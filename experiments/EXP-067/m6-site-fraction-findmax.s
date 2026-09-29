
simple_fastfloat_benchmark/build/m6-site-fraction/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d388 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d388: d103c3ff    	sub	sp, sp, #0xf0
10000d38c: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000d390: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000d394: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000d398: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000d39c: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000d3a0: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000d3a4: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000d3a8: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000d3ac: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000d3b0: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000d3b4: 910383fd    	add	x29, sp, #0xe0
10000d3b8: a9405013    	ldp	x19, x20, [x0]
10000d3bc: eb14027f    	cmp	x19, x20
10000d3c0: 54005e40    	b.eq	0x10000df88 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc00>
10000d3c4: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000d3c8: f299fa15    	movk	x21, #0xcfd0
10000d3cc: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000d3d0: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000d3d4: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d3d8: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d3dc: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d3e0: d2800c99    	mov	x25, #0x64              ; =100
10000d3e4: f2c84819    	movk	x25, #0x4240, lsl #32
10000d3e8: f2e001f9    	movk	x25, #0xf, lsl #48
10000d3ec: d280003a    	mov	x26, #0x1               ; =1
10000d3f0: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000d3f4: 529c201e    	mov	w30, #0xe100            ; =57600
10000d3f8: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000d3fc: 528a4d46    	mov	w6, #0x526a             ; =21098
10000d400: 72a00066    	movk	w6, #0x3, lsl #16
10000d404: 6f00e408    	movi.2d	v8, #0000000000000000
10000d408: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000d40c: f28dcd27    	movk	x7, #0x6e69
10000d410: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000d414: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d418: 9e670109    	fmov	d9, x8
10000d41c: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d420: 9e67010a    	fmov	d10, x8
10000d424: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d428: 9e67010b    	fmov	d11, x8
10000d42c: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d430: 9e67010c    	fmov	d12, x8
10000d434: 5280015b    	mov	w27, #0xa               ; =10
10000d438: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d43c: 9e67010d    	fmov	d13, x8
10000d440: 6f00e400    	movi.2d	v0, #0000000000000000
10000d444: 14000009    	b	0x10000d468 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d448: 52800008    	mov	w8, #0x0                ; =0
10000d44c: 37000041    	tbnz	w1, #0x0, 0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d450: 36005b68    	tbz	w8, #0x0, 0x10000dfbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc34>
10000d454: 1e612000    	fcmp	d0, d1
10000d458: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d45c: 91006273    	add	x19, x19, #0x18
10000d460: eb14027f    	cmp	x19, x20
10000d464: 54005940    	b.eq	0x10000df8c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc04>
10000d468: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d46c: b7f800a0    	tbnz	x0, #0x3f, 0x10000d480 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf8>
10000d470: aa1303f1    	mov	x17, x19
10000d474: 6f00e401    	movi.2d	v1, #0000000000000000
10000d478: b50000a0    	cbnz	x0, 0x10000d48c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x104>
10000d47c: 17fffff3    	b	0x10000d448 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d480: a9400271    	ldp	x17, x0, [x19]
10000d484: 6f00e401    	movi.2d	v1, #0000000000000000
10000d488: b4fffe00    	cbz	x0, 0x10000d448 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d48c: 3940023c    	ldrb	w28, [x17]
10000d490: aa1c03eb    	mov	x11, x28
10000d494: aa1103e9    	mov	x9, x17
10000d498: 7100b79f    	cmp	w28, #0x2d
10000d49c: 1a9f17ea    	cset	w10, eq
10000d4a0: 54000161    	b.ne	0x10000d4cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d4a4: f100041f    	cmp	x0, #0x1
10000d4a8: 54001aa0    	b.eq	0x10000d7fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d4ac: aa1103e9    	mov	x9, x17
10000d4b0: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000d4b4: 12001d0b    	and	w11, w8, #0xff
10000d4b8: 7100b91f    	cmp	w8, #0x2e
10000d4bc: 54000080    	b.eq	0x10000d4cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d4c0: 5100c108    	sub	w8, w8, #0x30
10000d4c4: 7100251f    	cmp	w8, #0x9
10000d4c8: 540019a8    	b.hi	0x10000d7fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d4cc: 8b000230    	add	x16, x17, x0
10000d4d0: eb10013f    	cmp	x9, x16
10000d4d4: 540008c0    	b.eq	0x10000d5ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d4d8: 13001d68    	sxtb	w8, w11
10000d4dc: 5100c108    	sub	w8, w8, #0x30
10000d4e0: 7100251f    	cmp	w8, #0x9
10000d4e4: 54000848    	b.hi	0x10000d5ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d4e8: 91000528    	add	x8, x9, #0x1
10000d4ec: 93401d6b    	sxtb	x11, w11
10000d4f0: d100c178    	sub	x24, x11, #0x30
10000d4f4: eb10011f    	cmp	x8, x16
10000d4f8: 540007e0    	b.eq	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d4fc: 39c0010b    	ldrsb	w11, [x8]
10000d500: 5100c16c    	sub	w12, w11, #0x30
10000d504: 7100259f    	cmp	w12, #0x9
10000d508: 54000768    	b.hi	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d50c: 93407d6b    	sxtw	x11, w11
10000d510: 91000928    	add	x8, x9, #0x2
10000d514: d100c16b    	sub	x11, x11, #0x30
10000d518: aa1803ec    	mov	x12, x24
10000d51c: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d520: 8b180578    	add	x24, x11, x24, lsl #1
10000d524: eb10011f    	cmp	x8, x16
10000d528: 54000660    	b.eq	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d52c: 39c0010b    	ldrsb	w11, [x8]
10000d530: 5100c16c    	sub	w12, w11, #0x30
10000d534: 7100259f    	cmp	w12, #0x9
10000d538: 540005e8    	b.hi	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d53c: 93407d6b    	sxtw	x11, w11
10000d540: 91000d28    	add	x8, x9, #0x3
10000d544: d100c16b    	sub	x11, x11, #0x30
10000d548: aa1803ec    	mov	x12, x24
10000d54c: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d550: 8b180578    	add	x24, x11, x24, lsl #1
10000d554: eb10011f    	cmp	x8, x16
10000d558: 540004e0    	b.eq	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d55c: 39c0010b    	ldrsb	w11, [x8]
10000d560: 5100c16c    	sub	w12, w11, #0x30
10000d564: 7100259f    	cmp	w12, #0x9
10000d568: 54000468    	b.hi	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d56c: 93407d6b    	sxtw	x11, w11
10000d570: 91001128    	add	x8, x9, #0x4
10000d574: d100c16b    	sub	x11, x11, #0x30
10000d578: aa1803ec    	mov	x12, x24
10000d57c: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d580: 8b180578    	add	x24, x11, x24, lsl #1
10000d584: eb10011f    	cmp	x8, x16
10000d588: 54000360    	b.eq	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d58c: 39c0010b    	ldrsb	w11, [x8]
10000d590: 5100c16c    	sub	w12, w11, #0x30
10000d594: 7100259f    	cmp	w12, #0x9
10000d598: 540002e8    	b.hi	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d59c: 93407d6b    	sxtw	x11, w11
10000d5a0: 91001528    	add	x8, x9, #0x5
10000d5a4: d100c16c    	sub	x12, x11, #0x30
10000d5a8: 8b180b0b    	add	x11, x24, x24, lsl #2
10000d5ac: 8b0b058b    	add	x11, x12, x11, lsl #1
10000d5b0: eb10011f    	cmp	x8, x16
10000d5b4: 540019c0    	b.eq	0x10000d8ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x564>
10000d5b8: 39c0010c    	ldrsb	w12, [x8]
10000d5bc: 5100c18d    	sub	w13, w12, #0x30
10000d5c0: 710025bf    	cmp	w13, #0x9
10000d5c4: 54001948    	b.hi	0x10000d8ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x564>
10000d5c8: 93407d8c    	sxtw	x12, w12
10000d5cc: d100c18c    	sub	x12, x12, #0x30
10000d5d0: 8b0b0978    	add	x24, x11, x11, lsl #2
10000d5d4: 8b180598    	add	x24, x12, x24, lsl #1
10000d5d8: 91000508    	add	x8, x8, #0x1
10000d5dc: aa1803eb    	mov	x11, x24
10000d5e0: eb10011f    	cmp	x8, x16
10000d5e4: 54fffea1    	b.ne	0x10000d5b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x230>
10000d5e8: 14000003    	b	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d5ec: d2800018    	mov	x24, #0x0               ; =0
10000d5f0: aa0903e8    	mov	x8, x9
10000d5f4: cb09010b    	sub	x11, x8, x9
10000d5f8: eb10011f    	cmp	x8, x16
10000d5fc: 54001800    	b.eq	0x10000d8fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x574>
10000d600: 3940010c    	ldrb	w12, [x8]
10000d604: 7100b99f    	cmp	w12, #0x2e
10000d608: 540017a1    	b.ne	0x10000d8fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x574>
10000d60c: 9100050c    	add	x12, x8, #0x1
10000d610: cb0c020e    	sub	x14, x16, x12
10000d614: f10041df    	cmp	x14, #0x10
10000d618: 5400056b    	b.lt	0x10000d6c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x33c>
10000d61c: 9100250d    	add	x13, x8, #0x9
10000d620: f85f81af    	ldur	x15, [x13, #-0x8]
10000d624: 8b1601e2    	add	x2, x15, x22
10000d628: 8b1501ef    	add	x15, x15, x21
10000d62c: aa0f0042    	orr	x2, x2, x15
10000d630: f201c05f    	tst	x2, #0x8080808080808080
10000d634: 540003a1    	b.ne	0x10000d6a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x320>
10000d638: f94001a2    	ldr	x2, [x13]
10000d63c: 8b160043    	add	x3, x2, x22
10000d640: 8b150042    	add	x2, x2, x21
10000d644: aa020063    	orr	x3, x3, x2
10000d648: f201c07f    	tst	x3, #0x8080808080808080
10000d64c: 54001361    	b.ne	0x10000d8b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x530>
10000d650: 9b1b7de3    	mul	x3, x15, x27
10000d654: 8b4f206f    	add	x15, x3, x15, lsr #8
10000d658: 92001de3    	and	x3, x15, #0xff000000ff
10000d65c: 9b197c63    	mul	x3, x3, x25
10000d660: d350fdef    	lsr	x15, x15, #16
10000d664: 92001def    	and	x15, x15, #0xff000000ff
10000d668: 9b1a0def    	madd	x15, x15, x26, x3
10000d66c: 9b1b7c43    	mul	x3, x2, x27
10000d670: 8b422062    	add	x2, x3, x2, lsr #8
10000d674: 92001c43    	and	x3, x2, #0xff000000ff
10000d678: 9b197c63    	mul	x3, x3, x25
10000d67c: d350fc42    	lsr	x2, x2, #16
10000d680: 92001c42    	and	x2, x2, #0xff000000ff
10000d684: 9b1a0c42    	madd	x2, x2, x26, x3
10000d688: 9b1e7f03    	mul	x3, x24, x30
10000d68c: 8b4f806f    	add	x15, x3, x15, lsr #32
10000d690: 9b1e7def    	mul	x15, x15, x30
10000d694: 8b4281f8    	add	x24, x15, x2, lsr #32
10000d698: 910041ad    	add	x13, x13, #0x10
10000d69c: d10041ce    	sub	x14, x14, #0x10
10000d6a0: f1003ddf    	cmp	x14, #0xf
10000d6a4: 54fffbec    	b.gt	0x10000d620 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x298>
10000d6a8: d10021ad    	sub	x13, x13, #0x8
10000d6ac: cb0d020e    	sub	x14, x16, x13
10000d6b0: f10021df    	cmp	x14, #0x8
10000d6b4: 5400010a    	b.ge	0x10000d6d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d6b8: f10011df    	cmp	x14, #0x4
10000d6bc: 5400032a    	b.ge	0x10000d720 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d6c0: 14000022    	b	0x10000d748 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d6c4: aa0c03ed    	mov	x13, x12
10000d6c8: cb0c020e    	sub	x14, x16, x12
10000d6cc: f10021df    	cmp	x14, #0x8
10000d6d0: 54ffff4b    	b.lt	0x10000d6b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d6d4: f94001ae    	ldr	x14, [x13]
10000d6d8: 8b1601cf    	add	x15, x14, x22
10000d6dc: 8b1501ce    	add	x14, x14, x21
10000d6e0: aa0e01ef    	orr	x15, x15, x14
10000d6e4: f201c1ff    	tst	x15, #0x8080808080808080
10000d6e8: 540001c1    	b.ne	0x10000d720 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d6ec: 9b1e7f0f    	mul	x15, x24, x30
10000d6f0: 9b1b7dc2    	mul	x2, x14, x27
10000d6f4: 8b4e204e    	add	x14, x2, x14, lsr #8
10000d6f8: 92001dc2    	and	x2, x14, #0xff000000ff
10000d6fc: 9b197c42    	mul	x2, x2, x25
10000d700: d350fdce    	lsr	x14, x14, #16
10000d704: 92001dce    	and	x14, x14, #0xff000000ff
10000d708: 9b1a09ce    	madd	x14, x14, x26, x2
10000d70c: 8b4e81f8    	add	x24, x15, x14, lsr #32
10000d710: 910021ad    	add	x13, x13, #0x8
10000d714: cb0d020e    	sub	x14, x16, x13
10000d718: f10011df    	cmp	x14, #0x4
10000d71c: 5400016b    	b.lt	0x10000d748 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d720: b94001ae    	ldr	w14, [x13]
10000d724: 5288c8cf    	mov	w15, #0x4646            ; =17990
10000d728: 72a8c8cf    	movk	w15, #0x4646, lsl #16
10000d72c: 0b0f01cf    	add	w15, w14, w15
10000d730: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000d734: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000d738: 0b0201ce    	add	w14, w14, w2
10000d73c: 2a0e01ef    	orr	w15, w15, w14
10000d740: 7201c1ff    	tst	w15, #0x80808080
10000d744: 54000940    	b.eq	0x10000d86c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e4>
10000d748: eb1001bf    	cmp	x13, x16
10000d74c: 54000a80    	b.eq	0x10000d89c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x514>
10000d750: 39c001ae    	ldrsb	w14, [x13]
10000d754: 5100c1cf    	sub	w15, w14, #0x30
10000d758: 710025ff    	cmp	w15, #0x9
10000d75c: 54000448    	b.hi	0x10000d7e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x45c>
10000d760: 12001dcf    	and	w15, w14, #0xff
10000d764: 9b1b7f02    	mul	x2, x24, x27
10000d768: 910005ae    	add	x14, x13, #0x1
10000d76c: 5100c1ef    	sub	w15, w15, #0x30
10000d770: 8b2f0058    	add	x24, x2, w15, uxtb
10000d774: eb1001df    	cmp	x14, x16
10000d778: 54000380    	b.eq	0x10000d7e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x460>
10000d77c: 39c001cf    	ldrsb	w15, [x14]
10000d780: 5100c1e2    	sub	w2, w15, #0x30
10000d784: 7100245f    	cmp	w2, #0x9
10000d788: 54000308    	b.hi	0x10000d7e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x460>
10000d78c: 12001def    	and	w15, w15, #0xff
10000d790: 9b1b7f02    	mul	x2, x24, x27
10000d794: 910009ae    	add	x14, x13, #0x2
10000d798: 5100c1ef    	sub	w15, w15, #0x30
10000d79c: 8b2f0058    	add	x24, x2, w15, uxtb
10000d7a0: eb1001df    	cmp	x14, x16
10000d7a4: 54000220    	b.eq	0x10000d7e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x460>
10000d7a8: 39c001cf    	ldrsb	w15, [x14]
10000d7ac: 5100c1e2    	sub	w2, w15, #0x30
10000d7b0: 7100245f    	cmp	w2, #0x9
10000d7b4: 540001a8    	b.hi	0x10000d7e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x460>
10000d7b8: 12001def    	and	w15, w15, #0xff
10000d7bc: 9b1b7f02    	mul	x2, x24, x27
10000d7c0: 91000dae    	add	x14, x13, #0x3
10000d7c4: 5100c1ed    	sub	w13, w15, #0x30
10000d7c8: 8b2d0058    	add	x24, x2, w13, uxtb
10000d7cc: cb0c01cd    	sub	x13, x14, x12
10000d7d0: cb0e018f    	sub	x15, x12, x14
10000d7d4: cb0f0163    	sub	x3, x11, x15
10000d7d8: aa0e03e2    	mov	x2, x14
10000d7dc: b50009e3    	cbnz	x3, 0x10000d918 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x590>
10000d7e0: 14000007    	b	0x10000d7fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d7e4: aa0d03ee    	mov	x14, x13
10000d7e8: cb0c01cd    	sub	x13, x14, x12
10000d7ec: cb0e018f    	sub	x15, x12, x14
10000d7f0: cb0f0163    	sub	x3, x11, x15
10000d7f4: aa0e03e2    	mov	x2, x14
10000d7f8: b5000903    	cbnz	x3, 0x10000d918 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x590>
10000d7fc: 39400228    	ldrb	w8, [x17]
10000d800: 7100b51f    	cmp	w8, #0x2d
10000d804: 1a9f17e9    	cset	w9, eq
10000d808: cb09000a    	sub	x10, x0, x9
10000d80c: f1000d5f    	cmp	x10, #0x3
10000d810: 54ffe1cb    	b.lt	0x10000d448 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d814: 8b090229    	add	x9, x17, x9
10000d818: 3940092a    	ldrb	w10, [x9, #0x2]
10000d81c: 79400129    	ldrh	w9, [x9]
10000d820: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d824: b203c129    	orr	x9, x9, #0x2020202020202020
10000d828: eb07013f    	cmp	x9, x7
10000d82c: 54000160    	b.eq	0x10000d858 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4d0>
10000d830: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d834: f28c2dca    	movk	x10, #0x616e
10000d838: f2a40dca    	movk	x10, #0x206e, lsl #16
10000d83c: eb0a013f    	cmp	x9, x10
10000d840: 54ffe041    	b.ne	0x10000d448 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d844: 7100b51f    	cmp	w8, #0x2d
10000d848: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000d84c: 52800028    	mov	w8, #0x1                ; =1
10000d850: 3607e001    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d854: 17ffff00    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d858: 7100b51f    	cmp	w8, #0x2d
10000d85c: 1e690d41    	fcsel	d1, d10, d9, eq
10000d860: 52800028    	mov	w8, #0x1                ; =1
10000d864: 3607df61    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d868: 17fffefb    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d86c: 1b1b7dcf    	mul	w15, w14, w27
10000d870: 0b4e21ee    	add	w14, w15, w14, lsr #8
10000d874: 12009dce    	and	w14, w14, #0xff00ff
10000d878: 5280002f    	mov	w15, #0x1               ; =1
10000d87c: 72a00c8f    	movk	w15, #0x64, lsl #16
10000d880: 1b0f7dce    	mul	w14, w14, w15
10000d884: 53107dce    	lsr	w14, w14, #16
10000d888: 5284e20f    	mov	w15, #0x2710            ; =10000
10000d88c: 9b0f3b18    	madd	x24, x24, x15, x14
10000d890: 910011ad    	add	x13, x13, #0x4
10000d894: eb1001bf    	cmp	x13, x16
10000d898: 54fff5c1    	b.ne	0x10000d750 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c8>
10000d89c: aa0d03ee    	mov	x14, x13
10000d8a0: cb0c01ad    	sub	x13, x13, x12
10000d8a4: cb0e018f    	sub	x15, x12, x14
10000d8a8: cb0f0163    	sub	x3, x11, x15
10000d8ac: aa0e03e2    	mov	x2, x14
10000d8b0: b5000343    	cbnz	x3, 0x10000d918 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x590>
10000d8b4: 17ffffd2    	b	0x10000d7fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d8b8: 9b1e7f0e    	mul	x14, x24, x30
10000d8bc: 9b1b7de2    	mul	x2, x15, x27
10000d8c0: 8b4f204f    	add	x15, x2, x15, lsr #8
10000d8c4: 92001de2    	and	x2, x15, #0xff000000ff
10000d8c8: 9b197c42    	mul	x2, x2, x25
10000d8cc: d350fdef    	lsr	x15, x15, #16
10000d8d0: 92001def    	and	x15, x15, #0xff000000ff
10000d8d4: 9b1a09ef    	madd	x15, x15, x26, x2
10000d8d8: 8b4f81d8    	add	x24, x14, x15, lsr #32
10000d8dc: cb0d020e    	sub	x14, x16, x13
10000d8e0: f10021df    	cmp	x14, #0x8
10000d8e4: 54ffeeab    	b.lt	0x10000d6b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d8e8: 17ffff7b    	b	0x10000d6d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d8ec: aa0b03f8    	mov	x24, x11
10000d8f0: cb09010b    	sub	x11, x8, x9
10000d8f4: eb10011f    	cmp	x8, x16
10000d8f8: 54ffe841    	b.ne	0x10000d600 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x278>
10000d8fc: d280000d    	mov	x13, #0x0               ; =0
10000d900: d280000f    	mov	x15, #0x0               ; =0
10000d904: d280000c    	mov	x12, #0x0               ; =0
10000d908: d2800002    	mov	x2, #0x0                ; =0
10000d90c: aa0803ee    	mov	x14, x8
10000d910: aa0b03e3    	mov	x3, x11
10000d914: b4fff74b    	cbz	x11, 0x10000d7fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d918: eb1001df    	cmp	x14, x16
10000d91c: 540005a0    	b.eq	0x10000d9d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d920: 394001d1    	ldrb	w17, [x14]
10000d924: 321b0231    	orr	w17, w17, #0x20
10000d928: 7101963f    	cmp	w17, #0x65
10000d92c: 54000521    	b.ne	0x10000d9d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d930: 910005c0    	add	x0, x14, #0x1
10000d934: eb10001f    	cmp	x0, x16
10000d938: 54000180    	b.eq	0x10000d968 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e0>
10000d93c: 39400011    	ldrb	w17, [x0]
10000d940: 910009c4    	add	x4, x14, #0x2
10000d944: 7100ae3f    	cmp	w17, #0x2b
10000d948: 9a800080    	csel	x0, x4, x0, eq
10000d94c: 7100b63f    	cmp	w17, #0x2d
10000d950: 52800031    	mov	w17, #0x1               ; =1
10000d954: 1a9113f1    	csel	w17, wzr, w17, ne
10000d958: 9a841000    	csel	x0, x0, x4, ne
10000d95c: eb10001f    	cmp	x0, x16
10000d960: 540000a1    	b.ne	0x10000d974 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5ec>
10000d964: 1400001b    	b	0x10000d9d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d968: 52800011    	mov	w17, #0x0               ; =0
10000d96c: eb10001f    	cmp	x0, x16
10000d970: 54000300    	b.eq	0x10000d9d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d974: 39c00004    	ldrsb	w4, [x0]
10000d978: 5100c084    	sub	w4, w4, #0x30
10000d97c: 7100249f    	cmp	w4, #0x9
10000d980: 54000288    	b.hi	0x10000d9d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d984: d280000e    	mov	x14, #0x0               ; =0
10000d988: 14000004    	b	0x10000d998 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x610>
10000d98c: 91000400    	add	x0, x0, #0x1
10000d990: eb10001f    	cmp	x0, x16
10000d994: 54000820    	b.eq	0x10000da98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x710>
10000d998: 39c00004    	ldrsb	w4, [x0]
10000d99c: 5100c085    	sub	w5, w4, #0x30
10000d9a0: 710024bf    	cmp	w5, #0x9
10000d9a4: 540007a8    	b.hi	0x10000da98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x710>
10000d9a8: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d9ac: eb0501df    	cmp	x14, x5
10000d9b0: 54fffeec    	b.gt	0x10000d98c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x604>
10000d9b4: 12001c84    	and	w4, w4, #0xff
10000d9b8: 5100c084    	sub	w4, w4, #0x30
10000d9bc: 92401c84    	and	x4, x4, #0xff
10000d9c0: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000d9c4: 8b050485    	add	x5, x4, x5, lsl #1
10000d9c8: aa0503ee    	mov	x14, x5
10000d9cc: 17fffff0    	b	0x10000d98c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x604>
10000d9d0: d2800011    	mov	x17, #0x0               ; =0
10000d9d4: f100507f    	cmp	x3, #0x14
10000d9d8: 540006cb    	b.lt	0x10000dab0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000d9dc: eb10013f    	cmp	x9, x16
10000d9e0: 54000200    	b.eq	0x10000da20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x698>
10000d9e4: aa0903e0    	mov	x0, x9
10000d9e8: 14000007    	b	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d9ec: 7100c09f    	cmp	w4, #0x30
10000d9f0: 1a9f17e4    	cset	w4, eq
10000d9f4: cb040063    	sub	x3, x3, x4
10000d9f8: 91000400    	add	x0, x0, #0x1
10000d9fc: eb10001f    	cmp	x0, x16
10000da00: 540000c0    	b.eq	0x10000da18 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x690>
10000da04: 39400004    	ldrb	w4, [x0]
10000da08: 7100c09f    	cmp	w4, #0x30
10000da0c: 54ffff00    	b.eq	0x10000d9ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x664>
10000da10: 7100b89f    	cmp	w4, #0x2e
10000da14: 54fffec0    	b.eq	0x10000d9ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x664>
10000da18: f100507f    	cmp	x3, #0x14
10000da1c: 540004ab    	b.lt	0x10000dab0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000da20: eb08013f    	cmp	x9, x8
10000da24: 54000e20    	b.eq	0x10000dbe8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x860>
10000da28: d2800018    	mov	x24, #0x0               ; =0
10000da2c: aa0903ef    	mov	x15, x9
10000da30: 388015f0    	ldrsb	x16, [x15], #0x1
10000da34: 9b1b4310    	madd	x16, x24, x27, x16
10000da38: d100c218    	sub	x24, x16, #0x30
10000da3c: eb17031f    	cmp	x24, x23
10000da40: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000da44: 54ffff61    	b.ne	0x10000da30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a8>
10000da48: d10006f0    	sub	x16, x23, #0x1
10000da4c: eb10031f    	cmp	x24, x16
10000da50: 54000168    	b.hi	0x10000da7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f4>
10000da54: aa0c03ef    	mov	x15, x12
10000da58: eb02019f    	cmp	x12, x2
10000da5c: 540000e0    	b.eq	0x10000da78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000da60: 388015e8    	ldrsb	x8, [x15], #0x1
10000da64: 9b1b2308    	madd	x8, x24, x27, x8
10000da68: d100c118    	sub	x24, x8, #0x30
10000da6c: eb17031f    	cmp	x24, x23
10000da70: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000da74: 54ffff61    	b.ne	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d8>
10000da78: aa0c03e8    	mov	x8, x12
10000da7c: cb0f0108    	sub	x8, x8, x15
10000da80: 8b11010f    	add	x15, x8, x17
10000da84: 390013ff    	strb	wzr, [sp, #0x4]
10000da88: b90003ff    	str	wzr, [sp]
10000da8c: 52800030    	mov	w16, #0x1               ; =1
10000da90: b50003d8    	cbnz	x24, 0x10000db08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x780>
10000da94: 14000045    	b	0x10000dba8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x820>
10000da98: 7100023f    	cmp	w17, #0x0
10000da9c: da8e05d1    	cneg	x17, x14, ne
10000daa0: 8b0f022f    	add	x15, x17, x15
10000daa4: aa0003ee    	mov	x14, x0
10000daa8: f100507f    	cmp	x3, #0x14
10000daac: 54fff98a    	b.ge	0x10000d9dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x654>
10000dab0: 390013ff    	strb	wzr, [sp, #0x4]
10000dab4: b90003ff    	str	wzr, [sp]
10000dab8: b50001ef    	cbnz	x15, 0x10000daf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x76c>
10000dabc: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000dac0: eb08031f    	cmp	x24, x8
10000dac4: 54000188    	b.hi	0x10000daf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x76c>
10000dac8: 9e630301    	ucvtf	d1, x24
10000dacc: 1e614022    	fneg	d2, d1
10000dad0: 7100b79f    	cmp	w28, #0x2d
10000dad4: 1e610c41    	fcsel	d1, d2, d1, eq
10000dad8: 1e680da2    	fcsel	d2, d13, d8, eq
10000dadc: f100031f    	cmp	x24, #0x0
10000dae0: 1e621c21    	fcsel	d1, d1, d2, ne
10000dae4: 52800028    	mov	w8, #0x1                ; =1
10000dae8: 2a0803e8    	mov	w8, w8
10000daec: 3607cb21    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000daf0: 17fffe59    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000daf4: d1005de8    	sub	x8, x15, #0x17
10000daf8: b100b51f    	cmn	x8, #0x2d
10000dafc: 54000162    	b.hs	0x10000db28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a0>
10000db00: 52800010    	mov	w16, #0x0               ; =0
10000db04: b4000538    	cbz	x24, 0x10000dba8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x820>
10000db08: b10559ff    	cmn	x15, #0x156
10000db0c: 540004eb    	b.lt	0x10000dba8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x820>
10000db10: f104d1ff    	cmp	x15, #0x134
10000db14: 5400012d    	b.le	0x10000db38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b0>
10000db18: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000db1c: d2800008    	mov	x8, #0x0                ; =0
10000db20: 350004b0    	cbnz	w16, 0x10000dbb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000db24: 140000b3    	b	0x10000ddf0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa68>
10000db28: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000db2c: eb08031f    	cmp	x24, x8
10000db30: 54000669    	b.ls	0x10000dbfc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x874>
10000db34: 52800010    	mov	w16, #0x0               ; =0
10000db38: dac01300    	clz	x0, x24
10000db3c: 9ac02302    	lsl	x2, x24, x0
10000db40: 531f79e3    	lsl	w3, w15, #1
10000db44: 110ab068    	add	w8, w3, #0x2ac
10000db48: d0000185    	adrp	x5, 0x10003f000 <__ZL5Lhint+0xfb0>
10000db4c: 911d60a5    	add	x5, x5, #0x758
10000db50: f86858b1    	ldr	x17, [x5, w8, uxtw #3]
10000db54: 9b027e28    	mul	x8, x17, x2
10000db58: 9bc27e31    	umulh	x17, x17, x2
10000db5c: 2a3103e4    	mvn	w4, w17
10000db60: f240209f    	tst	x4, #0x1ff
10000db64: 540000c1    	b.ne	0x10000db7c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7f4>
10000db68: 110ab463    	add	w3, w3, #0x2ad
10000db6c: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000db70: 9bc27c62    	umulh	x2, x3, x2
10000db74: ab080048    	adds	x8, x2, x8
10000db78: 9a913631    	cinc	x17, x17, hs
10000db7c: d37ffe24    	lsr	x4, x17, #63
10000db80: 91002483    	add	x3, x4, #0x9
10000db84: 9ac32622    	lsr	x2, x17, x3
10000db88: 1b067de5    	mul	w5, w15, w6
10000db8c: 4b000080    	sub	w0, w4, w0
10000db90: 0b854000    	add	w0, w0, w5, asr #16
10000db94: 1100fc00    	add	w0, w0, #0x3f
10000db98: 310ffc1f    	cmn	w0, #0x3ff
10000db9c: 5400048c    	b.gt	0x10000dc2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8a4>
10000dba0: 3110f41f    	cmn	w0, #0x43d
10000dba4: 54000cc2    	b.hs	0x10000dd3c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9b4>
10000dba8: 52800011    	mov	w17, #0x0               ; =0
10000dbac: d2800008    	mov	x8, #0x0                ; =0
10000dbb0: 34001210    	cbz	w16, 0x10000ddf0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa68>
10000dbb4: 52800002    	mov	w2, #0x0                ; =0
10000dbb8: d2800000    	mov	x0, #0x0                ; =0
10000dbbc: b1000704    	adds	x4, x24, #0x1
10000dbc0: 54001102    	b.hs	0x10000dde0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa58>
10000dbc4: b10559ff    	cmn	x15, #0x156
10000dbc8: 540010cb    	b.lt	0x10000dde0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa58>
10000dbcc: f104d1ff    	cmp	x15, #0x134
10000dbd0: 5400066d    	b.le	0x10000dc9c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x914>
10000dbd4: d2800000    	mov	x0, #0x0                ; =0
10000dbd8: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000dbdc: eb00011f    	cmp	x8, x0
10000dbe0: 54001040    	b.eq	0x10000dde8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa60>
10000dbe4: 140000a7    	b	0x10000de80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaf8>
10000dbe8: d2800018    	mov	x24, #0x0               ; =0
10000dbec: aa0c03ef    	mov	x15, x12
10000dbf0: eb02019f    	cmp	x12, x2
10000dbf4: 54fff361    	b.ne	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d8>
10000dbf8: 17ffffa0    	b	0x10000da78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000dbfc: 9e630301    	ucvtf	d1, x24
10000dc00: d0000188    	adrp	x8, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dc04: 9119c108    	add	x8, x8, #0x670
10000dc08: b7f8112f    	tbnz	x15, #0x3f, 0x10000de2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaa4>
10000dc0c: fc6f7902    	ldr	d2, [x8, x15, lsl #3]
10000dc10: 1e610841    	fmul	d1, d2, d1
10000dc14: 1e614022    	fneg	d2, d1
10000dc18: 7100b79f    	cmp	w28, #0x2d
10000dc1c: 1e610c41    	fcsel	d1, d2, d1, eq
10000dc20: 52800028    	mov	w8, #0x1                ; =1
10000dc24: 3607c161    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dc28: 17fffe0b    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dc2c: 92400444    	and	x4, x2, #0x3
10000dc30: 9ac32043    	lsl	x3, x2, x3
10000dc34: eb11007f    	cmp	x3, x17
10000dc38: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000dc3c: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000dc40: 910011e8    	add	x8, x15, #0x4
10000dc44: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000dc48: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000dc4c: 9a823108    	csel	x8, x8, x2, lo
10000dc50: 92400111    	and	x17, x8, #0x1
10000dc54: 8b080222    	add	x2, x17, x8
10000dc58: ca080223    	eor	x3, x17, x8
10000dc5c: 8a080228    	and	x8, x17, x8
10000dc60: 8b430508    	add	x8, x8, x3, lsr #1
10000dc64: d376fc51    	lsr	x17, x2, #54
10000dc68: f100023f    	cmp	x17, #0x0
10000dc6c: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000dc70: 1a820442    	cinc	w2, w2, ne
10000dc74: 0b000040    	add	w0, w2, w0
10000dc78: 711ffc1f    	cmp	w0, #0x7ff
10000dc7c: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000dc80: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000dc84: 8a110108    	and	x8, x8, x17
10000dc88: 9a9f0108    	csel	x8, x8, xzr, eq
10000dc8c: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000dc90: 1ad16c11    	umin	w17, w0, w17
10000dc94: 36000af0    	tbz	w16, #0x0, 0x10000ddf0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa68>
10000dc98: 17ffffc7    	b	0x10000dbb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000dc9c: dac01083    	clz	x3, x4
10000dca0: 9ac32084    	lsl	x4, x4, x3
10000dca4: 531f79e5    	lsl	w5, w15, #1
10000dca8: 110ab0a0    	add	w0, w5, #0x2ac
10000dcac: d0000187    	adrp	x7, 0x10003f000 <__ZL5Lhint+0xfb0>
10000dcb0: 911d60e7    	add	x7, x7, #0x758
10000dcb4: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000dcb8: 9b047c40    	mul	x0, x2, x4
10000dcbc: 9bc47c42    	umulh	x2, x2, x4
10000dcc0: 2a2203e6    	mvn	w6, w2
10000dcc4: f24020df    	tst	x6, #0x1ff
10000dcc8: 540000c1    	b.ne	0x10000dce0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x958>
10000dccc: 110ab4a5    	add	w5, w5, #0x2ad
10000dcd0: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000dcd4: 9bc47ca4    	umulh	x4, x5, x4
10000dcd8: ab000080    	adds	x0, x4, x0
10000dcdc: 9a823442    	cinc	x2, x2, hs
10000dce0: d37ffc46    	lsr	x6, x2, #63
10000dce4: 910024c5    	add	x5, x6, #0x9
10000dce8: 9ac52444    	lsr	x4, x2, x5
10000dcec: 528a4d47    	mov	w7, #0x526a             ; =21098
10000dcf0: 72a00067    	movk	w7, #0x3, lsl #16
10000dcf4: 1b077de7    	mul	w7, w15, w7
10000dcf8: 4b0300c3    	sub	w3, w6, w3
10000dcfc: 0b874063    	add	w3, w3, w7, asr #16
10000dd00: 1100fc63    	add	w3, w3, #0x3f
10000dd04: 310ffc7f    	cmn	w3, #0x3ff
10000dd08: 540002ec    	b.gt	0x10000dd64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9dc>
10000dd0c: 3110f47f    	cmn	w3, #0x43d
10000dd10: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dd14: f28dcd27    	movk	x7, #0x6e69
10000dd18: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dd1c: 540009a2    	b.hs	0x10000de50 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xac8>
10000dd20: d2800000    	mov	x0, #0x0                ; =0
10000dd24: 52800002    	mov	w2, #0x0                ; =0
10000dd28: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dd2c: 72a00066    	movk	w6, #0x3, lsl #16
10000dd30: eb00011f    	cmp	x8, x0
10000dd34: 540005a0    	b.eq	0x10000dde8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa60>
10000dd38: 14000052    	b	0x10000de80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaf8>
10000dd3c: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000dd40: 4b000108    	sub	w8, w8, w0
10000dd44: 9ac82448    	lsr	x8, x2, x8
10000dd48: 92400111    	and	x17, x8, #0x1
10000dd4c: 8b080231    	add	x17, x17, x8
10000dd50: d341fe28    	lsr	x8, x17, #1
10000dd54: f24b0e3f    	tst	x17, #0x1e0000000000000
10000dd58: 1a9f07f1    	cset	w17, ne
10000dd5c: 3707f2d0    	tbnz	w16, #0x0, 0x10000dbb4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000dd60: 14000024    	b	0x10000ddf0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa68>
10000dd64: 92400486    	and	x6, x4, #0x3
10000dd68: 9ac52085    	lsl	x5, x4, x5
10000dd6c: eb0200bf    	cmp	x5, x2
10000dd70: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000dd74: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000dd78: 910011e0    	add	x0, x15, #0x4
10000dd7c: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000dd80: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000dd84: 9a843000    	csel	x0, x0, x4, lo
10000dd88: 92400002    	and	x2, x0, #0x1
10000dd8c: 8b000044    	add	x4, x2, x0
10000dd90: ca000045    	eor	x5, x2, x0
10000dd94: 8a000040    	and	x0, x2, x0
10000dd98: 8b450400    	add	x0, x0, x5, lsr #1
10000dd9c: d376fc82    	lsr	x2, x4, #54
10000dda0: f100005f    	cmp	x2, #0x0
10000dda4: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000dda8: 1a840484    	cinc	w4, w4, ne
10000ddac: 0b030083    	add	w3, w4, w3
10000ddb0: 711ffc7f    	cmp	w3, #0x7ff
10000ddb4: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000ddb8: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000ddbc: 8a020000    	and	x0, x0, x2
10000ddc0: 9a9f0000    	csel	x0, x0, xzr, eq
10000ddc4: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000ddc8: 1ac26c62    	umin	w2, w3, w2
10000ddcc: 528a4d46    	mov	w6, #0x526a             ; =21098
10000ddd0: 72a00066    	movk	w6, #0x3, lsl #16
10000ddd4: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000ddd8: f28dcd27    	movk	x7, #0x6e69
10000dddc: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dde0: eb00011f    	cmp	x8, x0
10000dde4: 540004e1    	b.ne	0x10000de80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaf8>
10000dde8: 6b02023f    	cmp	w17, w2
10000ddec: 540004a1    	b.ne	0x10000de80 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaf8>
10000ddf0: 2a1103e2    	mov	w2, w17
10000ddf4: 7100b79f    	cmp	w28, #0x2d
10000ddf8: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000ddfc: 9a9f0129    	csel	x9, x9, xzr, eq
10000de00: aa02d129    	orr	x9, x9, x2, lsl #52
10000de04: aa080129    	orr	x9, x9, x8
10000de08: 9e670121    	fmov	d1, x9
10000de0c: f100011f    	cmp	x8, #0x0
10000de10: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000de14: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000de18: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000de1c: 7a480044    	ccmp	w2, w8, #0x4, eq
10000de20: 1a9f07e8    	cset	w8, ne
10000de24: 3607b161    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000de28: 17fffd8b    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000de2c: cb0f0d08    	sub	x8, x8, x15, lsl #3
10000de30: fd400102    	ldr	d2, [x8]
10000de34: 1e621821    	fdiv	d1, d1, d2
10000de38: 1e614022    	fneg	d2, d1
10000de3c: 7100b79f    	cmp	w28, #0x2d
10000de40: 1e610c41    	fcsel	d1, d2, d1, eq
10000de44: 52800028    	mov	w8, #0x1                ; =1
10000de48: 3607b041    	tbz	w1, #0x0, 0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000de4c: 17fffd82    	b	0x10000d454 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000de50: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000de54: 4b030000    	sub	w0, w0, w3
10000de58: 9ac02480    	lsr	x0, x4, x0
10000de5c: 92400002    	and	x2, x0, #0x1
10000de60: 8b000042    	add	x2, x2, x0
10000de64: d341fc40    	lsr	x0, x2, #1
10000de68: f24b0c5f    	tst	x2, #0x1e0000000000000
10000de6c: 1a9f07e2    	cset	w2, ne
10000de70: 528a4d46    	mov	w6, #0x526a             ; =21098
10000de74: 72a00066    	movk	w6, #0x3, lsl #16
10000de78: eb00011f    	cmp	x8, x0
10000de7c: 54fffb60    	b.eq	0x10000dde8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa60>
10000de80: dac01311    	clz	x17, x24
10000de84: 9ad12300    	lsl	x0, x24, x17
10000de88: 531f79e2    	lsl	w2, w15, #1
10000de8c: 110ab048    	add	w8, w2, #0x2ac
10000de90: d0000183    	adrp	x3, 0x10003f000 <__ZL5Lhint+0xfb0>
10000de94: 911d6063    	add	x3, x3, #0x758
10000de98: f868d863    	ldr	x3, [x3, w8, sxtw #3]
10000de9c: 9bc07c68    	umulh	x8, x3, x0
10000dea0: 2a2803e4    	mvn	w4, w8
10000dea4: f240209f    	tst	x4, #0x1ff
10000dea8: 54000121    	b.ne	0x10000decc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb44>
10000deac: 9b007c63    	mul	x3, x3, x0
10000deb0: 110ab442    	add	w2, w2, #0x2ad
10000deb4: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0xfb0>
10000deb8: 911d6084    	add	x4, x4, #0x758
10000debc: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000dec0: 9bc07c40    	umulh	x0, x2, x0
10000dec4: ab03001f    	cmn	x0, x3
10000dec8: 9a883508    	cinc	x8, x8, hs
10000decc: d37ffd00    	lsr	x0, x8, #63
10000ded0: 52000000    	eor	w0, w0, #0x1
10000ded4: 9ac02108    	lsl	x8, x8, x0
10000ded8: 1b067de2    	mul	w2, w15, w6
10000dedc: 13107c42    	asr	w2, w2, #16
10000dee0: 4b110051    	sub	w17, w2, w17
10000dee4: 4b000231    	sub	w17, w17, w0
10000dee8: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000deec: 2b000222    	adds	w2, w17, w0
10000def0: 54fff825    	b.pl	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000def4: a900e3ef    	stp	x15, x24, [sp, #0x8]
10000def8: f9000fee    	str	x14, [sp, #0x18]
10000defc: 390083ea    	strb	w10, [sp, #0x20]
10000df00: 5280002a    	mov	w10, #0x1               ; =1
10000df04: 390087ea    	strb	w10, [sp, #0x21]
10000df08: 39008bf0    	strb	w16, [sp, #0x22]
10000df0c: b94003ea    	ldr	w10, [sp]
10000df10: 910023ee    	add	x14, sp, #0x8
10000df14: b801b1ca    	stur	w10, [x14, #0x1b]
10000df18: 394013ea    	ldrb	w10, [sp, #0x4]
10000df1c: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000df20: a902afe9    	stp	x9, x11, [sp, #0x28]
10000df24: a903b7ec    	stp	x12, x13, [sp, #0x38]
10000df28: f90027ff    	str	xzr, [sp, #0x48]
10000df2c: 910023e0    	add	x0, sp, #0x8
10000df30: aa1903fa    	mov	x26, x25
10000df34: aa0103f9    	mov	x25, x1
10000df38: aa0803e1    	mov	x1, x8
10000df3c: 52800023    	mov	w3, #0x1                ; =1
10000df40: 4ea01c0e    	mov.16b	v14, v0
10000df44: aa0703f5    	mov	x21, x7
10000df48: 94001512    	bl	0x100013390 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000df4c: aa1503e7    	mov	x7, x21
10000df50: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000df54: f299fa15    	movk	x21, #0xcfd0
10000df58: 528a4d46    	mov	w6, #0x526a             ; =21098
10000df5c: 72a00066    	movk	w6, #0x3, lsl #16
10000df60: 529c201e    	mov	w30, #0xe100            ; =57600
10000df64: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000df68: 4eae1dc0    	mov.16b	v0, v14
10000df6c: aa0003e8    	mov	x8, x0
10000df70: aa0103e2    	mov	x2, x1
10000df74: aa1903e1    	mov	x1, x25
10000df78: aa1a03f9    	mov	x25, x26
10000df7c: d280003a    	mov	x26, #0x1               ; =1
10000df80: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000df84: 17ffff9c    	b	0x10000ddf4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa6c>
10000df88: 6f00e400    	movi.2d	v0, #0000000000000000
10000df8c: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000df90: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000df94: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000df98: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000df9c: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000dfa0: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000dfa4: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000dfa8: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000dfac: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000dfb0: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000dfb4: 9103c3ff    	add	sp, sp, #0xf0
10000dfb8: d65f03c0    	ret
10000dfbc: 52800200    	mov	w0, #0x10               ; =16
10000dfc0: 9400b477    	bl	0x10003b19c <_strtod_l+0x10003b19c>
10000dfc4: aa0003f3    	mov	x19, x0
10000dfc8: b00001e1    	adrp	x1, 0x10004a000 <GCC_except_table247+0x188>
10000dfcc: 912b3421    	add	x1, x1, #0xacd
10000dfd0: 9400b3f2    	bl	0x10003af98 <_strtod_l+0x10003af98>
10000dfd4: aa1303e0    	mov	x0, x19
10000dfd8: 9400b39d    	bl	0x10003ae4c <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000dfdc: aa0003f4    	mov	x20, x0
10000dfe0: aa1303e0    	mov	x0, x19
10000dfe4: 9400b47d    	bl	0x10003b1d8 <_strtod_l+0x10003b1d8>
10000dfe8: aa1403e0    	mov	x0, x20
10000dfec: 9400b3b8    	bl	0x10003aecc <_strtod_l+0x10003aecc>
