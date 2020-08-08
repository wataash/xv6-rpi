// arm-linux-gnueabi-ld -L. -N -e main -Ttext 0 -o _cat cat.o ulib.o usys.o printf.o umalloc.o  -L ../ /usr/lib/gcc-cross/#arm-linux-gnueabi/8/libgcc.a
// arm-linux-gnueabi-ld: ulib.o: in function `gets':
// ulib.c:(.text+0x394): undefined reference to `__stack_chk_fail'
// arm-linux-gnueabi-ld: ulib.c:(.text+0x3a0): undefined reference to `__stack_chk_guard'
// arm-linux-gnueabi-ld: printf.o: in function `printint':
// printf.c:(.text+0x180): undefined reference to `__stack_chk_fail'
// arm-linux-gnueabi-ld: printf.c:(.text+0x18c): undefined reference to `__stack_chk_guard'
// arm-linux-gnueabi-ld: /usr/lib/gcc-cross/arm-linux-gnueabi/8/libgcc.a(_dvmd_lnx.o): in function `__aeabi_idiv0':
// (.text+0x8): undefined reference to `raise'
int raise(int sig)
{
    // not implemented
    return -1;
}
