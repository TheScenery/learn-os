[org 0x7c00]

[section .text]
[bits 16]

global _start
_start:
    jmp $

mag: db "hello world", 10, 13, 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa