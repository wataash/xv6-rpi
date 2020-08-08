#include "arm.h"
#include "memlayout.h"

.text
.code 32

.global _start

// compare with kernel.asm

_start:
experiment_begin: // exp
#if 0 // exp_mov
    NOP
    MOV     r0, #0x0
    MOV     r1, #0x0
    MOV     r2, #0x0
    MOV     r3, #0x0
    MOV     r4, #0x0
    MOV     r5, #0x0
    MOV     r6, #0x0
    MOV     r7, #0x0
    MOV     r8, #0x0
    MOV     r9, #0x0
    # MOV     r10, #0x0 // sl
    # MOV     r11, #0x0 // fp
    # MOV     r12, #0x0 // ip
    # MOV     r13, #0x0 // sp
    # MOV     r14, #0x0 // lr
    # MOV     r15, #0x0 // pc
    # MOV     r16, #0x0 // entry.S:34: Error: ARM register expected -- `mov r16,#0x0'

    // https://twitter.com/wata_ash/status/1291992237010608129
                          // hex dump    ←のe3a07 より後の12ビットのbiary
    MOV     r7, #0x0      // e3a07000    0000 0000 0000
    MOV     r7, #0x1      // e3a07001    0000 0000 0001
    // 0x2-0x97 省略
    MOV     r7, #0x98     // e3a07098    0000 1001 1000
    MOV     r7, #0x99     // e3a07099    0000 1001 1001
    MOV     r7, #0x100    // e3a07c01    1100 0000 0001
    # MOV   r7, #0x101    // error
    # MOV   r7, #0x102    // error
    # MOV   r7, #0x103    // error
    MOV     r7, #0x104    // e3a07f41    1111 0100 0001
    # MOV   r7, #0x105    // error
    # MOV   r7, #0x106    // error
    # MOV   r7, #0x107    // error
    MOV     r7, #0x108    // e3a07f42    1111 0100 0010
    # MOV   r7, #0x109    // error
    MOV     r7, #0x110    // e3a07e11    1110 0001 0001
    # MOV   r7, #0x111    // error
    # MOV   r7, #0x112    // error
    # MOV   r7, #0x113    // error
    MOV     r7, #0x114    // e3a07f45    1111 0100 0101
    # MOV   r7, #0x115    // error
    # MOV   r7, #0x116    // error
    # MOV   r7, #0x117    // error
    MOV     r7, #0x118    // e3a07f46    1111 0100 0110
    # MOV   r7, #0x119    // error
    MOV     r7, #0x120    // e3a07e12    1110 0001 0010
    # MOV   r7, #0x121    // error
    # MOV   r7, #0x122    // error
    # MOV   r7, #0x123    // error
    MOV     r7, #0x124
    # MOV   r7, #0x125    // error
    # MOV   r7, #0x126    // error
    # MOV   r7, #0x127    // error
    MOV     r7, #0x128
    # MOV   r7, #0x129    // error
    MOV     r7, #0x130
    # MOV   r7, #0x131    // error
    # MOV   r7, #0x132    // error

    MOV     r7, #0x00000100  // e3a07c01  1100 0000 0001
    MOV     r7, #0x00000200  // e3a07c02  1100 0000 0010
    MOV     r7, #0x00000400  // e3a07b01  1011 0000 0001
    MOV     r7, #0x00000800  // e3a07b02  1011 0000 0010
    MOV     r7, #0x00001000  // e3a07a01  1010 0000 0001
    MOV     r7, #0x00002000  // e3a07a02  1010 0000 0010
    MOV     r7, #0x00004000  // e3a07901  1001 0000 0001
    MOV     r7, #0x00008000  // e3a07902  1001 0000 0010
    MOV     r7, #0x00010000  // e3a07801  1000 0000 0001
    MOV     r7, #0x00020000  // e3a07802  1000 0000 0010
    MOV     r7, #0x00040000  // e3a07701  0111 0000 0001
    MOV     r7, #0x00080000  // e3a07702  0111 0000 0010
    MOV     r7, #0x00100000  // e3a07601  0110 0000 0001
    MOV     r7, #0x00200000  // e3a07602  0110 0000 0010
    MOV     r7, #0x00400000  // e3a07501  0101 0000 0001
    MOV     r7, #0x00800000  // e3a07502  0101 0000 0010
    MOV     r7, #0x01000000  // e3a07401  0100 0000 0001
    MOV     r7, #0x02000000  // e3a07402  0100 0000 0010
    MOV     r7, #0x04000000  // e3a07301  0011 0000 0001
    MOV     r7, #0x08000000  // e3a07302  0011 0000 0010
    MOV     r7, #0x10000000  // e3a07201  0010 0000 0001
    MOV     r7, #0x20000000  // e3a07202  0010 0000 0010
    MOV     r7, #0x40000000  // e3a07101  0001 0000 0001
    MOV     r7, #0x80000000  // e3a07102  0001 0000 0010


    MOV     r7, #0x4000
    # MOV   r7, #0x4001   // error
    # MOV   r7, #0x4002   // error
    # MOV   r7, #0x4003   // error
    # MOV   r7, #0x4004   // error
    MOV     r7, #0x8000

    MOV     r7, #0xde                 // ok
    # MOV   r7, #0xdead               // entry.S:11: Error: invalid constant (dead) after fixup
    LDR     r7, =#0xdeadbeef
    // LDR  r7, =#0xdeadbeefdeadbeef                 // entry.S:57: Warning: value 0xdeadbeefdeadbeef truncated to 0xdeadbeef
    // LDR  r7, =#0xdeadbeefdeadbeefdeadbeefdeadbeef // entry.S:14: Error: syntax error -- `ldr r1,=#0xdeadbeefdeadbeefdeadbeefdeadbeef'
