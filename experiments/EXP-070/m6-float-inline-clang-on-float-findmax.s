
simple_fastfloat_benchmark/build/m6-float-inline-clang-on/benchmarks/benchmark32:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100008794 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE>:
100008794: d10303ff    	sub	sp, sp, #0xc0
100008798: 6d0523e9    	stp	d9, d8, [sp, #0x50]
10000879c: a9066ffc    	stp	x28, x27, [sp, #0x60]
1000087a0: a90767fa    	stp	x26, x25, [sp, #0x70]
1000087a4: a9085ff8    	stp	x24, x23, [sp, #0x80]
1000087a8: a90957f6    	stp	x22, x21, [sp, #0x90]
1000087ac: a90a4ff4    	stp	x20, x19, [sp, #0xa0]
1000087b0: a90b7bfd    	stp	x29, x30, [sp, #0xb0]
1000087b4: 9102c3fd    	add	x29, sp, #0xb0
1000087b8: a9405013    	ldp	x19, x20, [x0]
1000087bc: eb14027f    	cmp	x19, x20
1000087c0: 54005ac0    	b.eq	0x100009318 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb84>
1000087c4: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
1000087c8: f299fa15    	movk	x21, #0xcfd0
1000087cc: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
1000087d0: b202e2d6    	orr	x22, x22, #0x4444444444444444
1000087d4: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
1000087d8: f2d6d677    	movk	x23, #0xb6b3, lsl #32
1000087dc: f2e1bc17    	movk	x23, #0xde0, lsl #48
1000087e0: d2800c87    	mov	x7, #0x64               ; =100
1000087e4: f2c84807    	movk	x7, #0x4240, lsl #32
1000087e8: f2e001e7    	movk	x7, #0xf, lsl #48
1000087ec: d2800039    	mov	x25, #0x1               ; =1
1000087f0: f2c4e219    	movk	x25, #0x2710, lsl #32
1000087f4: 529c201a    	mov	w26, #0xe100            ; =57600
1000087f8: 72a0beba    	movk	w26, #0x5f5, lsl #16
1000087fc: 528a4d45    	mov	w5, #0x526a             ; =21098
100008800: 72a00065    	movk	w5, #0x3, lsl #16
100008804: 6f00e408    	movi.2d	v8, #0000000000000000
100008808: b203c3e6    	mov	x6, #0x2020202020202020 ; =2314885530818453536
10000880c: f28dcd26    	movk	x6, #0x6e69
100008810: f2a40cc6    	movk	x6, #0x2066, lsl #16
100008814: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100008818: 5280015c    	mov	w28, #0xa               ; =10
10000881c: 1400000b    	b	0x100008848 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb4>
100008820: 7100b51f    	cmp	w8, #0x2d
100008824: 52bff008    	mov	w8, #-0x800000          ; =-8388608
100008828: 1a9e0108    	csel	w8, w8, w30, eq
10000882c: 1e270100    	fmov	s0, w8
100008830: 1e22c000    	fcvt	d0, s0
100008834: 1e602100    	fcmp	d8, d0
100008838: 1e60cd08    	fcsel	d8, d8, d0, gt
10000883c: 91006273    	add	x19, x19, #0x18
100008840: eb14027f    	cmp	x19, x20
100008844: 540056c0    	b.eq	0x10000931c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb88>
100008848: 39805e60    	ldrsb	x0, [x19, #0x17]
10000884c: b7f80080    	tbnz	x0, #0x3f, 0x10000885c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xc8>
100008850: aa1303f1    	mov	x17, x19
100008854: b5000080    	cbnz	x0, 0x100008864 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xd0>
100008858: 140002bb    	b	0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
10000885c: a9400271    	ldp	x17, x0, [x19]
100008860: b4005720    	cbz	x0, 0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100008864: 3940023b    	ldrb	w27, [x17]
100008868: aa1b03eb    	mov	x11, x27
10000886c: aa1103e9    	mov	x9, x17
100008870: 7100b77f    	cmp	w27, #0x2d
100008874: 1a9f17ea    	cset	w10, eq
100008878: 54000161    	b.ne	0x1000088a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x110>
10000887c: f100041f    	cmp	x0, #0x1
100008880: 54001b60    	b.eq	0x100008bec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100008884: aa1103e9    	mov	x9, x17
100008888: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000888c: 12001d0b    	and	w11, w8, #0xff
100008890: 7100b91f    	cmp	w8, #0x2e
100008894: 54000080    	b.eq	0x1000088a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x110>
100008898: 5100c108    	sub	w8, w8, #0x30
10000889c: 7100251f    	cmp	w8, #0x9
1000088a0: 54001a68    	b.hi	0x100008bec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
1000088a4: 8b00022f    	add	x15, x17, x0
1000088a8: eb0f013f    	cmp	x9, x15
1000088ac: 540008c0    	b.eq	0x1000089c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x230>
1000088b0: 13001d68    	sxtb	w8, w11
1000088b4: 5100c108    	sub	w8, w8, #0x30
1000088b8: 7100251f    	cmp	w8, #0x9
1000088bc: 54000848    	b.hi	0x1000089c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x230>
1000088c0: 91000528    	add	x8, x9, #0x1
1000088c4: 93401d6b    	sxtb	x11, w11
1000088c8: d100c178    	sub	x24, x11, #0x30
1000088cc: eb0f011f    	cmp	x8, x15
1000088d0: 540007e0    	b.eq	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
1000088d4: 39c0010b    	ldrsb	w11, [x8]
1000088d8: 5100c16c    	sub	w12, w11, #0x30
1000088dc: 7100259f    	cmp	w12, #0x9
1000088e0: 54000768    	b.hi	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
1000088e4: 93407d6b    	sxtw	x11, w11
1000088e8: 91000928    	add	x8, x9, #0x2
1000088ec: d100c16b    	sub	x11, x11, #0x30
1000088f0: aa1803ec    	mov	x12, x24
1000088f4: 8b0c0998    	add	x24, x12, x12, lsl #2
1000088f8: 8b180578    	add	x24, x11, x24, lsl #1
1000088fc: eb0f011f    	cmp	x8, x15
100008900: 54000660    	b.eq	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008904: 39c0010b    	ldrsb	w11, [x8]
100008908: 5100c16c    	sub	w12, w11, #0x30
10000890c: 7100259f    	cmp	w12, #0x9
100008910: 540005e8    	b.hi	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008914: 93407d6b    	sxtw	x11, w11
100008918: 91000d28    	add	x8, x9, #0x3
10000891c: d100c16b    	sub	x11, x11, #0x30
100008920: aa1803ec    	mov	x12, x24
100008924: 8b0c0998    	add	x24, x12, x12, lsl #2
100008928: 8b180578    	add	x24, x11, x24, lsl #1
10000892c: eb0f011f    	cmp	x8, x15
100008930: 540004e0    	b.eq	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008934: 39c0010b    	ldrsb	w11, [x8]
100008938: 5100c16c    	sub	w12, w11, #0x30
10000893c: 7100259f    	cmp	w12, #0x9
100008940: 54000468    	b.hi	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008944: 93407d6b    	sxtw	x11, w11
100008948: 91001128    	add	x8, x9, #0x4
10000894c: d100c16b    	sub	x11, x11, #0x30
100008950: aa1803ec    	mov	x12, x24
100008954: 8b0c0998    	add	x24, x12, x12, lsl #2
100008958: 8b180578    	add	x24, x11, x24, lsl #1
10000895c: eb0f011f    	cmp	x8, x15
100008960: 54000360    	b.eq	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008964: 39c0010b    	ldrsb	w11, [x8]
100008968: 5100c16c    	sub	w12, w11, #0x30
10000896c: 7100259f    	cmp	w12, #0x9
100008970: 540002e8    	b.hi	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
100008974: 93407d6b    	sxtw	x11, w11
100008978: 91001528    	add	x8, x9, #0x5
10000897c: d100c16c    	sub	x12, x11, #0x30
100008980: 8b180b0b    	add	x11, x24, x24, lsl #2
100008984: 8b0b058b    	add	x11, x12, x11, lsl #1
100008988: eb0f011f    	cmp	x8, x15
10000898c: 540019e0    	b.eq	0x100008cc8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x534>
100008990: 39c0010c    	ldrsb	w12, [x8]
100008994: 5100c18d    	sub	w13, w12, #0x30
100008998: 710025bf    	cmp	w13, #0x9
10000899c: 54001968    	b.hi	0x100008cc8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x534>
1000089a0: 93407d8c    	sxtw	x12, w12
1000089a4: d100c18c    	sub	x12, x12, #0x30
1000089a8: 8b0b0978    	add	x24, x11, x11, lsl #2
1000089ac: 8b180598    	add	x24, x12, x24, lsl #1
1000089b0: 91000508    	add	x8, x8, #0x1
1000089b4: aa1803eb    	mov	x11, x24
1000089b8: eb0f011f    	cmp	x8, x15
1000089bc: 54fffea1    	b.ne	0x100008990 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x1fc>
1000089c0: 14000003    	b	0x1000089cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
1000089c4: d2800018    	mov	x24, #0x0               ; =0
1000089c8: aa0903e8    	mov	x8, x9
1000089cc: cb09010b    	sub	x11, x8, x9
1000089d0: eb0f011f    	cmp	x8, x15
1000089d4: 54001820    	b.eq	0x100008cd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x544>
1000089d8: 3940010c    	ldrb	w12, [x8]
1000089dc: 7100b99f    	cmp	w12, #0x2e
1000089e0: 540017c1    	b.ne	0x100008cd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x544>
1000089e4: 9100050c    	add	x12, x8, #0x1
1000089e8: cb0c01ee    	sub	x14, x15, x12
1000089ec: f10041df    	cmp	x14, #0x10
1000089f0: 5400056b    	b.lt	0x100008a9c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x308>
1000089f4: 9100250d    	add	x13, x8, #0x9
1000089f8: f85f81b0    	ldur	x16, [x13, #-0x8]
1000089fc: 8b160201    	add	x1, x16, x22
100008a00: 8b150210    	add	x16, x16, x21
100008a04: aa100021    	orr	x1, x1, x16
100008a08: f201c03f    	tst	x1, #0x8080808080808080
100008a0c: 540003a1    	b.ne	0x100008a80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2ec>
100008a10: f94001a1    	ldr	x1, [x13]
100008a14: 8b160022    	add	x2, x1, x22
100008a18: 8b150021    	add	x1, x1, x21
100008a1c: aa010042    	orr	x2, x2, x1
100008a20: f201c05f    	tst	x2, #0x8080808080808080
100008a24: 54001381    	b.ne	0x100008c94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x500>
100008a28: 9b1c7e02    	mul	x2, x16, x28
100008a2c: 8b502050    	add	x16, x2, x16, lsr #8
100008a30: 92001e02    	and	x2, x16, #0xff000000ff
100008a34: 9b077c42    	mul	x2, x2, x7
100008a38: d350fe10    	lsr	x16, x16, #16
100008a3c: 92001e10    	and	x16, x16, #0xff000000ff
100008a40: 9b190a10    	madd	x16, x16, x25, x2
100008a44: 9b1c7c22    	mul	x2, x1, x28
100008a48: 8b412041    	add	x1, x2, x1, lsr #8
100008a4c: 92001c22    	and	x2, x1, #0xff000000ff
100008a50: 9b077c42    	mul	x2, x2, x7
100008a54: d350fc21    	lsr	x1, x1, #16
100008a58: 92001c21    	and	x1, x1, #0xff000000ff
100008a5c: 9b190821    	madd	x1, x1, x25, x2
100008a60: 9b1a7f02    	mul	x2, x24, x26
100008a64: 8b508050    	add	x16, x2, x16, lsr #32
100008a68: 9b1a7e10    	mul	x16, x16, x26
100008a6c: 8b418218    	add	x24, x16, x1, lsr #32
100008a70: 910041ad    	add	x13, x13, #0x10
100008a74: d10041ce    	sub	x14, x14, #0x10
100008a78: f1003ddf    	cmp	x14, #0xf
100008a7c: 54fffbec    	b.gt	0x1000089f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x264>
100008a80: d10021ad    	sub	x13, x13, #0x8
100008a84: cb0d01ee    	sub	x14, x15, x13
100008a88: f10021df    	cmp	x14, #0x8
100008a8c: 5400010a    	b.ge	0x100008aac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x318>
100008a90: f10011df    	cmp	x14, #0x4
100008a94: 5400032a    	b.ge	0x100008af8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x364>
100008a98: 14000022    	b	0x100008b20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x38c>
100008a9c: aa0c03ed    	mov	x13, x12
100008aa0: cb0c01ee    	sub	x14, x15, x12
100008aa4: f10021df    	cmp	x14, #0x8
100008aa8: 54ffff4b    	b.lt	0x100008a90 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2fc>
100008aac: f94001ae    	ldr	x14, [x13]
100008ab0: 8b1601d0    	add	x16, x14, x22
100008ab4: 8b1501ce    	add	x14, x14, x21
100008ab8: aa0e0210    	orr	x16, x16, x14
100008abc: f201c21f    	tst	x16, #0x8080808080808080
100008ac0: 540001c1    	b.ne	0x100008af8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x364>
100008ac4: 9b1a7f10    	mul	x16, x24, x26
100008ac8: 9b1c7dc1    	mul	x1, x14, x28
100008acc: 8b4e202e    	add	x14, x1, x14, lsr #8
100008ad0: 92001dc1    	and	x1, x14, #0xff000000ff
100008ad4: 9b077c21    	mul	x1, x1, x7
100008ad8: d350fdce    	lsr	x14, x14, #16
100008adc: 92001dce    	and	x14, x14, #0xff000000ff
100008ae0: 9b1905ce    	madd	x14, x14, x25, x1
100008ae4: 8b4e8218    	add	x24, x16, x14, lsr #32
100008ae8: 910021ad    	add	x13, x13, #0x8
100008aec: cb0d01ee    	sub	x14, x15, x13
100008af0: f10011df    	cmp	x14, #0x4
100008af4: 5400016b    	b.lt	0x100008b20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x38c>
100008af8: b94001ae    	ldr	w14, [x13]
100008afc: 5288c8d0    	mov	w16, #0x4646            ; =17990
100008b00: 72a8c8d0    	movk	w16, #0x4646, lsl #16
100008b04: 0b1001d0    	add	w16, w14, w16
100008b08: 5299fa01    	mov	w1, #0xcfd0             ; =53200
100008b0c: 72b9f9e1    	movk	w1, #0xcfcf, lsl #16
100008b10: 0b0101ce    	add	w14, w14, w1
100008b14: 2a0e0210    	orr	w16, w16, w14
100008b18: 7201c21f    	tst	w16, #0x80808080
100008b1c: 54000960    	b.eq	0x100008c48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x4b4>
100008b20: eb0f01bf    	cmp	x13, x15
100008b24: 54000aa0    	b.eq	0x100008c78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x4e4>
100008b28: 39c001ae    	ldrsb	w14, [x13]
100008b2c: 5100c1d0    	sub	w16, w14, #0x30
100008b30: 7100261f    	cmp	w16, #0x9
100008b34: 54000508    	b.hi	0x100008bd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x440>
100008b38: 12001dd0    	and	w16, w14, #0xff
100008b3c: 910005ae    	add	x14, x13, #0x1
100008b40: 5100c210    	sub	w16, w16, #0x30
100008b44: 92401e10    	and	x16, x16, #0xff
100008b48: aa1803e1    	mov	x1, x24
100008b4c: 8b010838    	add	x24, x1, x1, lsl #2
100008b50: 8b180618    	add	x24, x16, x24, lsl #1
100008b54: eb0f01df    	cmp	x14, x15
100008b58: 54000400    	b.eq	0x100008bd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
100008b5c: 39c001d0    	ldrsb	w16, [x14]
100008b60: 5100c201    	sub	w1, w16, #0x30
100008b64: 7100243f    	cmp	w1, #0x9
100008b68: 54000388    	b.hi	0x100008bd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
100008b6c: 12001e10    	and	w16, w16, #0xff
100008b70: 910009ae    	add	x14, x13, #0x2
100008b74: 5100c210    	sub	w16, w16, #0x30
100008b78: 92401e10    	and	x16, x16, #0xff
100008b7c: aa1803e1    	mov	x1, x24
100008b80: 8b010838    	add	x24, x1, x1, lsl #2
100008b84: 8b180618    	add	x24, x16, x24, lsl #1
100008b88: eb0f01df    	cmp	x14, x15
100008b8c: 54000260    	b.eq	0x100008bd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
100008b90: 39c001d0    	ldrsb	w16, [x14]
100008b94: 5100c201    	sub	w1, w16, #0x30
100008b98: 7100243f    	cmp	w1, #0x9
100008b9c: 540001e8    	b.hi	0x100008bd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
100008ba0: 12001e10    	and	w16, w16, #0xff
100008ba4: 91000dae    	add	x14, x13, #0x3
100008ba8: 5100c20d    	sub	w13, w16, #0x30
100008bac: 92401dad    	and	x13, x13, #0xff
100008bb0: 8b180b10    	add	x16, x24, x24, lsl #2
100008bb4: 8b1005b0    	add	x16, x13, x16, lsl #1
100008bb8: aa1003f8    	mov	x24, x16
100008bbc: cb0c01cd    	sub	x13, x14, x12
100008bc0: cb0e0190    	sub	x16, x12, x14
100008bc4: cb100162    	sub	x2, x11, x16
100008bc8: aa0e03e1    	mov	x1, x14
100008bcc: b5000942    	cbnz	x2, 0x100008cf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
100008bd0: 14000007    	b	0x100008bec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100008bd4: aa0d03ee    	mov	x14, x13
100008bd8: cb0c01cd    	sub	x13, x14, x12
100008bdc: cb0e0190    	sub	x16, x12, x14
100008be0: cb100162    	sub	x2, x11, x16
100008be4: aa0e03e1    	mov	x1, x14
100008be8: b5000862    	cbnz	x2, 0x100008cf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
100008bec: 39400228    	ldrb	w8, [x17]
100008bf0: 7100b51f    	cmp	w8, #0x2d
100008bf4: 1a9f17e9    	cset	w9, eq
100008bf8: cb09000a    	sub	x10, x0, x9
100008bfc: f1000d5f    	cmp	x10, #0x3
100008c00: 54003a2b    	b.lt	0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100008c04: 8b090229    	add	x9, x17, x9
100008c08: 3940092a    	ldrb	w10, [x9, #0x2]
100008c0c: 79400129    	ldrh	w9, [x9]
100008c10: aa0a4129    	orr	x9, x9, x10, lsl #16
100008c14: b203c129    	orr	x9, x9, #0x2020202020202020
100008c18: eb06013f    	cmp	x9, x6
100008c1c: 54ffe020    	b.eq	0x100008820 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x8c>
100008c20: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
100008c24: f28c2dca    	movk	x10, #0x616e
100008c28: f2a40dca    	movk	x10, #0x206e, lsl #16
100008c2c: eb0a013f    	cmp	x9, x10
100008c30: 540038a1    	b.ne	0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100008c34: 7100b51f    	cmp	w8, #0x2d
100008c38: 52aff808    	mov	w8, #0x7fc00000         ; =2143289344
100008c3c: 52bff809    	mov	w9, #-0x400000          ; =-4194304
100008c40: 1a880128    	csel	w8, w9, w8, eq
100008c44: 17fffefa    	b	0x10000882c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
100008c48: 1b1c7dd0    	mul	w16, w14, w28
100008c4c: 0b4e220e    	add	w14, w16, w14, lsr #8
100008c50: 12009dce    	and	w14, w14, #0xff00ff
100008c54: 52800030    	mov	w16, #0x1               ; =1
100008c58: 72a00c90    	movk	w16, #0x64, lsl #16
100008c5c: 1b107dce    	mul	w14, w14, w16
100008c60: 53107dce    	lsr	w14, w14, #16
100008c64: 5284e210    	mov	w16, #0x2710            ; =10000
100008c68: 9b103b18    	madd	x24, x24, x16, x14
100008c6c: 910011ad    	add	x13, x13, #0x4
100008c70: eb0f01bf    	cmp	x13, x15
100008c74: 54fff5a1    	b.ne	0x100008b28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x394>
100008c78: aa0d03ee    	mov	x14, x13
100008c7c: cb0c01ad    	sub	x13, x13, x12
100008c80: cb0e0190    	sub	x16, x12, x14
100008c84: cb100162    	sub	x2, x11, x16
100008c88: aa0e03e1    	mov	x1, x14
100008c8c: b5000342    	cbnz	x2, 0x100008cf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
100008c90: 17ffffd7    	b	0x100008bec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100008c94: 9b1a7f0e    	mul	x14, x24, x26
100008c98: 9b1c7e01    	mul	x1, x16, x28
100008c9c: 8b502030    	add	x16, x1, x16, lsr #8
100008ca0: 92001e01    	and	x1, x16, #0xff000000ff
100008ca4: 9b077c21    	mul	x1, x1, x7
100008ca8: d350fe10    	lsr	x16, x16, #16
100008cac: 92001e10    	and	x16, x16, #0xff000000ff
100008cb0: 9b190610    	madd	x16, x16, x25, x1
100008cb4: 8b5081d8    	add	x24, x14, x16, lsr #32
100008cb8: cb0d01ee    	sub	x14, x15, x13
100008cbc: f10021df    	cmp	x14, #0x8
100008cc0: 54ffee8b    	b.lt	0x100008a90 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2fc>
100008cc4: 17ffff7a    	b	0x100008aac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x318>
100008cc8: aa0b03f8    	mov	x24, x11
100008ccc: cb09010b    	sub	x11, x8, x9
100008cd0: eb0f011f    	cmp	x8, x15
100008cd4: 54ffe821    	b.ne	0x1000089d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x244>
100008cd8: d280000d    	mov	x13, #0x0               ; =0
100008cdc: d2800010    	mov	x16, #0x0               ; =0
100008ce0: d280000c    	mov	x12, #0x0               ; =0
100008ce4: d2800001    	mov	x1, #0x0                ; =0
100008ce8: aa0803ee    	mov	x14, x8
100008cec: aa0b03e2    	mov	x2, x11
100008cf0: b4fff7eb    	cbz	x11, 0x100008bec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100008cf4: eb0f01df    	cmp	x14, x15
100008cf8: 540005a0    	b.eq	0x100008dac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100008cfc: 394001d1    	ldrb	w17, [x14]
100008d00: 321b0231    	orr	w17, w17, #0x20
100008d04: 7101963f    	cmp	w17, #0x65
100008d08: 54000521    	b.ne	0x100008dac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100008d0c: 910005c0    	add	x0, x14, #0x1
100008d10: eb0f001f    	cmp	x0, x15
100008d14: 54000180    	b.eq	0x100008d44 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5b0>
100008d18: 39400011    	ldrb	w17, [x0]
100008d1c: 910009c3    	add	x3, x14, #0x2
100008d20: 7100ae3f    	cmp	w17, #0x2b
100008d24: 9a800060    	csel	x0, x3, x0, eq
100008d28: 7100b63f    	cmp	w17, #0x2d
100008d2c: 52800031    	mov	w17, #0x1               ; =1
100008d30: 1a9113f1    	csel	w17, wzr, w17, ne
100008d34: 9a831000    	csel	x0, x0, x3, ne
100008d38: eb0f001f    	cmp	x0, x15
100008d3c: 540000a1    	b.ne	0x100008d50 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5bc>
100008d40: 1400001b    	b	0x100008dac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100008d44: 52800011    	mov	w17, #0x0               ; =0
100008d48: eb0f001f    	cmp	x0, x15
100008d4c: 54000300    	b.eq	0x100008dac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100008d50: 39c00003    	ldrsb	w3, [x0]
100008d54: 5100c063    	sub	w3, w3, #0x30
100008d58: 7100247f    	cmp	w3, #0x9
100008d5c: 54000288    	b.hi	0x100008dac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100008d60: d280000e    	mov	x14, #0x0               ; =0
100008d64: 14000004    	b	0x100008d74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5e0>
100008d68: 91000400    	add	x0, x0, #0x1
100008d6c: eb0f001f    	cmp	x0, x15
100008d70: 54000820    	b.eq	0x100008e74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6e0>
100008d74: 39c00003    	ldrsb	w3, [x0]
100008d78: 5100c064    	sub	w4, w3, #0x30
100008d7c: 7100249f    	cmp	w4, #0x9
100008d80: 540007a8    	b.hi	0x100008e74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6e0>
100008d84: 12be0004    	mov	w4, #0xfffffff          ; =268435455
100008d88: eb0401df    	cmp	x14, x4
100008d8c: 54fffeec    	b.gt	0x100008d68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5d4>
100008d90: 12001c63    	and	w3, w3, #0xff
100008d94: 5100c063    	sub	w3, w3, #0x30
100008d98: 92401c63    	and	x3, x3, #0xff
100008d9c: 8b0e09c4    	add	x4, x14, x14, lsl #2
100008da0: 8b040464    	add	x4, x3, x4, lsl #1
100008da4: aa0403ee    	mov	x14, x4
100008da8: 17fffff0    	b	0x100008d68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5d4>
100008dac: d2800011    	mov	x17, #0x0               ; =0
100008db0: f100505f    	cmp	x2, #0x14
100008db4: 540006cb    	b.lt	0x100008e8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6f8>
100008db8: eb0f013f    	cmp	x9, x15
100008dbc: 54000200    	b.eq	0x100008dfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x668>
100008dc0: aa0903e0    	mov	x0, x9
100008dc4: 14000007    	b	0x100008de0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x64c>
100008dc8: 7100c07f    	cmp	w3, #0x30
100008dcc: 1a9f17e3    	cset	w3, eq
100008dd0: cb030042    	sub	x2, x2, x3
100008dd4: 91000400    	add	x0, x0, #0x1
100008dd8: eb0f001f    	cmp	x0, x15
100008ddc: 540000c0    	b.eq	0x100008df4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x660>
100008de0: 39400003    	ldrb	w3, [x0]
100008de4: 7100c07f    	cmp	w3, #0x30
100008de8: 54ffff00    	b.eq	0x100008dc8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x634>
100008dec: 7100b87f    	cmp	w3, #0x2e
100008df0: 54fffec0    	b.eq	0x100008dc8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x634>
100008df4: f100505f    	cmp	x2, #0x14
100008df8: 540004ab    	b.lt	0x100008e8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6f8>
100008dfc: eb08013f    	cmp	x9, x8
100008e00: 54001580    	b.eq	0x1000090b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x91c>
100008e04: d2800018    	mov	x24, #0x0               ; =0
100008e08: aa0903ef    	mov	x15, x9
100008e0c: 388015f0    	ldrsb	x16, [x15], #0x1
100008e10: 9b1c4310    	madd	x16, x24, x28, x16
100008e14: d100c218    	sub	x24, x16, #0x30
100008e18: eb17031f    	cmp	x24, x23
100008e1c: fa4831e4    	ccmp	x15, x8, #0x4, lo
100008e20: 54ffff61    	b.ne	0x100008e0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x678>
100008e24: d10006f0    	sub	x16, x23, #0x1
100008e28: eb10031f    	cmp	x24, x16
100008e2c: 54000168    	b.hi	0x100008e58 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c4>
100008e30: aa0c03ef    	mov	x15, x12
100008e34: eb01019f    	cmp	x12, x1
100008e38: 540000e0    	b.eq	0x100008e54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c0>
100008e3c: 388015e8    	ldrsb	x8, [x15], #0x1
100008e40: 9b1c2308    	madd	x8, x24, x28, x8
100008e44: d100c118    	sub	x24, x8, #0x30
100008e48: eb17031f    	cmp	x24, x23
100008e4c: fa4131e4    	ccmp	x15, x1, #0x4, lo
100008e50: 54ffff61    	b.ne	0x100008e3c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6a8>
100008e54: aa0c03e8    	mov	x8, x12
100008e58: cb0f0108    	sub	x8, x8, x15
100008e5c: 8b110110    	add	x16, x8, x17
100008e60: 390013ff    	strb	wzr, [sp, #0x4]
100008e64: b90003ff    	str	wzr, [sp]
100008e68: 5280002f    	mov	w15, #0x1               ; =1
100008e6c: b5000358    	cbnz	x24, 0x100008ed4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x740>
100008e70: 14000042    	b	0x100008f78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
100008e74: 7100023f    	cmp	w17, #0x0
100008e78: da8e05d1    	cneg	x17, x14, ne
100008e7c: 8b100230    	add	x16, x17, x16
100008e80: aa0003ee    	mov	x14, x0
100008e84: f100505f    	cmp	x2, #0x14
100008e88: 54fff98a    	b.ge	0x100008db8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x624>
100008e8c: 390013ff    	strb	wzr, [sp, #0x4]
100008e90: b90003ff    	str	wzr, [sp]
100008e94: b5000170    	cbnz	x16, 0x100008ec0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x72c>
100008e98: 52a02008    	mov	w8, #0x1000000          ; =16777216
100008e9c: eb08031f    	cmp	x24, x8
100008ea0: 54000108    	b.hi	0x100008ec0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x72c>
100008ea4: b4001118    	cbz	x24, 0x1000090c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x930>
100008ea8: 9e230300    	ucvtf	s0, x24
100008eac: 1e260008    	fmov	w8, s0
100008eb0: 52010109    	eor	w9, w8, #0x80000000
100008eb4: 7100b77f    	cmp	w27, #0x2d
100008eb8: 1a891108    	csel	w8, w8, w9, ne
100008ebc: 17fffe5c    	b	0x10000882c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
100008ec0: d1002e08    	sub	x8, x16, #0xb
100008ec4: b100551f    	cmn	x8, #0x15
100008ec8: 54000162    	b.hs	0x100008ef4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x760>
100008ecc: 5280000f    	mov	w15, #0x0               ; =0
100008ed0: b4000558    	cbz	x24, 0x100008f78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
100008ed4: b101021f    	cmn	x16, #0x40
100008ed8: 5400050b    	b.lt	0x100008f78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
100008edc: f1009a1f    	cmp	x16, #0x26
100008ee0: 5400012d    	b.le	0x100008f04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x770>
100008ee4: 52801fe2    	mov	w2, #0xff               ; =255
100008ee8: d2800008    	mov	x8, #0x0                ; =0
100008eec: 350004cf    	cbnz	w15, 0x100008f84 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
100008ef0: 140000b6    	b	0x1000091c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100008ef4: 52a02008    	mov	w8, #0x1000000          ; =16777216
100008ef8: eb08031f    	cmp	x24, x8
100008efc: 54000ec9    	b.ls	0x1000090d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x940>
100008f00: 5280000f    	mov	w15, #0x0               ; =0
100008f04: dac01300    	clz	x0, x24
100008f08: 9ac02301    	lsl	x1, x24, x0
100008f0c: 531f7a02    	lsl	w2, w16, #1
100008f10: 110ab048    	add	w8, w2, #0x2ac
100008f14: d0000163    	adrp	x3, 0x100036000 <__ZL24FFC_DOUBLE_POWERS_OF_TEN+0x60>
100008f18: 91022063    	add	x3, x3, #0x88
100008f1c: f8685871    	ldr	x17, [x3, w8, uxtw #3]
100008f20: 9b017e28    	mul	x8, x17, x1
100008f24: 9bc17e31    	umulh	x17, x17, x1
100008f28: b24097e4    	mov	x4, #0x3fffffffff       ; =274877906943
100008f2c: ea31009f    	bics	xzr, x4, x17
100008f30: 540000c1    	b.ne	0x100008f48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7b4>
100008f34: 110ab442    	add	w2, w2, #0x2ad
100008f38: f8625862    	ldr	x2, [x3, w2, uxtw #3]
100008f3c: 9bc17c41    	umulh	x1, x2, x1
100008f40: ab080028    	adds	x8, x1, x8
100008f44: 9a913631    	cinc	x17, x17, hs
100008f48: d37ffe23    	lsr	x3, x17, #63
100008f4c: 528004c2    	mov	w2, #0x26               ; =38
100008f50: b37ffe22    	bfxil	x2, x17, #63, #1
100008f54: 9ac22621    	lsr	x1, x17, x2
100008f58: 1b057e04    	mul	w4, w16, w5
100008f5c: 4b000060    	sub	w0, w3, w0
100008f60: 0b844000    	add	w0, w0, w4, asr #16
100008f64: 1100fc00    	add	w0, w0, #0x3f
100008f68: 3101fc1f    	cmn	w0, #0x7f
100008f6c: 54000c2c    	b.gt	0x1000090f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x95c>
100008f70: 3102f41f    	cmn	w0, #0xbd
100008f74: 54001162    	b.hs	0x1000091a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0c>
100008f78: 52800002    	mov	w2, #0x0                ; =0
100008f7c: d2800008    	mov	x8, #0x0                ; =0
100008f80: 3400124f    	cbz	w15, 0x1000091c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100008f84: 52800000    	mov	w0, #0x0                ; =0
100008f88: d2800011    	mov	x17, #0x0               ; =0
100008f8c: b1000703    	adds	x3, x24, #0x1
100008f90: 540000e2    	b.hs	0x100008fac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x818>
100008f94: b101021f    	cmn	x16, #0x40
100008f98: 540000ab    	b.lt	0x100008fac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x818>
100008f9c: f1009a1f    	cmp	x16, #0x26
100008fa0: 54000dad    	b.le	0x100009154 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x9c0>
100008fa4: d2800011    	mov	x17, #0x0               ; =0
100008fa8: 52801fe0    	mov	w0, #0xff               ; =255
100008fac: eb11011f    	cmp	x8, x17
100008fb0: 54000061    	b.ne	0x100008fbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
100008fb4: 6b00005f    	cmp	w2, w0
100008fb8: 54001080    	b.eq	0x1000091c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100008fbc: dac01311    	clz	x17, x24
100008fc0: 9ad12300    	lsl	x0, x24, x17
100008fc4: 531f7a01    	lsl	w1, w16, #1
100008fc8: 110ab028    	add	w8, w1, #0x2ac
100008fcc: d0000162    	adrp	x2, 0x100036000 <__ZL24FFC_DOUBLE_POWERS_OF_TEN+0x60>
100008fd0: 91022042    	add	x2, x2, #0x88
100008fd4: f868d842    	ldr	x2, [x2, w8, sxtw #3]
100008fd8: 9bc07c48    	umulh	x8, x2, x0
100008fdc: b24097e3    	mov	x3, #0x3fffffffff       ; =274877906943
100008fe0: ea28007f    	bics	xzr, x3, x8
100008fe4: 54000121    	b.ne	0x100009008 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x874>
100008fe8: 9b007c42    	mul	x2, x2, x0
100008fec: 110ab421    	add	w1, w1, #0x2ad
100008ff0: d0000163    	adrp	x3, 0x100036000 <__ZL24FFC_DOUBLE_POWERS_OF_TEN+0x60>
100008ff4: 91022063    	add	x3, x3, #0x88
100008ff8: f861d861    	ldr	x1, [x3, w1, sxtw #3]
100008ffc: 9bc07c20    	umulh	x0, x1, x0
100009000: ab02001f    	cmn	x0, x2
100009004: 9a883508    	cinc	x8, x8, hs
100009008: d37ffd00    	lsr	x0, x8, #63
10000900c: 52000000    	eor	w0, w0, #0x1
100009010: 9ac02108    	lsl	x8, x8, x0
100009014: 1b057e01    	mul	w1, w16, w5
100009018: 13107c21    	asr	w1, w1, #16
10000901c: 4b110031    	sub	w17, w1, w17
100009020: 4b000231    	sub	w17, w17, w0
100009024: 128fed00    	mov	w0, #-0x7f69            ; =-32617
100009028: 2b000222    	adds	w2, w17, w0
10000902c: 54000ce5    	b.pl	0x1000091c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100009030: a900e3f0    	stp	x16, x24, [sp, #0x8]
100009034: f9000fee    	str	x14, [sp, #0x18]
100009038: 390083ea    	strb	w10, [sp, #0x20]
10000903c: 5280002a    	mov	w10, #0x1               ; =1
100009040: 390087ea    	strb	w10, [sp, #0x21]
100009044: 39008bef    	strb	w15, [sp, #0x22]
100009048: b94003ea    	ldr	w10, [sp]
10000904c: 910023ee    	add	x14, sp, #0x8
100009050: b801b1ca    	stur	w10, [x14, #0x1b]
100009054: 394013ea    	ldrb	w10, [sp, #0x4]
100009058: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000905c: a902afe9    	stp	x9, x11, [sp, #0x28]
100009060: a903b7ec    	stp	x12, x13, [sp, #0x38]
100009064: f90027ff    	str	xzr, [sp, #0x48]
100009068: 910023e0    	add	x0, sp, #0x8
10000906c: aa0803e1    	mov	x1, x8
100009070: 52800003    	mov	w3, #0x0                ; =0
100009074: aa0703f9    	mov	x25, x7
100009078: aa0603fa    	mov	x26, x6
10000907c: 9400127f    	bl	0x10000da78 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
100009080: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100009084: aa1a03e6    	mov	x6, x26
100009088: 529c201a    	mov	w26, #0xe100            ; =57600
10000908c: 72a0beba    	movk	w26, #0x5f5, lsl #16
100009090: 528a4d45    	mov	w5, #0x526a             ; =21098
100009094: 72a00065    	movk	w5, #0x3, lsl #16
100009098: aa1903e7    	mov	x7, x25
10000909c: d2800039    	mov	x25, #0x1               ; =1
1000090a0: f2c4e219    	movk	x25, #0x2710, lsl #32
1000090a4: aa0003e8    	mov	x8, x0
1000090a8: aa0103e2    	mov	x2, x1
1000090ac: 14000047    	b	0x1000091c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
1000090b0: d2800018    	mov	x24, #0x0               ; =0
1000090b4: aa0c03ef    	mov	x15, x12
1000090b8: eb01019f    	cmp	x12, x1
1000090bc: 54ffec01    	b.ne	0x100008e3c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6a8>
1000090c0: 17ffff65    	b	0x100008e54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c0>
1000090c4: 7100b77f    	cmp	w27, #0x2d
1000090c8: 52b00008    	mov	w8, #-0x80000000        ; =-2147483648
1000090cc: 1a9f0108    	csel	w8, w8, wzr, eq
1000090d0: 17fffdd7    	b	0x10000882c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
1000090d4: 9e230300    	ucvtf	s0, x24
1000090d8: b0000168    	adrp	x8, 0x100036000 <__ZL24FFC_DOUBLE_POWERS_OF_TEN+0x60>
1000090dc: 91016108    	add	x8, x8, #0x58
1000090e0: b7f80f90    	tbnz	x16, #0x3f, 0x1000092d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb3c>
1000090e4: bc707901    	ldr	s1, [x8, x16, lsl #2]
1000090e8: 1e200820    	fmul	s0, s1, s0
1000090ec: 17ffff70    	b	0x100008eac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x718>
1000090f0: 92400423    	and	x3, x1, #0x3
1000090f4: 9ac22022    	lsl	x2, x1, x2
1000090f8: eb11005f    	cmp	x2, x17
1000090fc: fa410860    	ccmp	x3, #0x1, #0x0, eq
100009100: fa420902    	ccmp	x8, #0x2, #0x2, eq
100009104: 91004608    	add	x8, x16, #0x11
100009108: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000910c: 927e5c28    	and	x8, x1, #0x3fffffc
100009110: 9a813108    	csel	x8, x8, x1, lo
100009114: 92400111    	and	x17, x8, #0x1
100009118: 8b080228    	add	x8, x17, x8
10000911c: 53017d11    	lsr	w17, w8, #1
100009120: d359fd08    	lsr	x8, x8, #25
100009124: f100011f    	cmp	x8, #0x0
100009128: 52800fe1    	mov	w1, #0x7f               ; =127
10000912c: 1a810421    	cinc	w1, w1, ne
100009130: 0b000020    	add	w0, w1, w0
100009134: 7103fc1f    	cmp	w0, #0xff
100009138: fa403900    	ccmp	x8, #0x0, #0x0, lo
10000913c: 12bf9008    	mov	w8, #0x37fffff          ; =58720255
100009140: 8a080228    	and	x8, x17, x8
100009144: 9a9f0108    	csel	x8, x8, xzr, eq
100009148: 11cffc02    	umin	w2, w0, #0xff
10000914c: 3707f1cf    	tbnz	w15, #0x0, 0x100008f84 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
100009150: 1400001d    	b	0x1000091c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa30>
100009154: dac01061    	clz	x1, x3
100009158: 9ac12063    	lsl	x3, x3, x1
10000915c: 531f7a04    	lsl	w4, w16, #1
100009160: 110ab091    	add	w17, w4, #0x2ac
100009164: b0000165    	adrp	x5, 0x100036000 <__ZL24FFC_DOUBLE_POWERS_OF_TEN+0x60>
100009168: 910220a5    	add	x5, x5, #0x88
10000916c: f87158a0    	ldr	x0, [x5, w17, uxtw #3]
100009170: 9b037c11    	mul	x17, x0, x3
100009174: 9bc37c00    	umulh	x0, x0, x3
100009178: b24097fe    	mov	x30, #0x3fffffffff      ; =274877906943
10000917c: ea2003df    	bics	xzr, x30, x0
100009180: 540003c1    	b.ne	0x1000091f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa64>
100009184: aa0603fe    	mov	x30, x6
100009188: 110ab484    	add	w4, w4, #0x2ad
10000918c: f86458a4    	ldr	x4, [x5, w4, uxtw #3]
100009190: 9bc37c83    	umulh	x3, x4, x3
100009194: ab110071    	adds	x17, x3, x17
100009198: 9a803400    	cinc	x0, x0, hs
10000919c: 14000018    	b	0x1000091fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa68>
1000091a0: 12800fa8    	mov	w8, #-0x7e              ; =-126
1000091a4: 4b000108    	sub	w8, w8, w0
1000091a8: 9ac82428    	lsr	x8, x1, x8
1000091ac: 12000111    	and	w17, w8, #0x1
1000091b0: 0b080231    	add	w17, w17, w8
1000091b4: 53017e28    	lsr	w8, w17, #1
1000091b8: f2680a3f    	tst	x17, #0x7000000
1000091bc: 1a9f07e2    	cset	w2, ne
1000091c0: 3707ee2f    	tbnz	w15, #0x0, 0x100008f84 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
1000091c4: 52800038    	mov	w24, #0x1               ; =1
1000091c8: 7100b77f    	cmp	w27, #0x2d
1000091cc: 52b00009    	mov	w9, #-0x80000000        ; =-2147483648
1000091d0: 1a9f0129    	csel	w9, w9, wzr, eq
1000091d4: f100031f    	cmp	x24, #0x0
1000091d8: 7a401840    	ccmp	w2, #0x0, #0x0, ne
1000091dc: fa400900    	ccmp	x8, #0x0, #0x0, eq
1000091e0: 54000b20    	b.eq	0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
1000091e4: 7103fc5f    	cmp	w2, #0xff
1000091e8: 54000ae0    	b.eq	0x100009344 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
1000091ec: 2a080128    	orr	w8, w9, w8
1000091f0: 2a025d08    	orr	w8, w8, w2, lsl #23
1000091f4: 17fffd8e    	b	0x10000882c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
1000091f8: aa0603fe    	mov	x30, x6
1000091fc: d37ffc05    	lsr	x5, x0, #63
100009200: 528004c4    	mov	w4, #0x26               ; =38
100009204: b37ffc04    	bfxil	x4, x0, #63, #1
100009208: 9ac42403    	lsr	x3, x0, x4
10000920c: 528a4d46    	mov	w6, #0x526a             ; =21098
100009210: 72a00066    	movk	w6, #0x3, lsl #16
100009214: 1b067e06    	mul	w6, w16, w6
100009218: 4b0100a1    	sub	w1, w5, w1
10000921c: 0b864021    	add	w1, w1, w6, asr #16
100009220: 1100fc21    	add	w1, w1, #0x3f
100009224: 3101fc3f    	cmn	w1, #0x7f
100009228: 5400018c    	b.gt	0x100009258 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xac4>
10000922c: 3102f43f    	cmn	w1, #0xbd
100009230: aa1e03e6    	mov	x6, x30
100009234: 54000562    	b.hs	0x1000092e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb4c>
100009238: d2800011    	mov	x17, #0x0               ; =0
10000923c: 52800000    	mov	w0, #0x0                ; =0
100009240: 528a4d45    	mov	w5, #0x526a             ; =21098
100009244: 72a00065    	movk	w5, #0x3, lsl #16
100009248: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
10000924c: eb11011f    	cmp	x8, x17
100009250: 54ffeb20    	b.eq	0x100008fb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
100009254: 17ffff5a    	b	0x100008fbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
100009258: 92400465    	and	x5, x3, #0x3
10000925c: 9ac42064    	lsl	x4, x3, x4
100009260: eb00009f    	cmp	x4, x0
100009264: fa4108a0    	ccmp	x5, #0x1, #0x0, eq
100009268: fa420a22    	ccmp	x17, #0x2, #0x2, eq
10000926c: 91004611    	add	x17, x16, #0x11
100009270: fa5c3a22    	ccmp	x17, #0x1c, #0x2, lo
100009274: 927e5c71    	and	x17, x3, #0x3fffffc
100009278: 9a833231    	csel	x17, x17, x3, lo
10000927c: 92400220    	and	x0, x17, #0x1
100009280: 8b110011    	add	x17, x0, x17
100009284: 53017e20    	lsr	w0, w17, #1
100009288: d359fe31    	lsr	x17, x17, #25
10000928c: f100023f    	cmp	x17, #0x0
100009290: 52800fe3    	mov	w3, #0x7f               ; =127
100009294: 1a830463    	cinc	w3, w3, ne
100009298: 0b010061    	add	w1, w3, w1
10000929c: 7103fc3f    	cmp	w1, #0xff
1000092a0: fa403a20    	ccmp	x17, #0x0, #0x0, lo
1000092a4: 12bf9011    	mov	w17, #0x37fffff         ; =58720255
1000092a8: 8a110011    	and	x17, x0, x17
1000092ac: 9a9f0231    	csel	x17, x17, xzr, eq
1000092b0: 11cffc20    	umin	w0, w1, #0xff
1000092b4: 528a4d45    	mov	w5, #0x526a             ; =21098
1000092b8: 72a00065    	movk	w5, #0x3, lsl #16
1000092bc: aa1e03e6    	mov	x6, x30
1000092c0: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
1000092c4: eb11011f    	cmp	x8, x17
1000092c8: 54ffe760    	b.eq	0x100008fb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
1000092cc: 17ffff3c    	b	0x100008fbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
1000092d0: cb100908    	sub	x8, x8, x16, lsl #2
1000092d4: bd400101    	ldr	s1, [x8]
1000092d8: 1e211800    	fdiv	s0, s0, s1
1000092dc: 17fffef4    	b	0x100008eac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x718>
1000092e0: 12800fb1    	mov	w17, #-0x7e             ; =-126
1000092e4: 4b010231    	sub	w17, w17, w1
1000092e8: 9ad12471    	lsr	x17, x3, x17
1000092ec: 12000220    	and	w0, w17, #0x1
1000092f0: 0b110000    	add	w0, w0, w17
1000092f4: 53017c11    	lsr	w17, w0, #1
1000092f8: f268081f    	tst	x0, #0x7000000
1000092fc: 1a9f07e0    	cset	w0, ne
100009300: 528a4d45    	mov	w5, #0x526a             ; =21098
100009304: 72a00065    	movk	w5, #0x3, lsl #16
100009308: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
10000930c: eb11011f    	cmp	x8, x17
100009310: 54ffe520    	b.eq	0x100008fb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
100009314: 17ffff2a    	b	0x100008fbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
100009318: 6f00e408    	movi.2d	v8, #0000000000000000
10000931c: 4ea81d00    	mov.16b	v0, v8
100009320: a94b7bfd    	ldp	x29, x30, [sp, #0xb0]
100009324: a94a4ff4    	ldp	x20, x19, [sp, #0xa0]
100009328: a94957f6    	ldp	x22, x21, [sp, #0x90]
10000932c: a9485ff8    	ldp	x24, x23, [sp, #0x80]
100009330: a94767fa    	ldp	x26, x25, [sp, #0x70]
100009334: a9466ffc    	ldp	x28, x27, [sp, #0x60]
100009338: 6d4523e9    	ldp	d9, d8, [sp, #0x50]
10000933c: 910303ff    	add	sp, sp, #0xc0
100009340: d65f03c0    	ret
100009344: 52800200    	mov	w0, #0x10               ; =16
100009348: 9400b0e9    	bl	0x1000356ec <_strtof_l+0x1000356ec>
10000934c: aa0003f3    	mov	x19, x0
100009350: 900001c1    	adrp	x1, 0x100041000 <_strtof_l+0x100041000>
100009354: 91034821    	add	x1, x1, #0xd2
100009358: 9400b067    	bl	0x1000354f4 <_strtof_l+0x1000354f4>
10000935c: aa1303e0    	mov	x0, x19
100009360: 9400b012    	bl	0x1000353a8 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE.cold.1>
100009364: aa0003f4    	mov	x20, x0
100009368: aa1303e0    	mov	x0, x19
10000936c: 9400b0ef    	bl	0x100035728 <_strtof_l+0x100035728>
100009370: aa1403e0    	mov	x0, x20
100009374: 9400b02d    	bl	0x100035428 <_strtof_l+0x100035428>
