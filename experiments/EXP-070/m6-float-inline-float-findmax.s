
simple_fastfloat_benchmark/build/m6-float-inline/benchmarks/benchmark32:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100006edc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE>:
100006edc: d10303ff    	sub	sp, sp, #0xc0
100006ee0: 6d0523e9    	stp	d9, d8, [sp, #0x50]
100006ee4: a9066ffc    	stp	x28, x27, [sp, #0x60]
100006ee8: a90767fa    	stp	x26, x25, [sp, #0x70]
100006eec: a9085ff8    	stp	x24, x23, [sp, #0x80]
100006ef0: a90957f6    	stp	x22, x21, [sp, #0x90]
100006ef4: a90a4ff4    	stp	x20, x19, [sp, #0xa0]
100006ef8: a90b7bfd    	stp	x29, x30, [sp, #0xb0]
100006efc: 9102c3fd    	add	x29, sp, #0xb0
100006f00: a9405013    	ldp	x19, x20, [x0]
100006f04: eb14027f    	cmp	x19, x20
100006f08: 54005ac0    	b.eq	0x100007a60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb84>
100006f0c: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
100006f10: f299fa15    	movk	x21, #0xcfd0
100006f14: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
100006f18: b202e2d6    	orr	x22, x22, #0x4444444444444444
100006f1c: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
100006f20: f2d6d677    	movk	x23, #0xb6b3, lsl #32
100006f24: f2e1bc17    	movk	x23, #0xde0, lsl #48
100006f28: d2800c87    	mov	x7, #0x64               ; =100
100006f2c: f2c84807    	movk	x7, #0x4240, lsl #32
100006f30: f2e001e7    	movk	x7, #0xf, lsl #48
100006f34: d2800039    	mov	x25, #0x1               ; =1
100006f38: f2c4e219    	movk	x25, #0x2710, lsl #32
100006f3c: 529c201a    	mov	w26, #0xe100            ; =57600
100006f40: 72a0beba    	movk	w26, #0x5f5, lsl #16
100006f44: 528a4d45    	mov	w5, #0x526a             ; =21098
100006f48: 72a00065    	movk	w5, #0x3, lsl #16
100006f4c: 6f00e408    	movi.2d	v8, #0000000000000000
100006f50: b203c3e6    	mov	x6, #0x2020202020202020 ; =2314885530818453536
100006f54: f28dcd26    	movk	x6, #0x6e69
100006f58: f2a40cc6    	movk	x6, #0x2066, lsl #16
100006f5c: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100006f60: 5280015c    	mov	w28, #0xa               ; =10
100006f64: 1400000b    	b	0x100006f90 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb4>
100006f68: 7100b51f    	cmp	w8, #0x2d
100006f6c: 52bff008    	mov	w8, #-0x800000          ; =-8388608
100006f70: 1a9e0108    	csel	w8, w8, w30, eq
100006f74: 1e270100    	fmov	s0, w8
100006f78: 1e22c000    	fcvt	d0, s0
100006f7c: 1e602100    	fcmp	d8, d0
100006f80: 1e60cd08    	fcsel	d8, d8, d0, gt
100006f84: 91006273    	add	x19, x19, #0x18
100006f88: eb14027f    	cmp	x19, x20
100006f8c: 540056c0    	b.eq	0x100007a64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb88>
100006f90: 39805e60    	ldrsb	x0, [x19, #0x17]
100006f94: b7f80080    	tbnz	x0, #0x3f, 0x100006fa4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xc8>
100006f98: aa1303f1    	mov	x17, x19
100006f9c: b5000080    	cbnz	x0, 0x100006fac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xd0>
100006fa0: 140002bb    	b	0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100006fa4: a9400271    	ldp	x17, x0, [x19]
100006fa8: b4005720    	cbz	x0, 0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100006fac: 3940023b    	ldrb	w27, [x17]
100006fb0: aa1b03eb    	mov	x11, x27
100006fb4: aa1103e9    	mov	x9, x17
100006fb8: 7100b77f    	cmp	w27, #0x2d
100006fbc: 1a9f17ea    	cset	w10, eq
100006fc0: 54000161    	b.ne	0x100006fec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x110>
100006fc4: f100041f    	cmp	x0, #0x1
100006fc8: 54001b60    	b.eq	0x100007334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100006fcc: aa1103e9    	mov	x9, x17
100006fd0: 38c01d28    	ldrsb	w8, [x9, #0x1]!
100006fd4: 12001d0b    	and	w11, w8, #0xff
100006fd8: 7100b91f    	cmp	w8, #0x2e
100006fdc: 54000080    	b.eq	0x100006fec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x110>
100006fe0: 5100c108    	sub	w8, w8, #0x30
100006fe4: 7100251f    	cmp	w8, #0x9
100006fe8: 54001a68    	b.hi	0x100007334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
100006fec: 8b00022f    	add	x15, x17, x0
100006ff0: eb0f013f    	cmp	x9, x15
100006ff4: 540008c0    	b.eq	0x10000710c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x230>
100006ff8: 13001d68    	sxtb	w8, w11
100006ffc: 5100c108    	sub	w8, w8, #0x30
100007000: 7100251f    	cmp	w8, #0x9
100007004: 54000848    	b.hi	0x10000710c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x230>
100007008: 91000528    	add	x8, x9, #0x1
10000700c: 93401d6b    	sxtb	x11, w11
100007010: d100c178    	sub	x24, x11, #0x30
100007014: eb0f011f    	cmp	x8, x15
100007018: 540007e0    	b.eq	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000701c: 39c0010b    	ldrsb	w11, [x8]
100007020: 5100c16c    	sub	w12, w11, #0x30
100007024: 7100259f    	cmp	w12, #0x9
100007028: 54000768    	b.hi	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000702c: 93407d6b    	sxtw	x11, w11
100007030: 91000928    	add	x8, x9, #0x2
100007034: d100c16b    	sub	x11, x11, #0x30
100007038: aa1803ec    	mov	x12, x24
10000703c: 8b0c0998    	add	x24, x12, x12, lsl #2
100007040: 8b180578    	add	x24, x11, x24, lsl #1
100007044: eb0f011f    	cmp	x8, x15
100007048: 54000660    	b.eq	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000704c: 39c0010b    	ldrsb	w11, [x8]
100007050: 5100c16c    	sub	w12, w11, #0x30
100007054: 7100259f    	cmp	w12, #0x9
100007058: 540005e8    	b.hi	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000705c: 93407d6b    	sxtw	x11, w11
100007060: 91000d28    	add	x8, x9, #0x3
100007064: d100c16b    	sub	x11, x11, #0x30
100007068: aa1803ec    	mov	x12, x24
10000706c: 8b0c0998    	add	x24, x12, x12, lsl #2
100007070: 8b180578    	add	x24, x11, x24, lsl #1
100007074: eb0f011f    	cmp	x8, x15
100007078: 540004e0    	b.eq	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000707c: 39c0010b    	ldrsb	w11, [x8]
100007080: 5100c16c    	sub	w12, w11, #0x30
100007084: 7100259f    	cmp	w12, #0x9
100007088: 54000468    	b.hi	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000708c: 93407d6b    	sxtw	x11, w11
100007090: 91001128    	add	x8, x9, #0x4
100007094: d100c16b    	sub	x11, x11, #0x30
100007098: aa1803ec    	mov	x12, x24
10000709c: 8b0c0998    	add	x24, x12, x12, lsl #2
1000070a0: 8b180578    	add	x24, x11, x24, lsl #1
1000070a4: eb0f011f    	cmp	x8, x15
1000070a8: 54000360    	b.eq	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
1000070ac: 39c0010b    	ldrsb	w11, [x8]
1000070b0: 5100c16c    	sub	w12, w11, #0x30
1000070b4: 7100259f    	cmp	w12, #0x9
1000070b8: 540002e8    	b.hi	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
1000070bc: 93407d6b    	sxtw	x11, w11
1000070c0: 91001528    	add	x8, x9, #0x5
1000070c4: d100c16c    	sub	x12, x11, #0x30
1000070c8: 8b180b0b    	add	x11, x24, x24, lsl #2
1000070cc: 8b0b058b    	add	x11, x12, x11, lsl #1
1000070d0: eb0f011f    	cmp	x8, x15
1000070d4: 540019e0    	b.eq	0x100007410 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x534>
1000070d8: 39c0010c    	ldrsb	w12, [x8]
1000070dc: 5100c18d    	sub	w13, w12, #0x30
1000070e0: 710025bf    	cmp	w13, #0x9
1000070e4: 54001968    	b.hi	0x100007410 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x534>
1000070e8: 93407d8c    	sxtw	x12, w12
1000070ec: d100c18c    	sub	x12, x12, #0x30
1000070f0: 8b0b0978    	add	x24, x11, x11, lsl #2
1000070f4: 8b180598    	add	x24, x12, x24, lsl #1
1000070f8: 91000508    	add	x8, x8, #0x1
1000070fc: aa1803eb    	mov	x11, x24
100007100: eb0f011f    	cmp	x8, x15
100007104: 54fffea1    	b.ne	0x1000070d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x1fc>
100007108: 14000003    	b	0x100007114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x238>
10000710c: d2800018    	mov	x24, #0x0               ; =0
100007110: aa0903e8    	mov	x8, x9
100007114: cb09010b    	sub	x11, x8, x9
100007118: eb0f011f    	cmp	x8, x15
10000711c: 54001820    	b.eq	0x100007420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x544>
100007120: 3940010c    	ldrb	w12, [x8]
100007124: 7100b99f    	cmp	w12, #0x2e
100007128: 540017c1    	b.ne	0x100007420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x544>
10000712c: 9100050c    	add	x12, x8, #0x1
100007130: cb0c01ee    	sub	x14, x15, x12
100007134: f10041df    	cmp	x14, #0x10
100007138: 5400056b    	b.lt	0x1000071e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x308>
10000713c: 9100250d    	add	x13, x8, #0x9
100007140: f85f81b0    	ldur	x16, [x13, #-0x8]
100007144: 8b160201    	add	x1, x16, x22
100007148: 8b150210    	add	x16, x16, x21
10000714c: aa100021    	orr	x1, x1, x16
100007150: f201c03f    	tst	x1, #0x8080808080808080
100007154: 540003a1    	b.ne	0x1000071c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2ec>
100007158: f94001a1    	ldr	x1, [x13]
10000715c: 8b160022    	add	x2, x1, x22
100007160: 8b150021    	add	x1, x1, x21
100007164: aa010042    	orr	x2, x2, x1
100007168: f201c05f    	tst	x2, #0x8080808080808080
10000716c: 54001381    	b.ne	0x1000073dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x500>
100007170: 9b1c7e02    	mul	x2, x16, x28
100007174: 8b502050    	add	x16, x2, x16, lsr #8
100007178: 92001e02    	and	x2, x16, #0xff000000ff
10000717c: 9b077c42    	mul	x2, x2, x7
100007180: d350fe10    	lsr	x16, x16, #16
100007184: 92001e10    	and	x16, x16, #0xff000000ff
100007188: 9b190a10    	madd	x16, x16, x25, x2
10000718c: 9b1c7c22    	mul	x2, x1, x28
100007190: 8b412041    	add	x1, x2, x1, lsr #8
100007194: 92001c22    	and	x2, x1, #0xff000000ff
100007198: 9b077c42    	mul	x2, x2, x7
10000719c: d350fc21    	lsr	x1, x1, #16
1000071a0: 92001c21    	and	x1, x1, #0xff000000ff
1000071a4: 9b190821    	madd	x1, x1, x25, x2
1000071a8: 9b1a7f02    	mul	x2, x24, x26
1000071ac: 8b508050    	add	x16, x2, x16, lsr #32
1000071b0: 9b1a7e10    	mul	x16, x16, x26
1000071b4: 8b418218    	add	x24, x16, x1, lsr #32
1000071b8: 910041ad    	add	x13, x13, #0x10
1000071bc: d10041ce    	sub	x14, x14, #0x10
1000071c0: f1003ddf    	cmp	x14, #0xf
1000071c4: 54fffbec    	b.gt	0x100007140 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x264>
1000071c8: d10021ad    	sub	x13, x13, #0x8
1000071cc: cb0d01ee    	sub	x14, x15, x13
1000071d0: f10021df    	cmp	x14, #0x8
1000071d4: 5400010a    	b.ge	0x1000071f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x318>
1000071d8: f10011df    	cmp	x14, #0x4
1000071dc: 5400032a    	b.ge	0x100007240 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x364>
1000071e0: 14000022    	b	0x100007268 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x38c>
1000071e4: aa0c03ed    	mov	x13, x12
1000071e8: cb0c01ee    	sub	x14, x15, x12
1000071ec: f10021df    	cmp	x14, #0x8
1000071f0: 54ffff4b    	b.lt	0x1000071d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2fc>
1000071f4: f94001ae    	ldr	x14, [x13]
1000071f8: 8b1601d0    	add	x16, x14, x22
1000071fc: 8b1501ce    	add	x14, x14, x21
100007200: aa0e0210    	orr	x16, x16, x14
100007204: f201c21f    	tst	x16, #0x8080808080808080
100007208: 540001c1    	b.ne	0x100007240 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x364>
10000720c: 9b1a7f10    	mul	x16, x24, x26
100007210: 9b1c7dc1    	mul	x1, x14, x28
100007214: 8b4e202e    	add	x14, x1, x14, lsr #8
100007218: 92001dc1    	and	x1, x14, #0xff000000ff
10000721c: 9b077c21    	mul	x1, x1, x7
100007220: d350fdce    	lsr	x14, x14, #16
100007224: 92001dce    	and	x14, x14, #0xff000000ff
100007228: 9b1905ce    	madd	x14, x14, x25, x1
10000722c: 8b4e8218    	add	x24, x16, x14, lsr #32
100007230: 910021ad    	add	x13, x13, #0x8
100007234: cb0d01ee    	sub	x14, x15, x13
100007238: f10011df    	cmp	x14, #0x4
10000723c: 5400016b    	b.lt	0x100007268 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x38c>
100007240: b94001ae    	ldr	w14, [x13]
100007244: 5288c8d0    	mov	w16, #0x4646            ; =17990
100007248: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000724c: 0b1001d0    	add	w16, w14, w16
100007250: 5299fa01    	mov	w1, #0xcfd0             ; =53200
100007254: 72b9f9e1    	movk	w1, #0xcfcf, lsl #16
100007258: 0b0101ce    	add	w14, w14, w1
10000725c: 2a0e0210    	orr	w16, w16, w14
100007260: 7201c21f    	tst	w16, #0x80808080
100007264: 54000960    	b.eq	0x100007390 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x4b4>
100007268: eb0f01bf    	cmp	x13, x15
10000726c: 54000aa0    	b.eq	0x1000073c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x4e4>
100007270: 39c001ae    	ldrsb	w14, [x13]
100007274: 5100c1d0    	sub	w16, w14, #0x30
100007278: 7100261f    	cmp	w16, #0x9
10000727c: 54000508    	b.hi	0x10000731c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x440>
100007280: 12001dd0    	and	w16, w14, #0xff
100007284: 910005ae    	add	x14, x13, #0x1
100007288: 5100c210    	sub	w16, w16, #0x30
10000728c: 92401e10    	and	x16, x16, #0xff
100007290: aa1803e1    	mov	x1, x24
100007294: 8b010838    	add	x24, x1, x1, lsl #2
100007298: 8b180618    	add	x24, x16, x24, lsl #1
10000729c: eb0f01df    	cmp	x14, x15
1000072a0: 54000400    	b.eq	0x100007320 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
1000072a4: 39c001d0    	ldrsb	w16, [x14]
1000072a8: 5100c201    	sub	w1, w16, #0x30
1000072ac: 7100243f    	cmp	w1, #0x9
1000072b0: 54000388    	b.hi	0x100007320 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
1000072b4: 12001e10    	and	w16, w16, #0xff
1000072b8: 910009ae    	add	x14, x13, #0x2
1000072bc: 5100c210    	sub	w16, w16, #0x30
1000072c0: 92401e10    	and	x16, x16, #0xff
1000072c4: aa1803e1    	mov	x1, x24
1000072c8: 8b010838    	add	x24, x1, x1, lsl #2
1000072cc: 8b180618    	add	x24, x16, x24, lsl #1
1000072d0: eb0f01df    	cmp	x14, x15
1000072d4: 54000260    	b.eq	0x100007320 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
1000072d8: 39c001d0    	ldrsb	w16, [x14]
1000072dc: 5100c201    	sub	w1, w16, #0x30
1000072e0: 7100243f    	cmp	w1, #0x9
1000072e4: 540001e8    	b.hi	0x100007320 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x444>
1000072e8: 12001e10    	and	w16, w16, #0xff
1000072ec: 91000dae    	add	x14, x13, #0x3
1000072f0: 5100c20d    	sub	w13, w16, #0x30
1000072f4: 92401dad    	and	x13, x13, #0xff
1000072f8: 8b180b10    	add	x16, x24, x24, lsl #2
1000072fc: 8b1005b0    	add	x16, x13, x16, lsl #1
100007300: aa1003f8    	mov	x24, x16
100007304: cb0c01cd    	sub	x13, x14, x12
100007308: cb0e0190    	sub	x16, x12, x14
10000730c: cb100162    	sub	x2, x11, x16
100007310: aa0e03e1    	mov	x1, x14
100007314: b5000942    	cbnz	x2, 0x10000743c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
100007318: 14000007    	b	0x100007334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
10000731c: aa0d03ee    	mov	x14, x13
100007320: cb0c01cd    	sub	x13, x14, x12
100007324: cb0e0190    	sub	x16, x12, x14
100007328: cb100162    	sub	x2, x11, x16
10000732c: aa0e03e1    	mov	x1, x14
100007330: b5000862    	cbnz	x2, 0x10000743c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
100007334: 39400228    	ldrb	w8, [x17]
100007338: 7100b51f    	cmp	w8, #0x2d
10000733c: 1a9f17e9    	cset	w9, eq
100007340: cb09000a    	sub	x10, x0, x9
100007344: f1000d5f    	cmp	x10, #0x3
100007348: 54003a2b    	b.lt	0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
10000734c: 8b090229    	add	x9, x17, x9
100007350: 3940092a    	ldrb	w10, [x9, #0x2]
100007354: 79400129    	ldrh	w9, [x9]
100007358: aa0a4129    	orr	x9, x9, x10, lsl #16
10000735c: b203c129    	orr	x9, x9, #0x2020202020202020
100007360: eb06013f    	cmp	x9, x6
100007364: 54ffe020    	b.eq	0x100006f68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x8c>
100007368: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000736c: f28c2dca    	movk	x10, #0x616e
100007370: f2a40dca    	movk	x10, #0x206e, lsl #16
100007374: eb0a013f    	cmp	x9, x10
100007378: 540038a1    	b.ne	0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
10000737c: 7100b51f    	cmp	w8, #0x2d
100007380: 52aff808    	mov	w8, #0x7fc00000         ; =2143289344
100007384: 52bff809    	mov	w9, #-0x400000          ; =-4194304
100007388: 1a880128    	csel	w8, w9, w8, eq
10000738c: 17fffefa    	b	0x100006f74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
100007390: 1b1c7dd0    	mul	w16, w14, w28
100007394: 0b4e220e    	add	w14, w16, w14, lsr #8
100007398: 12009dce    	and	w14, w14, #0xff00ff
10000739c: 52800030    	mov	w16, #0x1               ; =1
1000073a0: 72a00c90    	movk	w16, #0x64, lsl #16
1000073a4: 1b107dce    	mul	w14, w14, w16
1000073a8: 53107dce    	lsr	w14, w14, #16
1000073ac: 5284e210    	mov	w16, #0x2710            ; =10000
1000073b0: 9b103b18    	madd	x24, x24, x16, x14
1000073b4: 910011ad    	add	x13, x13, #0x4
1000073b8: eb0f01bf    	cmp	x13, x15
1000073bc: 54fff5a1    	b.ne	0x100007270 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x394>
1000073c0: aa0d03ee    	mov	x14, x13
1000073c4: cb0c01ad    	sub	x13, x13, x12
1000073c8: cb0e0190    	sub	x16, x12, x14
1000073cc: cb100162    	sub	x2, x11, x16
1000073d0: aa0e03e1    	mov	x1, x14
1000073d4: b5000342    	cbnz	x2, 0x10000743c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x560>
1000073d8: 17ffffd7    	b	0x100007334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
1000073dc: 9b1a7f0e    	mul	x14, x24, x26
1000073e0: 9b1c7e01    	mul	x1, x16, x28
1000073e4: 8b502030    	add	x16, x1, x16, lsr #8
1000073e8: 92001e01    	and	x1, x16, #0xff000000ff
1000073ec: 9b077c21    	mul	x1, x1, x7
1000073f0: d350fe10    	lsr	x16, x16, #16
1000073f4: 92001e10    	and	x16, x16, #0xff000000ff
1000073f8: 9b190610    	madd	x16, x16, x25, x1
1000073fc: 8b5081d8    	add	x24, x14, x16, lsr #32
100007400: cb0d01ee    	sub	x14, x15, x13
100007404: f10021df    	cmp	x14, #0x8
100007408: 54ffee8b    	b.lt	0x1000071d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x2fc>
10000740c: 17ffff7a    	b	0x1000071f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x318>
100007410: aa0b03f8    	mov	x24, x11
100007414: cb09010b    	sub	x11, x8, x9
100007418: eb0f011f    	cmp	x8, x15
10000741c: 54ffe821    	b.ne	0x100007120 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x244>
100007420: d280000d    	mov	x13, #0x0               ; =0
100007424: d2800010    	mov	x16, #0x0               ; =0
100007428: d280000c    	mov	x12, #0x0               ; =0
10000742c: d2800001    	mov	x1, #0x0                ; =0
100007430: aa0803ee    	mov	x14, x8
100007434: aa0b03e2    	mov	x2, x11
100007438: b4fff7eb    	cbz	x11, 0x100007334 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x458>
10000743c: eb0f01df    	cmp	x14, x15
100007440: 540005a0    	b.eq	0x1000074f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100007444: 394001d1    	ldrb	w17, [x14]
100007448: 321b0231    	orr	w17, w17, #0x20
10000744c: 7101963f    	cmp	w17, #0x65
100007450: 54000521    	b.ne	0x1000074f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100007454: 910005c0    	add	x0, x14, #0x1
100007458: eb0f001f    	cmp	x0, x15
10000745c: 54000180    	b.eq	0x10000748c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5b0>
100007460: 39400011    	ldrb	w17, [x0]
100007464: 910009c3    	add	x3, x14, #0x2
100007468: 7100ae3f    	cmp	w17, #0x2b
10000746c: 9a800060    	csel	x0, x3, x0, eq
100007470: 7100b63f    	cmp	w17, #0x2d
100007474: 52800031    	mov	w17, #0x1               ; =1
100007478: 1a9113f1    	csel	w17, wzr, w17, ne
10000747c: 9a831000    	csel	x0, x0, x3, ne
100007480: eb0f001f    	cmp	x0, x15
100007484: 540000a1    	b.ne	0x100007498 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5bc>
100007488: 1400001b    	b	0x1000074f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
10000748c: 52800011    	mov	w17, #0x0               ; =0
100007490: eb0f001f    	cmp	x0, x15
100007494: 54000300    	b.eq	0x1000074f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
100007498: 39c00003    	ldrsb	w3, [x0]
10000749c: 5100c063    	sub	w3, w3, #0x30
1000074a0: 7100247f    	cmp	w3, #0x9
1000074a4: 54000288    	b.hi	0x1000074f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x618>
1000074a8: d280000e    	mov	x14, #0x0               ; =0
1000074ac: 14000004    	b	0x1000074bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5e0>
1000074b0: 91000400    	add	x0, x0, #0x1
1000074b4: eb0f001f    	cmp	x0, x15
1000074b8: 54000820    	b.eq	0x1000075bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6e0>
1000074bc: 39c00003    	ldrsb	w3, [x0]
1000074c0: 5100c064    	sub	w4, w3, #0x30
1000074c4: 7100249f    	cmp	w4, #0x9
1000074c8: 540007a8    	b.hi	0x1000075bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6e0>
1000074cc: 12be0004    	mov	w4, #0xfffffff          ; =268435455
1000074d0: eb0401df    	cmp	x14, x4
1000074d4: 54fffeec    	b.gt	0x1000074b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5d4>
1000074d8: 12001c63    	and	w3, w3, #0xff
1000074dc: 5100c063    	sub	w3, w3, #0x30
1000074e0: 92401c63    	and	x3, x3, #0xff
1000074e4: 8b0e09c4    	add	x4, x14, x14, lsl #2
1000074e8: 8b040464    	add	x4, x3, x4, lsl #1
1000074ec: aa0403ee    	mov	x14, x4
1000074f0: 17fffff0    	b	0x1000074b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x5d4>
1000074f4: d2800011    	mov	x17, #0x0               ; =0
1000074f8: f100505f    	cmp	x2, #0x14
1000074fc: 540006cb    	b.lt	0x1000075d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6f8>
100007500: eb0f013f    	cmp	x9, x15
100007504: 54000200    	b.eq	0x100007544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x668>
100007508: aa0903e0    	mov	x0, x9
10000750c: 14000007    	b	0x100007528 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x64c>
100007510: 7100c07f    	cmp	w3, #0x30
100007514: 1a9f17e3    	cset	w3, eq
100007518: cb030042    	sub	x2, x2, x3
10000751c: 91000400    	add	x0, x0, #0x1
100007520: eb0f001f    	cmp	x0, x15
100007524: 540000c0    	b.eq	0x10000753c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x660>
100007528: 39400003    	ldrb	w3, [x0]
10000752c: 7100c07f    	cmp	w3, #0x30
100007530: 54ffff00    	b.eq	0x100007510 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x634>
100007534: 7100b87f    	cmp	w3, #0x2e
100007538: 54fffec0    	b.eq	0x100007510 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x634>
10000753c: f100505f    	cmp	x2, #0x14
100007540: 540004ab    	b.lt	0x1000075d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6f8>
100007544: eb08013f    	cmp	x9, x8
100007548: 54001580    	b.eq	0x1000077f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x91c>
10000754c: d2800018    	mov	x24, #0x0               ; =0
100007550: aa0903ef    	mov	x15, x9
100007554: 388015f0    	ldrsb	x16, [x15], #0x1
100007558: 9b1c4310    	madd	x16, x24, x28, x16
10000755c: d100c218    	sub	x24, x16, #0x30
100007560: eb17031f    	cmp	x24, x23
100007564: fa4831e4    	ccmp	x15, x8, #0x4, lo
100007568: 54ffff61    	b.ne	0x100007554 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x678>
10000756c: d10006f0    	sub	x16, x23, #0x1
100007570: eb10031f    	cmp	x24, x16
100007574: 54000168    	b.hi	0x1000075a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c4>
100007578: aa0c03ef    	mov	x15, x12
10000757c: eb01019f    	cmp	x12, x1
100007580: 540000e0    	b.eq	0x10000759c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c0>
100007584: 388015e8    	ldrsb	x8, [x15], #0x1
100007588: 9b1c2308    	madd	x8, x24, x28, x8
10000758c: d100c118    	sub	x24, x8, #0x30
100007590: eb17031f    	cmp	x24, x23
100007594: fa4131e4    	ccmp	x15, x1, #0x4, lo
100007598: 54ffff61    	b.ne	0x100007584 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6a8>
10000759c: aa0c03e8    	mov	x8, x12
1000075a0: cb0f0108    	sub	x8, x8, x15
1000075a4: 8b110110    	add	x16, x8, x17
1000075a8: 390013ff    	strb	wzr, [sp, #0x4]
1000075ac: b90003ff    	str	wzr, [sp]
1000075b0: 5280002f    	mov	w15, #0x1               ; =1
1000075b4: b5000358    	cbnz	x24, 0x10000761c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x740>
1000075b8: 14000042    	b	0x1000076c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
1000075bc: 7100023f    	cmp	w17, #0x0
1000075c0: da8e05d1    	cneg	x17, x14, ne
1000075c4: 8b100230    	add	x16, x17, x16
1000075c8: aa0003ee    	mov	x14, x0
1000075cc: f100505f    	cmp	x2, #0x14
1000075d0: 54fff98a    	b.ge	0x100007500 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x624>
1000075d4: 390013ff    	strb	wzr, [sp, #0x4]
1000075d8: b90003ff    	str	wzr, [sp]
1000075dc: b5000170    	cbnz	x16, 0x100007608 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x72c>
1000075e0: 52a02008    	mov	w8, #0x1000000          ; =16777216
1000075e4: eb08031f    	cmp	x24, x8
1000075e8: 54000108    	b.hi	0x100007608 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x72c>
1000075ec: b4001118    	cbz	x24, 0x10000780c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x930>
1000075f0: 9e230300    	ucvtf	s0, x24
1000075f4: 1e260008    	fmov	w8, s0
1000075f8: 52010109    	eor	w9, w8, #0x80000000
1000075fc: 7100b77f    	cmp	w27, #0x2d
100007600: 1a891108    	csel	w8, w8, w9, ne
100007604: 17fffe5c    	b	0x100006f74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
100007608: d1002e08    	sub	x8, x16, #0xb
10000760c: b100551f    	cmn	x8, #0x15
100007610: 54000162    	b.hs	0x10000763c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x760>
100007614: 5280000f    	mov	w15, #0x0               ; =0
100007618: b4000558    	cbz	x24, 0x1000076c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
10000761c: b101021f    	cmn	x16, #0x40
100007620: 5400050b    	b.lt	0x1000076c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7e4>
100007624: f1009a1f    	cmp	x16, #0x26
100007628: 5400012d    	b.le	0x10000764c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x770>
10000762c: 52801fe2    	mov	w2, #0xff               ; =255
100007630: d2800008    	mov	x8, #0x0                ; =0
100007634: 350004cf    	cbnz	w15, 0x1000076cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
100007638: 140000b6    	b	0x100007910 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
10000763c: 52a02008    	mov	w8, #0x1000000          ; =16777216
100007640: eb08031f    	cmp	x24, x8
100007644: 54000ec9    	b.ls	0x10000781c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x940>
100007648: 5280000f    	mov	w15, #0x0               ; =0
10000764c: dac01300    	clz	x0, x24
100007650: 9ac02301    	lsl	x1, x24, x0
100007654: 531f7a02    	lsl	w2, w16, #1
100007658: 110ab048    	add	w8, w2, #0x2ac
10000765c: b0000163    	adrp	x3, 0x100034000 <_strtof_l+0x100034000>
100007660: 911f6063    	add	x3, x3, #0x7d8
100007664: f8685871    	ldr	x17, [x3, w8, uxtw #3]
100007668: 9b017e28    	mul	x8, x17, x1
10000766c: 9bc17e31    	umulh	x17, x17, x1
100007670: b24097e4    	mov	x4, #0x3fffffffff       ; =274877906943
100007674: ea31009f    	bics	xzr, x4, x17
100007678: 540000c1    	b.ne	0x100007690 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7b4>
10000767c: 110ab442    	add	w2, w2, #0x2ad
100007680: f8625862    	ldr	x2, [x3, w2, uxtw #3]
100007684: 9bc17c41    	umulh	x1, x2, x1
100007688: ab080028    	adds	x8, x1, x8
10000768c: 9a913631    	cinc	x17, x17, hs
100007690: d37ffe23    	lsr	x3, x17, #63
100007694: 528004c2    	mov	w2, #0x26               ; =38
100007698: b37ffe22    	bfxil	x2, x17, #63, #1
10000769c: 9ac22621    	lsr	x1, x17, x2
1000076a0: 1b057e04    	mul	w4, w16, w5
1000076a4: 4b000060    	sub	w0, w3, w0
1000076a8: 0b844000    	add	w0, w0, w4, asr #16
1000076ac: 1100fc00    	add	w0, w0, #0x3f
1000076b0: 3101fc1f    	cmn	w0, #0x7f
1000076b4: 54000c2c    	b.gt	0x100007838 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x95c>
1000076b8: 3102f41f    	cmn	w0, #0xbd
1000076bc: 54001162    	b.hs	0x1000078e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0c>
1000076c0: 52800002    	mov	w2, #0x0                ; =0
1000076c4: d2800008    	mov	x8, #0x0                ; =0
1000076c8: 3400124f    	cbz	w15, 0x100007910 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
1000076cc: 52800000    	mov	w0, #0x0                ; =0
1000076d0: d2800011    	mov	x17, #0x0               ; =0
1000076d4: b1000703    	adds	x3, x24, #0x1
1000076d8: 540000e2    	b.hs	0x1000076f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x818>
1000076dc: b101021f    	cmn	x16, #0x40
1000076e0: 540000ab    	b.lt	0x1000076f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x818>
1000076e4: f1009a1f    	cmp	x16, #0x26
1000076e8: 54000dad    	b.le	0x10000789c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x9c0>
1000076ec: d2800011    	mov	x17, #0x0               ; =0
1000076f0: 52801fe0    	mov	w0, #0xff               ; =255
1000076f4: eb11011f    	cmp	x8, x17
1000076f8: 54000061    	b.ne	0x100007704 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
1000076fc: 6b00005f    	cmp	w2, w0
100007700: 54001080    	b.eq	0x100007910 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100007704: dac01311    	clz	x17, x24
100007708: 9ad12300    	lsl	x0, x24, x17
10000770c: 531f7a01    	lsl	w1, w16, #1
100007710: 110ab028    	add	w8, w1, #0x2ac
100007714: b0000162    	adrp	x2, 0x100034000 <_strtof_l+0x100034000>
100007718: 911f6042    	add	x2, x2, #0x7d8
10000771c: f868d842    	ldr	x2, [x2, w8, sxtw #3]
100007720: 9bc07c48    	umulh	x8, x2, x0
100007724: b24097e3    	mov	x3, #0x3fffffffff       ; =274877906943
100007728: ea28007f    	bics	xzr, x3, x8
10000772c: 54000121    	b.ne	0x100007750 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x874>
100007730: 9b007c42    	mul	x2, x2, x0
100007734: 110ab421    	add	w1, w1, #0x2ad
100007738: b0000163    	adrp	x3, 0x100034000 <_strtof_l+0x100034000>
10000773c: 911f6063    	add	x3, x3, #0x7d8
100007740: f861d861    	ldr	x1, [x3, w1, sxtw #3]
100007744: 9bc07c20    	umulh	x0, x1, x0
100007748: ab02001f    	cmn	x0, x2
10000774c: 9a883508    	cinc	x8, x8, hs
100007750: d37ffd00    	lsr	x0, x8, #63
100007754: 52000000    	eor	w0, w0, #0x1
100007758: 9ac02108    	lsl	x8, x8, x0
10000775c: 1b057e01    	mul	w1, w16, w5
100007760: 13107c21    	asr	w1, w1, #16
100007764: 4b110031    	sub	w17, w1, w17
100007768: 4b000231    	sub	w17, w17, w0
10000776c: 128fed00    	mov	w0, #-0x7f69            ; =-32617
100007770: 2b000222    	adds	w2, w17, w0
100007774: 54000ce5    	b.pl	0x100007910 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
100007778: a900e3f0    	stp	x16, x24, [sp, #0x8]
10000777c: f9000fee    	str	x14, [sp, #0x18]
100007780: 390083ea    	strb	w10, [sp, #0x20]
100007784: 5280002a    	mov	w10, #0x1               ; =1
100007788: 390087ea    	strb	w10, [sp, #0x21]
10000778c: 39008bef    	strb	w15, [sp, #0x22]
100007790: b94003ea    	ldr	w10, [sp]
100007794: 910023ee    	add	x14, sp, #0x8
100007798: b801b1ca    	stur	w10, [x14, #0x1b]
10000779c: 394013ea    	ldrb	w10, [sp, #0x4]
1000077a0: 3801f1ca    	sturb	w10, [x14, #0x1f]
1000077a4: a902afe9    	stp	x9, x11, [sp, #0x28]
1000077a8: a903b7ec    	stp	x12, x13, [sp, #0x38]
1000077ac: f90027ff    	str	xzr, [sp, #0x48]
1000077b0: 910023e0    	add	x0, sp, #0x8
1000077b4: aa0803e1    	mov	x1, x8
1000077b8: 52800003    	mov	w3, #0x0                ; =0
1000077bc: aa0703f9    	mov	x25, x7
1000077c0: aa0603fa    	mov	x26, x6
1000077c4: 9400127f    	bl	0x10000c1c0 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
1000077c8: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
1000077cc: aa1a03e6    	mov	x6, x26
1000077d0: 529c201a    	mov	w26, #0xe100            ; =57600
1000077d4: 72a0beba    	movk	w26, #0x5f5, lsl #16
1000077d8: 528a4d45    	mov	w5, #0x526a             ; =21098
1000077dc: 72a00065    	movk	w5, #0x3, lsl #16
1000077e0: aa1903e7    	mov	x7, x25
1000077e4: d2800039    	mov	x25, #0x1               ; =1
1000077e8: f2c4e219    	movk	x25, #0x2710, lsl #32
1000077ec: aa0003e8    	mov	x8, x0
1000077f0: aa0103e2    	mov	x2, x1
1000077f4: 14000047    	b	0x100007910 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa34>
1000077f8: d2800018    	mov	x24, #0x0               ; =0
1000077fc: aa0c03ef    	mov	x15, x12
100007800: eb01019f    	cmp	x12, x1
100007804: 54ffec01    	b.ne	0x100007584 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6a8>
100007808: 17ffff65    	b	0x10000759c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c0>
10000780c: 7100b77f    	cmp	w27, #0x2d
100007810: 52b00008    	mov	w8, #-0x80000000        ; =-2147483648
100007814: 1a9f0108    	csel	w8, w8, wzr, eq
100007818: 17fffdd7    	b	0x100006f74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
10000781c: 9e230300    	ucvtf	s0, x24
100007820: b0000168    	adrp	x8, 0x100034000 <_strtof_l+0x100034000>
100007824: 911ea108    	add	x8, x8, #0x7a8
100007828: b7f80f90    	tbnz	x16, #0x3f, 0x100007a18 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb3c>
10000782c: bc707901    	ldr	s1, [x8, x16, lsl #2]
100007830: 1e200820    	fmul	s0, s1, s0
100007834: 17ffff70    	b	0x1000075f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x718>
100007838: 92400423    	and	x3, x1, #0x3
10000783c: 9ac22022    	lsl	x2, x1, x2
100007840: eb11005f    	cmp	x2, x17
100007844: fa410860    	ccmp	x3, #0x1, #0x0, eq
100007848: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000784c: 91004608    	add	x8, x16, #0x11
100007850: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
100007854: 927e5c28    	and	x8, x1, #0x3fffffc
100007858: 9a813108    	csel	x8, x8, x1, lo
10000785c: 92400111    	and	x17, x8, #0x1
100007860: 8b080228    	add	x8, x17, x8
100007864: 53017d11    	lsr	w17, w8, #1
100007868: d359fd08    	lsr	x8, x8, #25
10000786c: f100011f    	cmp	x8, #0x0
100007870: 52800fe1    	mov	w1, #0x7f               ; =127
100007874: 1a810421    	cinc	w1, w1, ne
100007878: 0b000020    	add	w0, w1, w0
10000787c: 7103fc1f    	cmp	w0, #0xff
100007880: fa403900    	ccmp	x8, #0x0, #0x0, lo
100007884: 12bf9008    	mov	w8, #0x37fffff          ; =58720255
100007888: 8a080228    	and	x8, x17, x8
10000788c: 9a9f0108    	csel	x8, x8, xzr, eq
100007890: 11cffc02    	umin	w2, w0, #0xff
100007894: 3707f1cf    	tbnz	w15, #0x0, 0x1000076cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
100007898: 1400001d    	b	0x10000790c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa30>
10000789c: dac01061    	clz	x1, x3
1000078a0: 9ac12063    	lsl	x3, x3, x1
1000078a4: 531f7a04    	lsl	w4, w16, #1
1000078a8: 110ab091    	add	w17, w4, #0x2ac
1000078ac: b0000165    	adrp	x5, 0x100034000 <_strtof_l+0x100034000>
1000078b0: 911f60a5    	add	x5, x5, #0x7d8
1000078b4: f87158a0    	ldr	x0, [x5, w17, uxtw #3]
1000078b8: 9b037c11    	mul	x17, x0, x3
1000078bc: 9bc37c00    	umulh	x0, x0, x3
1000078c0: b24097fe    	mov	x30, #0x3fffffffff      ; =274877906943
1000078c4: ea2003df    	bics	xzr, x30, x0
1000078c8: 540003c1    	b.ne	0x100007940 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa64>
1000078cc: aa0603fe    	mov	x30, x6
1000078d0: 110ab484    	add	w4, w4, #0x2ad
1000078d4: f86458a4    	ldr	x4, [x5, w4, uxtw #3]
1000078d8: 9bc37c83    	umulh	x3, x4, x3
1000078dc: ab110071    	adds	x17, x3, x17
1000078e0: 9a803400    	cinc	x0, x0, hs
1000078e4: 14000018    	b	0x100007944 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa68>
1000078e8: 12800fa8    	mov	w8, #-0x7e              ; =-126
1000078ec: 4b000108    	sub	w8, w8, w0
1000078f0: 9ac82428    	lsr	x8, x1, x8
1000078f4: 12000111    	and	w17, w8, #0x1
1000078f8: 0b080231    	add	w17, w17, w8
1000078fc: 53017e28    	lsr	w8, w17, #1
100007900: f2680a3f    	tst	x17, #0x7000000
100007904: 1a9f07e2    	cset	w2, ne
100007908: 3707ee2f    	tbnz	w15, #0x0, 0x1000076cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x7f0>
10000790c: 52800038    	mov	w24, #0x1               ; =1
100007910: 7100b77f    	cmp	w27, #0x2d
100007914: 52b00009    	mov	w9, #-0x80000000        ; =-2147483648
100007918: 1a9f0129    	csel	w9, w9, wzr, eq
10000791c: f100031f    	cmp	x24, #0x0
100007920: 7a401840    	ccmp	w2, #0x0, #0x0, ne
100007924: fa400900    	ccmp	x8, #0x0, #0x0, eq
100007928: 54000b20    	b.eq	0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
10000792c: 7103fc5f    	cmp	w2, #0xff
100007930: 54000ae0    	b.eq	0x100007a8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xbb0>
100007934: 2a080128    	orr	w8, w9, w8
100007938: 2a025d08    	orr	w8, w8, w2, lsl #23
10000793c: 17fffd8e    	b	0x100006f74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x98>
100007940: aa0603fe    	mov	x30, x6
100007944: d37ffc05    	lsr	x5, x0, #63
100007948: 528004c4    	mov	w4, #0x26               ; =38
10000794c: b37ffc04    	bfxil	x4, x0, #63, #1
100007950: 9ac42403    	lsr	x3, x0, x4
100007954: 528a4d46    	mov	w6, #0x526a             ; =21098
100007958: 72a00066    	movk	w6, #0x3, lsl #16
10000795c: 1b067e06    	mul	w6, w16, w6
100007960: 4b0100a1    	sub	w1, w5, w1
100007964: 0b864021    	add	w1, w1, w6, asr #16
100007968: 1100fc21    	add	w1, w1, #0x3f
10000796c: 3101fc3f    	cmn	w1, #0x7f
100007970: 5400018c    	b.gt	0x1000079a0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xac4>
100007974: 3102f43f    	cmn	w1, #0xbd
100007978: aa1e03e6    	mov	x6, x30
10000797c: 54000562    	b.hs	0x100007a28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xb4c>
100007980: d2800011    	mov	x17, #0x0               ; =0
100007984: 52800000    	mov	w0, #0x0                ; =0
100007988: 528a4d45    	mov	w5, #0x526a             ; =21098
10000798c: 72a00065    	movk	w5, #0x3, lsl #16
100007990: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100007994: eb11011f    	cmp	x8, x17
100007998: 54ffeb20    	b.eq	0x1000076fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
10000799c: 17ffff5a    	b	0x100007704 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
1000079a0: 92400465    	and	x5, x3, #0x3
1000079a4: 9ac42064    	lsl	x4, x3, x4
1000079a8: eb00009f    	cmp	x4, x0
1000079ac: fa4108a0    	ccmp	x5, #0x1, #0x0, eq
1000079b0: fa420a22    	ccmp	x17, #0x2, #0x2, eq
1000079b4: 91004611    	add	x17, x16, #0x11
1000079b8: fa5c3a22    	ccmp	x17, #0x1c, #0x2, lo
1000079bc: 927e5c71    	and	x17, x3, #0x3fffffc
1000079c0: 9a833231    	csel	x17, x17, x3, lo
1000079c4: 92400220    	and	x0, x17, #0x1
1000079c8: 8b110011    	add	x17, x0, x17
1000079cc: 53017e20    	lsr	w0, w17, #1
1000079d0: d359fe31    	lsr	x17, x17, #25
1000079d4: f100023f    	cmp	x17, #0x0
1000079d8: 52800fe3    	mov	w3, #0x7f               ; =127
1000079dc: 1a830463    	cinc	w3, w3, ne
1000079e0: 0b010061    	add	w1, w3, w1
1000079e4: 7103fc3f    	cmp	w1, #0xff
1000079e8: fa403a20    	ccmp	x17, #0x0, #0x0, lo
1000079ec: 12bf9011    	mov	w17, #0x37fffff         ; =58720255
1000079f0: 8a110011    	and	x17, x0, x17
1000079f4: 9a9f0231    	csel	x17, x17, xzr, eq
1000079f8: 11cffc20    	umin	w0, w1, #0xff
1000079fc: 528a4d45    	mov	w5, #0x526a             ; =21098
100007a00: 72a00065    	movk	w5, #0x3, lsl #16
100007a04: aa1e03e6    	mov	x6, x30
100007a08: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100007a0c: eb11011f    	cmp	x8, x17
100007a10: 54ffe760    	b.eq	0x1000076fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
100007a14: 17ffff3c    	b	0x100007704 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
100007a18: cb100908    	sub	x8, x8, x16, lsl #2
100007a1c: bd400101    	ldr	s1, [x8]
100007a20: 1e211800    	fdiv	s0, s0, s1
100007a24: 17fffef4    	b	0x1000075f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x718>
100007a28: 12800fb1    	mov	w17, #-0x7e             ; =-126
100007a2c: 4b010231    	sub	w17, w17, w1
100007a30: 9ad12471    	lsr	x17, x3, x17
100007a34: 12000220    	and	w0, w17, #0x1
100007a38: 0b110000    	add	w0, w0, w17
100007a3c: 53017c11    	lsr	w17, w0, #1
100007a40: f268081f    	tst	x0, #0x7000000
100007a44: 1a9f07e0    	cset	w0, ne
100007a48: 528a4d45    	mov	w5, #0x526a             ; =21098
100007a4c: 72a00065    	movk	w5, #0x3, lsl #16
100007a50: 52aff01e    	mov	w30, #0x7f800000        ; =2139095040
100007a54: eb11011f    	cmp	x8, x17
100007a58: 54ffe520    	b.eq	0x1000076fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x820>
100007a5c: 17ffff2a    	b	0x100007704 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x828>
100007a60: 6f00e408    	movi.2d	v8, #0000000000000000
100007a64: 4ea81d00    	mov.16b	v0, v8
100007a68: a94b7bfd    	ldp	x29, x30, [sp, #0xb0]
100007a6c: a94a4ff4    	ldp	x20, x19, [sp, #0xa0]
100007a70: a94957f6    	ldp	x22, x21, [sp, #0x90]
100007a74: a9485ff8    	ldp	x24, x23, [sp, #0x80]
100007a78: a94767fa    	ldp	x26, x25, [sp, #0x70]
100007a7c: a9466ffc    	ldp	x28, x27, [sp, #0x60]
100007a80: 6d4523e9    	ldp	d9, d8, [sp, #0x50]
100007a84: 910303ff    	add	sp, sp, #0xc0
100007a88: d65f03c0    	ret
100007a8c: 52800200    	mov	w0, #0x10               ; =16
100007a90: 9400b0e9    	bl	0x100033e34 <_strtof_l+0x100033e34>
100007a94: aa0003f3    	mov	x19, x0
100007a98: 900001c1    	adrp	x1, 0x10003f000 <GCC_except_table317+0x18>
100007a9c: 91208821    	add	x1, x1, #0x822
100007aa0: 9400b067    	bl	0x100033c3c <_strtof_l+0x100033c3c>
100007aa4: aa1303e0    	mov	x0, x19
100007aa8: 9400b012    	bl	0x100033af0 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE.cold.1>
100007aac: aa0003f4    	mov	x20, x0
100007ab0: aa1303e0    	mov	x0, x19
100007ab4: 9400b0ef    	bl	0x100033e70 <_strtof_l+0x100033e70>
100007ab8: aa1403e0    	mov	x0, x20
100007abc: 9400b02d    	bl	0x100033b70 <_strtof_l+0x100033b70>
