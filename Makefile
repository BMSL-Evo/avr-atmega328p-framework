MCU = atmega328p
F_CPU = 16000000UL
CC = avr-gcc

CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os -Wall
LDFLAGS = -mmcu=$(MCU)

SRC = applications/blink_led/main.c

TARGET = build/main

all: $(TARGET).hex

$(TARGET).elf: $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET).elf $(LDFLAGS)

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -O ihex -R .eeprom $(TARGET).elf $(TARGET).hex

clean:
	rm -f build/*.elf build/*.hex
