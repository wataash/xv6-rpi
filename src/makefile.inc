# Cross-compiling (e.g., on Mac OS X, install arm-none-eabi-gcc with MacPorts)
CROSSCOMPILE := arm-none-eabi-

CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy
OBJDUMP = $(CROSSCOMPILE)objdump

# -fno-stack-protector: to fix:
#   arm-linux-gnueabi-ld -L. -N -e main -Ttext 0 -o _cat cat.o ulib.o usys.o printf.o umalloc.o  -L ../ /usr/lib/gcc-cross/arm-linux-gnueabi/8/libgcc.a
#   arm-linux-gnueabi-ld: ulib.o: in function `gets':
#   /home/wsh/qc/xv6-rpi/src/usr/ulib.c:94: undefined reference to `__stack_chk_fail'
#   arm-linux-gnueabi-ld: /home/wsh/qc/xv6-rpi/src/usr/ulib.c:94: undefined reference to `__stack_chk_guard'
#   arm-linux-gnueabi-ld: printf.o: in function `printint':
#   /home/wsh/qc/xv6-rpi/src/usr/printf.c:38: undefined reference to `__stack_chk_fail'
#   arm-linux-gnueabi-ld: /home/wsh/qc/xv6-rpi/src/usr/printf.c:38: undefined reference to `__stack_chk_guard'
#   make[1]: *** [Makefile:32: _cat] Error 1
# -ggdb3: too large, link error
# CFLAGS = -ggdb3 -march=armv6 -fno-pic -static -fno-builtin -fno-strict-aliasing -fno-stack-protector -Wall -Werror -I.
CFLAGS = -g -march=armv6 -fno-pic -static -fno-builtin -fno-strict-aliasing -fno-stack-protector -Wall -Werror -I.
LDFLAGS = -L.
ASFLAGS = -march=armv6 -g

LIBGCC = $(shell $(CC) -print-libgcc-file-name)

# host compiler
HOSTCC_preferred = gcc
define get_hostcc
    $(if $(shell which $(HOSTCC_preferred)),$(HOSTCC_preferred),"cc")
endef
HOSTCC := $(call get_hostcc)

# general rules
quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))

LINK_BIN = $(call quiet-command,$(LD) $(LDFLAGS) \
	-T $(1) -o $(2) $(3) $(LIBS) -b binary $(4), "  LINK     $(TARGET_DIR)$@")

LINK_INIT = $(call quiet-command,$(LD) $(LDFLAGS) \
	$(1) -o $@.out $<, "  LINK     $(TARGET_DIR)$@")
OBJCOPY_INIT = $(call quiet-command,$(OBJCOPY) \
	-S -O binary --prefix-symbols="_binary_$@" $@.out $@, "  OBJCOPY  $(TARGET_DIR)$@")

build-directory = $(shell mkdir -p build build/device build/lib)

build/%.o: %.c
	$(call build-directory)
	$(call quiet-command,$(CC) $(CFLAGS) \
		-c -o $@ $<,"  CC       $(TARGET_DIR)$@")

AS_WITH = $(call quiet-command,$(CC) $(ASFLAGS) \
		$(1) -c -o $@ $<,"  AS       $(TARGET_DIR)$@")

build/%.o: %.S
	$(call build-directory)
	$(call AS_WITH, )