#endif // exp_mov
#if 0 // exp_cmp
    // CMP
    // https://courses.washington.edu/cp105/02_Exceptions/Status_Registers.html
    // CPSR: N Z C V ... I F T M M M M M

    MOV     r7, #7
    MOV     r8, #8
    // psr: 0x400001d3->0x800001d3 -Z (1<<30 0x40000000) +N (1<<31 0x80000000)
    // 7 < 8
    // Nzcv
    CMP     r7, r8

    MOV     r8, #7
    // psr: 0x800001d3->0x600001d3 +C (1<<29 0x20000000) +Z (1<<30 0x40000000) -N (1<<31 0x80000000)
    // 7 == 7
    // nZCv
    CMP     r7, r8

    MOV     r7, #8
    // psr: 0x600001d3->0x200001d3 -Z (1<<30 0x40000000)
    // 8 > 7
    // nzCv
    CMP     r7, r8

    // N: <
    // Z: ==
    // C: >=
    // V: unused in CMP
#endif // exp_cmp

#if 0 // exp_stmltia
    NOP
                        // x/100bx 0x1000
                        // 0x1000: 0x00 0x00 0x00 ...
    STMIA r7!, {r8}     // regs[7]: 0x1000->0x1004
                        // 0x1000: 0x08 0x00 0x00 ...
    STMLTIA r7!, {r8}   // nop
    STMGTIA r7!, {r8}   // nop

    // https://www.keil.com/support/man/docs/armasm/armasm_dom1361289860997.htm 10.8 Condition code suffixes
    // https://www.keil.com/support/man/docs/armasm/armasm_dom1361289906470.htm 10.132 STM
    //   IA This is the default, and can be omitted
    // https://www.cs.ccu.edu.tw/~pahsiung/courses/ese/notes/ESD_05_ARM_Instructions.pdf The ARM Instruction Set
    //   p.16 The Condition Field
    //   p.55 Block Data Transfer
    //     24:P Pre/Post indexing bit
    //     23:U Up/Down bit
    MOV      r7,  #0x1000  // e3a07a01
    MOV      r8,  #8       // e3a08008

    STM      r7!, {r8}     // e8a70100 STMIA
    STMIA    r7!, {r8}     // e8a70100 1110 1000 1010 ... 24:0 23:1
    STMIB    r7!, {r8}     // e9a70100 1110 1001 1010 ... 24:1 23:1
    STMDA    r7!, {r8}     // e8270100 1110 1000 0010 ... 24:0 23:0
    STMDB    r7!, {r8}     // e9270100 1110 1000 0010 ... 24:1 23:0

    STMEQ    r7!, {r8}     // 08a70100
    STMNE    r7!, {r8}     // 18a70100
    STMHS    r7!, {r8}     // 28a70100
    STMCS    r7!, {r8}     // (same)
    STMLO    r7!, {r8}     // 38a70100
    STMCC    r7!, {r8}     // (same)
    STMMI    r7!, {r8}     // 48a70100
    STMPL    r7!, {r8}     // 58a70100
    STMVS    r7!, {r8}     // 68a70100
    STMVC    r7!, {r8}     // 78a70100
    STMHI    r7!, {r8}     // 88a70100
    STMLS    r7!, {r8}     // 98a70100
    STMGE    r7!, {r8}     // a8a70100
    STMLT    r7!, {r8}     // b8a70100
    STMGT    r7!, {r8}     // c8a70100
    STMLE    r7!, {r8}     // d8a70100
    STMAL    r7!, {r8}     // e8a70100
    // STMNV r7!, {r8}     // Error: bad instruction `stmnv r7!,{r8}'

    STM      r7!, {r8,r9}             // e8a70100
    STM      r7!, {r3-r6,r11,r12}     // e8a71878
