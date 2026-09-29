
simple_fastfloat_benchmark/build/m6-float-inline-clang-on/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000eb94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000eb94: d103c3ff    	sub	sp, sp, #0xf0
10000eb98: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000eb9c: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000eba0: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000eba4: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000eba8: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000ebac: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000ebb0: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000ebb4: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000ebb8: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000ebbc: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000ebc0: 910383fd    	add	x29, sp, #0xe0
10000ebc4: a9405013    	ldp	x19, x20, [x0]
10000ebc8: eb14027f    	cmp	x19, x20
10000ebcc: 54005f00    	b.eq	0x10000f7ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc18>
10000ebd0: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000ebd4: f299fa15    	movk	x21, #0xcfd0
10000ebd8: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000ebdc: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000ebe0: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000ebe4: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000ebe8: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000ebec: d2800c99    	mov	x25, #0x64              ; =100
10000ebf0: f2c84819    	movk	x25, #0x4240, lsl #32
10000ebf4: f2e001f9    	movk	x25, #0xf, lsl #48
10000ebf8: d280003a    	mov	x26, #0x1               ; =1
10000ebfc: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000ec00: 529c201e    	mov	w30, #0xe100            ; =57600
10000ec04: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000ec08: 528a4d46    	mov	w6, #0x526a             ; =21098
10000ec0c: 72a00066    	movk	w6, #0x3, lsl #16
10000ec10: 6f00e408    	movi.2d	v8, #0000000000000000
10000ec14: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000ec18: f28dcd27    	movk	x7, #0x6e69
10000ec1c: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000ec20: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000ec24: 9e670109    	fmov	d9, x8
10000ec28: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000ec2c: 9e67010a    	fmov	d10, x8
10000ec30: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000ec34: 9e67010b    	fmov	d11, x8
10000ec38: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000ec3c: 9e67010c    	fmov	d12, x8
10000ec40: 5280015b    	mov	w27, #0xa               ; =10
10000ec44: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000ec48: 9e67010d    	fmov	d13, x8
10000ec4c: 6f00e400    	movi.2d	v0, #0000000000000000
10000ec50: 14000009    	b	0x10000ec74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000ec54: 52800008    	mov	w8, #0x0                ; =0
10000ec58: 37000041    	tbnz	w1, #0x0, 0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000ec5c: 36005c28    	tbz	w8, #0x0, 0x10000f7e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4c>
10000ec60: 1e612000    	fcmp	d0, d1
10000ec64: 1e61cc00    	fcsel	d0, d0, d1, gt
10000ec68: 91006273    	add	x19, x19, #0x18
10000ec6c: eb14027f    	cmp	x19, x20
10000ec70: 54005a00    	b.eq	0x10000f7b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc1c>
10000ec74: 39805e60    	ldrsb	x0, [x19, #0x17]
10000ec78: b7f800a0    	tbnz	x0, #0x3f, 0x10000ec8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf8>
10000ec7c: aa1303f1    	mov	x17, x19
10000ec80: 6f00e401    	movi.2d	v1, #0000000000000000
10000ec84: b50000a0    	cbnz	x0, 0x10000ec98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x104>
10000ec88: 17fffff3    	b	0x10000ec54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000ec8c: a9400271    	ldp	x17, x0, [x19]
10000ec90: 6f00e401    	movi.2d	v1, #0000000000000000
10000ec94: b4fffe00    	cbz	x0, 0x10000ec54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000ec98: 3940023c    	ldrb	w28, [x17]
10000ec9c: aa1c03eb    	mov	x11, x28
10000eca0: aa1103e9    	mov	x9, x17
10000eca4: 7100b79f    	cmp	w28, #0x2d
10000eca8: 1a9f17ea    	cset	w10, eq
10000ecac: 54000161    	b.ne	0x10000ecd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000ecb0: f100041f    	cmp	x0, #0x1
10000ecb4: 54001b60    	b.eq	0x10000f020 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000ecb8: aa1103e9    	mov	x9, x17
10000ecbc: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000ecc0: 12001d0b    	and	w11, w8, #0xff
10000ecc4: 7100b91f    	cmp	w8, #0x2e
10000ecc8: 54000080    	b.eq	0x10000ecd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000eccc: 5100c108    	sub	w8, w8, #0x30
10000ecd0: 7100251f    	cmp	w8, #0x9
10000ecd4: 54001a68    	b.hi	0x10000f020 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000ecd8: 8b00022f    	add	x15, x17, x0
10000ecdc: eb0f013f    	cmp	x9, x15
10000ece0: 540008c0    	b.eq	0x10000edf8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000ece4: 13001d68    	sxtb	w8, w11
10000ece8: 5100c108    	sub	w8, w8, #0x30
10000ecec: 7100251f    	cmp	w8, #0x9
10000ecf0: 54000848    	b.hi	0x10000edf8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000ecf4: 91000528    	add	x8, x9, #0x1
10000ecf8: 93401d6b    	sxtb	x11, w11
10000ecfc: d100c178    	sub	x24, x11, #0x30
10000ed00: eb0f011f    	cmp	x8, x15
10000ed04: 540007e0    	b.eq	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed08: 39c0010b    	ldrsb	w11, [x8]
10000ed0c: 5100c16c    	sub	w12, w11, #0x30
10000ed10: 7100259f    	cmp	w12, #0x9
10000ed14: 54000768    	b.hi	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed18: 93407d6b    	sxtw	x11, w11
10000ed1c: 91000928    	add	x8, x9, #0x2
10000ed20: d100c16b    	sub	x11, x11, #0x30
10000ed24: aa1803ec    	mov	x12, x24
10000ed28: 8b0c0998    	add	x24, x12, x12, lsl #2
10000ed2c: 8b180578    	add	x24, x11, x24, lsl #1
10000ed30: eb0f011f    	cmp	x8, x15
10000ed34: 54000660    	b.eq	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed38: 39c0010b    	ldrsb	w11, [x8]
10000ed3c: 5100c16c    	sub	w12, w11, #0x30
10000ed40: 7100259f    	cmp	w12, #0x9
10000ed44: 540005e8    	b.hi	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed48: 93407d6b    	sxtw	x11, w11
10000ed4c: 91000d28    	add	x8, x9, #0x3
10000ed50: d100c16b    	sub	x11, x11, #0x30
10000ed54: aa1803ec    	mov	x12, x24
10000ed58: 8b0c0998    	add	x24, x12, x12, lsl #2
10000ed5c: 8b180578    	add	x24, x11, x24, lsl #1
10000ed60: eb0f011f    	cmp	x8, x15
10000ed64: 540004e0    	b.eq	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed68: 39c0010b    	ldrsb	w11, [x8]
10000ed6c: 5100c16c    	sub	w12, w11, #0x30
10000ed70: 7100259f    	cmp	w12, #0x9
10000ed74: 54000468    	b.hi	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed78: 93407d6b    	sxtw	x11, w11
10000ed7c: 91001128    	add	x8, x9, #0x4
10000ed80: d100c16b    	sub	x11, x11, #0x30
10000ed84: aa1803ec    	mov	x12, x24
10000ed88: 8b0c0998    	add	x24, x12, x12, lsl #2
10000ed8c: 8b180578    	add	x24, x11, x24, lsl #1
10000ed90: eb0f011f    	cmp	x8, x15
10000ed94: 54000360    	b.eq	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000ed98: 39c0010b    	ldrsb	w11, [x8]
10000ed9c: 5100c16c    	sub	w12, w11, #0x30
10000eda0: 7100259f    	cmp	w12, #0x9
10000eda4: 540002e8    	b.hi	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000eda8: 93407d6b    	sxtw	x11, w11
10000edac: 91001528    	add	x8, x9, #0x5
10000edb0: d100c16c    	sub	x12, x11, #0x30
10000edb4: 8b180b0b    	add	x11, x24, x24, lsl #2
10000edb8: 8b0b058b    	add	x11, x12, x11, lsl #1
10000edbc: eb0f011f    	cmp	x8, x15
10000edc0: 54001a80    	b.eq	0x10000f110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000edc4: 39c0010c    	ldrsb	w12, [x8]
10000edc8: 5100c18d    	sub	w13, w12, #0x30
10000edcc: 710025bf    	cmp	w13, #0x9
10000edd0: 54001a08    	b.hi	0x10000f110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000edd4: 93407d8c    	sxtw	x12, w12
10000edd8: d100c18c    	sub	x12, x12, #0x30
10000eddc: 8b0b0978    	add	x24, x11, x11, lsl #2
10000ede0: 8b180598    	add	x24, x12, x24, lsl #1
10000ede4: 91000508    	add	x8, x8, #0x1
10000ede8: aa1803eb    	mov	x11, x24
10000edec: eb0f011f    	cmp	x8, x15
10000edf0: 54fffea1    	b.ne	0x10000edc4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x230>
10000edf4: 14000003    	b	0x10000ee00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000edf8: d2800018    	mov	x24, #0x0               ; =0
10000edfc: aa0903e8    	mov	x8, x9
10000ee00: cb09010b    	sub	x11, x8, x9
10000ee04: eb0f011f    	cmp	x8, x15
10000ee08: 540018c0    	b.eq	0x10000f120 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000ee0c: 3940010c    	ldrb	w12, [x8]
10000ee10: 7100b99f    	cmp	w12, #0x2e
10000ee14: 54001861    	b.ne	0x10000f120 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000ee18: 9100050c    	add	x12, x8, #0x1
10000ee1c: cb0c01ee    	sub	x14, x15, x12
10000ee20: f10041df    	cmp	x14, #0x10
10000ee24: 5400056b    	b.lt	0x10000eed0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x33c>
10000ee28: 9100250d    	add	x13, x8, #0x9
10000ee2c: f85f81b0    	ldur	x16, [x13, #-0x8]
10000ee30: 8b160202    	add	x2, x16, x22
10000ee34: 8b150210    	add	x16, x16, x21
10000ee38: aa100042    	orr	x2, x2, x16
10000ee3c: f201c05f    	tst	x2, #0x8080808080808080
10000ee40: 540003a1    	b.ne	0x10000eeb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x320>
10000ee44: f94001a2    	ldr	x2, [x13]
10000ee48: 8b160043    	add	x3, x2, x22
10000ee4c: 8b150042    	add	x2, x2, x21
10000ee50: aa020063    	orr	x3, x3, x2
10000ee54: f201c07f    	tst	x3, #0x8080808080808080
10000ee58: 54001421    	b.ne	0x10000f0dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x548>
10000ee5c: 9b1b7e03    	mul	x3, x16, x27
10000ee60: 8b502070    	add	x16, x3, x16, lsr #8
10000ee64: 92001e03    	and	x3, x16, #0xff000000ff
10000ee68: 9b197c63    	mul	x3, x3, x25
10000ee6c: d350fe10    	lsr	x16, x16, #16
10000ee70: 92001e10    	and	x16, x16, #0xff000000ff
10000ee74: 9b1a0e10    	madd	x16, x16, x26, x3
10000ee78: 9b1b7c43    	mul	x3, x2, x27
10000ee7c: 8b422062    	add	x2, x3, x2, lsr #8
10000ee80: 92001c43    	and	x3, x2, #0xff000000ff
10000ee84: 9b197c63    	mul	x3, x3, x25
10000ee88: d350fc42    	lsr	x2, x2, #16
10000ee8c: 92001c42    	and	x2, x2, #0xff000000ff
10000ee90: 9b1a0c42    	madd	x2, x2, x26, x3
10000ee94: 9b1e7f03    	mul	x3, x24, x30
10000ee98: 8b508070    	add	x16, x3, x16, lsr #32
10000ee9c: 9b1e7e10    	mul	x16, x16, x30
10000eea0: 8b428218    	add	x24, x16, x2, lsr #32
10000eea4: 910041ad    	add	x13, x13, #0x10
10000eea8: d10041ce    	sub	x14, x14, #0x10
10000eeac: f1003ddf    	cmp	x14, #0xf
10000eeb0: 54fffbec    	b.gt	0x10000ee2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x298>
10000eeb4: d10021ad    	sub	x13, x13, #0x8
10000eeb8: cb0d01ee    	sub	x14, x15, x13
10000eebc: f10021df    	cmp	x14, #0x8
10000eec0: 5400010a    	b.ge	0x10000eee0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000eec4: f10011df    	cmp	x14, #0x4
10000eec8: 5400032a    	b.ge	0x10000ef2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000eecc: 14000022    	b	0x10000ef54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000eed0: aa0c03ed    	mov	x13, x12
10000eed4: cb0c01ee    	sub	x14, x15, x12
10000eed8: f10021df    	cmp	x14, #0x8
10000eedc: 54ffff4b    	b.lt	0x10000eec4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000eee0: f94001ae    	ldr	x14, [x13]
10000eee4: 8b1601d0    	add	x16, x14, x22
10000eee8: 8b1501ce    	add	x14, x14, x21
10000eeec: aa0e0210    	orr	x16, x16, x14
10000eef0: f201c21f    	tst	x16, #0x8080808080808080
10000eef4: 540001c1    	b.ne	0x10000ef2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000eef8: 9b1e7f10    	mul	x16, x24, x30
10000eefc: 9b1b7dc2    	mul	x2, x14, x27
10000ef00: 8b4e204e    	add	x14, x2, x14, lsr #8
10000ef04: 92001dc2    	and	x2, x14, #0xff000000ff
10000ef08: 9b197c42    	mul	x2, x2, x25
10000ef0c: d350fdce    	lsr	x14, x14, #16
10000ef10: 92001dce    	and	x14, x14, #0xff000000ff
10000ef14: 9b1a09ce    	madd	x14, x14, x26, x2
10000ef18: 8b4e8218    	add	x24, x16, x14, lsr #32
10000ef1c: 910021ad    	add	x13, x13, #0x8
10000ef20: cb0d01ee    	sub	x14, x15, x13
10000ef24: f10011df    	cmp	x14, #0x4
10000ef28: 5400016b    	b.lt	0x10000ef54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000ef2c: b94001ae    	ldr	w14, [x13]
10000ef30: 5288c8d0    	mov	w16, #0x4646            ; =17990
10000ef34: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000ef38: 0b1001d0    	add	w16, w14, w16
10000ef3c: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000ef40: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000ef44: 0b0201ce    	add	w14, w14, w2
10000ef48: 2a0e0210    	orr	w16, w16, w14
10000ef4c: 7201c21f    	tst	w16, #0x80808080
10000ef50: 54000a00    	b.eq	0x10000f090 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000ef54: eb0f01bf    	cmp	x13, x15
10000ef58: 54000b40    	b.eq	0x10000f0c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x52c>
10000ef5c: 39c001ae    	ldrsb	w14, [x13]
10000ef60: 5100c1d0    	sub	w16, w14, #0x30
10000ef64: 7100261f    	cmp	w16, #0x9
10000ef68: 54000508    	b.hi	0x10000f008 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000ef6c: 12001dd0    	and	w16, w14, #0xff
10000ef70: 910005ae    	add	x14, x13, #0x1
10000ef74: 5100c210    	sub	w16, w16, #0x30
10000ef78: 92401e10    	and	x16, x16, #0xff
10000ef7c: aa1803e2    	mov	x2, x24
10000ef80: 8b020858    	add	x24, x2, x2, lsl #2
10000ef84: 8b180618    	add	x24, x16, x24, lsl #1
10000ef88: eb0f01df    	cmp	x14, x15
10000ef8c: 54000400    	b.eq	0x10000f00c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000ef90: 39c001d0    	ldrsb	w16, [x14]
10000ef94: 5100c202    	sub	w2, w16, #0x30
10000ef98: 7100245f    	cmp	w2, #0x9
10000ef9c: 54000388    	b.hi	0x10000f00c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000efa0: 12001e10    	and	w16, w16, #0xff
10000efa4: 910009ae    	add	x14, x13, #0x2
10000efa8: 5100c210    	sub	w16, w16, #0x30
10000efac: 92401e10    	and	x16, x16, #0xff
10000efb0: aa1803e2    	mov	x2, x24
10000efb4: 8b020858    	add	x24, x2, x2, lsl #2
10000efb8: 8b180618    	add	x24, x16, x24, lsl #1
10000efbc: eb0f01df    	cmp	x14, x15
10000efc0: 54000260    	b.eq	0x10000f00c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000efc4: 39c001d0    	ldrsb	w16, [x14]
10000efc8: 5100c202    	sub	w2, w16, #0x30
10000efcc: 7100245f    	cmp	w2, #0x9
10000efd0: 540001e8    	b.hi	0x10000f00c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000efd4: 12001e10    	and	w16, w16, #0xff
10000efd8: 91000dae    	add	x14, x13, #0x3
10000efdc: 5100c20d    	sub	w13, w16, #0x30
10000efe0: 92401dad    	and	x13, x13, #0xff
10000efe4: 8b180b10    	add	x16, x24, x24, lsl #2
10000efe8: 8b1005b0    	add	x16, x13, x16, lsl #1
10000efec: aa1003f8    	mov	x24, x16
10000eff0: cb0c01cd    	sub	x13, x14, x12
10000eff4: cb0e0190    	sub	x16, x12, x14
10000eff8: cb100163    	sub	x3, x11, x16
10000effc: aa0e03e2    	mov	x2, x14
10000f000: b50009e3    	cbnz	x3, 0x10000f13c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000f004: 14000007    	b	0x10000f020 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000f008: aa0d03ee    	mov	x14, x13
10000f00c: cb0c01cd    	sub	x13, x14, x12
10000f010: cb0e0190    	sub	x16, x12, x14
10000f014: cb100163    	sub	x3, x11, x16
10000f018: aa0e03e2    	mov	x2, x14
10000f01c: b5000903    	cbnz	x3, 0x10000f13c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000f020: 39400228    	ldrb	w8, [x17]
10000f024: 7100b51f    	cmp	w8, #0x2d
10000f028: 1a9f17e9    	cset	w9, eq
10000f02c: cb09000a    	sub	x10, x0, x9
10000f030: f1000d5f    	cmp	x10, #0x3
10000f034: 54ffe10b    	b.lt	0x10000ec54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000f038: 8b090229    	add	x9, x17, x9
10000f03c: 3940092a    	ldrb	w10, [x9, #0x2]
10000f040: 79400129    	ldrh	w9, [x9]
10000f044: aa0a4129    	orr	x9, x9, x10, lsl #16
10000f048: b203c129    	orr	x9, x9, #0x2020202020202020
10000f04c: eb07013f    	cmp	x9, x7
10000f050: 54000160    	b.eq	0x10000f07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e8>
10000f054: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000f058: f28c2dca    	movk	x10, #0x616e
10000f05c: f2a40dca    	movk	x10, #0x206e, lsl #16
10000f060: eb0a013f    	cmp	x9, x10
10000f064: 54ffdf81    	b.ne	0x10000ec54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000f068: 7100b51f    	cmp	w8, #0x2d
10000f06c: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000f070: 52800028    	mov	w8, #0x1                ; =1
10000f074: 3607df41    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f078: 17fffefa    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f07c: 7100b51f    	cmp	w8, #0x2d
10000f080: 1e690d41    	fcsel	d1, d10, d9, eq
10000f084: 52800028    	mov	w8, #0x1                ; =1
10000f088: 3607dea1    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f08c: 17fffef5    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f090: 1b1b7dd0    	mul	w16, w14, w27
10000f094: 0b4e220e    	add	w14, w16, w14, lsr #8
10000f098: 12009dce    	and	w14, w14, #0xff00ff
10000f09c: 52800030    	mov	w16, #0x1               ; =1
10000f0a0: 72a00c90    	movk	w16, #0x64, lsl #16
10000f0a4: 1b107dce    	mul	w14, w14, w16
10000f0a8: 53107dce    	lsr	w14, w14, #16
10000f0ac: 5284e210    	mov	w16, #0x2710            ; =10000
10000f0b0: 9b103b18    	madd	x24, x24, x16, x14
10000f0b4: 910011ad    	add	x13, x13, #0x4
10000f0b8: eb0f01bf    	cmp	x13, x15
10000f0bc: 54fff501    	b.ne	0x10000ef5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c8>
10000f0c0: aa0d03ee    	mov	x14, x13
10000f0c4: cb0c01ad    	sub	x13, x13, x12
10000f0c8: cb0e0190    	sub	x16, x12, x14
10000f0cc: cb100163    	sub	x3, x11, x16
10000f0d0: aa0e03e2    	mov	x2, x14
10000f0d4: b5000343    	cbnz	x3, 0x10000f13c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000f0d8: 17ffffd2    	b	0x10000f020 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000f0dc: 9b1e7f0e    	mul	x14, x24, x30
10000f0e0: 9b1b7e02    	mul	x2, x16, x27
10000f0e4: 8b502050    	add	x16, x2, x16, lsr #8
10000f0e8: 92001e02    	and	x2, x16, #0xff000000ff
10000f0ec: 9b197c42    	mul	x2, x2, x25
10000f0f0: d350fe10    	lsr	x16, x16, #16
10000f0f4: 92001e10    	and	x16, x16, #0xff000000ff
10000f0f8: 9b1a0a10    	madd	x16, x16, x26, x2
10000f0fc: 8b5081d8    	add	x24, x14, x16, lsr #32
10000f100: cb0d01ee    	sub	x14, x15, x13
10000f104: f10021df    	cmp	x14, #0x8
10000f108: 54ffedeb    	b.lt	0x10000eec4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000f10c: 17ffff75    	b	0x10000eee0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000f110: aa0b03f8    	mov	x24, x11
10000f114: cb09010b    	sub	x11, x8, x9
10000f118: eb0f011f    	cmp	x8, x15
10000f11c: 54ffe781    	b.ne	0x10000ee0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x278>
10000f120: d280000d    	mov	x13, #0x0               ; =0
10000f124: d2800010    	mov	x16, #0x0               ; =0
10000f128: d280000c    	mov	x12, #0x0               ; =0
10000f12c: d2800002    	mov	x2, #0x0                ; =0
10000f130: aa0803ee    	mov	x14, x8
10000f134: aa0b03e3    	mov	x3, x11
10000f138: b4fff74b    	cbz	x11, 0x10000f020 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000f13c: eb0f01df    	cmp	x14, x15
10000f140: 540005a0    	b.eq	0x10000f1f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000f144: 394001d1    	ldrb	w17, [x14]
10000f148: 321b0231    	orr	w17, w17, #0x20
10000f14c: 7101963f    	cmp	w17, #0x65
10000f150: 54000521    	b.ne	0x10000f1f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000f154: 910005c0    	add	x0, x14, #0x1
10000f158: eb0f001f    	cmp	x0, x15
10000f15c: 54000180    	b.eq	0x10000f18c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f8>
10000f160: 39400011    	ldrb	w17, [x0]
10000f164: 910009c4    	add	x4, x14, #0x2
10000f168: 7100ae3f    	cmp	w17, #0x2b
10000f16c: 9a800080    	csel	x0, x4, x0, eq
10000f170: 7100b63f    	cmp	w17, #0x2d
10000f174: 52800031    	mov	w17, #0x1               ; =1
10000f178: 1a9113f1    	csel	w17, wzr, w17, ne
10000f17c: 9a841000    	csel	x0, x0, x4, ne
10000f180: eb0f001f    	cmp	x0, x15
10000f184: 540000a1    	b.ne	0x10000f198 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x604>
10000f188: 1400001b    	b	0x10000f1f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000f18c: 52800011    	mov	w17, #0x0               ; =0
10000f190: eb0f001f    	cmp	x0, x15
10000f194: 54000300    	b.eq	0x10000f1f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000f198: 39c00004    	ldrsb	w4, [x0]
10000f19c: 5100c084    	sub	w4, w4, #0x30
10000f1a0: 7100249f    	cmp	w4, #0x9
10000f1a4: 54000288    	b.hi	0x10000f1f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000f1a8: d280000e    	mov	x14, #0x0               ; =0
10000f1ac: 14000004    	b	0x10000f1bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x628>
10000f1b0: 91000400    	add	x0, x0, #0x1
10000f1b4: eb0f001f    	cmp	x0, x15
10000f1b8: 54000820    	b.eq	0x10000f2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000f1bc: 39c00004    	ldrsb	w4, [x0]
10000f1c0: 5100c085    	sub	w5, w4, #0x30
10000f1c4: 710024bf    	cmp	w5, #0x9
10000f1c8: 540007a8    	b.hi	0x10000f2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000f1cc: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000f1d0: eb0501df    	cmp	x14, x5
10000f1d4: 54fffeec    	b.gt	0x10000f1b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000f1d8: 12001c84    	and	w4, w4, #0xff
10000f1dc: 5100c084    	sub	w4, w4, #0x30
10000f1e0: 92401c84    	and	x4, x4, #0xff
10000f1e4: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000f1e8: 8b050485    	add	x5, x4, x5, lsl #1
10000f1ec: aa0503ee    	mov	x14, x5
10000f1f0: 17fffff0    	b	0x10000f1b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000f1f4: d2800011    	mov	x17, #0x0               ; =0
10000f1f8: f100507f    	cmp	x3, #0x14
10000f1fc: 540006cb    	b.lt	0x10000f2d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000f200: eb0f013f    	cmp	x9, x15
10000f204: 54000200    	b.eq	0x10000f244 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000f208: aa0903e0    	mov	x0, x9
10000f20c: 14000007    	b	0x10000f228 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x694>
10000f210: 7100c09f    	cmp	w4, #0x30
10000f214: 1a9f17e4    	cset	w4, eq
10000f218: cb040063    	sub	x3, x3, x4
10000f21c: 91000400    	add	x0, x0, #0x1
10000f220: eb0f001f    	cmp	x0, x15
10000f224: 540000c0    	b.eq	0x10000f23c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a8>
10000f228: 39400004    	ldrb	w4, [x0]
10000f22c: 7100c09f    	cmp	w4, #0x30
10000f230: 54ffff00    	b.eq	0x10000f210 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000f234: 7100b89f    	cmp	w4, #0x2e
10000f238: 54fffec0    	b.eq	0x10000f210 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000f23c: f100507f    	cmp	x3, #0x14
10000f240: 540004ab    	b.lt	0x10000f2d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000f244: eb08013f    	cmp	x9, x8
10000f248: 54000e20    	b.eq	0x10000f40c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x878>
10000f24c: d2800018    	mov	x24, #0x0               ; =0
10000f250: aa0903ef    	mov	x15, x9
10000f254: 388015f0    	ldrsb	x16, [x15], #0x1
10000f258: 9b1b4310    	madd	x16, x24, x27, x16
10000f25c: d100c218    	sub	x24, x16, #0x30
10000f260: eb17031f    	cmp	x24, x23
10000f264: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000f268: 54ffff61    	b.ne	0x10000f254 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6c0>
10000f26c: d10006f0    	sub	x16, x23, #0x1
10000f270: eb10031f    	cmp	x24, x16
10000f274: 54000168    	b.hi	0x10000f2a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x70c>
10000f278: aa0c03ef    	mov	x15, x12
10000f27c: eb02019f    	cmp	x12, x2
10000f280: 540000e0    	b.eq	0x10000f29c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x708>
10000f284: 388015e8    	ldrsb	x8, [x15], #0x1
10000f288: 9b1b2308    	madd	x8, x24, x27, x8
10000f28c: d100c118    	sub	x24, x8, #0x30
10000f290: eb17031f    	cmp	x24, x23
10000f294: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000f298: 54ffff61    	b.ne	0x10000f284 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000f29c: aa0c03e8    	mov	x8, x12
10000f2a0: cb0f0108    	sub	x8, x8, x15
10000f2a4: 8b110110    	add	x16, x8, x17
10000f2a8: 390013ff    	strb	wzr, [sp, #0x4]
10000f2ac: b90003ff    	str	wzr, [sp]
10000f2b0: 5280002f    	mov	w15, #0x1               ; =1
10000f2b4: b50003d8    	cbnz	x24, 0x10000f32c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000f2b8: 14000045    	b	0x10000f3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000f2bc: 7100023f    	cmp	w17, #0x0
10000f2c0: da8e05d1    	cneg	x17, x14, ne
10000f2c4: 8b100230    	add	x16, x17, x16
10000f2c8: aa0003ee    	mov	x14, x0
10000f2cc: f100507f    	cmp	x3, #0x14
10000f2d0: 54fff98a    	b.ge	0x10000f200 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000f2d4: 390013ff    	strb	wzr, [sp, #0x4]
10000f2d8: b90003ff    	str	wzr, [sp]
10000f2dc: b50001f0    	cbnz	x16, 0x10000f318 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x784>
10000f2e0: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000f2e4: eb08031f    	cmp	x24, x8
10000f2e8: 54000188    	b.hi	0x10000f318 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x784>
10000f2ec: 9e630301    	ucvtf	d1, x24
10000f2f0: 1e614022    	fneg	d2, d1
10000f2f4: 7100b79f    	cmp	w28, #0x2d
10000f2f8: 1e610c41    	fcsel	d1, d2, d1, eq
10000f2fc: 1e680da2    	fcsel	d2, d13, d8, eq
10000f300: f100031f    	cmp	x24, #0x0
10000f304: 1e621c21    	fcsel	d1, d1, d2, ne
10000f308: 52800028    	mov	w8, #0x1                ; =1
10000f30c: 2a0803e8    	mov	w8, w8
10000f310: 3607ca61    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f314: 17fffe53    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f318: d1005e08    	sub	x8, x16, #0x17
10000f31c: b100b51f    	cmn	x8, #0x2d
10000f320: 54000162    	b.hs	0x10000f34c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b8>
10000f324: 5280000f    	mov	w15, #0x0               ; =0
10000f328: b4000538    	cbz	x24, 0x10000f3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000f32c: b1055a1f    	cmn	x16, #0x156
10000f330: 540004eb    	b.lt	0x10000f3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000f334: f104d21f    	cmp	x16, #0x134
10000f338: 5400012d    	b.le	0x10000f35c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7c8>
10000f33c: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000f340: d2800008    	mov	x8, #0x0                ; =0
10000f344: 350004af    	cbnz	w15, 0x10000f3d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000f348: 140000b3    	b	0x10000f614 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000f34c: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000f350: eb08031f    	cmp	x24, x8
10000f354: 54000669    	b.ls	0x10000f420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x88c>
10000f358: 5280000f    	mov	w15, #0x0               ; =0
10000f35c: dac01300    	clz	x0, x24
10000f360: 9ac02302    	lsl	x2, x24, x0
10000f364: 531f7a03    	lsl	w3, w16, #1
10000f368: 110ab068    	add	w8, w3, #0x2ac
10000f36c: b0000185    	adrp	x5, 0x100040000 <__ZL5Lhint+0x790>
10000f370: 913de0a5    	add	x5, x5, #0xf78
10000f374: f86858b1    	ldr	x17, [x5, w8, uxtw #3]
10000f378: 9b027e28    	mul	x8, x17, x2
10000f37c: 9bc27e31    	umulh	x17, x17, x2
10000f380: 2a3103e4    	mvn	w4, w17
10000f384: f240209f    	tst	x4, #0x1ff
10000f388: 540000c1    	b.ne	0x10000f3a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x80c>
10000f38c: 110ab463    	add	w3, w3, #0x2ad
10000f390: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000f394: 9bc27c62    	umulh	x2, x3, x2
10000f398: ab080048    	adds	x8, x2, x8
10000f39c: 9a913631    	cinc	x17, x17, hs
10000f3a0: d37ffe24    	lsr	x4, x17, #63
10000f3a4: 91002483    	add	x3, x4, #0x9
10000f3a8: 9ac32622    	lsr	x2, x17, x3
10000f3ac: 1b067e05    	mul	w5, w16, w6
10000f3b0: 4b000080    	sub	w0, w4, w0
10000f3b4: 0b854000    	add	w0, w0, w5, asr #16
10000f3b8: 1100fc00    	add	w0, w0, #0x3f
10000f3bc: 310ffc1f    	cmn	w0, #0x3ff
10000f3c0: 5400048c    	b.gt	0x10000f450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8bc>
10000f3c4: 3110f41f    	cmn	w0, #0x43d
10000f3c8: 54000cc2    	b.hs	0x10000f560 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9cc>
10000f3cc: 52800011    	mov	w17, #0x0               ; =0
10000f3d0: d2800008    	mov	x8, #0x0                ; =0
10000f3d4: 3400120f    	cbz	w15, 0x10000f614 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000f3d8: 52800002    	mov	w2, #0x0                ; =0
10000f3dc: d2800000    	mov	x0, #0x0                ; =0
10000f3e0: b1000704    	adds	x4, x24, #0x1
10000f3e4: 54001102    	b.hs	0x10000f604 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000f3e8: b1055a1f    	cmn	x16, #0x156
10000f3ec: 540010cb    	b.lt	0x10000f604 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000f3f0: f104d21f    	cmp	x16, #0x134
10000f3f4: 5400066d    	b.le	0x10000f4c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x92c>
10000f3f8: d2800000    	mov	x0, #0x0                ; =0
10000f3fc: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000f400: eb00011f    	cmp	x8, x0
10000f404: 54001040    	b.eq	0x10000f60c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000f408: 140000a7    	b	0x10000f6a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000f40c: d2800018    	mov	x24, #0x0               ; =0
10000f410: aa0c03ef    	mov	x15, x12
10000f414: eb02019f    	cmp	x12, x2
10000f418: 54fff361    	b.ne	0x10000f284 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000f41c: 17ffffa0    	b	0x10000f29c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x708>
10000f420: 9e630301    	ucvtf	d1, x24
10000f424: b0000188    	adrp	x8, 0x100040000 <__ZL5Lhint+0x790>
10000f428: 913a4108    	add	x8, x8, #0xe90
10000f42c: b7f81130    	tbnz	x16, #0x3f, 0x10000f650 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xabc>
10000f430: fc707902    	ldr	d2, [x8, x16, lsl #3]
10000f434: 1e610841    	fmul	d1, d2, d1
10000f438: 1e614022    	fneg	d2, d1
10000f43c: 7100b79f    	cmp	w28, #0x2d
10000f440: 1e610c41    	fcsel	d1, d2, d1, eq
10000f444: 52800028    	mov	w8, #0x1                ; =1
10000f448: 3607c0a1    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f44c: 17fffe05    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f450: 92400444    	and	x4, x2, #0x3
10000f454: 9ac32043    	lsl	x3, x2, x3
10000f458: eb11007f    	cmp	x3, x17
10000f45c: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000f460: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000f464: 91001208    	add	x8, x16, #0x4
10000f468: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000f46c: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000f470: 9a823108    	csel	x8, x8, x2, lo
10000f474: 92400111    	and	x17, x8, #0x1
10000f478: 8b080222    	add	x2, x17, x8
10000f47c: ca080223    	eor	x3, x17, x8
10000f480: 8a080228    	and	x8, x17, x8
10000f484: 8b430508    	add	x8, x8, x3, lsr #1
10000f488: d376fc51    	lsr	x17, x2, #54
10000f48c: f100023f    	cmp	x17, #0x0
10000f490: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000f494: 1a820442    	cinc	w2, w2, ne
10000f498: 0b000040    	add	w0, w2, w0
10000f49c: 711ffc1f    	cmp	w0, #0x7ff
10000f4a0: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000f4a4: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000f4a8: 8a110108    	and	x8, x8, x17
10000f4ac: 9a9f0108    	csel	x8, x8, xzr, eq
10000f4b0: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000f4b4: 1ad16c11    	umin	w17, w0, w17
10000f4b8: 36000aef    	tbz	w15, #0x0, 0x10000f614 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000f4bc: 17ffffc7    	b	0x10000f3d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000f4c0: dac01083    	clz	x3, x4
10000f4c4: 9ac32084    	lsl	x4, x4, x3
10000f4c8: 531f7a05    	lsl	w5, w16, #1
10000f4cc: 110ab0a0    	add	w0, w5, #0x2ac
10000f4d0: b0000187    	adrp	x7, 0x100040000 <__ZL5Lhint+0x790>
10000f4d4: 913de0e7    	add	x7, x7, #0xf78
10000f4d8: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000f4dc: 9b047c40    	mul	x0, x2, x4
10000f4e0: 9bc47c42    	umulh	x2, x2, x4
10000f4e4: 2a2203e6    	mvn	w6, w2
10000f4e8: f24020df    	tst	x6, #0x1ff
10000f4ec: 540000c1    	b.ne	0x10000f504 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x970>
10000f4f0: 110ab4a5    	add	w5, w5, #0x2ad
10000f4f4: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000f4f8: 9bc47ca4    	umulh	x4, x5, x4
10000f4fc: ab000080    	adds	x0, x4, x0
10000f500: 9a823442    	cinc	x2, x2, hs
10000f504: d37ffc46    	lsr	x6, x2, #63
10000f508: 910024c5    	add	x5, x6, #0x9
10000f50c: 9ac52444    	lsr	x4, x2, x5
10000f510: 528a4d47    	mov	w7, #0x526a             ; =21098
10000f514: 72a00067    	movk	w7, #0x3, lsl #16
10000f518: 1b077e07    	mul	w7, w16, w7
10000f51c: 4b0300c3    	sub	w3, w6, w3
10000f520: 0b874063    	add	w3, w3, w7, asr #16
10000f524: 1100fc63    	add	w3, w3, #0x3f
10000f528: 310ffc7f    	cmn	w3, #0x3ff
10000f52c: 540002ec    	b.gt	0x10000f588 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f4>
10000f530: 3110f47f    	cmn	w3, #0x43d
10000f534: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000f538: f28dcd27    	movk	x7, #0x6e69
10000f53c: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000f540: 540009a2    	b.hs	0x10000f674 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xae0>
10000f544: d2800000    	mov	x0, #0x0                ; =0
10000f548: 52800002    	mov	w2, #0x0                ; =0
10000f54c: 528a4d46    	mov	w6, #0x526a             ; =21098
10000f550: 72a00066    	movk	w6, #0x3, lsl #16
10000f554: eb00011f    	cmp	x8, x0
10000f558: 540005a0    	b.eq	0x10000f60c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000f55c: 14000052    	b	0x10000f6a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000f560: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000f564: 4b000108    	sub	w8, w8, w0
10000f568: 9ac82448    	lsr	x8, x2, x8
10000f56c: 92400111    	and	x17, x8, #0x1
10000f570: 8b080231    	add	x17, x17, x8
10000f574: d341fe28    	lsr	x8, x17, #1
10000f578: f24b0e3f    	tst	x17, #0x1e0000000000000
10000f57c: 1a9f07f1    	cset	w17, ne
10000f580: 3707f2cf    	tbnz	w15, #0x0, 0x10000f3d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000f584: 14000024    	b	0x10000f614 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000f588: 92400486    	and	x6, x4, #0x3
10000f58c: 9ac52085    	lsl	x5, x4, x5
10000f590: eb0200bf    	cmp	x5, x2
10000f594: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000f598: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000f59c: 91001200    	add	x0, x16, #0x4
10000f5a0: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000f5a4: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000f5a8: 9a843000    	csel	x0, x0, x4, lo
10000f5ac: 92400002    	and	x2, x0, #0x1
10000f5b0: 8b000044    	add	x4, x2, x0
10000f5b4: ca000045    	eor	x5, x2, x0
10000f5b8: 8a000040    	and	x0, x2, x0
10000f5bc: 8b450400    	add	x0, x0, x5, lsr #1
10000f5c0: d376fc82    	lsr	x2, x4, #54
10000f5c4: f100005f    	cmp	x2, #0x0
10000f5c8: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000f5cc: 1a840484    	cinc	w4, w4, ne
10000f5d0: 0b030083    	add	w3, w4, w3
10000f5d4: 711ffc7f    	cmp	w3, #0x7ff
10000f5d8: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000f5dc: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000f5e0: 8a020000    	and	x0, x0, x2
10000f5e4: 9a9f0000    	csel	x0, x0, xzr, eq
10000f5e8: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000f5ec: 1ac26c62    	umin	w2, w3, w2
10000f5f0: 528a4d46    	mov	w6, #0x526a             ; =21098
10000f5f4: 72a00066    	movk	w6, #0x3, lsl #16
10000f5f8: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000f5fc: f28dcd27    	movk	x7, #0x6e69
10000f600: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000f604: eb00011f    	cmp	x8, x0
10000f608: 540004e1    	b.ne	0x10000f6a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000f60c: 6b02023f    	cmp	w17, w2
10000f610: 540004a1    	b.ne	0x10000f6a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000f614: 2a1103e2    	mov	w2, w17
10000f618: 7100b79f    	cmp	w28, #0x2d
10000f61c: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000f620: 9a9f0129    	csel	x9, x9, xzr, eq
10000f624: aa02d129    	orr	x9, x9, x2, lsl #52
10000f628: aa080129    	orr	x9, x9, x8
10000f62c: 9e670121    	fmov	d1, x9
10000f630: f100011f    	cmp	x8, #0x0
10000f634: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000f638: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000f63c: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000f640: 7a480044    	ccmp	w2, w8, #0x4, eq
10000f644: 1a9f07e8    	cset	w8, ne
10000f648: 3607b0a1    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f64c: 17fffd85    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f650: cb100d08    	sub	x8, x8, x16, lsl #3
10000f654: fd400102    	ldr	d2, [x8]
10000f658: 1e621821    	fdiv	d1, d1, d2
10000f65c: 1e614022    	fneg	d2, d1
10000f660: 7100b79f    	cmp	w28, #0x2d
10000f664: 1e610c41    	fcsel	d1, d2, d1, eq
10000f668: 52800028    	mov	w8, #0x1                ; =1
10000f66c: 3607af81    	tbz	w1, #0x0, 0x10000ec5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000f670: 17fffd7c    	b	0x10000ec60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000f674: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000f678: 4b030000    	sub	w0, w0, w3
10000f67c: 9ac02480    	lsr	x0, x4, x0
10000f680: 92400002    	and	x2, x0, #0x1
10000f684: 8b000042    	add	x2, x2, x0
10000f688: d341fc40    	lsr	x0, x2, #1
10000f68c: f24b0c5f    	tst	x2, #0x1e0000000000000
10000f690: 1a9f07e2    	cset	w2, ne
10000f694: 528a4d46    	mov	w6, #0x526a             ; =21098
10000f698: 72a00066    	movk	w6, #0x3, lsl #16
10000f69c: eb00011f    	cmp	x8, x0
10000f6a0: 54fffb60    	b.eq	0x10000f60c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000f6a4: dac01311    	clz	x17, x24
10000f6a8: 9ad12300    	lsl	x0, x24, x17
10000f6ac: 531f7a02    	lsl	w2, w16, #1
10000f6b0: 110ab048    	add	w8, w2, #0x2ac
10000f6b4: b0000183    	adrp	x3, 0x100040000 <__ZL5Lhint+0x790>
10000f6b8: 913de063    	add	x3, x3, #0xf78
10000f6bc: f868d863    	ldr	x3, [x3, w8, sxtw #3]
10000f6c0: 9bc07c68    	umulh	x8, x3, x0
10000f6c4: 2a2803e4    	mvn	w4, w8
10000f6c8: f240209f    	tst	x4, #0x1ff
10000f6cc: 54000121    	b.ne	0x10000f6f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000f6d0: 9b007c63    	mul	x3, x3, x0
10000f6d4: 110ab442    	add	w2, w2, #0x2ad
10000f6d8: b0000184    	adrp	x4, 0x100040000 <__ZL5Lhint+0x790>
10000f6dc: 913de084    	add	x4, x4, #0xf78
10000f6e0: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000f6e4: 9bc07c40    	umulh	x0, x2, x0
10000f6e8: ab03001f    	cmn	x0, x3
10000f6ec: 9a883508    	cinc	x8, x8, hs
10000f6f0: d37ffd00    	lsr	x0, x8, #63
10000f6f4: 52000000    	eor	w0, w0, #0x1
10000f6f8: 9ac02108    	lsl	x8, x8, x0
10000f6fc: 1b067e02    	mul	w2, w16, w6
10000f700: 13107c42    	asr	w2, w2, #16
10000f704: 4b110051    	sub	w17, w2, w17
10000f708: 4b000231    	sub	w17, w17, w0
10000f70c: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000f710: 2b000222    	adds	w2, w17, w0
10000f714: 54fff825    	b.pl	0x10000f618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa84>
10000f718: a900e3f0    	stp	x16, x24, [sp, #0x8]
10000f71c: f9000fee    	str	x14, [sp, #0x18]
10000f720: 390083ea    	strb	w10, [sp, #0x20]
10000f724: 5280002a    	mov	w10, #0x1               ; =1
10000f728: 390087ea    	strb	w10, [sp, #0x21]
10000f72c: 39008bef    	strb	w15, [sp, #0x22]
10000f730: b94003ea    	ldr	w10, [sp]
10000f734: 910023ee    	add	x14, sp, #0x8
10000f738: b801b1ca    	stur	w10, [x14, #0x1b]
10000f73c: 394013ea    	ldrb	w10, [sp, #0x4]
10000f740: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000f744: a902afe9    	stp	x9, x11, [sp, #0x28]
10000f748: a903b7ec    	stp	x12, x13, [sp, #0x38]
10000f74c: f90027ff    	str	xzr, [sp, #0x48]
10000f750: 910023e0    	add	x0, sp, #0x8
10000f754: aa1903fa    	mov	x26, x25
10000f758: aa0103f9    	mov	x25, x1
10000f75c: aa0803e1    	mov	x1, x8
10000f760: 52800023    	mov	w3, #0x1                ; =1
10000f764: 4ea01c0e    	mov.16b	v14, v0
10000f768: aa0703f5    	mov	x21, x7
10000f76c: 94001512    	bl	0x100014bb4 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000f770: aa1503e7    	mov	x7, x21
10000f774: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000f778: f299fa15    	movk	x21, #0xcfd0
10000f77c: 528a4d46    	mov	w6, #0x526a             ; =21098
10000f780: 72a00066    	movk	w6, #0x3, lsl #16
10000f784: 529c201e    	mov	w30, #0xe100            ; =57600
10000f788: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000f78c: 4eae1dc0    	mov.16b	v0, v14
10000f790: aa0003e8    	mov	x8, x0
10000f794: aa0103e2    	mov	x2, x1
10000f798: aa1903e1    	mov	x1, x25
10000f79c: aa1a03f9    	mov	x25, x26
10000f7a0: d280003a    	mov	x26, #0x1               ; =1
10000f7a4: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000f7a8: 17ffff9c    	b	0x10000f618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa84>
10000f7ac: 6f00e400    	movi.2d	v0, #0000000000000000
10000f7b0: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000f7b4: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000f7b8: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000f7bc: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000f7c0: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000f7c4: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000f7c8: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000f7cc: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000f7d0: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000f7d4: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000f7d8: 9103c3ff    	add	sp, sp, #0xf0
10000f7dc: d65f03c0    	ret
10000f7e0: 52800200    	mov	w0, #0x10               ; =16
10000f7e4: 9400b477    	bl	0x10003c9c0 <_strtod_l+0x10003c9c0>
10000f7e8: aa0003f3    	mov	x19, x0
10000f7ec: b00001e1    	adrp	x1, 0x10004c000 <_strtod_l+0x10004c000>
10000f7f0: 910bb421    	add	x1, x1, #0x2ed
10000f7f4: 9400b3f2    	bl	0x10003c7bc <_strtod_l+0x10003c7bc>
10000f7f8: aa1303e0    	mov	x0, x19
10000f7fc: 9400b39d    	bl	0x10003c670 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000f800: aa0003f4    	mov	x20, x0
10000f804: aa1303e0    	mov	x0, x19
10000f808: 9400b47d    	bl	0x10003c9fc <_strtod_l+0x10003c9fc>
10000f80c: aa1403e0    	mov	x0, x20
10000f810: 9400b3b8    	bl	0x10003c6f0 <_strtod_l+0x10003c6f0>
