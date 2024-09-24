# Makefile

AS = nasm
ASFLAGS = -f bin
TARGET = output/boot.bin
SRC = src/boot.asm
HD_IMG_NAME := "hd.img"

all: write-image

build: $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(TARGET)

write-image: build
	$(shell rm -rf ${HD_IMG_NAME})
	bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $(HD_IMG_NAME)
	dd if=$(TARGET) of=$(HD_IMG_NAME) bs=512 seek=0 count=1 conv=notrunc

clean:
	rm -f $(TARGET)

qemu: all
	qemu-system-x86_64 -hda $(HD_IMG_NAME)

bochs: all
	bochs -q -f bochsrc