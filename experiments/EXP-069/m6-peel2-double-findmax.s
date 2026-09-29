
/Users/oly/redislabs/ffc-agent-workspace/simple_fastfloat_benchmark/build/m6-peel2/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d47c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d47c: d103c3ff    	sub	sp, sp, #0xf0
10000d480: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000d484: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000d488: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000d48c: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000d490: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000d494: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000d498: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000d49c: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000d4a0: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000d4a4: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000d4a8: 910383fd    	add	x29, sp, #0xe0
10000d4ac: a9405013    	ldp	x19, x20, [x0]
10000d4b0: eb14027f    	cmp	x19, x20
10000d4b4: 54006140    	b.eq	0x10000e0dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc60>
10000d4b8: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000d4bc: f299fa15    	movk	x21, #0xcfd0
10000d4c0: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000d4c4: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000d4c8: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d4cc: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d4d0: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d4d4: d2800c99    	mov	x25, #0x64              ; =100
10000d4d8: f2c84819    	movk	x25, #0x4240, lsl #32
10000d4dc: f2e001f9    	movk	x25, #0xf, lsl #48
10000d4e0: d280003a    	mov	x26, #0x1               ; =1
10000d4e4: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000d4e8: 529c201e    	mov	w30, #0xe100            ; =57600
10000d4ec: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000d4f0: 528a4d46    	mov	w6, #0x526a             ; =21098
10000d4f4: 72a00066    	movk	w6, #0x3, lsl #16
10000d4f8: 6f00e408    	movi.2d	v8, #0000000000000000
10000d4fc: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000d500: f28dcd27    	movk	x7, #0x6e69
10000d504: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000d508: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d50c: 9e670109    	fmov	d9, x8
10000d510: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d514: 9e67010a    	fmov	d10, x8
10000d518: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d51c: 9e67010b    	fmov	d11, x8
10000d520: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d524: 9e67010c    	fmov	d12, x8
10000d528: 5280015b    	mov	w27, #0xa               ; =10
10000d52c: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d530: 9e67010d    	fmov	d13, x8
10000d534: 6f00e400    	movi.2d	v0, #0000000000000000
10000d538: 14000009    	b	0x10000d55c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d53c: 52800008    	mov	w8, #0x0                ; =0
10000d540: 37000041    	tbnz	w1, #0x0, 0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d544: 36005e68    	tbz	w8, #0x0, 0x10000e110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc94>
10000d548: 1e612000    	fcmp	d0, d1
10000d54c: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d550: 91006273    	add	x19, x19, #0x18
10000d554: eb14027f    	cmp	x19, x20
10000d558: 54005c40    	b.eq	0x10000e0e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc64>
10000d55c: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d560: b7f800a0    	tbnz	x0, #0x3f, 0x10000d574 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf8>
10000d564: aa1303f1    	mov	x17, x19
10000d568: 6f00e401    	movi.2d	v1, #0000000000000000
10000d56c: b50000a0    	cbnz	x0, 0x10000d580 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x104>
10000d570: 17fffff3    	b	0x10000d53c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d574: a9400271    	ldp	x17, x0, [x19]
10000d578: 6f00e401    	movi.2d	v1, #0000000000000000
10000d57c: b4fffe00    	cbz	x0, 0x10000d53c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d580: 3940023c    	ldrb	w28, [x17]
10000d584: aa1c03eb    	mov	x11, x28
10000d588: aa1103e9    	mov	x9, x17
10000d58c: 7100b79f    	cmp	w28, #0x2d
10000d590: 1a9f17ea    	cset	w10, eq
10000d594: 54000161    	b.ne	0x10000d5c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d598: f100041f    	cmp	x0, #0x1
10000d59c: 54001b60    	b.eq	0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d5a0: aa1103e9    	mov	x9, x17
10000d5a4: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000d5a8: 12001d0b    	and	w11, w8, #0xff
10000d5ac: 7100b91f    	cmp	w8, #0x2e
10000d5b0: 54000080    	b.eq	0x10000d5c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d5b4: 5100c108    	sub	w8, w8, #0x30
10000d5b8: 7100251f    	cmp	w8, #0x9
10000d5bc: 54001a68    	b.hi	0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d5c0: 8b00022f    	add	x15, x17, x0
10000d5c4: eb0f013f    	cmp	x9, x15
10000d5c8: 540008c0    	b.eq	0x10000d6e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d5cc: 13001d68    	sxtb	w8, w11
10000d5d0: 5100c108    	sub	w8, w8, #0x30
10000d5d4: 7100251f    	cmp	w8, #0x9
10000d5d8: 54000848    	b.hi	0x10000d6e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d5dc: 91000528    	add	x8, x9, #0x1
10000d5e0: 93401d6b    	sxtb	x11, w11
10000d5e4: d100c178    	sub	x24, x11, #0x30
10000d5e8: eb0f011f    	cmp	x8, x15
10000d5ec: 540007e0    	b.eq	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d5f0: 39c0010b    	ldrsb	w11, [x8]
10000d5f4: 5100c16c    	sub	w12, w11, #0x30
10000d5f8: 7100259f    	cmp	w12, #0x9
10000d5fc: 54000768    	b.hi	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d600: 93407d6b    	sxtw	x11, w11
10000d604: 91000928    	add	x8, x9, #0x2
10000d608: d100c16b    	sub	x11, x11, #0x30
10000d60c: aa1803ec    	mov	x12, x24
10000d610: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d614: 8b180578    	add	x24, x11, x24, lsl #1
10000d618: eb0f011f    	cmp	x8, x15
10000d61c: 54000660    	b.eq	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d620: 39c0010b    	ldrsb	w11, [x8]
10000d624: 5100c16c    	sub	w12, w11, #0x30
10000d628: 7100259f    	cmp	w12, #0x9
10000d62c: 540005e8    	b.hi	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d630: 93407d6b    	sxtw	x11, w11
10000d634: 91000d28    	add	x8, x9, #0x3
10000d638: d100c16b    	sub	x11, x11, #0x30
10000d63c: aa1803ec    	mov	x12, x24
10000d640: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d644: 8b180578    	add	x24, x11, x24, lsl #1
10000d648: eb0f011f    	cmp	x8, x15
10000d64c: 540004e0    	b.eq	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d650: 39c0010b    	ldrsb	w11, [x8]
10000d654: 5100c16c    	sub	w12, w11, #0x30
10000d658: 7100259f    	cmp	w12, #0x9
10000d65c: 54000468    	b.hi	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d660: 93407d6b    	sxtw	x11, w11
10000d664: 91001128    	add	x8, x9, #0x4
10000d668: d100c16b    	sub	x11, x11, #0x30
10000d66c: aa1803ec    	mov	x12, x24
10000d670: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d674: 8b180578    	add	x24, x11, x24, lsl #1
10000d678: eb0f011f    	cmp	x8, x15
10000d67c: 54000360    	b.eq	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d680: 39c0010b    	ldrsb	w11, [x8]
10000d684: 5100c16c    	sub	w12, w11, #0x30
10000d688: 7100259f    	cmp	w12, #0x9
10000d68c: 540002e8    	b.hi	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d690: 93407d6b    	sxtw	x11, w11
10000d694: 91001528    	add	x8, x9, #0x5
10000d698: d100c16c    	sub	x12, x11, #0x30
10000d69c: 8b180b0b    	add	x11, x24, x24, lsl #2
10000d6a0: 8b0b058b    	add	x11, x12, x11, lsl #1
10000d6a4: eb0f011f    	cmp	x8, x15
10000d6a8: 54001a80    	b.eq	0x10000d9f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000d6ac: 39c0010c    	ldrsb	w12, [x8]
10000d6b0: 5100c18d    	sub	w13, w12, #0x30
10000d6b4: 710025bf    	cmp	w13, #0x9
10000d6b8: 54001a08    	b.hi	0x10000d9f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000d6bc: 93407d8c    	sxtw	x12, w12
10000d6c0: d100c18c    	sub	x12, x12, #0x30
10000d6c4: 8b0b0978    	add	x24, x11, x11, lsl #2
10000d6c8: 8b180598    	add	x24, x12, x24, lsl #1
10000d6cc: 91000508    	add	x8, x8, #0x1
10000d6d0: aa1803eb    	mov	x11, x24
10000d6d4: eb0f011f    	cmp	x8, x15
10000d6d8: 54fffea1    	b.ne	0x10000d6ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x230>
10000d6dc: 14000003    	b	0x10000d6e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d6e0: d2800018    	mov	x24, #0x0               ; =0
10000d6e4: aa0903e8    	mov	x8, x9
10000d6e8: cb09010b    	sub	x11, x8, x9
10000d6ec: eb0f011f    	cmp	x8, x15
10000d6f0: 540018c0    	b.eq	0x10000da08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000d6f4: 3940010c    	ldrb	w12, [x8]
10000d6f8: 7100b99f    	cmp	w12, #0x2e
10000d6fc: 54001861    	b.ne	0x10000da08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000d700: 9100050c    	add	x12, x8, #0x1
10000d704: cb0c01ed    	sub	x13, x15, x12
10000d708: f10041bf    	cmp	x13, #0x10
10000d70c: 5400056b    	b.lt	0x10000d7b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x33c>
10000d710: 9100250e    	add	x14, x8, #0x9
10000d714: f85f81d0    	ldur	x16, [x14, #-0x8]
10000d718: 8b160202    	add	x2, x16, x22
10000d71c: 8b150210    	add	x16, x16, x21
10000d720: aa100042    	orr	x2, x2, x16
10000d724: f201c05f    	tst	x2, #0x8080808080808080
10000d728: 540003a1    	b.ne	0x10000d79c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x320>
10000d72c: f94001c2    	ldr	x2, [x14]
10000d730: 8b160043    	add	x3, x2, x22
10000d734: 8b150042    	add	x2, x2, x21
10000d738: aa020063    	orr	x3, x3, x2
10000d73c: f201c07f    	tst	x3, #0x8080808080808080
10000d740: 54001421    	b.ne	0x10000d9c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x548>
10000d744: 9b1b7e03    	mul	x3, x16, x27
10000d748: 8b502070    	add	x16, x3, x16, lsr #8
10000d74c: 92001e03    	and	x3, x16, #0xff000000ff
10000d750: 9b197c63    	mul	x3, x3, x25
10000d754: d350fe10    	lsr	x16, x16, #16
10000d758: 92001e10    	and	x16, x16, #0xff000000ff
10000d75c: 9b1a0e10    	madd	x16, x16, x26, x3
10000d760: 9b1b7c43    	mul	x3, x2, x27
10000d764: 8b422062    	add	x2, x3, x2, lsr #8
10000d768: 92001c43    	and	x3, x2, #0xff000000ff
10000d76c: 9b197c63    	mul	x3, x3, x25
10000d770: d350fc42    	lsr	x2, x2, #16
10000d774: 92001c42    	and	x2, x2, #0xff000000ff
10000d778: 9b1a0c42    	madd	x2, x2, x26, x3
10000d77c: 9b1e7f03    	mul	x3, x24, x30
10000d780: 8b508070    	add	x16, x3, x16, lsr #32
10000d784: 9b1e7e10    	mul	x16, x16, x30
10000d788: 8b428218    	add	x24, x16, x2, lsr #32
10000d78c: 910041ce    	add	x14, x14, #0x10
10000d790: d10041ad    	sub	x13, x13, #0x10
10000d794: f1003dbf    	cmp	x13, #0xf
10000d798: 54fffbec    	b.gt	0x10000d714 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x298>
10000d79c: d10021ce    	sub	x14, x14, #0x8
10000d7a0: cb0e01ed    	sub	x13, x15, x14
10000d7a4: f10021bf    	cmp	x13, #0x8
10000d7a8: 5400010a    	b.ge	0x10000d7c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d7ac: f10011bf    	cmp	x13, #0x4
10000d7b0: 5400032a    	b.ge	0x10000d814 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d7b4: 14000022    	b	0x10000d83c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d7b8: aa0c03ee    	mov	x14, x12
10000d7bc: cb0c01ed    	sub	x13, x15, x12
10000d7c0: f10021bf    	cmp	x13, #0x8
10000d7c4: 54ffff4b    	b.lt	0x10000d7ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d7c8: f94001cd    	ldr	x13, [x14]
10000d7cc: 8b1601b0    	add	x16, x13, x22
10000d7d0: 8b1501ad    	add	x13, x13, x21
10000d7d4: aa0d0210    	orr	x16, x16, x13
10000d7d8: f201c21f    	tst	x16, #0x8080808080808080
10000d7dc: 540001c1    	b.ne	0x10000d814 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d7e0: 9b1e7f10    	mul	x16, x24, x30
10000d7e4: 9b1b7da2    	mul	x2, x13, x27
10000d7e8: 8b4d204d    	add	x13, x2, x13, lsr #8
10000d7ec: 92001da2    	and	x2, x13, #0xff000000ff
10000d7f0: 9b197c42    	mul	x2, x2, x25
10000d7f4: d350fdad    	lsr	x13, x13, #16
10000d7f8: 92001dad    	and	x13, x13, #0xff000000ff
10000d7fc: 9b1a09ad    	madd	x13, x13, x26, x2
10000d800: 8b4d8218    	add	x24, x16, x13, lsr #32
10000d804: 910021ce    	add	x14, x14, #0x8
10000d808: cb0e01ed    	sub	x13, x15, x14
10000d80c: f10011bf    	cmp	x13, #0x4
10000d810: 5400016b    	b.lt	0x10000d83c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d814: b94001cd    	ldr	w13, [x14]
10000d818: 5288c8d0    	mov	w16, #0x4646            ; =17990
10000d81c: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000d820: 0b1001b0    	add	w16, w13, w16
10000d824: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000d828: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000d82c: 0b0201ad    	add	w13, w13, w2
10000d830: 2a0d0210    	orr	w16, w16, w13
10000d834: 7201c21f    	tst	w16, #0x80808080
10000d838: 54000a00    	b.eq	0x10000d978 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000d83c: eb0f01df    	cmp	x14, x15
10000d840: 54000b40    	b.eq	0x10000d9a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x52c>
10000d844: 39c001cd    	ldrsb	w13, [x14]
10000d848: 5100c1b0    	sub	w16, w13, #0x30
10000d84c: 7100261f    	cmp	w16, #0x9
10000d850: 54000508    	b.hi	0x10000d8f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d854: 12001db0    	and	w16, w13, #0xff
10000d858: 910005cd    	add	x13, x14, #0x1
10000d85c: 5100c210    	sub	w16, w16, #0x30
10000d860: 92401e10    	and	x16, x16, #0xff
10000d864: aa1803e2    	mov	x2, x24
10000d868: 8b020858    	add	x24, x2, x2, lsl #2
10000d86c: 8b180618    	add	x24, x16, x24, lsl #1
10000d870: eb0f01bf    	cmp	x13, x15
10000d874: 54000400    	b.eq	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d878: 39c001b0    	ldrsb	w16, [x13]
10000d87c: 5100c202    	sub	w2, w16, #0x30
10000d880: 7100245f    	cmp	w2, #0x9
10000d884: 54000388    	b.hi	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d888: 12001e10    	and	w16, w16, #0xff
10000d88c: 910009cd    	add	x13, x14, #0x2
10000d890: 5100c210    	sub	w16, w16, #0x30
10000d894: 92401e10    	and	x16, x16, #0xff
10000d898: aa1803e2    	mov	x2, x24
10000d89c: 8b020858    	add	x24, x2, x2, lsl #2
10000d8a0: 8b180618    	add	x24, x16, x24, lsl #1
10000d8a4: eb0f01bf    	cmp	x13, x15
10000d8a8: 54000260    	b.eq	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d8ac: 39c001b0    	ldrsb	w16, [x13]
10000d8b0: 5100c202    	sub	w2, w16, #0x30
10000d8b4: 7100245f    	cmp	w2, #0x9
10000d8b8: 540001e8    	b.hi	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d8bc: 12001e10    	and	w16, w16, #0xff
10000d8c0: 91000dcd    	add	x13, x14, #0x3
10000d8c4: 5100c20e    	sub	w14, w16, #0x30
10000d8c8: 92401dce    	and	x14, x14, #0xff
10000d8cc: 8b180b10    	add	x16, x24, x24, lsl #2
10000d8d0: 8b1005d0    	add	x16, x14, x16, lsl #1
10000d8d4: aa1003f8    	mov	x24, x16
10000d8d8: cb0c01ae    	sub	x14, x13, x12
10000d8dc: cb0d0190    	sub	x16, x12, x13
10000d8e0: cb100163    	sub	x3, x11, x16
10000d8e4: aa0d03e2    	mov	x2, x13
10000d8e8: b50009e3    	cbnz	x3, 0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d8ec: 14000007    	b	0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d8f0: aa0e03ed    	mov	x13, x14
10000d8f4: cb0c01ae    	sub	x14, x13, x12
10000d8f8: cb0d0190    	sub	x16, x12, x13
10000d8fc: cb100163    	sub	x3, x11, x16
10000d900: aa0d03e2    	mov	x2, x13
10000d904: b5000903    	cbnz	x3, 0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d908: 39400228    	ldrb	w8, [x17]
10000d90c: 7100b51f    	cmp	w8, #0x2d
10000d910: 1a9f17e9    	cset	w9, eq
10000d914: cb09000a    	sub	x10, x0, x9
10000d918: f1000d5f    	cmp	x10, #0x3
10000d91c: 54ffe10b    	b.lt	0x10000d53c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d920: 8b090229    	add	x9, x17, x9
10000d924: 3940092a    	ldrb	w10, [x9, #0x2]
10000d928: 79400129    	ldrh	w9, [x9]
10000d92c: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d930: b203c129    	orr	x9, x9, #0x2020202020202020
10000d934: eb07013f    	cmp	x9, x7
10000d938: 54000160    	b.eq	0x10000d964 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e8>
10000d93c: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d940: f28c2dca    	movk	x10, #0x616e
10000d944: f2a40dca    	movk	x10, #0x206e, lsl #16
10000d948: eb0a013f    	cmp	x9, x10
10000d94c: 54ffdf81    	b.ne	0x10000d53c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d950: 7100b51f    	cmp	w8, #0x2d
10000d954: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000d958: 52800028    	mov	w8, #0x1                ; =1
10000d95c: 3607df41    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d960: 17fffefa    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d964: 7100b51f    	cmp	w8, #0x2d
10000d968: 1e690d41    	fcsel	d1, d10, d9, eq
10000d96c: 52800028    	mov	w8, #0x1                ; =1
10000d970: 3607dea1    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d974: 17fffef5    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d978: 1b1b7db0    	mul	w16, w13, w27
10000d97c: 0b4d220d    	add	w13, w16, w13, lsr #8
10000d980: 12009dad    	and	w13, w13, #0xff00ff
10000d984: 52800030    	mov	w16, #0x1               ; =1
10000d988: 72a00c90    	movk	w16, #0x64, lsl #16
10000d98c: 1b107dad    	mul	w13, w13, w16
10000d990: 53107dad    	lsr	w13, w13, #16
10000d994: 5284e210    	mov	w16, #0x2710            ; =10000
10000d998: 9b103718    	madd	x24, x24, x16, x13
10000d99c: 910011ce    	add	x14, x14, #0x4
10000d9a0: eb0f01df    	cmp	x14, x15
10000d9a4: 54fff501    	b.ne	0x10000d844 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c8>
10000d9a8: aa0e03ed    	mov	x13, x14
10000d9ac: cb0c01ce    	sub	x14, x14, x12
10000d9b0: cb0d0190    	sub	x16, x12, x13
10000d9b4: cb100163    	sub	x3, x11, x16
10000d9b8: aa0d03e2    	mov	x2, x13
10000d9bc: b5000343    	cbnz	x3, 0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d9c0: 17ffffd2    	b	0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d9c4: 9b1e7f0d    	mul	x13, x24, x30
10000d9c8: 9b1b7e02    	mul	x2, x16, x27
10000d9cc: 8b502050    	add	x16, x2, x16, lsr #8
10000d9d0: 92001e02    	and	x2, x16, #0xff000000ff
10000d9d4: 9b197c42    	mul	x2, x2, x25
10000d9d8: d350fe10    	lsr	x16, x16, #16
10000d9dc: 92001e10    	and	x16, x16, #0xff000000ff
10000d9e0: 9b1a0a10    	madd	x16, x16, x26, x2
10000d9e4: 8b5081b8    	add	x24, x13, x16, lsr #32
10000d9e8: cb0e01ed    	sub	x13, x15, x14
10000d9ec: f10021bf    	cmp	x13, #0x8
10000d9f0: 54ffedeb    	b.lt	0x10000d7ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d9f4: 17ffff75    	b	0x10000d7c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d9f8: aa0b03f8    	mov	x24, x11
10000d9fc: cb09010b    	sub	x11, x8, x9
10000da00: eb0f011f    	cmp	x8, x15
10000da04: 54ffe781    	b.ne	0x10000d6f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x278>
10000da08: d280000e    	mov	x14, #0x0               ; =0
10000da0c: d2800010    	mov	x16, #0x0               ; =0
10000da10: d280000c    	mov	x12, #0x0               ; =0
10000da14: d2800002    	mov	x2, #0x0                ; =0
10000da18: aa0803ed    	mov	x13, x8
10000da1c: aa0b03e3    	mov	x3, x11
10000da20: b4fff74b    	cbz	x11, 0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000da24: eb0f01bf    	cmp	x13, x15
10000da28: 54000820    	b.eq	0x10000db2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000da2c: 394001b1    	ldrb	w17, [x13]
10000da30: 321b0231    	orr	w17, w17, #0x20
10000da34: 7101963f    	cmp	w17, #0x65
10000da38: 540007a1    	b.ne	0x10000db2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000da3c: 910005a4    	add	x4, x13, #0x1
10000da40: eb0f009f    	cmp	x4, x15
10000da44: 54000180    	b.eq	0x10000da74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f8>
10000da48: 39400091    	ldrb	w17, [x4]
10000da4c: 910009a0    	add	x0, x13, #0x2
10000da50: 7100ae3f    	cmp	w17, #0x2b
10000da54: 9a840004    	csel	x4, x0, x4, eq
10000da58: 7100b63f    	cmp	w17, #0x2d
10000da5c: 52800031    	mov	w17, #0x1               ; =1
10000da60: 1a9113f1    	csel	w17, wzr, w17, ne
10000da64: 9a801084    	csel	x4, x4, x0, ne
10000da68: eb0f009f    	cmp	x4, x15
10000da6c: 540000a1    	b.ne	0x10000da80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x604>
10000da70: 1400002f    	b	0x10000db2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000da74: 52800011    	mov	w17, #0x0               ; =0
10000da78: eb0f009f    	cmp	x4, x15
10000da7c: 54000580    	b.eq	0x10000db2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000da80: 39c00080    	ldrsb	w0, [x4]
10000da84: 5100c005    	sub	w5, w0, #0x30
10000da88: 710024bf    	cmp	w5, #0x9
10000da8c: 54000508    	b.hi	0x10000db2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000da90: 12001c00    	and	w0, w0, #0xff
10000da94: 9100048d    	add	x13, x4, #0x1
10000da98: 5100c000    	sub	w0, w0, #0x30
10000da9c: 92401c00    	and	x0, x0, #0xff
10000daa0: eb0f01bf    	cmp	x13, x15
10000daa4: 54000240    	b.eq	0x10000daec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x670>
10000daa8: 39c001ad    	ldrsb	w13, [x13]
10000daac: 12001da5    	and	w5, w13, #0xff
10000dab0: 5100c1ad    	sub	w13, w13, #0x30
10000dab4: 9bbb7c06    	umull	x6, w0, w27
10000dab8: 91000887    	add	x7, x4, #0x2
10000dabc: 5100c0a5    	sub	w5, w5, #0x30
10000dac0: 8b2500c5    	add	x5, x6, w5, uxtb
10000dac4: 710025bf    	cmp	w13, #0x9
10000dac8: 9a8494ed    	csinc	x13, x7, x4, ls
10000dacc: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dad0: f28dcd27    	movk	x7, #0x6e69
10000dad4: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dad8: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dadc: 72a00066    	movk	w6, #0x3, lsl #16
10000dae0: 9a858000    	csel	x0, x0, x5, hi
10000dae4: 14000002    	b	0x10000daec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x670>
10000dae8: 910005ad    	add	x13, x13, #0x1
10000daec: eb0f01bf    	cmp	x13, x15
10000daf0: 54000820    	b.eq	0x10000dbf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x778>
10000daf4: 39c001a4    	ldrsb	w4, [x13]
10000daf8: 5100c085    	sub	w5, w4, #0x30
10000dafc: 710024bf    	cmp	w5, #0x9
10000db00: 540007a8    	b.hi	0x10000dbf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x778>
10000db04: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000db08: eb05001f    	cmp	x0, x5
10000db0c: 54fffeec    	b.gt	0x10000dae8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000db10: 12001c84    	and	w4, w4, #0xff
10000db14: 5100c084    	sub	w4, w4, #0x30
10000db18: 92401c84    	and	x4, x4, #0xff
10000db1c: 8b000805    	add	x5, x0, x0, lsl #2
10000db20: 8b050485    	add	x5, x4, x5, lsl #1
10000db24: aa0503e0    	mov	x0, x5
10000db28: 17fffff0    	b	0x10000dae8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000db2c: d2800011    	mov	x17, #0x0               ; =0
10000db30: f100507f    	cmp	x3, #0x14
10000db34: 540006ab    	b.lt	0x10000dc08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000db38: eb0f013f    	cmp	x9, x15
10000db3c: 54000200    	b.eq	0x10000db7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x700>
10000db40: aa0903e0    	mov	x0, x9
10000db44: 14000007    	b	0x10000db60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6e4>
10000db48: 7100c09f    	cmp	w4, #0x30
10000db4c: 1a9f17e4    	cset	w4, eq
10000db50: cb040063    	sub	x3, x3, x4
10000db54: 91000400    	add	x0, x0, #0x1
10000db58: eb0f001f    	cmp	x0, x15
10000db5c: 540000c0    	b.eq	0x10000db74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f8>
10000db60: 39400004    	ldrb	w4, [x0]
10000db64: 7100c09f    	cmp	w4, #0x30
10000db68: 54ffff00    	b.eq	0x10000db48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6cc>
10000db6c: 7100b89f    	cmp	w4, #0x2e
10000db70: 54fffec0    	b.eq	0x10000db48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6cc>
10000db74: f100507f    	cmp	x3, #0x14
10000db78: 5400048b    	b.lt	0x10000dc08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000db7c: eb08013f    	cmp	x9, x8
10000db80: 54000e00    	b.eq	0x10000dd40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8c4>
10000db84: d2800018    	mov	x24, #0x0               ; =0
10000db88: aa0903ef    	mov	x15, x9
10000db8c: 388015f0    	ldrsb	x16, [x15], #0x1
10000db90: 9b1b4310    	madd	x16, x24, x27, x16
10000db94: d100c218    	sub	x24, x16, #0x30
10000db98: eb17031f    	cmp	x24, x23
10000db9c: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000dba0: 54ffff61    	b.ne	0x10000db8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x710>
10000dba4: d10006f0    	sub	x16, x23, #0x1
10000dba8: eb10031f    	cmp	x24, x16
10000dbac: 54000168    	b.hi	0x10000dbd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x75c>
10000dbb0: aa0c03ef    	mov	x15, x12
10000dbb4: eb02019f    	cmp	x12, x2
10000dbb8: 540000e0    	b.eq	0x10000dbd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x758>
10000dbbc: 388015e8    	ldrsb	x8, [x15], #0x1
10000dbc0: 9b1b2308    	madd	x8, x24, x27, x8
10000dbc4: d100c118    	sub	x24, x8, #0x30
10000dbc8: eb17031f    	cmp	x24, x23
10000dbcc: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000dbd0: 54ffff61    	b.ne	0x10000dbbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000dbd4: aa0c03e8    	mov	x8, x12
10000dbd8: cb0f0108    	sub	x8, x8, x15
10000dbdc: 8b110110    	add	x16, x8, x17
10000dbe0: 390013ff    	strb	wzr, [sp, #0x4]
10000dbe4: b90003ff    	str	wzr, [sp]
10000dbe8: 5280002f    	mov	w15, #0x1               ; =1
10000dbec: b50003b8    	cbnz	x24, 0x10000dc60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7e4>
10000dbf0: 14000044    	b	0x10000dd00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x884>
10000dbf4: 7100023f    	cmp	w17, #0x0
10000dbf8: da800411    	cneg	x17, x0, ne
10000dbfc: 8b100230    	add	x16, x17, x16
10000dc00: f100507f    	cmp	x3, #0x14
10000dc04: 54fff9aa    	b.ge	0x10000db38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6bc>
10000dc08: 390013ff    	strb	wzr, [sp, #0x4]
10000dc0c: b90003ff    	str	wzr, [sp]
10000dc10: b50001f0    	cbnz	x16, 0x10000dc4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7d0>
10000dc14: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000dc18: eb08031f    	cmp	x24, x8
10000dc1c: 54000188    	b.hi	0x10000dc4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7d0>
10000dc20: 9e630301    	ucvtf	d1, x24
10000dc24: 1e614022    	fneg	d2, d1
10000dc28: 7100b79f    	cmp	w28, #0x2d
10000dc2c: 1e610c41    	fcsel	d1, d2, d1, eq
10000dc30: 1e680da2    	fcsel	d2, d13, d8, eq
10000dc34: f100031f    	cmp	x24, #0x0
10000dc38: 1e621c21    	fcsel	d1, d1, d2, ne
10000dc3c: 52800028    	mov	w8, #0x1                ; =1
10000dc40: 2a0803e8    	mov	w8, w8
10000dc44: 3607c801    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dc48: 17fffe40    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dc4c: d1005e08    	sub	x8, x16, #0x17
10000dc50: b100b51f    	cmn	x8, #0x2d
10000dc54: 54000162    	b.hs	0x10000dc80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x804>
10000dc58: 5280000f    	mov	w15, #0x0               ; =0
10000dc5c: b4000538    	cbz	x24, 0x10000dd00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x884>
10000dc60: b1055a1f    	cmn	x16, #0x156
10000dc64: 540004eb    	b.lt	0x10000dd00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x884>
10000dc68: f104d21f    	cmp	x16, #0x134
10000dc6c: 5400012d    	b.le	0x10000dc90 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x814>
10000dc70: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000dc74: d2800008    	mov	x8, #0x0                ; =0
10000dc78: 350004af    	cbnz	w15, 0x10000dd0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x890>
10000dc7c: 140000b3    	b	0x10000df48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xacc>
10000dc80: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000dc84: eb08031f    	cmp	x24, x8
10000dc88: 54000669    	b.ls	0x10000dd54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8d8>
10000dc8c: 5280000f    	mov	w15, #0x0               ; =0
10000dc90: dac01300    	clz	x0, x24
10000dc94: 9ac02302    	lsl	x2, x24, x0
10000dc98: 531f7a03    	lsl	w3, w16, #1
10000dc9c: 110ab068    	add	w8, w3, #0x2ac
10000dca0: d0000185    	adrp	x5, 0x10003f000 <__ZL5Lhint+0xe60>
10000dca4: 9122a0a5    	add	x5, x5, #0x8a8
10000dca8: f86858b1    	ldr	x17, [x5, w8, uxtw #3]
10000dcac: 9b027e28    	mul	x8, x17, x2
10000dcb0: 9bc27e31    	umulh	x17, x17, x2
10000dcb4: 2a3103e4    	mvn	w4, w17
10000dcb8: f240209f    	tst	x4, #0x1ff
10000dcbc: 540000c1    	b.ne	0x10000dcd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x858>
10000dcc0: 110ab463    	add	w3, w3, #0x2ad
10000dcc4: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000dcc8: 9bc27c62    	umulh	x2, x3, x2
10000dccc: ab080048    	adds	x8, x2, x8
10000dcd0: 9a913631    	cinc	x17, x17, hs
10000dcd4: d37ffe24    	lsr	x4, x17, #63
10000dcd8: 91002483    	add	x3, x4, #0x9
10000dcdc: 9ac32622    	lsr	x2, x17, x3
10000dce0: 1b067e05    	mul	w5, w16, w6
10000dce4: 4b000080    	sub	w0, w4, w0
10000dce8: 0b854000    	add	w0, w0, w5, asr #16
10000dcec: 1100fc00    	add	w0, w0, #0x3f
10000dcf0: 310ffc1f    	cmn	w0, #0x3ff
10000dcf4: 5400048c    	b.gt	0x10000dd84 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x908>
10000dcf8: 3110f41f    	cmn	w0, #0x43d
10000dcfc: 54000cc2    	b.hs	0x10000de94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa18>
10000dd00: 52800011    	mov	w17, #0x0               ; =0
10000dd04: d2800008    	mov	x8, #0x0                ; =0
10000dd08: 3400120f    	cbz	w15, 0x10000df48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xacc>
10000dd0c: 52800002    	mov	w2, #0x0                ; =0
10000dd10: d2800000    	mov	x0, #0x0                ; =0
10000dd14: b1000704    	adds	x4, x24, #0x1
10000dd18: 54001102    	b.hs	0x10000df38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xabc>
10000dd1c: b1055a1f    	cmn	x16, #0x156
10000dd20: 540010cb    	b.lt	0x10000df38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xabc>
10000dd24: f104d21f    	cmp	x16, #0x134
10000dd28: 5400066d    	b.le	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x978>
10000dd2c: d2800000    	mov	x0, #0x0                ; =0
10000dd30: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000dd34: eb00011f    	cmp	x8, x0
10000dd38: 54001040    	b.eq	0x10000df40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xac4>
10000dd3c: 140000a7    	b	0x10000dfd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000dd40: d2800018    	mov	x24, #0x0               ; =0
10000dd44: aa0c03ef    	mov	x15, x12
10000dd48: eb02019f    	cmp	x12, x2
10000dd4c: 54fff381    	b.ne	0x10000dbbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000dd50: 17ffffa1    	b	0x10000dbd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x758>
10000dd54: 9e630301    	ucvtf	d1, x24
10000dd58: d0000188    	adrp	x8, 0x10003f000 <__ZL5Lhint+0xe60>
10000dd5c: 911f0108    	add	x8, x8, #0x7c0
10000dd60: b7f81130    	tbnz	x16, #0x3f, 0x10000df84 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb08>
10000dd64: fc707902    	ldr	d2, [x8, x16, lsl #3]
10000dd68: 1e610841    	fmul	d1, d2, d1
10000dd6c: 1e614022    	fneg	d2, d1
10000dd70: 7100b79f    	cmp	w28, #0x2d
10000dd74: 1e610c41    	fcsel	d1, d2, d1, eq
10000dd78: 52800028    	mov	w8, #0x1                ; =1
10000dd7c: 3607be41    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dd80: 17fffdf2    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dd84: 92400444    	and	x4, x2, #0x3
10000dd88: 9ac32043    	lsl	x3, x2, x3
10000dd8c: eb11007f    	cmp	x3, x17
10000dd90: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000dd94: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000dd98: 91001208    	add	x8, x16, #0x4
10000dd9c: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000dda0: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000dda4: 9a823108    	csel	x8, x8, x2, lo
10000dda8: 92400111    	and	x17, x8, #0x1
10000ddac: 8b080222    	add	x2, x17, x8
10000ddb0: ca080223    	eor	x3, x17, x8
10000ddb4: 8a080228    	and	x8, x17, x8
10000ddb8: 8b430508    	add	x8, x8, x3, lsr #1
10000ddbc: d376fc51    	lsr	x17, x2, #54
10000ddc0: f100023f    	cmp	x17, #0x0
10000ddc4: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000ddc8: 1a820442    	cinc	w2, w2, ne
10000ddcc: 0b000040    	add	w0, w2, w0
10000ddd0: 711ffc1f    	cmp	w0, #0x7ff
10000ddd4: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000ddd8: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000dddc: 8a110108    	and	x8, x8, x17
10000dde0: 9a9f0108    	csel	x8, x8, xzr, eq
10000dde4: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000dde8: 1ad16c11    	umin	w17, w0, w17
10000ddec: 36000aef    	tbz	w15, #0x0, 0x10000df48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xacc>
10000ddf0: 17ffffc7    	b	0x10000dd0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x890>
10000ddf4: dac01083    	clz	x3, x4
10000ddf8: 9ac32084    	lsl	x4, x4, x3
10000ddfc: 531f7a05    	lsl	w5, w16, #1
10000de00: 110ab0a0    	add	w0, w5, #0x2ac
10000de04: d0000187    	adrp	x7, 0x10003f000 <__ZL5Lhint+0xe60>
10000de08: 9122a0e7    	add	x7, x7, #0x8a8
10000de0c: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000de10: 9b047c40    	mul	x0, x2, x4
10000de14: 9bc47c42    	umulh	x2, x2, x4
10000de18: 2a2203e6    	mvn	w6, w2
10000de1c: f24020df    	tst	x6, #0x1ff
10000de20: 540000c1    	b.ne	0x10000de38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9bc>
10000de24: 110ab4a5    	add	w5, w5, #0x2ad
10000de28: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000de2c: 9bc47ca4    	umulh	x4, x5, x4
10000de30: ab000080    	adds	x0, x4, x0
10000de34: 9a823442    	cinc	x2, x2, hs
10000de38: d37ffc46    	lsr	x6, x2, #63
10000de3c: 910024c5    	add	x5, x6, #0x9
10000de40: 9ac52444    	lsr	x4, x2, x5
10000de44: 528a4d47    	mov	w7, #0x526a             ; =21098
10000de48: 72a00067    	movk	w7, #0x3, lsl #16
10000de4c: 1b077e07    	mul	w7, w16, w7
10000de50: 4b0300c3    	sub	w3, w6, w3
10000de54: 0b874063    	add	w3, w3, w7, asr #16
10000de58: 1100fc63    	add	w3, w3, #0x3f
10000de5c: 310ffc7f    	cmn	w3, #0x3ff
10000de60: 540002ec    	b.gt	0x10000debc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa40>
10000de64: 3110f47f    	cmn	w3, #0x43d
10000de68: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000de6c: f28dcd27    	movk	x7, #0x6e69
10000de70: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000de74: 540009a2    	b.hs	0x10000dfa8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb2c>
10000de78: d2800000    	mov	x0, #0x0                ; =0
10000de7c: 52800002    	mov	w2, #0x0                ; =0
10000de80: 528a4d46    	mov	w6, #0x526a             ; =21098
10000de84: 72a00066    	movk	w6, #0x3, lsl #16
10000de88: eb00011f    	cmp	x8, x0
10000de8c: 540005a0    	b.eq	0x10000df40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xac4>
10000de90: 14000052    	b	0x10000dfd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000de94: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000de98: 4b000108    	sub	w8, w8, w0
10000de9c: 9ac82448    	lsr	x8, x2, x8
10000dea0: 92400111    	and	x17, x8, #0x1
10000dea4: 8b080231    	add	x17, x17, x8
10000dea8: d341fe28    	lsr	x8, x17, #1
10000deac: f24b0e3f    	tst	x17, #0x1e0000000000000
10000deb0: 1a9f07f1    	cset	w17, ne
10000deb4: 3707f2cf    	tbnz	w15, #0x0, 0x10000dd0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x890>
10000deb8: 14000024    	b	0x10000df48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xacc>
10000debc: 92400486    	and	x6, x4, #0x3
10000dec0: 9ac52085    	lsl	x5, x4, x5
10000dec4: eb0200bf    	cmp	x5, x2
10000dec8: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000decc: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000ded0: 91001200    	add	x0, x16, #0x4
10000ded4: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000ded8: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000dedc: 9a843000    	csel	x0, x0, x4, lo
10000dee0: 92400002    	and	x2, x0, #0x1
10000dee4: 8b000044    	add	x4, x2, x0
10000dee8: ca000045    	eor	x5, x2, x0
10000deec: 8a000040    	and	x0, x2, x0
10000def0: 8b450400    	add	x0, x0, x5, lsr #1
10000def4: d376fc82    	lsr	x2, x4, #54
10000def8: f100005f    	cmp	x2, #0x0
10000defc: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000df00: 1a840484    	cinc	w4, w4, ne
10000df04: 0b030083    	add	w3, w4, w3
10000df08: 711ffc7f    	cmp	w3, #0x7ff
10000df0c: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000df10: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000df14: 8a020000    	and	x0, x0, x2
10000df18: 9a9f0000    	csel	x0, x0, xzr, eq
10000df1c: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000df20: 1ac26c62    	umin	w2, w3, w2
10000df24: 528a4d46    	mov	w6, #0x526a             ; =21098
10000df28: 72a00066    	movk	w6, #0x3, lsl #16
10000df2c: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000df30: f28dcd27    	movk	x7, #0x6e69
10000df34: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000df38: eb00011f    	cmp	x8, x0
10000df3c: 540004e1    	b.ne	0x10000dfd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000df40: 6b02023f    	cmp	w17, w2
10000df44: 540004a1    	b.ne	0x10000dfd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000df48: 2a1103e2    	mov	w2, w17
10000df4c: 7100b79f    	cmp	w28, #0x2d
10000df50: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000df54: 9a9f0129    	csel	x9, x9, xzr, eq
10000df58: aa02d129    	orr	x9, x9, x2, lsl #52
10000df5c: aa080129    	orr	x9, x9, x8
10000df60: 9e670121    	fmov	d1, x9
10000df64: f100011f    	cmp	x8, #0x0
10000df68: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000df6c: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000df70: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000df74: 7a480044    	ccmp	w2, w8, #0x4, eq
10000df78: 1a9f07e8    	cset	w8, ne
10000df7c: 3607ae41    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000df80: 17fffd72    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000df84: cb100d08    	sub	x8, x8, x16, lsl #3
10000df88: fd400102    	ldr	d2, [x8]
10000df8c: 1e621821    	fdiv	d1, d1, d2
10000df90: 1e614022    	fneg	d2, d1
10000df94: 7100b79f    	cmp	w28, #0x2d
10000df98: 1e610c41    	fcsel	d1, d2, d1, eq
10000df9c: 52800028    	mov	w8, #0x1                ; =1
10000dfa0: 3607ad21    	tbz	w1, #0x0, 0x10000d544 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dfa4: 17fffd69    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dfa8: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000dfac: 4b030000    	sub	w0, w0, w3
10000dfb0: 9ac02480    	lsr	x0, x4, x0
10000dfb4: 92400002    	and	x2, x0, #0x1
10000dfb8: 8b000042    	add	x2, x2, x0
10000dfbc: d341fc40    	lsr	x0, x2, #1
10000dfc0: f24b0c5f    	tst	x2, #0x1e0000000000000
10000dfc4: 1a9f07e2    	cset	w2, ne
10000dfc8: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dfcc: 72a00066    	movk	w6, #0x3, lsl #16
10000dfd0: eb00011f    	cmp	x8, x0
10000dfd4: 54fffb60    	b.eq	0x10000df40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xac4>
10000dfd8: dac01311    	clz	x17, x24
10000dfdc: 9ad12300    	lsl	x0, x24, x17
10000dfe0: 531f7a02    	lsl	w2, w16, #1
10000dfe4: 110ab048    	add	w8, w2, #0x2ac
10000dfe8: d0000183    	adrp	x3, 0x10003f000 <__ZL5Lhint+0xe60>
10000dfec: 9122a063    	add	x3, x3, #0x8a8
10000dff0: f868d863    	ldr	x3, [x3, w8, sxtw #3]
10000dff4: 9bc07c68    	umulh	x8, x3, x0
10000dff8: 2a2803e4    	mvn	w4, w8
10000dffc: f240209f    	tst	x4, #0x1ff
10000e000: 54000121    	b.ne	0x10000e024 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xba8>
10000e004: 9b007c63    	mul	x3, x3, x0
10000e008: 110ab442    	add	w2, w2, #0x2ad
10000e00c: b0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xe60>
10000e010: 9122a084    	add	x4, x4, #0x8a8
10000e014: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000e018: 9bc07c40    	umulh	x0, x2, x0
10000e01c: ab03001f    	cmn	x0, x3
10000e020: 9a883508    	cinc	x8, x8, hs
10000e024: d37ffd00    	lsr	x0, x8, #63
10000e028: 52000000    	eor	w0, w0, #0x1
10000e02c: 9ac02108    	lsl	x8, x8, x0
10000e030: 1b067e02    	mul	w2, w16, w6
10000e034: 13107c42    	asr	w2, w2, #16
10000e038: 4b110051    	sub	w17, w2, w17
10000e03c: 4b000231    	sub	w17, w17, w0
10000e040: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000e044: 2b000222    	adds	w2, w17, w0
10000e048: 54fff825    	b.pl	0x10000df4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xad0>
10000e04c: a900e3f0    	stp	x16, x24, [sp, #0x8]
10000e050: f9000fed    	str	x13, [sp, #0x18]
10000e054: 390083ea    	strb	w10, [sp, #0x20]
10000e058: 5280002a    	mov	w10, #0x1               ; =1
10000e05c: 390087ea    	strb	w10, [sp, #0x21]
10000e060: 39008bef    	strb	w15, [sp, #0x22]
10000e064: b94003ea    	ldr	w10, [sp]
10000e068: 910023ed    	add	x13, sp, #0x8
10000e06c: b801b1aa    	stur	w10, [x13, #0x1b]
10000e070: 394013ea    	ldrb	w10, [sp, #0x4]
10000e074: 3801f1aa    	sturb	w10, [x13, #0x1f]
10000e078: a902afe9    	stp	x9, x11, [sp, #0x28]
10000e07c: a903bbec    	stp	x12, x14, [sp, #0x38]
10000e080: f90027ff    	str	xzr, [sp, #0x48]
10000e084: 910023e0    	add	x0, sp, #0x8
10000e088: aa1903fa    	mov	x26, x25
10000e08c: aa0103f9    	mov	x25, x1
10000e090: aa0803e1    	mov	x1, x8
10000e094: 52800023    	mov	w3, #0x1                ; =1
10000e098: 4ea01c0e    	mov.16b	v14, v0
10000e09c: 94001512    	bl	0x1000134e4 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000e0a0: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000e0a4: f28dcd27    	movk	x7, #0x6e69
10000e0a8: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000e0ac: 528a4d46    	mov	w6, #0x526a             ; =21098
10000e0b0: 72a00066    	movk	w6, #0x3, lsl #16
10000e0b4: 529c201e    	mov	w30, #0xe100            ; =57600
10000e0b8: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000e0bc: 4eae1dc0    	mov.16b	v0, v14
10000e0c0: aa0003e8    	mov	x8, x0
10000e0c4: aa0103e2    	mov	x2, x1
10000e0c8: aa1903e1    	mov	x1, x25
10000e0cc: aa1a03f9    	mov	x25, x26
10000e0d0: d280003a    	mov	x26, #0x1               ; =1
10000e0d4: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000e0d8: 17ffff9d    	b	0x10000df4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xad0>
10000e0dc: 6f00e400    	movi.2d	v0, #0000000000000000
10000e0e0: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000e0e4: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000e0e8: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000e0ec: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000e0f0: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000e0f4: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000e0f8: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000e0fc: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000e100: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000e104: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000e108: 9103c3ff    	add	sp, sp, #0xf0
10000e10c: d65f03c0    	ret
10000e110: 52800200    	mov	w0, #0x10               ; =16
10000e114: 9400b477    	bl	0x10003b2f0 <_strtod_l+0x10003b2f0>
10000e118: aa0003f3    	mov	x19, x0
10000e11c: 900001e1    	adrp	x1, 0x10004a000 <GCC_except_table247+0x38>
10000e120: 91307421    	add	x1, x1, #0xc1d
10000e124: 9400b3f2    	bl	0x10003b0ec <_strtod_l+0x10003b0ec>
10000e128: aa1303e0    	mov	x0, x19
10000e12c: 9400b39d    	bl	0x10003afa0 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000e130: aa0003f4    	mov	x20, x0
10000e134: aa1303e0    	mov	x0, x19
10000e138: 9400b47d    	bl	0x10003b32c <_strtod_l+0x10003b32c>
10000e13c: aa1403e0    	mov	x0, x20
10000e140: 9400b3b8    	bl	0x10003b020 <_strtod_l+0x10003b020>