#endif // exp_stmltia

#if 0 // exp_thumb
    // https://sourceware.org/binutils/docs/as/ARM-Directives.html 9.4.4 ARM Machine Directives
.thumb // or .code 16
    NOP               // 46c0
    MOV     r0, #0x0  // 2000
    MOV     r1, #0x0  // 2100
.arm // or .code 32
    NOP               // e1a00000
    MOV     r0, #0x0  // e3a00000
    MOV     r1, #0x0  // e3a01000
#endif // exp_thumb

#if 0 // exp_cpsr
    // https://www.keil.com/support/man/docs/armasm/armasm_dom1361289882044.htm 10.63 MSR (general-purpose register to PSR)
    // QEMU:
    // code_gen_buffer() helper_cpsr_write() cpsr_write() bad_mode_switch()
    // #define CPSR_M (0x1fU)
    MSR     CPSR_c,    #0    // e321f000  psr: 0x600001d3->0x60000113 -F (1<<6 0x40) -I (1<<7 0x80)
    MSR     CPSR_c,    #1    // e321f001
    MSR     CPSR_c,    #2    // e321f002
    MSR     CPSR_c,    #15   // e321f00f
    MSR     CPSR_c,    #16   // e321f010  psr: 0x60000113->0x60000110 svc->usr(3->0)
    MSR     CPSR_c,    #255  // e321f0ff
    MSR     CPSR_c,    #256  // e321fc01
    // MSR     CPSR_c,    #511  // Error: invalid constant (1ff) after fixup
    MSR     CPSR_c,    #512  // e321fc02

    // #define CPSR_GE (0xfU << 16) 19 18 17 16
    // env->GE
    MSR     CPSR_c,    #(SVC_MODE|NO_INT)  // e321f0d3
    MSR     CPSR_x,    #(SVC_MODE|NO_INT)  // e322f0d3
    MSR     CPSR_s,    #(SVC_MODE|NO_INT)  // e324f0d3
    MSR     CPSR_f,    #(SVC_MODE|NO_INT)  // e328f0d3  psr: 0x60000110->0x110 -C (1<<29 0x20000000) -Z (1<<30 0x40000000)
    MSR     CPSR_cxsf, #(SVC_MODE|NO_INT)  // e32ff0d3
    MSR     CPSR,      #(SVC_MODE|NO_INT)  // CPSR_fc
#endif // exp_cpsr

experiment_end: // exp

    // p edata_entry   (void *) 0x0 (?)
    // p &edata_entry  (void **) 0x105b0 <edata_entry>
    // p end_entry     {<text variable, no debug info>} 0x19000
    //
    // regs[1]: 0->0x105e8
    // regs[2]: 0->0x19000
    # clear the entry bss section, the svc stack, and kernel page table
    LDR     r1, =edata_entry
    LDR     r2, =end_entry
    MOV     r3, #0x00

1:
    // fill edata_entry-end_entry with zero(r3)
    //
    // psr: 0x400001d3->0x800001d3 -Z (1<<30 0x40000000) +N (1<<31 0x80000000)
    // Nzcv r1 < r2; edata_entry < end_entry
    CMP     r1, r2
    // TAKEN [Reason: N!=V]
    // cond != 0xe
    STMLTIA r1!, {r3}
    // B LT; label 1 b?
    BLT     1b  // baffbfdb  blt 0 <shift>
    // BLT  1   // bafffffb  blt 10084 <_start+0x84>

    # initialize stack pointers for svc modes
    // arm.h
    // #define SVC_MODE    0x13
    // #define NO_INT      0xc0
    // psr: 0x600001d3->0xd3 -A (1<<8 0x100) -C (1<<29 0x20000000) -Z (1<<30 0x40000000)
    MSR     CPSR_cxsf, #(SVC_MODE|NO_INT)
    // regs[13]: 0->0x12000
    LDR     sp, =svc_stktop

    // regs[14]: 0->0x1009c
    BL      start
    // infinite loop
    B .

# during startup, kernel stack uses user address, now switch it to kernel addr
.global jump_stack
jump_stack:
    MOV     r0, sp
    ADD     r0, r0, #KERNBASE
    MOV     sp, r0
    MOV     pc, lr
