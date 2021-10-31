/* Ch55xGrayLink:
 *  A modern yet simple TI Graph-Link cable ported to Ch55xduino for CH551/CH552 MCUs
 *  Ch55xduino: (https://github.com/DeqingSun/ch55xduino)
 *  Max transfer speed: about 3.2 KB/s (TI-83 Plus)
 *
 *  https://github.com/serisman/Ch55xGrayLink
 *  Copyright (C) 2021 serisman <github@serisman.com>
 *
 *  MIT-licensed.
 *
 *  Based on:
 *   https://github.com/MTres19/serial2ti83 (Copyright (C) 2018 Matthew Trescott)
 *   https://github.com/DSchndr/serial2ti83 (Copyright (C) 2018 DSchndr)
 *   https://github.com/jw0k/serial2ti83 (Copyright (C) 2017 jw0k)
 */

#define TXTIMEOUT   65000UL
#define RXTIMEOUT   65000UL

#define PIN_TIP       P1_4
#define PIN_RING      P1_7
#define BM_TIP        (uint8_t)0b00010000
#define BM_RING       (uint8_t)0b10000000

inline bool TI_isTipHigh() { return PIN_TIP == 1; }
inline bool TI_isRingHigh() { return PIN_RING == 1; }

inline bool TI_isTipLow() { return PIN_TIP == 0; }
inline bool TI_isRingLow() { return PIN_RING == 0; }

inline void TI_pullTipLow() { PIN_TIP = 0; }
inline void TI_pullRingLow() { PIN_RING = 0; }

inline void TI_releaseTip() { PIN_TIP = 1; }
inline void TI_releaseRing() { PIN_RING = 1; }

void TI_setup() {
  // Configure both lines to be in Bidirectional mode (open-drain output with pull-up resistors and simultaneous input support)
  P1_MOD_OC = (BM_TIP | BM_RING);
  P1_DIR_PU = (BM_TIP | BM_RING);
  TI_releaseTip();
  TI_releaseRing();
}

void TI_sendByte(uint8_t byte) {
  unsigned int timeout;

  for (char i = 0; i < 8; ++i) {
    bool bit = byte & 0x01;
    byte >>= 1;

    // Poll both lines until they are both high, which means we're ready to send a bit
    timeout = TXTIMEOUT;
    while (TI_isTipLow() || TI_isRingLow()) {
      if (--timeout == 0) {
        return;
      }
    }

    if (bit) {
      // Send a bit by pulling appropriate line low
      TI_pullRingLow();

      // Wait for opposite line to become low
      timeout = TXTIMEOUT;
      while (TI_isTipHigh()) {
        if (--timeout == 0) {
          TI_releaseRing();
          return;
        }
      }

      // Release our line
      TI_releaseRing();

      // wait for opposite line to become high
      timeout = TXTIMEOUT;
      while (TI_isTipLow()) {
        if (--timeout == 0) {
          return;
        }
      }
    } else {
      // Send a bit by pulling appropriate line low
      TI_pullTipLow();

      // Wait for opposite line to become low
      timeout = TXTIMEOUT;
      while (TI_isRingHigh()) {
        if (--timeout == 0) {
          TI_releaseTip();
          return;
        }
      }

      // Release our line
      TI_releaseTip();

      // Wait for opposite line to become high
      timeout = TXTIMEOUT;
      while (TI_isRingLow()) {
        if (--timeout == 0) {
          return;
        }
      }
    }
  }
}

bool TI_getByte(uint8_t * byte) {
  // Return immediately if TI isn't trying to send us a byte (i.e. bus is idle)
  if (TI_isRingHigh() && TI_isTipHigh()) {
    return false;
  }

  uint8_t result = 0;
  unsigned int timeout;

  for (char i = 0; i < 8; ++i) {
    // Poll both lines until one of them becomes low
    timeout = RXTIMEOUT;
    while (TI_isRingHigh() && TI_isTipHigh()) {
      if (--timeout == 0) {
        return false;
      }
    }

    bool bit = TI_isRingLow();
    result >>= 1;

    if (bit) {
      result |= 0x80; // Bits are always transmitted LSb first (least significant bit)

      // Acknowledge a bit by pulling appropriate line low
      TI_pullTipLow();

      // Wait for opposite line to become high
      timeout = RXTIMEOUT;
      while (TI_isRingLow()) {
        if (--timeout == 0) {
          TI_releaseTip();
          return false;
        }
      }

      // release our line
      TI_releaseTip();
    } else {
      // Acknowledge a bit by pulling appropriate line low
      TI_pullRingLow();

      // Wait for opposite line to become high
      timeout = RXTIMEOUT;
      while (TI_isTipLow()) {
        if (--timeout == 0) {
          TI_releaseRing();
          return false;
        }
      }

      // Release our line
      TI_releaseRing();
    }

    // Wait for both lines stable high
    timeout = RXTIMEOUT;
    while (TI_isTipLow() || TI_isRingLow()) {
      if (--timeout == 0) {
        return false;
      }
    }
  }

  *byte = result;
  return true;
}

void setup() {
  // No need to init USBSerial
  TI_setup();
}

void loop() {
  // Forward incoming data from PC to the calculator
  while (USBSerial_available() > 0) {
      TI_sendByte(USBSerial_read());
  }

  // Forward incoming data from calculator to the PC
  uint8_t byteFromCalc;
  if (TI_getByte(&byteFromCalc)) {
    USBSerial_write(byteFromCalc);
  }
}
