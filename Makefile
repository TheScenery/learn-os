# Makefile

AS = nasm
ASFLAGS = -f bin
TARGET = output/boot.bin
SRC = src/boot.asm

all: build

build: $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)

qemu:all
	qemu-system-x86_64 -drive format=raw,file=$(TARGET)