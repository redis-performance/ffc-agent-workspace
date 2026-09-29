
simple_fastfloat_benchmark/build/m6-scan-neon16/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d7d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d7d8: d10483ff    	sub	sp, sp, #0x120
10000d7dc: 6d083bef    	stp	d15, d14, [sp, #0x80]
10000d7e0: 6d0933ed    	stp	d13, d12, [sp, #0x90]
10000d7e4: 6d0a2beb    	stp	d11, d10, [sp, #0xa0]
10000d7e8: 6d0b23e9    	stp	d9, d8, [sp, #0xb0]
10000d7ec: a90c6ffc    	stp	x28, x27, [sp, #0xc0]
10000d7f0: a90d67fa    	stp	x26, x25, [sp, #0xd0]
10000d7f4: a90e5ff8    	stp	x24, x23, [sp, #0xe0]
10000d7f8: a90f57f6    	stp	x22, x21, [sp, #0xf0]
10000d7fc: a9104ff4    	stp	x20, x19, [sp, #0x100]
10000d800: a9117bfd    	stp	x29, x30, [sp, #0x110]
10000d804: 910443fd    	add	x29, sp, #0x110
10000d808: a9405013    	ldp	x19, x20, [x0]
10000d80c: eb14027f    	cmp	x19, x20
10000d810: 54006660    	b.eq	0x10000e4dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xd04>
10000d814: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000d818: f299fa15    	movk	x21, #0xcfd0
10000d81c: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000d820: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000d824: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d828: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d82c: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d830: d2800c99    	mov	x25, #0x64              ; =100
10000d834: f2c84819    	movk	x25, #0x4240, lsl #32
10000d838: f2e001f9    	movk	x25, #0xf, lsl #48
10000d83c: d280003e    	mov	x30, #0x1               ; =1
10000d840: f2c4e21e    	movk	x30, #0x2710, lsl #32
10000d844: 529c201a    	mov	w26, #0xe100            ; =57600
10000d848: 72a0beba    	movk	w26, #0x5f5, lsl #16
10000d84c: 528a4d46    	mov	w6, #0x526a             ; =21098
10000d850: 72a00066    	movk	w6, #0x3, lsl #16
10000d854: 6f00e408    	movi.2d	v8, #0000000000000000
10000d858: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d85c: 9e670109    	fmov	d9, x8
10000d860: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d864: 9e67010a    	fmov	d10, x8
10000d868: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d86c: 9e67010b    	fmov	d11, x8
10000d870: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d874: 9e67010c    	fmov	d12, x8
10000d878: 5280015b    	mov	w27, #0xa               ; =10
10000d87c: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000d880: 91336084    	add	x4, x4, #0xcd8
10000d884: 128f7967    	mov	w7, #-0x7bcc            ; =-31692
10000d888: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d88c: 9e67010d    	fmov	d13, x8
10000d890: 4f06e605    	movi.16b	v5, #0xd0
10000d894: d0000168    	adrp	x8, 0x10003b000 <__ZN4absl12lts_2025081416strings_internal10ParseFloatILi16EEENS1_11ParsedFloatEPKcS5_NS0_12chars_formatE+0x254>
10000d898: fd447d0e    	ldr	d14, [x8, #0x8f8]
10000d89c: d0000168    	adrp	x8, 0x10003b000 <__ZN4absl12lts_2025081416strings_internal10ParseFloatILi16EEENS1_11ParsedFloatEPKcS5_NS0_12chars_formatE+0x254>
10000d8a0: 3dc27906    	ldr	q6, [x8, #0x9e0]
10000d8a4: d0000168    	adrp	x8, 0x10003b000 <__ZN4absl12lts_2025081416strings_internal10ParseFloatILi16EEENS1_11ParsedFloatEPKcS5_NS0_12chars_formatE+0x254>
10000d8a8: 3dc27d07    	ldr	q7, [x8, #0x9f0]
10000d8ac: 6f00e400    	movi.2d	v0, #0000000000000000
10000d8b0: 14000009    	b	0x10000d8d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xfc>
10000d8b4: 52800008    	mov	w8, #0x0                ; =0
10000d8b8: 37000041    	tbnz	w1, #0x0, 0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000d8bc: 360062a8    	tbz	w8, #0x0, 0x10000e510 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xd38>
10000d8c0: 1e612000    	fcmp	d0, d1
10000d8c4: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d8c8: 91006273    	add	x19, x19, #0x18
10000d8cc: eb14027f    	cmp	x19, x20
10000d8d0: 54006080    	b.eq	0x10000e4e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xd08>
10000d8d4: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d8d8: b7f800a0    	tbnz	x0, #0x3f, 0x10000d8ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x114>
10000d8dc: aa1303f1    	mov	x17, x19
10000d8e0: 6f00e401    	movi.2d	v1, #0000000000000000
10000d8e4: b50000a0    	cbnz	x0, 0x10000d8f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x120>
10000d8e8: 17fffff3    	b	0x10000d8b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xdc>
10000d8ec: a9400271    	ldp	x17, x0, [x19]
10000d8f0: 6f00e401    	movi.2d	v1, #0000000000000000
10000d8f4: b4fffe00    	cbz	x0, 0x10000d8b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xdc>
10000d8f8: 3940023c    	ldrb	w28, [x17]
10000d8fc: aa1c03eb    	mov	x11, x28
10000d900: aa1103e9    	mov	x9, x17
10000d904: 7100b79f    	cmp	w28, #0x2d
10000d908: 1a9f17ea    	cset	w10, eq
10000d90c: 54000161    	b.ne	0x10000d938 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x160>
10000d910: f100041f    	cmp	x0, #0x1
10000d914: 54001ea0    	b.eq	0x10000dce8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x510>
10000d918: aa1103e9    	mov	x9, x17
10000d91c: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000d920: 12001d0b    	and	w11, w8, #0xff
10000d924: 7100b91f    	cmp	w8, #0x2e
10000d928: 54000080    	b.eq	0x10000d938 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x160>
10000d92c: 5100c108    	sub	w8, w8, #0x30
10000d930: 7100251f    	cmp	w8, #0x9
10000d934: 54001da8    	b.hi	0x10000dce8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x510>
10000d938: 8b00022f    	add	x15, x17, x0
10000d93c: eb0f013f    	cmp	x9, x15
10000d940: 540008c0    	b.eq	0x10000da58 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x280>
10000d944: 13001d68    	sxtb	w8, w11
10000d948: 5100c108    	sub	w8, w8, #0x30
10000d94c: 7100251f    	cmp	w8, #0x9
10000d950: 54000848    	b.hi	0x10000da58 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x280>
10000d954: 91000528    	add	x8, x9, #0x1
10000d958: 93401d6b    	sxtb	x11, w11
10000d95c: d100c178    	sub	x24, x11, #0x30
10000d960: eb0f011f    	cmp	x8, x15
10000d964: 540007e0    	b.eq	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d968: 39c0010b    	ldrsb	w11, [x8]
10000d96c: 5100c16c    	sub	w12, w11, #0x30
10000d970: 7100259f    	cmp	w12, #0x9
10000d974: 54000768    	b.hi	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d978: 93407d6b    	sxtw	x11, w11
10000d97c: 91000928    	add	x8, x9, #0x2
10000d980: d100c16b    	sub	x11, x11, #0x30
10000d984: aa1803ec    	mov	x12, x24
10000d988: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d98c: 8b180578    	add	x24, x11, x24, lsl #1
10000d990: eb0f011f    	cmp	x8, x15
10000d994: 54000660    	b.eq	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d998: 39c0010b    	ldrsb	w11, [x8]
10000d99c: 5100c16c    	sub	w12, w11, #0x30
10000d9a0: 7100259f    	cmp	w12, #0x9
10000d9a4: 540005e8    	b.hi	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d9a8: 93407d6b    	sxtw	x11, w11
10000d9ac: 91000d28    	add	x8, x9, #0x3
10000d9b0: d100c16b    	sub	x11, x11, #0x30
10000d9b4: aa1803ec    	mov	x12, x24
10000d9b8: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d9bc: 8b180578    	add	x24, x11, x24, lsl #1
10000d9c0: eb0f011f    	cmp	x8, x15
10000d9c4: 540004e0    	b.eq	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d9c8: 39c0010b    	ldrsb	w11, [x8]
10000d9cc: 5100c16c    	sub	w12, w11, #0x30
10000d9d0: 7100259f    	cmp	w12, #0x9
10000d9d4: 54000468    	b.hi	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d9d8: 93407d6b    	sxtw	x11, w11
10000d9dc: 91001128    	add	x8, x9, #0x4
10000d9e0: d100c16b    	sub	x11, x11, #0x30
10000d9e4: aa1803ec    	mov	x12, x24
10000d9e8: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d9ec: 8b180578    	add	x24, x11, x24, lsl #1
10000d9f0: eb0f011f    	cmp	x8, x15
10000d9f4: 54000360    	b.eq	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000d9f8: 39c0010b    	ldrsb	w11, [x8]
10000d9fc: 5100c16c    	sub	w12, w11, #0x30
10000da00: 7100259f    	cmp	w12, #0x9
10000da04: 540002e8    	b.hi	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000da08: 93407d6b    	sxtw	x11, w11
10000da0c: 91001528    	add	x8, x9, #0x5
10000da10: d100c16c    	sub	x12, x11, #0x30
10000da14: 8b180b0b    	add	x11, x24, x24, lsl #2
10000da18: 8b0b058b    	add	x11, x12, x11, lsl #1
10000da1c: eb0f011f    	cmp	x8, x15
10000da20: 54001e20    	b.eq	0x10000dde4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x60c>
10000da24: 39c0010c    	ldrsb	w12, [x8]
10000da28: 5100c18d    	sub	w13, w12, #0x30
10000da2c: 710025bf    	cmp	w13, #0x9
10000da30: 54001da8    	b.hi	0x10000dde4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x60c>
10000da34: 93407d8c    	sxtw	x12, w12
10000da38: d100c18c    	sub	x12, x12, #0x30
10000da3c: 8b0b0978    	add	x24, x11, x11, lsl #2
10000da40: 8b180598    	add	x24, x12, x24, lsl #1
10000da44: 91000508    	add	x8, x8, #0x1
10000da48: aa1803eb    	mov	x11, x24
10000da4c: eb0f011f    	cmp	x8, x15
10000da50: 54fffea1    	b.ne	0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x24c>
10000da54: 14000003    	b	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x288>
10000da58: d2800018    	mov	x24, #0x0               ; =0
10000da5c: aa0903e8    	mov	x8, x9
10000da60: cb09010b    	sub	x11, x8, x9
10000da64: eb0f011f    	cmp	x8, x15
10000da68: 54001c60    	b.eq	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000da6c: 3940010c    	ldrb	w12, [x8]
10000da70: 7100b99f    	cmp	w12, #0x2e
10000da74: 54001c01    	b.ne	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000da78: 9100050c    	add	x12, x8, #0x1
10000da7c: cb0c01ee    	sub	x14, x15, x12
10000da80: f10041df    	cmp	x14, #0x10
10000da84: 540008ab    	b.lt	0x10000db98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000da88: 9100250d    	add	x13, x8, #0x9
10000da8c: 14000014    	b	0x10000dadc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x304>
10000da90: 2e2ec062    	umull.8h	v2, v3, v14
10000da94: 6e034063    	ext.16b	v3, v3, v3, #0x8
10000da98: 2e2ec063    	umull.8h	v3, v3, v14
10000da9c: 4e63bc42    	addp.8h	v2, v2, v3
10000daa0: 4e669c42    	mul.8h	v2, v2, v6
10000daa4: 6e602842    	uaddlp.4s	v2, v2
10000daa8: 4ea79c42    	mul.4s	v2, v2, v7
10000daac: 6ea02842    	uaddlp.2d	v2, v2
10000dab0: 4e183c50    	mov.d	x16, v2[1]
10000dab4: 9e660042    	fmov	x2, d2
10000dab8: d2adf823    	mov	x3, #0x6fc10000         ; =1874919424
10000dabc: f2d0de43    	movk	x3, #0x86f2, lsl #32
10000dac0: f2e00463    	movk	x3, #0x23, lsl #48
10000dac4: 9b034310    	madd	x16, x24, x3, x16
10000dac8: 9b1a4058    	madd	x24, x2, x26, x16
10000dacc: 910041ad    	add	x13, x13, #0x10
10000dad0: d10041ce    	sub	x14, x14, #0x10
10000dad4: f1003ddf    	cmp	x14, #0xf
10000dad8: 5400052d    	b.le	0x10000db7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3a4>
10000dadc: 3cdf81a2    	ldur	q2, [x13, #-0x8]
10000dae0: 4e258443    	add.16b	v3, v2, v5
10000dae4: 6e30a864    	umaxv.16b	b4, v3
10000dae8: 1e260090    	fmov	w16, s4
10000daec: 7100261f    	cmp	w16, #0x9
10000daf0: 54fffd09    	b.ls	0x10000da90 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x2b8>
10000daf4: 9e660050    	fmov	x16, d2
10000daf8: 8b160202    	add	x2, x16, x22
10000dafc: 8b150210    	add	x16, x16, x21
10000db00: aa100042    	orr	x2, x2, x16
10000db04: f201c05f    	tst	x2, #0x8080808080808080
10000db08: 540003a1    	b.ne	0x10000db7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3a4>
10000db0c: 4e183c42    	mov.d	x2, v2[1]
10000db10: 8b160043    	add	x3, x2, x22
10000db14: 8b150042    	add	x2, x2, x21
10000db18: aa020063    	orr	x3, x3, x2
10000db1c: f201c07f    	tst	x3, #0x8080808080808080
10000db20: 54001481    	b.ne	0x10000ddb0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5d8>
10000db24: 9b1b7e03    	mul	x3, x16, x27
10000db28: 8b502070    	add	x16, x3, x16, lsr #8
10000db2c: 92001e03    	and	x3, x16, #0xff000000ff
10000db30: 9b197c63    	mul	x3, x3, x25
10000db34: d350fe10    	lsr	x16, x16, #16
10000db38: 92001e10    	and	x16, x16, #0xff000000ff
10000db3c: 9b1e0e10    	madd	x16, x16, x30, x3
10000db40: 9b1b7c43    	mul	x3, x2, x27
10000db44: 8b422062    	add	x2, x3, x2, lsr #8
10000db48: 92001c43    	and	x3, x2, #0xff000000ff
10000db4c: 9b197c63    	mul	x3, x3, x25
10000db50: d350fc42    	lsr	x2, x2, #16
10000db54: 92001c42    	and	x2, x2, #0xff000000ff
10000db58: 9b1e0c42    	madd	x2, x2, x30, x3
10000db5c: 9b1a7f03    	mul	x3, x24, x26
10000db60: 8b508070    	add	x16, x3, x16, lsr #32
10000db64: 9b1a7e10    	mul	x16, x16, x26
10000db68: 8b428218    	add	x24, x16, x2, lsr #32
10000db6c: 910041ad    	add	x13, x13, #0x10
10000db70: d10041ce    	sub	x14, x14, #0x10
10000db74: f1003ddf    	cmp	x14, #0xf
10000db78: 54fffb2c    	b.gt	0x10000dadc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x304>
10000db7c: d10021ad    	sub	x13, x13, #0x8
10000db80: cb0d01ee    	sub	x14, x15, x13
10000db84: f10021df    	cmp	x14, #0x8
10000db88: 5400010a    	b.ge	0x10000dba8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3d0>
10000db8c: f10011df    	cmp	x14, #0x4
10000db90: 5400046b    	b.lt	0x10000dc1c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x444>
10000db94: 14000018    	b	0x10000dbf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x41c>
10000db98: aa0c03ed    	mov	x13, x12
10000db9c: cb0c01ee    	sub	x14, x15, x12
10000dba0: f10021df    	cmp	x14, #0x8
10000dba4: 54ffff4b    	b.lt	0x10000db8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3b4>
10000dba8: f94001ae    	ldr	x14, [x13]
10000dbac: 8b1601d0    	add	x16, x14, x22
10000dbb0: 8b1501ce    	add	x14, x14, x21
10000dbb4: aa0e0210    	orr	x16, x16, x14
10000dbb8: f201c21f    	tst	x16, #0x8080808080808080
10000dbbc: 540001c1    	b.ne	0x10000dbf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x41c>
10000dbc0: 9b1a7f10    	mul	x16, x24, x26
10000dbc4: 9b1b7dc2    	mul	x2, x14, x27
10000dbc8: 8b4e204e    	add	x14, x2, x14, lsr #8
10000dbcc: 92001dc2    	and	x2, x14, #0xff000000ff
10000dbd0: 9b197c42    	mul	x2, x2, x25
10000dbd4: d350fdce    	lsr	x14, x14, #16
10000dbd8: 92001dce    	and	x14, x14, #0xff000000ff
10000dbdc: 9b1e09ce    	madd	x14, x14, x30, x2
10000dbe0: 8b4e8218    	add	x24, x16, x14, lsr #32
10000dbe4: 910021ad    	add	x13, x13, #0x8
10000dbe8: cb0d01ee    	sub	x14, x15, x13
10000dbec: f10011df    	cmp	x14, #0x4
10000dbf0: 5400016b    	b.lt	0x10000dc1c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x444>
10000dbf4: b94001ae    	ldr	w14, [x13]
10000dbf8: 5288c8d0    	mov	w16, #0x4646            ; =17990
10000dbfc: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000dc00: 0b1001d0    	add	w16, w14, w16
10000dc04: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000dc08: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000dc0c: 0b0201ce    	add	w14, w14, w2
10000dc10: 2a0e0210    	orr	w16, w16, w14
10000dc14: 7201c21f    	tst	w16, #0x80808080
10000dc18: 54000a60    	b.eq	0x10000dd64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000dc1c: eb0f01bf    	cmp	x13, x15
10000dc20: 54000ba0    	b.eq	0x10000dd94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5bc>
10000dc24: 39c001ae    	ldrsb	w14, [x13]
10000dc28: 5100c1d0    	sub	w16, w14, #0x30
10000dc2c: 7100261f    	cmp	w16, #0x9
10000dc30: 54000508    	b.hi	0x10000dcd0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f8>
10000dc34: 12001dd0    	and	w16, w14, #0xff
10000dc38: 910005ae    	add	x14, x13, #0x1
10000dc3c: 5100c210    	sub	w16, w16, #0x30
10000dc40: 92401e10    	and	x16, x16, #0xff
10000dc44: aa1803e2    	mov	x2, x24
10000dc48: 8b020858    	add	x24, x2, x2, lsl #2
10000dc4c: 8b180618    	add	x24, x16, x24, lsl #1
10000dc50: eb0f01df    	cmp	x14, x15
10000dc54: 54000400    	b.eq	0x10000dcd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000dc58: 39c001d0    	ldrsb	w16, [x14]
10000dc5c: 5100c202    	sub	w2, w16, #0x30
10000dc60: 7100245f    	cmp	w2, #0x9
10000dc64: 54000388    	b.hi	0x10000dcd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000dc68: 12001e10    	and	w16, w16, #0xff
10000dc6c: 910009ae    	add	x14, x13, #0x2
10000dc70: 5100c210    	sub	w16, w16, #0x30
10000dc74: 92401e10    	and	x16, x16, #0xff
10000dc78: aa1803e2    	mov	x2, x24
10000dc7c: 8b020858    	add	x24, x2, x2, lsl #2
10000dc80: 8b180618    	add	x24, x16, x24, lsl #1
10000dc84: eb0f01df    	cmp	x14, x15
10000dc88: 54000260    	b.eq	0x10000dcd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000dc8c: 39c001d0    	ldrsb	w16, [x14]
10000dc90: 5100c202    	sub	w2, w16, #0x30
10000dc94: 7100245f    	cmp	w2, #0x9
10000dc98: 540001e8    	b.hi	0x10000dcd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000dc9c: 12001e10    	and	w16, w16, #0xff
10000dca0: 91000dae    	add	x14, x13, #0x3
10000dca4: 5100c20d    	sub	w13, w16, #0x30
10000dca8: 92401dad    	and	x13, x13, #0xff
10000dcac: 8b180b10    	add	x16, x24, x24, lsl #2
10000dcb0: 8b1005b0    	add	x16, x13, x16, lsl #1
10000dcb4: aa1003f8    	mov	x24, x16
10000dcb8: cb0c01cd    	sub	x13, x14, x12
10000dcbc: cb0e0190    	sub	x16, x12, x14
10000dcc0: cb100163    	sub	x3, x11, x16
10000dcc4: aa0e03e2    	mov	x2, x14
10000dcc8: b5000a43    	cbnz	x3, 0x10000de10 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x638>
10000dccc: 14000007    	b	0x10000dce8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x510>
10000dcd0: aa0d03ee    	mov	x14, x13
10000dcd4: cb0c01cd    	sub	x13, x14, x12
10000dcd8: cb0e0190    	sub	x16, x12, x14
10000dcdc: cb100163    	sub	x3, x11, x16
10000dce0: aa0e03e2    	mov	x2, x14
10000dce4: b5000963    	cbnz	x3, 0x10000de10 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x638>
10000dce8: 39400228    	ldrb	w8, [x17]
10000dcec: 7100b51f    	cmp	w8, #0x2d
10000dcf0: 1a9f17e9    	cset	w9, eq
10000dcf4: cb09000a    	sub	x10, x0, x9
10000dcf8: f1000d5f    	cmp	x10, #0x3
10000dcfc: 54ffddcb    	b.lt	0x10000d8b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xdc>
10000dd00: 8b090229    	add	x9, x17, x9
10000dd04: 3940092a    	ldrb	w10, [x9, #0x2]
10000dd08: 79400129    	ldrh	w9, [x9]
10000dd0c: aa0a4129    	orr	x9, x9, x10, lsl #16
10000dd10: b203c129    	orr	x9, x9, #0x2020202020202020
10000dd14: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000dd18: f28dcd2a    	movk	x10, #0x6e69
10000dd1c: f2a40cca    	movk	x10, #0x2066, lsl #16
10000dd20: eb0a013f    	cmp	x9, x10
10000dd24: 54000160    	b.eq	0x10000dd50 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x578>
10000dd28: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000dd2c: f28c2dca    	movk	x10, #0x616e
10000dd30: f2a40dca    	movk	x10, #0x206e, lsl #16
10000dd34: eb0a013f    	cmp	x9, x10
10000dd38: 54ffdbe1    	b.ne	0x10000d8b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xdc>
10000dd3c: 7100b51f    	cmp	w8, #0x2d
10000dd40: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000dd44: 52800028    	mov	w8, #0x1                ; =1
10000dd48: 3607dba1    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000dd4c: 17fffedd    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000dd50: 7100b51f    	cmp	w8, #0x2d
10000dd54: 1e690d41    	fcsel	d1, d10, d9, eq
10000dd58: 52800028    	mov	w8, #0x1                ; =1
10000dd5c: 3607db01    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000dd60: 17fffed8    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000dd64: 1b1b7dd0    	mul	w16, w14, w27
10000dd68: 0b4e220e    	add	w14, w16, w14, lsr #8
10000dd6c: 12009dce    	and	w14, w14, #0xff00ff
10000dd70: 52800030    	mov	w16, #0x1               ; =1
10000dd74: 72a00c90    	movk	w16, #0x64, lsl #16
10000dd78: 1b107dce    	mul	w14, w14, w16
10000dd7c: 53107dce    	lsr	w14, w14, #16
10000dd80: 5284e210    	mov	w16, #0x2710            ; =10000
10000dd84: 9b103b18    	madd	x24, x24, x16, x14
10000dd88: 910011ad    	add	x13, x13, #0x4
10000dd8c: eb0f01bf    	cmp	x13, x15
10000dd90: 54fff4a1    	b.ne	0x10000dc24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x44c>
10000dd94: aa0d03ee    	mov	x14, x13
10000dd98: cb0c01ad    	sub	x13, x13, x12
10000dd9c: cb0e0190    	sub	x16, x12, x14
10000dda0: cb100163    	sub	x3, x11, x16
10000dda4: aa0e03e2    	mov	x2, x14
10000dda8: b5000343    	cbnz	x3, 0x10000de10 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x638>
10000ddac: 17ffffcf    	b	0x10000dce8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x510>
10000ddb0: 9b1a7f0e    	mul	x14, x24, x26
10000ddb4: 9b1b7e02    	mul	x2, x16, x27
10000ddb8: 8b502050    	add	x16, x2, x16, lsr #8
10000ddbc: 92001e02    	and	x2, x16, #0xff000000ff
10000ddc0: 9b197c42    	mul	x2, x2, x25
10000ddc4: d350fe10    	lsr	x16, x16, #16
10000ddc8: 92001e10    	and	x16, x16, #0xff000000ff
10000ddcc: 9b1e0a10    	madd	x16, x16, x30, x2
10000ddd0: 8b5081d8    	add	x24, x14, x16, lsr #32
10000ddd4: cb0d01ee    	sub	x14, x15, x13
10000ddd8: f10021df    	cmp	x14, #0x8
10000dddc: 54ffee6a    	b.ge	0x10000dba8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3d0>
10000dde0: 17ffff6b    	b	0x10000db8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3b4>
10000dde4: aa0b03f8    	mov	x24, x11
10000dde8: cb09010b    	sub	x11, x8, x9
10000ddec: eb0f011f    	cmp	x8, x15
10000ddf0: 54ffe3e1    	b.ne	0x10000da6c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x294>
10000ddf4: d280000d    	mov	x13, #0x0               ; =0
10000ddf8: d2800010    	mov	x16, #0x0               ; =0
10000ddfc: d280000c    	mov	x12, #0x0               ; =0
10000de00: d2800002    	mov	x2, #0x0                ; =0
10000de04: aa0803ee    	mov	x14, x8
10000de08: aa0b03e3    	mov	x3, x11
10000de0c: b4fff6eb    	cbz	x11, 0x10000dce8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x510>
10000de10: eb0f01df    	cmp	x14, x15
10000de14: 540005c0    	b.eq	0x10000decc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f4>
10000de18: 394001d1    	ldrb	w17, [x14]
10000de1c: 321b0231    	orr	w17, w17, #0x20
10000de20: 7101963f    	cmp	w17, #0x65
10000de24: 54000541    	b.ne	0x10000decc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f4>
10000de28: 910005c0    	add	x0, x14, #0x1
10000de2c: eb0f001f    	cmp	x0, x15
10000de30: 54000480    	b.eq	0x10000dec0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6e8>
10000de34: 39400011    	ldrb	w17, [x0]
10000de38: 910009c4    	add	x4, x14, #0x2
10000de3c: 7100ae3f    	cmp	w17, #0x2b
10000de40: 9a800080    	csel	x0, x4, x0, eq
10000de44: 7100b63f    	cmp	w17, #0x2d
10000de48: 52800031    	mov	w17, #0x1               ; =1
10000de4c: 1a9113f1    	csel	w17, wzr, w17, ne
10000de50: 9a841000    	csel	x0, x0, x4, ne
10000de54: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000de58: 91336084    	add	x4, x4, #0xcd8
10000de5c: eb0f001f    	cmp	x0, x15
10000de60: 54000360    	b.eq	0x10000decc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f4>
10000de64: 39c00004    	ldrsb	w4, [x0]
10000de68: 5100c084    	sub	w4, w4, #0x30
10000de6c: 7100249f    	cmp	w4, #0x9
10000de70: 54000968    	b.hi	0x10000df9c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7c4>
10000de74: d280000e    	mov	x14, #0x0               ; =0
10000de78: 14000004    	b	0x10000de88 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000de7c: 91000400    	add	x0, x0, #0x1
10000de80: eb0f001f    	cmp	x0, x15
10000de84: 54000980    	b.eq	0x10000dfb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7dc>
10000de88: 39c00004    	ldrsb	w4, [x0]
10000de8c: 5100c085    	sub	w5, w4, #0x30
10000de90: 710024bf    	cmp	w5, #0x9
10000de94: 54000908    	b.hi	0x10000dfb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7dc>
10000de98: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000de9c: eb0501df    	cmp	x14, x5
10000dea0: 54fffeec    	b.gt	0x10000de7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a4>
10000dea4: 12001c84    	and	w4, w4, #0xff
10000dea8: 5100c084    	sub	w4, w4, #0x30
10000deac: 92401c84    	and	x4, x4, #0xff
10000deb0: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000deb4: 8b050485    	add	x5, x4, x5, lsl #1
10000deb8: aa0503ee    	mov	x14, x5
10000debc: 17fffff0    	b	0x10000de7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a4>
10000dec0: 52800011    	mov	w17, #0x0               ; =0
10000dec4: eb0f001f    	cmp	x0, x15
10000dec8: 54fffce1    	b.ne	0x10000de64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x68c>
10000decc: d2800011    	mov	x17, #0x0               ; =0
10000ded0: f100507f    	cmp	x3, #0x14
10000ded4: 5400080b    	b.lt	0x10000dfd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7fc>
10000ded8: eb0f013f    	cmp	x9, x15
10000dedc: 54000240    	b.eq	0x10000df24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x74c>
10000dee0: aa0903e0    	mov	x0, x9
10000dee4: 14000007    	b	0x10000df00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000dee8: 7100c09f    	cmp	w4, #0x30
10000deec: 1a9f17e4    	cset	w4, eq
10000def0: cb040063    	sub	x3, x3, x4
10000def4: 91000400    	add	x0, x0, #0x1
10000def8: eb0f001f    	cmp	x0, x15
10000defc: 540000c0    	b.eq	0x10000df14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x73c>
10000df00: 39400004    	ldrb	w4, [x0]
10000df04: 7100c09f    	cmp	w4, #0x30
10000df08: 54ffff00    	b.eq	0x10000dee8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x710>
10000df0c: 7100b89f    	cmp	w4, #0x2e
10000df10: 54fffec0    	b.eq	0x10000dee8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x710>
10000df14: f100507f    	cmp	x3, #0x14
10000df18: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000df1c: 91336084    	add	x4, x4, #0xcd8
10000df20: 540005ab    	b.lt	0x10000dfd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7fc>
10000df24: eb08013f    	cmp	x9, x8
10000df28: 54000f60    	b.eq	0x10000e114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x93c>
10000df2c: d2800018    	mov	x24, #0x0               ; =0
10000df30: aa0903ef    	mov	x15, x9
10000df34: 388015f0    	ldrsb	x16, [x15], #0x1
10000df38: 9b1b4310    	madd	x16, x24, x27, x16
10000df3c: d100c218    	sub	x24, x16, #0x30
10000df40: eb17031f    	cmp	x24, x23
10000df44: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000df48: 54ffff61    	b.ne	0x10000df34 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x75c>
10000df4c: d10006f0    	sub	x16, x23, #0x1
10000df50: eb10031f    	cmp	x24, x16
10000df54: 54000168    	b.hi	0x10000df80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a8>
10000df58: aa0c03ef    	mov	x15, x12
10000df5c: eb02019f    	cmp	x12, x2
10000df60: 540000e0    	b.eq	0x10000df7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a4>
10000df64: 388015e8    	ldrsb	x8, [x15], #0x1
10000df68: 9b1b2308    	madd	x8, x24, x27, x8
10000df6c: d100c118    	sub	x24, x8, #0x30
10000df70: eb17031f    	cmp	x24, x23
10000df74: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000df78: 54ffff61    	b.ne	0x10000df64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000df7c: aa0c03e8    	mov	x8, x12
10000df80: cb0f0108    	sub	x8, x8, x15
10000df84: 8b110110    	add	x16, x8, x17
10000df88: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000df8c: b9002bff    	str	wzr, [sp, #0x28]
10000df90: 5280002f    	mov	w15, #0x1               ; =1
10000df94: b50004d8    	cbnz	x24, 0x10000e02c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x854>
10000df98: 14000027    	b	0x10000e034 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x85c>
10000df9c: d2800011    	mov	x17, #0x0               ; =0
10000dfa0: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000dfa4: 91336084    	add	x4, x4, #0xcd8
10000dfa8: f100507f    	cmp	x3, #0x14
10000dfac: 54fff96a    	b.ge	0x10000ded8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x700>
10000dfb0: 14000009    	b	0x10000dfd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7fc>
10000dfb4: 7100023f    	cmp	w17, #0x0
10000dfb8: da8e05d1    	cneg	x17, x14, ne
10000dfbc: 8b100230    	add	x16, x17, x16
10000dfc0: aa0003ee    	mov	x14, x0
10000dfc4: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000dfc8: 91336084    	add	x4, x4, #0xcd8
10000dfcc: f100507f    	cmp	x3, #0x14
10000dfd0: 54fff84a    	b.ge	0x10000ded8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x700>
10000dfd4: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000dfd8: b9002bff    	str	wzr, [sp, #0x28]
10000dfdc: b50001f0    	cbnz	x16, 0x10000e018 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x840>
10000dfe0: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000dfe4: eb08031f    	cmp	x24, x8
10000dfe8: 54000188    	b.hi	0x10000e018 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x840>
10000dfec: 9e630301    	ucvtf	d1, x24
10000dff0: 1e614022    	fneg	d2, d1
10000dff4: 7100b79f    	cmp	w28, #0x2d
10000dff8: 1e610c41    	fcsel	d1, d2, d1, eq
10000dffc: 1e680da2    	fcsel	d2, d13, d8, eq
10000e000: f100031f    	cmp	x24, #0x0
10000e004: 1e621c21    	fcsel	d1, d1, d2, ne
10000e008: 52800028    	mov	w8, #0x1                ; =1
10000e00c: 2a0803e8    	mov	w8, w8
10000e010: 3607c561    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000e014: 17fffe2b    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000e018: d1005e08    	sub	x8, x16, #0x17
10000e01c: b100b51f    	cmn	x8, #0x2d
10000e020: 540002a2    	b.hs	0x10000e074 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x89c>
10000e024: 5280000f    	mov	w15, #0x0               ; =0
10000e028: b4000078    	cbz	x24, 0x10000e034 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x85c>
10000e02c: b1055a1f    	cmn	x16, #0x156
10000e030: 540002ca    	b.ge	0x10000e088 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8b0>
10000e034: 52800011    	mov	w17, #0x0               ; =0
10000e038: d2800008    	mov	x8, #0x0                ; =0
10000e03c: 340017cf    	cbz	w15, 0x10000e334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000e040: 52800002    	mov	w2, #0x0                ; =0
10000e044: d2800000    	mov	x0, #0x0                ; =0
10000e048: b1000704    	adds	x4, x24, #0x1
10000e04c: 54001682    	b.hs	0x10000e31c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb44>
10000e050: b1055a1f    	cmn	x16, #0x156
10000e054: 5400164b    	b.lt	0x10000e31c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb44>
10000e058: f104d21f    	cmp	x16, #0x134
10000e05c: 54000bad    	b.le	0x10000e1d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f8>
10000e060: d2800000    	mov	x0, #0x0                ; =0
10000e064: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000e068: eb00011f    	cmp	x8, x0
10000e06c: 540015c0    	b.eq	0x10000e324 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb4c>
10000e070: 140000d7    	b	0x10000e3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xbf4>
10000e074: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000e078: eb08031f    	cmp	x24, x8
10000e07c: 54000569    	b.ls	0x10000e128 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x950>
10000e080: 5280000f    	mov	w15, #0x0               ; =0
10000e084: 14000005    	b	0x10000e098 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8c0>
10000e088: f104d21f    	cmp	x16, #0x134
10000e08c: 5400006d    	b.le	0x10000e098 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8c0>
10000e090: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000e094: 17ffffe9    	b	0x10000e038 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x860>
10000e098: dac01300    	clz	x0, x24
10000e09c: 9ac02302    	lsl	x2, x24, x0
10000e0a0: 531f7a03    	lsl	w3, w16, #1
10000e0a4: 110ab068    	add	w8, w3, #0x2ac
10000e0a8: f8685891    	ldr	x17, [x4, w8, uxtw #3]
10000e0ac: 9b027e28    	mul	x8, x17, x2
10000e0b0: 9bc27e31    	umulh	x17, x17, x2
10000e0b4: aa0403e5    	mov	x5, x4
10000e0b8: 2a3103e4    	mvn	w4, w17
10000e0bc: f240209f    	tst	x4, #0x1ff
10000e0c0: 540000c1    	b.ne	0x10000e0d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x900>
10000e0c4: 110ab463    	add	w3, w3, #0x2ad
10000e0c8: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000e0cc: 9bc27c62    	umulh	x2, x3, x2
10000e0d0: ab080048    	adds	x8, x2, x8
10000e0d4: 9a913631    	cinc	x17, x17, hs
10000e0d8: d37ffe24    	lsr	x4, x17, #63
10000e0dc: 91002483    	add	x3, x4, #0x9
10000e0e0: 9ac32622    	lsr	x2, x17, x3
10000e0e4: 1b067e05    	mul	w5, w16, w6
10000e0e8: 4b000080    	sub	w0, w4, w0
10000e0ec: 0b854000    	add	w0, w0, w5, asr #16
10000e0f0: 1100fc00    	add	w0, w0, #0x3f
10000e0f4: 310ffc1f    	cmn	w0, #0x3ff
10000e0f8: 5400030c    	b.gt	0x10000e158 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x980>
10000e0fc: 3110f41f    	cmn	w0, #0x43d
10000e100: 54000b82    	b.hs	0x10000e270 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa98>
10000e104: 52800011    	mov	w17, #0x0               ; =0
10000e108: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000e10c: 91336084    	add	x4, x4, #0xcd8
10000e110: 17ffffca    	b	0x10000e038 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x860>
10000e114: d2800018    	mov	x24, #0x0               ; =0
10000e118: aa0c03ef    	mov	x15, x12
10000e11c: eb02019f    	cmp	x12, x2
10000e120: 54fff221    	b.ne	0x10000df64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000e124: 17ffff96    	b	0x10000df7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a4>
10000e128: 9e630301    	ucvtf	d1, x24
10000e12c: b0000188    	adrp	x8, 0x10003f000 <__ZL5Lhint+0xa30>
10000e130: 912fc108    	add	x8, x8, #0xbf0
10000e134: b7f811f0    	tbnz	x16, #0x3f, 0x10000e370 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb98>
10000e138: fc707902    	ldr	d2, [x8, x16, lsl #3]
10000e13c: 1e610841    	fmul	d1, d2, d1
10000e140: 1e614022    	fneg	d2, d1
10000e144: 7100b79f    	cmp	w28, #0x2d
10000e148: 1e610c41    	fcsel	d1, d2, d1, eq
10000e14c: 52800028    	mov	w8, #0x1                ; =1
10000e150: 3607bb61    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000e154: 17fffddb    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000e158: 92400444    	and	x4, x2, #0x3
10000e15c: 9ac32043    	lsl	x3, x2, x3
10000e160: eb11007f    	cmp	x3, x17
10000e164: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000e168: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000e16c: 91001208    	add	x8, x16, #0x4
10000e170: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000e174: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000e178: 9a823108    	csel	x8, x8, x2, lo
10000e17c: 92400111    	and	x17, x8, #0x1
10000e180: 8b080222    	add	x2, x17, x8
10000e184: ca080223    	eor	x3, x17, x8
10000e188: 8a080228    	and	x8, x17, x8
10000e18c: 8b430508    	add	x8, x8, x3, lsr #1
10000e190: d376fc51    	lsr	x17, x2, #54
10000e194: f100023f    	cmp	x17, #0x0
10000e198: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000e19c: 1a820442    	cinc	w2, w2, ne
10000e1a0: 0b000040    	add	w0, w2, w0
10000e1a4: 711ffc1f    	cmp	w0, #0x7ff
10000e1a8: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000e1ac: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000e1b0: 8a110108    	and	x8, x8, x17
10000e1b4: 9a9f0108    	csel	x8, x8, xzr, eq
10000e1b8: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000e1bc: 1ad16c11    	umin	w17, w0, w17
10000e1c0: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000e1c4: 91336084    	add	x4, x4, #0xcd8
10000e1c8: 3707f3cf    	tbnz	w15, #0x0, 0x10000e040 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x868>
10000e1cc: 1400005a    	b	0x10000e334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000e1d0: dac01083    	clz	x3, x4
10000e1d4: 9ac32084    	lsl	x4, x4, x3
10000e1d8: 531f7a05    	lsl	w5, w16, #1
10000e1dc: 110ab0a0    	add	w0, w5, #0x2ac
10000e1e0: b0000187    	adrp	x7, 0x10003f000 <__ZL5Lhint+0xa30>
10000e1e4: 913360e7    	add	x7, x7, #0xcd8
10000e1e8: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000e1ec: 9b047c40    	mul	x0, x2, x4
10000e1f0: 9bc47c42    	umulh	x2, x2, x4
10000e1f4: 2a2203e6    	mvn	w6, w2
10000e1f8: f24020df    	tst	x6, #0x1ff
10000e1fc: 540000c1    	b.ne	0x10000e214 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa3c>
10000e200: 110ab4a5    	add	w5, w5, #0x2ad
10000e204: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000e208: 9bc47ca4    	umulh	x4, x5, x4
10000e20c: ab000080    	adds	x0, x4, x0
10000e210: 9a823442    	cinc	x2, x2, hs
10000e214: d37ffc46    	lsr	x6, x2, #63
10000e218: 910024c5    	add	x5, x6, #0x9
10000e21c: 9ac52444    	lsr	x4, x2, x5
10000e220: 528a4d47    	mov	w7, #0x526a             ; =21098
10000e224: 72a00067    	movk	w7, #0x3, lsl #16
10000e228: 1b077e07    	mul	w7, w16, w7
10000e22c: 4b0300c3    	sub	w3, w6, w3
10000e230: 0b874063    	add	w3, w3, w7, asr #16
10000e234: 1100fc63    	add	w3, w3, #0x3f
10000e238: 310ffc7f    	cmn	w3, #0x3ff
10000e23c: 5400032c    	b.gt	0x10000e2a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xac8>
10000e240: 3110f47f    	cmn	w3, #0x43d
10000e244: 128f7967    	mov	w7, #-0x7bcc            ; =-31692
10000e248: 54000a62    	b.hs	0x10000e394 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xbbc>
10000e24c: d2800000    	mov	x0, #0x0                ; =0
10000e250: 52800002    	mov	w2, #0x0                ; =0
10000e254: 528a4d46    	mov	w6, #0x526a             ; =21098
10000e258: 72a00066    	movk	w6, #0x3, lsl #16
10000e25c: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000e260: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000e264: eb00011f    	cmp	x8, x0
10000e268: 540005e0    	b.eq	0x10000e324 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb4c>
10000e26c: 14000058    	b	0x10000e3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xbf4>
10000e270: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000e274: 4b000108    	sub	w8, w8, w0
10000e278: 9ac82448    	lsr	x8, x2, x8
10000e27c: 92400111    	and	x17, x8, #0x1
10000e280: 8b080231    	add	x17, x17, x8
10000e284: d341fe28    	lsr	x8, x17, #1
10000e288: f24b0e3f    	tst	x17, #0x1e0000000000000
10000e28c: 1a9f07f1    	cset	w17, ne
10000e290: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000e294: 91336084    	add	x4, x4, #0xcd8
10000e298: 360004ef    	tbz	w15, #0x0, 0x10000e334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000e29c: 17ffff69    	b	0x10000e040 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x868>
10000e2a0: 92400486    	and	x6, x4, #0x3
10000e2a4: 9ac52085    	lsl	x5, x4, x5
10000e2a8: eb0200bf    	cmp	x5, x2
10000e2ac: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000e2b0: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000e2b4: 91001200    	add	x0, x16, #0x4
10000e2b8: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000e2bc: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000e2c0: 9a843000    	csel	x0, x0, x4, lo
10000e2c4: 92400002    	and	x2, x0, #0x1
10000e2c8: 8b000044    	add	x4, x2, x0
10000e2cc: ca000045    	eor	x5, x2, x0
10000e2d0: 8a000040    	and	x0, x2, x0
10000e2d4: 8b450400    	add	x0, x0, x5, lsr #1
10000e2d8: d376fc82    	lsr	x2, x4, #54
10000e2dc: f100005f    	cmp	x2, #0x0
10000e2e0: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000e2e4: 1a840484    	cinc	w4, w4, ne
10000e2e8: 0b030083    	add	w3, w4, w3
10000e2ec: 711ffc7f    	cmp	w3, #0x7ff
10000e2f0: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000e2f4: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000e2f8: 8a020000    	and	x0, x0, x2
10000e2fc: 9a9f0000    	csel	x0, x0, xzr, eq
10000e300: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000e304: 1ac26c62    	umin	w2, w3, w2
10000e308: 528a4d46    	mov	w6, #0x526a             ; =21098
10000e30c: 72a00066    	movk	w6, #0x3, lsl #16
10000e310: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000e314: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000e318: 128f7967    	mov	w7, #-0x7bcc            ; =-31692
10000e31c: eb00011f    	cmp	x8, x0
10000e320: 54000561    	b.ne	0x10000e3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xbf4>
10000e324: 6b02023f    	cmp	w17, w2
10000e328: 54000521    	b.ne	0x10000e3cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xbf4>
10000e32c: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000e330: 91336084    	add	x4, x4, #0xcd8
10000e334: 2a1103e2    	mov	w2, w17
10000e338: 7100b79f    	cmp	w28, #0x2d
10000e33c: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000e340: 9a9f0129    	csel	x9, x9, xzr, eq
10000e344: aa02d129    	orr	x9, x9, x2, lsl #52
10000e348: aa080129    	orr	x9, x9, x8
10000e34c: 9e670121    	fmov	d1, x9
10000e350: f100011f    	cmp	x8, #0x0
10000e354: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000e358: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000e35c: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000e360: 7a480044    	ccmp	w2, w8, #0x4, eq
10000e364: 1a9f07e8    	cset	w8, ne
10000e368: 3607aaa1    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000e36c: 17fffd55    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000e370: cb100d08    	sub	x8, x8, x16, lsl #3
10000e374: fd400102    	ldr	d2, [x8]
10000e378: 1e621821    	fdiv	d1, d1, d2
10000e37c: 1e614022    	fneg	d2, d1
10000e380: 7100b79f    	cmp	w28, #0x2d
10000e384: 1e610c41    	fcsel	d1, d2, d1, eq
10000e388: 52800028    	mov	w8, #0x1                ; =1
10000e38c: 3607a981    	tbz	w1, #0x0, 0x10000d8bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe4>
10000e390: 17fffd4c    	b	0x10000d8c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000e394: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000e398: 4b030000    	sub	w0, w0, w3
10000e39c: 9ac02480    	lsr	x0, x4, x0
10000e3a0: 92400002    	and	x2, x0, #0x1
10000e3a4: 8b000042    	add	x2, x2, x0
10000e3a8: d341fc40    	lsr	x0, x2, #1
10000e3ac: f24b0c5f    	tst	x2, #0x1e0000000000000
10000e3b0: 1a9f07e2    	cset	w2, ne
10000e3b4: 528a4d46    	mov	w6, #0x526a             ; =21098
10000e3b8: 72a00066    	movk	w6, #0x3, lsl #16
10000e3bc: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000e3c0: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000e3c4: eb00011f    	cmp	x8, x0
10000e3c8: 54fffae0    	b.eq	0x10000e324 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb4c>
10000e3cc: dac01311    	clz	x17, x24
10000e3d0: 9ad12300    	lsl	x0, x24, x17
10000e3d4: 531f7a02    	lsl	w2, w16, #1
10000e3d8: 110ab048    	add	w8, w2, #0x2ac
10000e3dc: b0000185    	adrp	x5, 0x10003f000 <__ZL5Lhint+0xa30>
10000e3e0: 913360a5    	add	x5, x5, #0xcd8
10000e3e4: f868d8a3    	ldr	x3, [x5, w8, sxtw #3]
10000e3e8: 9bc07c68    	umulh	x8, x3, x0
10000e3ec: 2a2803e4    	mvn	w4, w8
10000e3f0: f240209f    	tst	x4, #0x1ff
10000e3f4: aa0503e4    	mov	x4, x5
10000e3f8: 540000e1    	b.ne	0x10000e414 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc3c>
10000e3fc: 9b007c63    	mul	x3, x3, x0
10000e400: 110ab442    	add	w2, w2, #0x2ad
10000e404: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000e408: 9bc07c40    	umulh	x0, x2, x0
10000e40c: ab03001f    	cmn	x0, x3
10000e410: 9a883508    	cinc	x8, x8, hs
10000e414: d37ffd00    	lsr	x0, x8, #63
10000e418: 52000000    	eor	w0, w0, #0x1
10000e41c: 9ac02108    	lsl	x8, x8, x0
10000e420: 1b067e02    	mul	w2, w16, w6
10000e424: 13107c42    	asr	w2, w2, #16
10000e428: 4b110051    	sub	w17, w2, w17
10000e42c: 4b000231    	sub	w17, w17, w0
10000e430: 2b070222    	adds	w2, w17, w7
10000e434: 54fff825    	b.pl	0x10000e338 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb60>
10000e438: a90363f0    	stp	x16, x24, [sp, #0x30]
10000e43c: f90023ee    	str	x14, [sp, #0x40]
10000e440: 390123ea    	strb	w10, [sp, #0x48]
10000e444: 5280002a    	mov	w10, #0x1               ; =1
10000e448: 390127ea    	strb	w10, [sp, #0x49]
10000e44c: 39012bef    	strb	w15, [sp, #0x4a]
10000e450: b9402bea    	ldr	w10, [sp, #0x28]
10000e454: 9100c3ee    	add	x14, sp, #0x30
10000e458: b801b1ca    	stur	w10, [x14, #0x1b]
10000e45c: 3940b3ea    	ldrb	w10, [sp, #0x2c]
10000e460: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000e464: a9052fe9    	stp	x9, x11, [sp, #0x50]
10000e468: a90637ec    	stp	x12, x13, [sp, #0x60]
10000e46c: f9003bff    	str	xzr, [sp, #0x70]
10000e470: 9100c3e0    	add	x0, sp, #0x30
10000e474: aa1903f5    	mov	x21, x25
10000e478: aa0103f9    	mov	x25, x1
10000e47c: aa0803e1    	mov	x1, x8
10000e480: 52800023    	mov	w3, #0x1                ; =1
10000e484: 4ea01c0f    	mov.16b	v15, v0
10000e488: ad001be7    	stp	q7, q6, [sp]
10000e48c: 94001516    	bl	0x1000138e4 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000e490: ad401be7    	ldp	q7, q6, [sp]
10000e494: 4f06e605    	movi.16b	v5, #0xd0
10000e498: 128f7967    	mov	w7, #-0x7bcc            ; =-31692
10000e49c: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xa30>
10000e4a0: 91336084    	add	x4, x4, #0xcd8
10000e4a4: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000e4a8: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000e4ac: 528a4d46    	mov	w6, #0x526a             ; =21098
10000e4b0: 72a00066    	movk	w6, #0x3, lsl #16
10000e4b4: d280003e    	mov	x30, #0x1               ; =1
10000e4b8: f2c4e21e    	movk	x30, #0x2710, lsl #32
10000e4bc: 4eaf1de0    	mov.16b	v0, v15
10000e4c0: aa0003e8    	mov	x8, x0
10000e4c4: aa0103e2    	mov	x2, x1
10000e4c8: aa1903e1    	mov	x1, x25
10000e4cc: aa1503f9    	mov	x25, x21
10000e4d0: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000e4d4: f299fa15    	movk	x21, #0xcfd0
10000e4d8: 17ffff98    	b	0x10000e338 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb60>
10000e4dc: 6f00e400    	movi.2d	v0, #0000000000000000
10000e4e0: a9517bfd    	ldp	x29, x30, [sp, #0x110]
10000e4e4: a9504ff4    	ldp	x20, x19, [sp, #0x100]
10000e4e8: a94f57f6    	ldp	x22, x21, [sp, #0xf0]
10000e4ec: a94e5ff8    	ldp	x24, x23, [sp, #0xe0]
10000e4f0: a94d67fa    	ldp	x26, x25, [sp, #0xd0]
10000e4f4: a94c6ffc    	ldp	x28, x27, [sp, #0xc0]
10000e4f8: 6d4b23e9    	ldp	d9, d8, [sp, #0xb0]
10000e4fc: 6d4a2beb    	ldp	d11, d10, [sp, #0xa0]
10000e500: 6d4933ed    	ldp	d13, d12, [sp, #0x90]
10000e504: 6d483bef    	ldp	d15, d14, [sp, #0x80]
10000e508: 910483ff    	add	sp, sp, #0x120
10000e50c: d65f03c0    	ret
10000e510: 52800200    	mov	w0, #0x10               ; =16
10000e514: 9400b477    	bl	0x10003b6f0 <_strtod_l+0x10003b6f0>
10000e518: aa0003f3    	mov	x19, x0
10000e51c: b00001e1    	adrp	x1, 0x10004b000 <_strtod_l+0x10004b000>
10000e520: 91013421    	add	x1, x1, #0x4d
10000e524: 9400b3f2    	bl	0x10003b4ec <_strtod_l+0x10003b4ec>
10000e528: aa1303e0    	mov	x0, x19
10000e52c: 9400b39d    	bl	0x10003b3a0 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000e530: aa0003f4    	mov	x20, x0
10000e534: aa1303e0    	mov	x0, x19
10000e538: 9400b47d    	bl	0x10003b72c <_strtod_l+0x10003b72c>
10000e53c: aa1403e0    	mov	x0, x20
10000e540: 9400b3b8    	bl	0x10003b420 <_strtod_l+0x10003b420>
