
simple_fastfloat_benchmark/build/m6-site-integer/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d390 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d390: d103c3ff    	sub	sp, sp, #0xf0
10000d394: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000d398: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000d39c: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000d3a0: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000d3a4: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000d3a8: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000d3ac: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000d3b0: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000d3b4: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000d3b8: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000d3bc: 910383fd    	add	x29, sp, #0xe0
10000d3c0: a9405013    	ldp	x19, x20, [x0]
10000d3c4: eb14027f    	cmp	x19, x20
10000d3c8: 54005e60    	b.eq	0x10000df94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc04>
10000d3cc: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000d3d0: f299fa15    	movk	x21, #0xcfd0
10000d3d4: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000d3d8: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000d3dc: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d3e0: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d3e4: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d3e8: d2800c99    	mov	x25, #0x64              ; =100
10000d3ec: f2c84819    	movk	x25, #0x4240, lsl #32
10000d3f0: f2e001f9    	movk	x25, #0xf, lsl #48
10000d3f4: d280003a    	mov	x26, #0x1               ; =1
10000d3f8: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000d3fc: 529c201e    	mov	w30, #0xe100            ; =57600
10000d400: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000d404: 528a4d46    	mov	w6, #0x526a             ; =21098
10000d408: 72a00066    	movk	w6, #0x3, lsl #16
10000d40c: 6f00e408    	movi.2d	v8, #0000000000000000
10000d410: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000d414: f28dcd27    	movk	x7, #0x6e69
10000d418: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000d41c: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d420: 9e670109    	fmov	d9, x8
10000d424: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d428: 9e67010a    	fmov	d10, x8
10000d42c: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d430: 9e67010b    	fmov	d11, x8
10000d434: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d438: 9e67010c    	fmov	d12, x8
10000d43c: 5280015b    	mov	w27, #0xa               ; =10
10000d440: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d444: 9e67010d    	fmov	d13, x8
10000d448: 6f00e400    	movi.2d	v0, #0000000000000000
10000d44c: 14000009    	b	0x10000d470 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d450: 52800008    	mov	w8, #0x0                ; =0
10000d454: 37000041    	tbnz	w1, #0x0, 0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d458: 36005b88    	tbz	w8, #0x0, 0x10000dfc8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc38>
10000d45c: 1e612000    	fcmp	d0, d1
10000d460: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d464: 91006273    	add	x19, x19, #0x18
10000d468: eb14027f    	cmp	x19, x20
10000d46c: 54005960    	b.eq	0x10000df98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc08>
10000d470: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d474: b7f800a0    	tbnz	x0, #0x3f, 0x10000d488 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf8>
10000d478: aa1303f1    	mov	x17, x19
10000d47c: 6f00e401    	movi.2d	v1, #0000000000000000
10000d480: b50000a0    	cbnz	x0, 0x10000d494 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x104>
10000d484: 17fffff3    	b	0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d488: a9400271    	ldp	x17, x0, [x19]
10000d48c: 6f00e401    	movi.2d	v1, #0000000000000000
10000d490: b4fffe00    	cbz	x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d494: 3940023c    	ldrb	w28, [x17]
10000d498: 7100b79f    	cmp	w28, #0x2d
10000d49c: 1a9f17e9    	cset	w9, eq
10000d4a0: 540001e1    	b.ne	0x10000d4dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x14c>
10000d4a4: f100041f    	cmp	x0, #0x1
10000d4a8: 54001ee0    	b.eq	0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f4>
10000d4ac: aa1103ea    	mov	x10, x17
10000d4b0: 38c01d48    	ldrsb	w8, [x10, #0x1]!
10000d4b4: 7100b91f    	cmp	w8, #0x2e
10000d4b8: 54000080    	b.eq	0x10000d4c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x138>
10000d4bc: 5100c10b    	sub	w11, w8, #0x30
10000d4c0: 7100257f    	cmp	w11, #0x9
10000d4c4: 54001e08    	b.hi	0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f4>
10000d4c8: 12001d0b    	and	w11, w8, #0xff
10000d4cc: 8b00022f    	add	x15, x17, x0
10000d4d0: eb0f015f    	cmp	x10, x15
10000d4d4: 540000e1    	b.ne	0x10000d4f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x160>
10000d4d8: 14000046    	b	0x10000d5f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x260>
10000d4dc: aa1103ea    	mov	x10, x17
10000d4e0: aa1c03eb    	mov	x11, x28
10000d4e4: 8b00022f    	add	x15, x17, x0
10000d4e8: eb0f023f    	cmp	x17, x15
10000d4ec: 54000820    	b.eq	0x10000d5f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x260>
10000d4f0: 13001d68    	sxtb	w8, w11
10000d4f4: 5100c108    	sub	w8, w8, #0x30
10000d4f8: 7100251f    	cmp	w8, #0x9
10000d4fc: 540007a8    	b.hi	0x10000d5f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x260>
10000d500: 91000548    	add	x8, x10, #0x1
10000d504: 93401d6b    	sxtb	x11, w11
10000d508: d100c178    	sub	x24, x11, #0x30
10000d50c: eb0f011f    	cmp	x8, x15
10000d510: 54000740    	b.eq	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d514: 39c0010b    	ldrsb	w11, [x8]
10000d518: 5100c16c    	sub	w12, w11, #0x30
10000d51c: 7100259f    	cmp	w12, #0x9
10000d520: 540006c8    	b.hi	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d524: 93407d6b    	sxtw	x11, w11
10000d528: 91000948    	add	x8, x10, #0x2
10000d52c: 9b3b2f0b    	smaddl	x11, w24, w27, x11
10000d530: d100c178    	sub	x24, x11, #0x30
10000d534: eb0f011f    	cmp	x8, x15
10000d538: 54000600    	b.eq	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d53c: 39c0010b    	ldrsb	w11, [x8]
10000d540: 5100c16c    	sub	w12, w11, #0x30
10000d544: 7100259f    	cmp	w12, #0x9
10000d548: 54000588    	b.hi	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d54c: 93407d6b    	sxtw	x11, w11
10000d550: 91000d48    	add	x8, x10, #0x3
10000d554: 9b3b2f0b    	smaddl	x11, w24, w27, x11
10000d558: d100c178    	sub	x24, x11, #0x30
10000d55c: eb0f011f    	cmp	x8, x15
10000d560: 540004c0    	b.eq	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d564: 39c0010b    	ldrsb	w11, [x8]
10000d568: 5100c16c    	sub	w12, w11, #0x30
10000d56c: 7100259f    	cmp	w12, #0x9
10000d570: 54000448    	b.hi	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d574: 93407d6b    	sxtw	x11, w11
10000d578: 91001148    	add	x8, x10, #0x4
10000d57c: 9b3b2f0b    	smaddl	x11, w24, w27, x11
10000d580: d100c178    	sub	x24, x11, #0x30
10000d584: eb0f011f    	cmp	x8, x15
10000d588: 54000380    	b.eq	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d58c: 39c0010b    	ldrsb	w11, [x8]
10000d590: 5100c16c    	sub	w12, w11, #0x30
10000d594: 7100259f    	cmp	w12, #0x9
10000d598: 54000308    	b.hi	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d59c: 93407d6b    	sxtw	x11, w11
10000d5a0: 91001548    	add	x8, x10, #0x5
10000d5a4: 9b3b2f0b    	smaddl	x11, w24, w27, x11
10000d5a8: d100c178    	sub	x24, x11, #0x30
10000d5ac: eb0f011f    	cmp	x8, x15
10000d5b0: 54000240    	b.eq	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d5b4: 8b11000b    	add	x11, x0, x17
10000d5b8: cb0a016b    	sub	x11, x11, x10
10000d5bc: 8b0b014b    	add	x11, x10, x11
10000d5c0: 39c0010c    	ldrsb	w12, [x8]
10000d5c4: 5100c18d    	sub	w13, w12, #0x30
10000d5c8: 710025bf    	cmp	w13, #0x9
10000d5cc: 54000168    	b.hi	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d5d0: 93407d8c    	sxtw	x12, w12
10000d5d4: 9b1b330c    	madd	x12, x24, x27, x12
10000d5d8: d100c198    	sub	x24, x12, #0x30
10000d5dc: 91000508    	add	x8, x8, #0x1
10000d5e0: eb0f011f    	cmp	x8, x15
10000d5e4: 54fffee1    	b.ne	0x10000d5c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x230>
10000d5e8: aa0b03e8    	mov	x8, x11
10000d5ec: 14000003    	b	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x268>
10000d5f0: d2800018    	mov	x24, #0x0               ; =0
10000d5f4: aa0a03e8    	mov	x8, x10
10000d5f8: cb0a010b    	sub	x11, x8, x10
10000d5fc: eb0f011f    	cmp	x8, x15
10000d600: 54000640    	b.eq	0x10000d6c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x338>
10000d604: 3940010c    	ldrb	w12, [x8]
10000d608: 7100b99f    	cmp	w12, #0x2e
10000d60c: 540005e1    	b.ne	0x10000d6c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x338>
10000d610: 9100050c    	add	x12, x8, #0x1
10000d614: cb0c01ee    	sub	x14, x15, x12
10000d618: f10041df    	cmp	x14, #0x10
10000d61c: 540008cb    	b.lt	0x10000d734 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3a4>
10000d620: 9100250d    	add	x13, x8, #0x9
10000d624: f85f81b0    	ldur	x16, [x13, #-0x8]
10000d628: 8b160202    	add	x2, x16, x22
10000d62c: 8b150210    	add	x16, x16, x21
10000d630: aa100042    	orr	x2, x2, x16
10000d634: f201c05f    	tst	x2, #0x8080808080808080
10000d638: 540003a1    	b.ne	0x10000d6ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x31c>
10000d63c: f94001a2    	ldr	x2, [x13]
10000d640: 8b160043    	add	x3, x2, x22
10000d644: 8b150042    	add	x2, x2, x21
10000d648: aa020063    	orr	x3, x3, x2
10000d64c: f201c07f    	tst	x3, #0x8080808080808080
10000d650: 54002c21    	b.ne	0x10000dbd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000d654: 9b1b7e03    	mul	x3, x16, x27
10000d658: 8b502070    	add	x16, x3, x16, lsr #8
10000d65c: 92001e03    	and	x3, x16, #0xff000000ff
10000d660: 9b197c63    	mul	x3, x3, x25
10000d664: d350fe10    	lsr	x16, x16, #16
10000d668: 92001e10    	and	x16, x16, #0xff000000ff
10000d66c: 9b1a0e10    	madd	x16, x16, x26, x3
10000d670: 9b1b7c43    	mul	x3, x2, x27
10000d674: 8b422062    	add	x2, x3, x2, lsr #8
10000d678: 92001c43    	and	x3, x2, #0xff000000ff
10000d67c: 9b197c63    	mul	x3, x3, x25
10000d680: d350fc42    	lsr	x2, x2, #16
10000d684: 92001c42    	and	x2, x2, #0xff000000ff
10000d688: 9b1a0c42    	madd	x2, x2, x26, x3
10000d68c: 9b1e7f03    	mul	x3, x24, x30
10000d690: 8b508070    	add	x16, x3, x16, lsr #32
10000d694: 9b1e7e10    	mul	x16, x16, x30
10000d698: 8b428218    	add	x24, x16, x2, lsr #32
10000d69c: 910041ad    	add	x13, x13, #0x10
10000d6a0: d10041ce    	sub	x14, x14, #0x10
10000d6a4: f1003ddf    	cmp	x14, #0xf
10000d6a8: 54fffbec    	b.gt	0x10000d624 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x294>
10000d6ac: d10021ad    	sub	x13, x13, #0x8
10000d6b0: cb0d01ee    	sub	x14, x15, x13
10000d6b4: f10021df    	cmp	x14, #0x8
10000d6b8: 5400046a    	b.ge	0x10000d744 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3b4>
10000d6bc: f10011df    	cmp	x14, #0x4
10000d6c0: 5400068a    	b.ge	0x10000d790 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x400>
10000d6c4: 1400003d    	b	0x10000d7b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x428>
10000d6c8: d280000d    	mov	x13, #0x0               ; =0
10000d6cc: d2800010    	mov	x16, #0x0               ; =0
10000d6d0: d280000c    	mov	x12, #0x0               ; =0
10000d6d4: d2800002    	mov	x2, #0x0                ; =0
10000d6d8: aa0803ee    	mov	x14, x8
10000d6dc: aa0b03e3    	mov	x3, x11
10000d6e0: b4000d2b    	cbz	x11, 0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f4>
10000d6e4: eb0f01df    	cmp	x14, x15
10000d6e8: 540013a0    	b.eq	0x10000d95c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5cc>
10000d6ec: 394001d1    	ldrb	w17, [x14]
10000d6f0: 321b0231    	orr	w17, w17, #0x20
10000d6f4: 7101963f    	cmp	w17, #0x65
10000d6f8: 54001321    	b.ne	0x10000d95c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5cc>
10000d6fc: 910005c0    	add	x0, x14, #0x1
10000d700: eb0f001f    	cmp	x0, x15
10000d704: 54000f80    	b.eq	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x564>
10000d708: 39400011    	ldrb	w17, [x0]
10000d70c: 910009c4    	add	x4, x14, #0x2
10000d710: 7100ae3f    	cmp	w17, #0x2b
10000d714: 9a800080    	csel	x0, x4, x0, eq
10000d718: 7100b63f    	cmp	w17, #0x2d
10000d71c: 52800031    	mov	w17, #0x1               ; =1
10000d720: 1a9113f1    	csel	w17, wzr, w17, ne
10000d724: 9a841000    	csel	x0, x0, x4, ne
10000d728: eb0f001f    	cmp	x0, x15
10000d72c: 54000ea1    	b.ne	0x10000d900 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x570>
10000d730: 1400008b    	b	0x10000d95c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5cc>
10000d734: aa0c03ed    	mov	x13, x12
10000d738: cb0c01ee    	sub	x14, x15, x12
10000d73c: f10021df    	cmp	x14, #0x8
10000d740: 54fffbeb    	b.lt	0x10000d6bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x32c>
10000d744: f94001ae    	ldr	x14, [x13]
10000d748: 8b1601d0    	add	x16, x14, x22
10000d74c: 8b1501ce    	add	x14, x14, x21
10000d750: aa0e0210    	orr	x16, x16, x14
10000d754: f201c21f    	tst	x16, #0x8080808080808080
10000d758: 540001c1    	b.ne	0x10000d790 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x400>
10000d75c: 9b1e7f10    	mul	x16, x24, x30
10000d760: 9b1b7dc2    	mul	x2, x14, x27
10000d764: 8b4e204e    	add	x14, x2, x14, lsr #8
10000d768: 92001dc2    	and	x2, x14, #0xff000000ff
10000d76c: 9b197c42    	mul	x2, x2, x25
10000d770: d350fdce    	lsr	x14, x14, #16
10000d774: 92001dce    	and	x14, x14, #0xff000000ff
10000d778: 9b1a09ce    	madd	x14, x14, x26, x2
10000d77c: 8b4e8218    	add	x24, x16, x14, lsr #32
10000d780: 910021ad    	add	x13, x13, #0x8
10000d784: cb0d01ee    	sub	x14, x15, x13
10000d788: f10011df    	cmp	x14, #0x4
10000d78c: 5400016b    	b.lt	0x10000d7b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x428>
10000d790: b94001ae    	ldr	w14, [x13]
10000d794: 5288c8d0    	mov	w16, #0x4646            ; =17990
10000d798: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000d79c: 0b1001d0    	add	w16, w14, w16
10000d7a0: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000d7a4: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000d7a8: 0b0201ce    	add	w14, w14, w2
10000d7ac: 2a0e0210    	orr	w16, w16, w14
10000d7b0: 7201c21f    	tst	w16, #0x80808080
10000d7b4: 54001ea0    	b.eq	0x10000db88 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7f8>
10000d7b8: eb0f01bf    	cmp	x13, x15
10000d7bc: 54001fe0    	b.eq	0x10000dbb8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x828>
10000d7c0: 39c001ae    	ldrsb	w14, [x13]
10000d7c4: 5100c1d0    	sub	w16, w14, #0x30
10000d7c8: 7100261f    	cmp	w16, #0x9
10000d7cc: 54000508    	b.hi	0x10000d86c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4dc>
10000d7d0: 12001dd0    	and	w16, w14, #0xff
10000d7d4: 910005ae    	add	x14, x13, #0x1
10000d7d8: 5100c210    	sub	w16, w16, #0x30
10000d7dc: 92401e10    	and	x16, x16, #0xff
10000d7e0: aa1803e2    	mov	x2, x24
10000d7e4: 8b020858    	add	x24, x2, x2, lsl #2
10000d7e8: 8b180618    	add	x24, x16, x24, lsl #1
10000d7ec: eb0f01df    	cmp	x14, x15
10000d7f0: 54000400    	b.eq	0x10000d870 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e0>
10000d7f4: 39c001d0    	ldrsb	w16, [x14]
10000d7f8: 5100c202    	sub	w2, w16, #0x30
10000d7fc: 7100245f    	cmp	w2, #0x9
10000d800: 54000388    	b.hi	0x10000d870 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e0>
10000d804: 12001e10    	and	w16, w16, #0xff
10000d808: 910009ae    	add	x14, x13, #0x2
10000d80c: 5100c210    	sub	w16, w16, #0x30
10000d810: 92401e10    	and	x16, x16, #0xff
10000d814: aa1803e2    	mov	x2, x24
10000d818: 8b020858    	add	x24, x2, x2, lsl #2
10000d81c: 8b180618    	add	x24, x16, x24, lsl #1
10000d820: eb0f01df    	cmp	x14, x15
10000d824: 54000260    	b.eq	0x10000d870 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e0>
10000d828: 39c001d0    	ldrsb	w16, [x14]
10000d82c: 5100c202    	sub	w2, w16, #0x30
10000d830: 7100245f    	cmp	w2, #0x9
10000d834: 540001e8    	b.hi	0x10000d870 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e0>
10000d838: 12001e10    	and	w16, w16, #0xff
10000d83c: 91000dae    	add	x14, x13, #0x3
10000d840: 5100c20d    	sub	w13, w16, #0x30
10000d844: 92401dad    	and	x13, x13, #0xff
10000d848: 8b180b10    	add	x16, x24, x24, lsl #2
10000d84c: 8b1005b0    	add	x16, x13, x16, lsl #1
10000d850: aa1003f8    	mov	x24, x16
10000d854: cb0c01cd    	sub	x13, x14, x12
10000d858: cb0e0190    	sub	x16, x12, x14
10000d85c: cb100163    	sub	x3, x11, x16
10000d860: aa0e03e2    	mov	x2, x14
10000d864: b5fff403    	cbnz	x3, 0x10000d6e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x354>
10000d868: 14000007    	b	0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f4>
10000d86c: aa0d03ee    	mov	x14, x13
10000d870: cb0c01cd    	sub	x13, x14, x12
10000d874: cb0e0190    	sub	x16, x12, x14
10000d878: cb100163    	sub	x3, x11, x16
10000d87c: aa0e03e2    	mov	x2, x14
10000d880: b5fff323    	cbnz	x3, 0x10000d6e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x354>
10000d884: 39400228    	ldrb	w8, [x17]
10000d888: 7100b51f    	cmp	w8, #0x2d
10000d88c: 1a9f17e9    	cset	w9, eq
10000d890: cb09000a    	sub	x10, x0, x9
10000d894: f1000d5f    	cmp	x10, #0x3
10000d898: 54ffddcb    	b.lt	0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d89c: 8b090229    	add	x9, x17, x9
10000d8a0: 3940092a    	ldrb	w10, [x9, #0x2]
10000d8a4: 79400129    	ldrh	w9, [x9]
10000d8a8: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d8ac: b203c129    	orr	x9, x9, #0x2020202020202020
10000d8b0: eb07013f    	cmp	x9, x7
10000d8b4: 54000160    	b.eq	0x10000d8e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x550>
10000d8b8: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d8bc: f28c2dca    	movk	x10, #0x616e
10000d8c0: f2a40dca    	movk	x10, #0x206e, lsl #16
10000d8c4: eb0a013f    	cmp	x9, x10
10000d8c8: 54ffdc41    	b.ne	0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d8cc: 7100b51f    	cmp	w8, #0x2d
10000d8d0: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000d8d4: 52800028    	mov	w8, #0x1                ; =1
10000d8d8: 3607dc01    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d8dc: 17fffee0    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d8e0: 7100b51f    	cmp	w8, #0x2d
10000d8e4: 1e690d41    	fcsel	d1, d10, d9, eq
10000d8e8: 52800028    	mov	w8, #0x1                ; =1
10000d8ec: 3607db61    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d8f0: 17fffedb    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d8f4: 52800011    	mov	w17, #0x0               ; =0
10000d8f8: eb0f001f    	cmp	x0, x15
10000d8fc: 54000300    	b.eq	0x10000d95c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5cc>
10000d900: 39c00004    	ldrsb	w4, [x0]
10000d904: 5100c084    	sub	w4, w4, #0x30
10000d908: 7100249f    	cmp	w4, #0x9
10000d90c: 54000288    	b.hi	0x10000d95c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5cc>
10000d910: d280000e    	mov	x14, #0x0               ; =0
10000d914: 14000004    	b	0x10000d924 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x594>
10000d918: 91000400    	add	x0, x0, #0x1
10000d91c: eb0f001f    	cmp	x0, x15
10000d920: 54000820    	b.eq	0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x694>
10000d924: 39c00004    	ldrsb	w4, [x0]
10000d928: 5100c085    	sub	w5, w4, #0x30
10000d92c: 710024bf    	cmp	w5, #0x9
10000d930: 540007a8    	b.hi	0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x694>
10000d934: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d938: eb0501df    	cmp	x14, x5
10000d93c: 54fffeec    	b.gt	0x10000d918 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x588>
10000d940: 12001c84    	and	w4, w4, #0xff
10000d944: 5100c084    	sub	w4, w4, #0x30
10000d948: 92401c84    	and	x4, x4, #0xff
10000d94c: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000d950: 8b050485    	add	x5, x4, x5, lsl #1
10000d954: aa0503ee    	mov	x14, x5
10000d958: 17fffff0    	b	0x10000d918 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x588>
10000d95c: d2800011    	mov	x17, #0x0               ; =0
10000d960: f100507f    	cmp	x3, #0x14
10000d964: 540006cb    	b.lt	0x10000da3c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6ac>
10000d968: eb0f015f    	cmp	x10, x15
10000d96c: 54000200    	b.eq	0x10000d9ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000d970: aa0a03e0    	mov	x0, x10
10000d974: 14000007    	b	0x10000d990 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x600>
10000d978: 7100c09f    	cmp	w4, #0x30
10000d97c: 1a9f17e4    	cset	w4, eq
10000d980: cb040063    	sub	x3, x3, x4
10000d984: 91000400    	add	x0, x0, #0x1
10000d988: eb0f001f    	cmp	x0, x15
10000d98c: 540000c0    	b.eq	0x10000d9a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x614>
10000d990: 39400004    	ldrb	w4, [x0]
10000d994: 7100c09f    	cmp	w4, #0x30
10000d998: 54ffff00    	b.eq	0x10000d978 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e8>
10000d99c: 7100b89f    	cmp	w4, #0x2e
10000d9a0: 54fffec0    	b.eq	0x10000d978 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e8>
10000d9a4: f100507f    	cmp	x3, #0x14
10000d9a8: 540004ab    	b.lt	0x10000da3c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6ac>
10000d9ac: eb08015f    	cmp	x10, x8
10000d9b0: 54000e20    	b.eq	0x10000db74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7e4>
10000d9b4: d2800018    	mov	x24, #0x0               ; =0
10000d9b8: aa0a03ef    	mov	x15, x10
10000d9bc: 388015f0    	ldrsb	x16, [x15], #0x1
10000d9c0: 9b1b4310    	madd	x16, x24, x27, x16
10000d9c4: d100c218    	sub	x24, x16, #0x30
10000d9c8: eb17031f    	cmp	x24, x23
10000d9cc: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000d9d0: 54ffff61    	b.ne	0x10000d9bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x62c>
10000d9d4: d10006f0    	sub	x16, x23, #0x1
10000d9d8: eb10031f    	cmp	x24, x16
10000d9dc: 54000168    	b.hi	0x10000da08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x678>
10000d9e0: aa0c03ef    	mov	x15, x12
10000d9e4: eb02019f    	cmp	x12, x2
10000d9e8: 540000e0    	b.eq	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x674>
10000d9ec: 388015e8    	ldrsb	x8, [x15], #0x1
10000d9f0: 9b1b2308    	madd	x8, x24, x27, x8
10000d9f4: d100c118    	sub	x24, x8, #0x30
10000d9f8: eb17031f    	cmp	x24, x23
10000d9fc: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000da00: 54ffff61    	b.ne	0x10000d9ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x65c>
10000da04: aa0c03e8    	mov	x8, x12
10000da08: cb0f0108    	sub	x8, x8, x15
10000da0c: 8b110110    	add	x16, x8, x17
10000da10: 390013ff    	strb	wzr, [sp, #0x4]
10000da14: b90003ff    	str	wzr, [sp]
10000da18: 5280002f    	mov	w15, #0x1               ; =1
10000da1c: b50003d8    	cbnz	x24, 0x10000da94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x704>
10000da20: 14000045    	b	0x10000db34 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a4>
10000da24: 7100023f    	cmp	w17, #0x0
10000da28: da8e05d1    	cneg	x17, x14, ne
10000da2c: 8b100230    	add	x16, x17, x16
10000da30: aa0003ee    	mov	x14, x0
10000da34: f100507f    	cmp	x3, #0x14
10000da38: 54fff98a    	b.ge	0x10000d968 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5d8>
10000da3c: 390013ff    	strb	wzr, [sp, #0x4]
10000da40: b90003ff    	str	wzr, [sp]
10000da44: b50001f0    	cbnz	x16, 0x10000da80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000da48: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000da4c: eb08031f    	cmp	x24, x8
10000da50: 54000188    	b.hi	0x10000da80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000da54: 9e630301    	ucvtf	d1, x24
10000da58: 1e614022    	fneg	d2, d1
10000da5c: 7100b79f    	cmp	w28, #0x2d
10000da60: 1e610c41    	fcsel	d1, d2, d1, eq
10000da64: 1e680da2    	fcsel	d2, d13, d8, eq
10000da68: f100031f    	cmp	x24, #0x0
10000da6c: 1e621c21    	fcsel	d1, d1, d2, ne
10000da70: 52800028    	mov	w8, #0x1                ; =1
10000da74: 2a0803e8    	mov	w8, w8
10000da78: 3607cf01    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000da7c: 17fffe78    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000da80: d1005e08    	sub	x8, x16, #0x17
10000da84: b100b51f    	cmn	x8, #0x2d
10000da88: 54000162    	b.hs	0x10000dab4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x724>
10000da8c: 5280000f    	mov	w15, #0x0               ; =0
10000da90: b4000538    	cbz	x24, 0x10000db34 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a4>
10000da94: b1055a1f    	cmn	x16, #0x156
10000da98: 540004eb    	b.lt	0x10000db34 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a4>
10000da9c: f104d21f    	cmp	x16, #0x134
10000daa0: 5400012d    	b.le	0x10000dac4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x734>
10000daa4: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000daa8: d2800008    	mov	x8, #0x0                ; =0
10000daac: 350004af    	cbnz	w15, 0x10000db40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b0>
10000dab0: 140000d3    	b	0x10000ddfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000dab4: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000dab8: eb08031f    	cmp	x24, x8
10000dabc: 54000a69    	b.ls	0x10000dc08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x878>
10000dac0: 5280000f    	mov	w15, #0x0               ; =0
10000dac4: dac01300    	clz	x0, x24
10000dac8: 9ac02302    	lsl	x2, x24, x0
10000dacc: 531f7a03    	lsl	w3, w16, #1
10000dad0: 110ab068    	add	w8, w3, #0x2ac
10000dad4: d0000185    	adrp	x5, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dad8: 911d60a5    	add	x5, x5, #0x758
10000dadc: f86858b1    	ldr	x17, [x5, w8, uxtw #3]
10000dae0: 9b027e28    	mul	x8, x17, x2
10000dae4: 9bc27e31    	umulh	x17, x17, x2
10000dae8: 2a3103e4    	mvn	w4, w17
10000daec: f240209f    	tst	x4, #0x1ff
10000daf0: 540000c1    	b.ne	0x10000db08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x778>
10000daf4: 110ab463    	add	w3, w3, #0x2ad
10000daf8: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000dafc: 9bc27c62    	umulh	x2, x3, x2
10000db00: ab080048    	adds	x8, x2, x8
10000db04: 9a913631    	cinc	x17, x17, hs
10000db08: d37ffe24    	lsr	x4, x17, #63
10000db0c: 91002483    	add	x3, x4, #0x9
10000db10: 9ac32622    	lsr	x2, x17, x3
10000db14: 1b067e05    	mul	w5, w16, w6
10000db18: 4b000080    	sub	w0, w4, w0
10000db1c: 0b854000    	add	w0, w0, w5, asr #16
10000db20: 1100fc00    	add	w0, w0, #0x3f
10000db24: 310ffc1f    	cmn	w0, #0x3ff
10000db28: 5400088c    	b.gt	0x10000dc38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8a8>
10000db2c: 3110f41f    	cmn	w0, #0x43d
10000db30: 540010c2    	b.hs	0x10000dd48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9b8>
10000db34: 52800011    	mov	w17, #0x0               ; =0
10000db38: d2800008    	mov	x8, #0x0                ; =0
10000db3c: 3400160f    	cbz	w15, 0x10000ddfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000db40: 52800002    	mov	w2, #0x0                ; =0
10000db44: d2800000    	mov	x0, #0x0                ; =0
10000db48: b1000704    	adds	x4, x24, #0x1
10000db4c: 54001502    	b.hs	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa5c>
10000db50: b1055a1f    	cmn	x16, #0x156
10000db54: 540014cb    	b.lt	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa5c>
10000db58: f104d21f    	cmp	x16, #0x134
10000db5c: 54000a6d    	b.le	0x10000dca8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x918>
10000db60: d2800000    	mov	x0, #0x0                ; =0
10000db64: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000db68: eb00011f    	cmp	x8, x0
10000db6c: 54001440    	b.eq	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa64>
10000db70: 140000c7    	b	0x10000de8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xafc>
10000db74: d2800018    	mov	x24, #0x0               ; =0
10000db78: aa0c03ef    	mov	x15, x12
10000db7c: eb02019f    	cmp	x12, x2
10000db80: 54fff361    	b.ne	0x10000d9ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x65c>
10000db84: 17ffffa0    	b	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x674>
10000db88: 1b1b7dd0    	mul	w16, w14, w27
10000db8c: 0b4e220e    	add	w14, w16, w14, lsr #8
10000db90: 12009dce    	and	w14, w14, #0xff00ff
10000db94: 52800030    	mov	w16, #0x1               ; =1
10000db98: 72a00c90    	movk	w16, #0x64, lsl #16
10000db9c: 1b107dce    	mul	w14, w14, w16
10000dba0: 53107dce    	lsr	w14, w14, #16
10000dba4: 5284e210    	mov	w16, #0x2710            ; =10000
10000dba8: 9b103b18    	madd	x24, x24, x16, x14
10000dbac: 910011ad    	add	x13, x13, #0x4
10000dbb0: eb0f01bf    	cmp	x13, x15
10000dbb4: 54ffe061    	b.ne	0x10000d7c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x430>
10000dbb8: aa0d03ee    	mov	x14, x13
10000dbbc: cb0c01ad    	sub	x13, x13, x12
10000dbc0: cb0e0190    	sub	x16, x12, x14
10000dbc4: cb100163    	sub	x3, x11, x16
10000dbc8: aa0e03e2    	mov	x2, x14
10000dbcc: b5ffd8c3    	cbnz	x3, 0x10000d6e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x354>
10000dbd0: 17ffff2d    	b	0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4f4>
10000dbd4: 9b1e7f0e    	mul	x14, x24, x30
10000dbd8: 9b1b7e02    	mul	x2, x16, x27
10000dbdc: 8b502050    	add	x16, x2, x16, lsr #8
10000dbe0: 92001e02    	and	x2, x16, #0xff000000ff
10000dbe4: 9b197c42    	mul	x2, x2, x25
10000dbe8: d350fe10    	lsr	x16, x16, #16
10000dbec: 92001e10    	and	x16, x16, #0xff000000ff
10000dbf0: 9b1a0a10    	madd	x16, x16, x26, x2
10000dbf4: 8b5081d8    	add	x24, x14, x16, lsr #32
10000dbf8: cb0d01ee    	sub	x14, x15, x13
10000dbfc: f10021df    	cmp	x14, #0x8
10000dc00: 54ffd5eb    	b.lt	0x10000d6bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x32c>
10000dc04: 17fffed0    	b	0x10000d744 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3b4>
10000dc08: 9e630301    	ucvtf	d1, x24
10000dc0c: d0000188    	adrp	x8, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dc10: 9119c108    	add	x8, x8, #0x670
10000dc14: b7f81130    	tbnz	x16, #0x3f, 0x10000de38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaa8>
10000dc18: fc707902    	ldr	d2, [x8, x16, lsl #3]
10000dc1c: 1e610841    	fmul	d1, d2, d1
10000dc20: 1e614022    	fneg	d2, d1
10000dc24: 7100b79f    	cmp	w28, #0x2d
10000dc28: 1e610c41    	fcsel	d1, d2, d1, eq
10000dc2c: 52800028    	mov	w8, #0x1                ; =1
10000dc30: 3607c141    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dc34: 17fffe0a    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dc38: 92400444    	and	x4, x2, #0x3
10000dc3c: 9ac32043    	lsl	x3, x2, x3
10000dc40: eb11007f    	cmp	x3, x17
10000dc44: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000dc48: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000dc4c: 91001208    	add	x8, x16, #0x4
10000dc50: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000dc54: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000dc58: 9a823108    	csel	x8, x8, x2, lo
10000dc5c: 92400111    	and	x17, x8, #0x1
10000dc60: 8b080222    	add	x2, x17, x8
10000dc64: ca080223    	eor	x3, x17, x8
10000dc68: 8a080228    	and	x8, x17, x8
10000dc6c: 8b430508    	add	x8, x8, x3, lsr #1
10000dc70: d376fc51    	lsr	x17, x2, #54
10000dc74: f100023f    	cmp	x17, #0x0
10000dc78: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000dc7c: 1a820442    	cinc	w2, w2, ne
10000dc80: 0b000040    	add	w0, w2, w0
10000dc84: 711ffc1f    	cmp	w0, #0x7ff
10000dc88: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000dc8c: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000dc90: 8a110108    	and	x8, x8, x17
10000dc94: 9a9f0108    	csel	x8, x8, xzr, eq
10000dc98: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000dc9c: 1ad16c11    	umin	w17, w0, w17
10000dca0: 36000aef    	tbz	w15, #0x0, 0x10000ddfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000dca4: 17ffffa7    	b	0x10000db40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b0>
10000dca8: dac01083    	clz	x3, x4
10000dcac: 9ac32084    	lsl	x4, x4, x3
10000dcb0: 531f7a05    	lsl	w5, w16, #1
10000dcb4: 110ab0a0    	add	w0, w5, #0x2ac
10000dcb8: d0000187    	adrp	x7, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dcbc: 911d60e7    	add	x7, x7, #0x758
10000dcc0: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000dcc4: 9b047c40    	mul	x0, x2, x4
10000dcc8: 9bc47c42    	umulh	x2, x2, x4
10000dccc: 2a2203e6    	mvn	w6, w2
10000dcd0: f24020df    	tst	x6, #0x1ff
10000dcd4: 540000c1    	b.ne	0x10000dcec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x95c>
10000dcd8: 110ab4a5    	add	w5, w5, #0x2ad
10000dcdc: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000dce0: 9bc47ca4    	umulh	x4, x5, x4
10000dce4: ab000080    	adds	x0, x4, x0
10000dce8: 9a823442    	cinc	x2, x2, hs
10000dcec: d37ffc46    	lsr	x6, x2, #63
10000dcf0: 910024c5    	add	x5, x6, #0x9
10000dcf4: 9ac52444    	lsr	x4, x2, x5
10000dcf8: 528a4d47    	mov	w7, #0x526a             ; =21098
10000dcfc: 72a00067    	movk	w7, #0x3, lsl #16
10000dd00: 1b077e07    	mul	w7, w16, w7
10000dd04: 4b0300c3    	sub	w3, w6, w3
10000dd08: 0b874063    	add	w3, w3, w7, asr #16
10000dd0c: 1100fc63    	add	w3, w3, #0x3f
10000dd10: 310ffc7f    	cmn	w3, #0x3ff
10000dd14: 540002ec    	b.gt	0x10000dd70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9e0>
10000dd18: 3110f47f    	cmn	w3, #0x43d
10000dd1c: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dd20: f28dcd27    	movk	x7, #0x6e69
10000dd24: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dd28: 540009a2    	b.hs	0x10000de5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xacc>
10000dd2c: d2800000    	mov	x0, #0x0                ; =0
10000dd30: 52800002    	mov	w2, #0x0                ; =0
10000dd34: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dd38: 72a00066    	movk	w6, #0x3, lsl #16
10000dd3c: eb00011f    	cmp	x8, x0
10000dd40: 540005a0    	b.eq	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa64>
10000dd44: 14000052    	b	0x10000de8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xafc>
10000dd48: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000dd4c: 4b000108    	sub	w8, w8, w0
10000dd50: 9ac82448    	lsr	x8, x2, x8
10000dd54: 92400111    	and	x17, x8, #0x1
10000dd58: 8b080231    	add	x17, x17, x8
10000dd5c: d341fe28    	lsr	x8, x17, #1
10000dd60: f24b0e3f    	tst	x17, #0x1e0000000000000
10000dd64: 1a9f07f1    	cset	w17, ne
10000dd68: 3707eecf    	tbnz	w15, #0x0, 0x10000db40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b0>
10000dd6c: 14000024    	b	0x10000ddfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000dd70: 92400486    	and	x6, x4, #0x3
10000dd74: 9ac52085    	lsl	x5, x4, x5
10000dd78: eb0200bf    	cmp	x5, x2
10000dd7c: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000dd80: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000dd84: 91001200    	add	x0, x16, #0x4
10000dd88: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000dd8c: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000dd90: 9a843000    	csel	x0, x0, x4, lo
10000dd94: 92400002    	and	x2, x0, #0x1
10000dd98: 8b000044    	add	x4, x2, x0
10000dd9c: ca000045    	eor	x5, x2, x0
10000dda0: 8a000040    	and	x0, x2, x0
10000dda4: 8b450400    	add	x0, x0, x5, lsr #1
10000dda8: d376fc82    	lsr	x2, x4, #54
10000ddac: f100005f    	cmp	x2, #0x0
10000ddb0: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000ddb4: 1a840484    	cinc	w4, w4, ne
10000ddb8: 0b030083    	add	w3, w4, w3
10000ddbc: 711ffc7f    	cmp	w3, #0x7ff
10000ddc0: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000ddc4: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000ddc8: 8a020000    	and	x0, x0, x2
10000ddcc: 9a9f0000    	csel	x0, x0, xzr, eq
10000ddd0: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000ddd4: 1ac26c62    	umin	w2, w3, w2
10000ddd8: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dddc: 72a00066    	movk	w6, #0x3, lsl #16
10000dde0: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dde4: f28dcd27    	movk	x7, #0x6e69
10000dde8: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000ddec: eb00011f    	cmp	x8, x0
10000ddf0: 540004e1    	b.ne	0x10000de8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xafc>
10000ddf4: 6b02023f    	cmp	w17, w2
10000ddf8: 540004a1    	b.ne	0x10000de8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xafc>
10000ddfc: 2a1103e2    	mov	w2, w17
10000de00: 7100b79f    	cmp	w28, #0x2d
10000de04: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000de08: 9a9f0129    	csel	x9, x9, xzr, eq
10000de0c: aa02d129    	orr	x9, x9, x2, lsl #52
10000de10: aa080129    	orr	x9, x9, x8
10000de14: 9e670121    	fmov	d1, x9
10000de18: f100011f    	cmp	x8, #0x0
10000de1c: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000de20: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000de24: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000de28: 7a480044    	ccmp	w2, w8, #0x4, eq
10000de2c: 1a9f07e8    	cset	w8, ne
10000de30: 3607b141    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000de34: 17fffd8a    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000de38: cb100d08    	sub	x8, x8, x16, lsl #3
10000de3c: fd400102    	ldr	d2, [x8]
10000de40: 1e621821    	fdiv	d1, d1, d2
10000de44: 1e614022    	fneg	d2, d1
10000de48: 7100b79f    	cmp	w28, #0x2d
10000de4c: 1e610c41    	fcsel	d1, d2, d1, eq
10000de50: 52800028    	mov	w8, #0x1                ; =1
10000de54: 3607b021    	tbz	w1, #0x0, 0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000de58: 17fffd81    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000de5c: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000de60: 4b030000    	sub	w0, w0, w3
10000de64: 9ac02480    	lsr	x0, x4, x0
10000de68: 92400002    	and	x2, x0, #0x1
10000de6c: 8b000042    	add	x2, x2, x0
10000de70: d341fc40    	lsr	x0, x2, #1
10000de74: f24b0c5f    	tst	x2, #0x1e0000000000000
10000de78: 1a9f07e2    	cset	w2, ne
10000de7c: 528a4d46    	mov	w6, #0x526a             ; =21098
10000de80: 72a00066    	movk	w6, #0x3, lsl #16
10000de84: eb00011f    	cmp	x8, x0
10000de88: 54fffb60    	b.eq	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa64>
10000de8c: dac01311    	clz	x17, x24
10000de90: 9ad12300    	lsl	x0, x24, x17
10000de94: 531f7a02    	lsl	w2, w16, #1
10000de98: 110ab048    	add	w8, w2, #0x2ac
10000de9c: d0000183    	adrp	x3, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dea0: 911d6063    	add	x3, x3, #0x758
10000dea4: f868d863    	ldr	x3, [x3, w8, sxtw #3]
10000dea8: 9bc07c68    	umulh	x8, x3, x0
10000deac: 2a2803e4    	mvn	w4, w8
10000deb0: f240209f    	tst	x4, #0x1ff
10000deb4: 54000121    	b.ne	0x10000ded8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb48>
10000deb8: 9b007c63    	mul	x3, x3, x0
10000debc: 110ab442    	add	w2, w2, #0x2ad
10000dec0: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dec4: 911d6084    	add	x4, x4, #0x758
10000dec8: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000decc: 9bc07c40    	umulh	x0, x2, x0
10000ded0: ab03001f    	cmn	x0, x3
10000ded4: 9a883508    	cinc	x8, x8, hs
10000ded8: d37ffd00    	lsr	x0, x8, #63
10000dedc: 52000000    	eor	w0, w0, #0x1
10000dee0: 9ac02108    	lsl	x8, x8, x0
10000dee4: 1b067e02    	mul	w2, w16, w6
10000dee8: 13107c42    	asr	w2, w2, #16
10000deec: 4b110051    	sub	w17, w2, w17
10000def0: 4b000231    	sub	w17, w17, w0
10000def4: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000def8: 2b000222    	adds	w2, w17, w0
10000defc: 54fff825    	b.pl	0x10000de00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000df00: a900e3f0    	stp	x16, x24, [sp, #0x8]
10000df04: f9000fee    	str	x14, [sp, #0x18]
10000df08: 390083e9    	strb	w9, [sp, #0x20]
10000df0c: 52800029    	mov	w9, #0x1                ; =1
10000df10: 390087e9    	strb	w9, [sp, #0x21]
10000df14: 39008bef    	strb	w15, [sp, #0x22]
10000df18: b94003e9    	ldr	w9, [sp]
10000df1c: 910023ee    	add	x14, sp, #0x8
10000df20: b801b1c9    	stur	w9, [x14, #0x1b]
10000df24: 394013e9    	ldrb	w9, [sp, #0x4]
10000df28: 3801f1c9    	sturb	w9, [x14, #0x1f]
10000df2c: a902afea    	stp	x10, x11, [sp, #0x28]
10000df30: a903b7ec    	stp	x12, x13, [sp, #0x38]
10000df34: f90027ff    	str	xzr, [sp, #0x48]
10000df38: 910023e0    	add	x0, sp, #0x8
10000df3c: aa1903fa    	mov	x26, x25
10000df40: aa0103f9    	mov	x25, x1
10000df44: aa0803e1    	mov	x1, x8
10000df48: 52800023    	mov	w3, #0x1                ; =1
10000df4c: 4ea01c0e    	mov.16b	v14, v0
10000df50: aa0703f5    	mov	x21, x7
10000df54: 94001512    	bl	0x10001339c <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000df58: aa1503e7    	mov	x7, x21
10000df5c: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000df60: f299fa15    	movk	x21, #0xcfd0
10000df64: 528a4d46    	mov	w6, #0x526a             ; =21098
10000df68: 72a00066    	movk	w6, #0x3, lsl #16
10000df6c: 529c201e    	mov	w30, #0xe100            ; =57600
10000df70: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000df74: 4eae1dc0    	mov.16b	v0, v14
10000df78: aa0003e8    	mov	x8, x0
10000df7c: aa0103e2    	mov	x2, x1
10000df80: aa1903e1    	mov	x1, x25
10000df84: aa1a03f9    	mov	x25, x26
10000df88: d280003a    	mov	x26, #0x1               ; =1
10000df8c: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000df90: 17ffff9c    	b	0x10000de00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000df94: 6f00e400    	movi.2d	v0, #0000000000000000
10000df98: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000df9c: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000dfa0: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000dfa4: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000dfa8: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000dfac: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000dfb0: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000dfb4: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000dfb8: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000dfbc: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000dfc0: 9103c3ff    	add	sp, sp, #0xf0
10000dfc4: d65f03c0    	ret
10000dfc8: 52800200    	mov	w0, #0x10               ; =16
10000dfcc: 9400b477    	bl	0x10003b1a8 <_strtod_l+0x10003b1a8>
10000dfd0: aa0003f3    	mov	x19, x0
10000dfd4: b00001e1    	adrp	x1, 0x10004a000 <GCC_except_table247+0x188>
10000dfd8: 912b3421    	add	x1, x1, #0xacd
10000dfdc: 9400b3f2    	bl	0x10003afa4 <_strtod_l+0x10003afa4>
10000dfe0: aa1303e0    	mov	x0, x19
10000dfe4: 9400b39d    	bl	0x10003ae58 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000dfe8: aa0003f4    	mov	x20, x0
10000dfec: aa1303e0    	mov	x0, x19
10000dff0: 9400b47d    	bl	0x10003b1e4 <_strtod_l+0x10003b1e4>
10000dff4: aa1403e0    	mov	x0, x20
10000dff8: 9400b3b8    	bl	0x10003aed8 <_strtod_l+0x10003aed8>
