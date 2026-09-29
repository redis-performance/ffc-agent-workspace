
simple_fastfloat_benchmark/build/m6-float-inline/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d2dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d2dc: d103c3ff    	sub	sp, sp, #0xf0
10000d2e0: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000d2e4: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000d2e8: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000d2ec: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000d2f0: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000d2f4: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000d2f8: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000d2fc: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000d300: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000d304: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000d308: 910383fd    	add	x29, sp, #0xe0
10000d30c: a9405013    	ldp	x19, x20, [x0]
10000d310: eb14027f    	cmp	x19, x20
10000d314: 54005f00    	b.eq	0x10000def4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc18>
10000d318: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000d31c: f299fa15    	movk	x21, #0xcfd0
10000d320: b207c7f6    	mov	x22, #0x606060606060606 ; =434041037028460038
10000d324: b202e2d6    	orr	x22, x22, #0x4444444444444444
10000d328: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d32c: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d330: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d334: d2800c99    	mov	x25, #0x64              ; =100
10000d338: f2c84819    	movk	x25, #0x4240, lsl #32
10000d33c: f2e001f9    	movk	x25, #0xf, lsl #48
10000d340: d280003a    	mov	x26, #0x1               ; =1
10000d344: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000d348: 529c201e    	mov	w30, #0xe100            ; =57600
10000d34c: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000d350: 528a4d46    	mov	w6, #0x526a             ; =21098
10000d354: 72a00066    	movk	w6, #0x3, lsl #16
10000d358: 6f00e408    	movi.2d	v8, #0000000000000000
10000d35c: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000d360: f28dcd27    	movk	x7, #0x6e69
10000d364: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000d368: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d36c: 9e670109    	fmov	d9, x8
10000d370: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d374: 9e67010a    	fmov	d10, x8
10000d378: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d37c: 9e67010b    	fmov	d11, x8
10000d380: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d384: 9e67010c    	fmov	d12, x8
10000d388: 5280015b    	mov	w27, #0xa               ; =10
10000d38c: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d390: 9e67010d    	fmov	d13, x8
10000d394: 6f00e400    	movi.2d	v0, #0000000000000000
10000d398: 14000009    	b	0x10000d3bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d39c: 52800008    	mov	w8, #0x0                ; =0
10000d3a0: 37000041    	tbnz	w1, #0x0, 0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d3a4: 36005c28    	tbz	w8, #0x0, 0x10000df28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4c>
10000d3a8: 1e612000    	fcmp	d0, d1
10000d3ac: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d3b0: 91006273    	add	x19, x19, #0x18
10000d3b4: eb14027f    	cmp	x19, x20
10000d3b8: 54005a00    	b.eq	0x10000def8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc1c>
10000d3bc: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d3c0: b7f800a0    	tbnz	x0, #0x3f, 0x10000d3d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf8>
10000d3c4: aa1303f1    	mov	x17, x19
10000d3c8: 6f00e401    	movi.2d	v1, #0000000000000000
10000d3cc: b50000a0    	cbnz	x0, 0x10000d3e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x104>
10000d3d0: 17fffff3    	b	0x10000d39c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d3d4: a9400271    	ldp	x17, x0, [x19]
10000d3d8: 6f00e401    	movi.2d	v1, #0000000000000000
10000d3dc: b4fffe00    	cbz	x0, 0x10000d39c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d3e0: 3940023c    	ldrb	w28, [x17]
10000d3e4: aa1c03eb    	mov	x11, x28
10000d3e8: aa1103e9    	mov	x9, x17
10000d3ec: 7100b79f    	cmp	w28, #0x2d
10000d3f0: 1a9f17ea    	cset	w10, eq
10000d3f4: 54000161    	b.ne	0x10000d420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d3f8: f100041f    	cmp	x0, #0x1
10000d3fc: 54001b60    	b.eq	0x10000d768 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d400: aa1103e9    	mov	x9, x17
10000d404: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000d408: 12001d0b    	and	w11, w8, #0xff
10000d40c: 7100b91f    	cmp	w8, #0x2e
10000d410: 54000080    	b.eq	0x10000d420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x144>
10000d414: 5100c108    	sub	w8, w8, #0x30
10000d418: 7100251f    	cmp	w8, #0x9
10000d41c: 54001a68    	b.hi	0x10000d768 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d420: 8b00022f    	add	x15, x17, x0
10000d424: eb0f013f    	cmp	x9, x15
10000d428: 540008c0    	b.eq	0x10000d540 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d42c: 13001d68    	sxtb	w8, w11
10000d430: 5100c108    	sub	w8, w8, #0x30
10000d434: 7100251f    	cmp	w8, #0x9
10000d438: 54000848    	b.hi	0x10000d540 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000d43c: 91000528    	add	x8, x9, #0x1
10000d440: 93401d6b    	sxtb	x11, w11
10000d444: d100c178    	sub	x24, x11, #0x30
10000d448: eb0f011f    	cmp	x8, x15
10000d44c: 540007e0    	b.eq	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d450: 39c0010b    	ldrsb	w11, [x8]
10000d454: 5100c16c    	sub	w12, w11, #0x30
10000d458: 7100259f    	cmp	w12, #0x9
10000d45c: 54000768    	b.hi	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d460: 93407d6b    	sxtw	x11, w11
10000d464: 91000928    	add	x8, x9, #0x2
10000d468: d100c16b    	sub	x11, x11, #0x30
10000d46c: aa1803ec    	mov	x12, x24
10000d470: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d474: 8b180578    	add	x24, x11, x24, lsl #1
10000d478: eb0f011f    	cmp	x8, x15
10000d47c: 54000660    	b.eq	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d480: 39c0010b    	ldrsb	w11, [x8]
10000d484: 5100c16c    	sub	w12, w11, #0x30
10000d488: 7100259f    	cmp	w12, #0x9
10000d48c: 540005e8    	b.hi	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d490: 93407d6b    	sxtw	x11, w11
10000d494: 91000d28    	add	x8, x9, #0x3
10000d498: d100c16b    	sub	x11, x11, #0x30
10000d49c: aa1803ec    	mov	x12, x24
10000d4a0: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d4a4: 8b180578    	add	x24, x11, x24, lsl #1
10000d4a8: eb0f011f    	cmp	x8, x15
10000d4ac: 540004e0    	b.eq	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d4b0: 39c0010b    	ldrsb	w11, [x8]
10000d4b4: 5100c16c    	sub	w12, w11, #0x30
10000d4b8: 7100259f    	cmp	w12, #0x9
10000d4bc: 54000468    	b.hi	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d4c0: 93407d6b    	sxtw	x11, w11
10000d4c4: 91001128    	add	x8, x9, #0x4
10000d4c8: d100c16b    	sub	x11, x11, #0x30
10000d4cc: aa1803ec    	mov	x12, x24
10000d4d0: 8b0c0998    	add	x24, x12, x12, lsl #2
10000d4d4: 8b180578    	add	x24, x11, x24, lsl #1
10000d4d8: eb0f011f    	cmp	x8, x15
10000d4dc: 54000360    	b.eq	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d4e0: 39c0010b    	ldrsb	w11, [x8]
10000d4e4: 5100c16c    	sub	w12, w11, #0x30
10000d4e8: 7100259f    	cmp	w12, #0x9
10000d4ec: 540002e8    	b.hi	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d4f0: 93407d6b    	sxtw	x11, w11
10000d4f4: 91001528    	add	x8, x9, #0x5
10000d4f8: d100c16c    	sub	x12, x11, #0x30
10000d4fc: 8b180b0b    	add	x11, x24, x24, lsl #2
10000d500: 8b0b058b    	add	x11, x12, x11, lsl #1
10000d504: eb0f011f    	cmp	x8, x15
10000d508: 54001a80    	b.eq	0x10000d858 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000d50c: 39c0010c    	ldrsb	w12, [x8]
10000d510: 5100c18d    	sub	w13, w12, #0x30
10000d514: 710025bf    	cmp	w13, #0x9
10000d518: 54001a08    	b.hi	0x10000d858 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x57c>
10000d51c: 93407d8c    	sxtw	x12, w12
10000d520: d100c18c    	sub	x12, x12, #0x30
10000d524: 8b0b0978    	add	x24, x11, x11, lsl #2
10000d528: 8b180598    	add	x24, x12, x24, lsl #1
10000d52c: 91000508    	add	x8, x8, #0x1
10000d530: aa1803eb    	mov	x11, x24
10000d534: eb0f011f    	cmp	x8, x15
10000d538: 54fffea1    	b.ne	0x10000d50c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x230>
10000d53c: 14000003    	b	0x10000d548 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x26c>
10000d540: d2800018    	mov	x24, #0x0               ; =0
10000d544: aa0903e8    	mov	x8, x9
10000d548: cb09010b    	sub	x11, x8, x9
10000d54c: eb0f011f    	cmp	x8, x15
10000d550: 540018c0    	b.eq	0x10000d868 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000d554: 3940010c    	ldrb	w12, [x8]
10000d558: 7100b99f    	cmp	w12, #0x2e
10000d55c: 54001861    	b.ne	0x10000d868 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x58c>
10000d560: 9100050c    	add	x12, x8, #0x1
10000d564: cb0c01ee    	sub	x14, x15, x12
10000d568: f10041df    	cmp	x14, #0x10
10000d56c: 5400056b    	b.lt	0x10000d618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x33c>
10000d570: 9100250d    	add	x13, x8, #0x9
10000d574: f85f81b0    	ldur	x16, [x13, #-0x8]
10000d578: 8b160202    	add	x2, x16, x22
10000d57c: 8b150210    	add	x16, x16, x21
10000d580: aa100042    	orr	x2, x2, x16
10000d584: f201c05f    	tst	x2, #0x8080808080808080
10000d588: 540003a1    	b.ne	0x10000d5fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x320>
10000d58c: f94001a2    	ldr	x2, [x13]
10000d590: 8b160043    	add	x3, x2, x22
10000d594: 8b150042    	add	x2, x2, x21
10000d598: aa020063    	orr	x3, x3, x2
10000d59c: f201c07f    	tst	x3, #0x8080808080808080
10000d5a0: 54001421    	b.ne	0x10000d824 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x548>
10000d5a4: 9b1b7e03    	mul	x3, x16, x27
10000d5a8: 8b502070    	add	x16, x3, x16, lsr #8
10000d5ac: 92001e03    	and	x3, x16, #0xff000000ff
10000d5b0: 9b197c63    	mul	x3, x3, x25
10000d5b4: d350fe10    	lsr	x16, x16, #16
10000d5b8: 92001e10    	and	x16, x16, #0xff000000ff
10000d5bc: 9b1a0e10    	madd	x16, x16, x26, x3
10000d5c0: 9b1b7c43    	mul	x3, x2, x27
10000d5c4: 8b422062    	add	x2, x3, x2, lsr #8
10000d5c8: 92001c43    	and	x3, x2, #0xff000000ff
10000d5cc: 9b197c63    	mul	x3, x3, x25
10000d5d0: d350fc42    	lsr	x2, x2, #16
10000d5d4: 92001c42    	and	x2, x2, #0xff000000ff
10000d5d8: 9b1a0c42    	madd	x2, x2, x26, x3
10000d5dc: 9b1e7f03    	mul	x3, x24, x30
10000d5e0: 8b508070    	add	x16, x3, x16, lsr #32
10000d5e4: 9b1e7e10    	mul	x16, x16, x30
10000d5e8: 8b428218    	add	x24, x16, x2, lsr #32
10000d5ec: 910041ad    	add	x13, x13, #0x10
10000d5f0: d10041ce    	sub	x14, x14, #0x10
10000d5f4: f1003ddf    	cmp	x14, #0xf
10000d5f8: 54fffbec    	b.gt	0x10000d574 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x298>
10000d5fc: d10021ad    	sub	x13, x13, #0x8
10000d600: cb0d01ee    	sub	x14, x15, x13
10000d604: f10021df    	cmp	x14, #0x8
10000d608: 5400010a    	b.ge	0x10000d628 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d60c: f10011df    	cmp	x14, #0x4
10000d610: 5400032a    	b.ge	0x10000d674 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d614: 14000022    	b	0x10000d69c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d618: aa0c03ed    	mov	x13, x12
10000d61c: cb0c01ee    	sub	x14, x15, x12
10000d620: f10021df    	cmp	x14, #0x8
10000d624: 54ffff4b    	b.lt	0x10000d60c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d628: f94001ae    	ldr	x14, [x13]
10000d62c: 8b1601d0    	add	x16, x14, x22
10000d630: 8b1501ce    	add	x14, x14, x21
10000d634: aa0e0210    	orr	x16, x16, x14
10000d638: f201c21f    	tst	x16, #0x8080808080808080
10000d63c: 540001c1    	b.ne	0x10000d674 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x398>
10000d640: 9b1e7f10    	mul	x16, x24, x30
10000d644: 9b1b7dc2    	mul	x2, x14, x27
10000d648: 8b4e204e    	add	x14, x2, x14, lsr #8
10000d64c: 92001dc2    	and	x2, x14, #0xff000000ff
10000d650: 9b197c42    	mul	x2, x2, x25
10000d654: d350fdce    	lsr	x14, x14, #16
10000d658: 92001dce    	and	x14, x14, #0xff000000ff
10000d65c: 9b1a09ce    	madd	x14, x14, x26, x2
10000d660: 8b4e8218    	add	x24, x16, x14, lsr #32
10000d664: 910021ad    	add	x13, x13, #0x8
10000d668: cb0d01ee    	sub	x14, x15, x13
10000d66c: f10011df    	cmp	x14, #0x4
10000d670: 5400016b    	b.lt	0x10000d69c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c0>
10000d674: b94001ae    	ldr	w14, [x13]
10000d678: 5288c8d0    	mov	w16, #0x4646            ; =17990
10000d67c: 72a8c8d0    	movk	w16, #0x4646, lsl #16
10000d680: 0b1001d0    	add	w16, w14, w16
10000d684: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000d688: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000d68c: 0b0201ce    	add	w14, w14, w2
10000d690: 2a0e0210    	orr	w16, w16, w14
10000d694: 7201c21f    	tst	w16, #0x80808080
10000d698: 54000a00    	b.eq	0x10000d7d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4fc>
10000d69c: eb0f01bf    	cmp	x13, x15
10000d6a0: 54000b40    	b.eq	0x10000d808 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x52c>
10000d6a4: 39c001ae    	ldrsb	w14, [x13]
10000d6a8: 5100c1d0    	sub	w16, w14, #0x30
10000d6ac: 7100261f    	cmp	w16, #0x9
10000d6b0: 54000508    	b.hi	0x10000d750 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x474>
10000d6b4: 12001dd0    	and	w16, w14, #0xff
10000d6b8: 910005ae    	add	x14, x13, #0x1
10000d6bc: 5100c210    	sub	w16, w16, #0x30
10000d6c0: 92401e10    	and	x16, x16, #0xff
10000d6c4: aa1803e2    	mov	x2, x24
10000d6c8: 8b020858    	add	x24, x2, x2, lsl #2
10000d6cc: 8b180618    	add	x24, x16, x24, lsl #1
10000d6d0: eb0f01df    	cmp	x14, x15
10000d6d4: 54000400    	b.eq	0x10000d754 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d6d8: 39c001d0    	ldrsb	w16, [x14]
10000d6dc: 5100c202    	sub	w2, w16, #0x30
10000d6e0: 7100245f    	cmp	w2, #0x9
10000d6e4: 54000388    	b.hi	0x10000d754 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d6e8: 12001e10    	and	w16, w16, #0xff
10000d6ec: 910009ae    	add	x14, x13, #0x2
10000d6f0: 5100c210    	sub	w16, w16, #0x30
10000d6f4: 92401e10    	and	x16, x16, #0xff
10000d6f8: aa1803e2    	mov	x2, x24
10000d6fc: 8b020858    	add	x24, x2, x2, lsl #2
10000d700: 8b180618    	add	x24, x16, x24, lsl #1
10000d704: eb0f01df    	cmp	x14, x15
10000d708: 54000260    	b.eq	0x10000d754 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d70c: 39c001d0    	ldrsb	w16, [x14]
10000d710: 5100c202    	sub	w2, w16, #0x30
10000d714: 7100245f    	cmp	w2, #0x9
10000d718: 540001e8    	b.hi	0x10000d754 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x478>
10000d71c: 12001e10    	and	w16, w16, #0xff
10000d720: 91000dae    	add	x14, x13, #0x3
10000d724: 5100c20d    	sub	w13, w16, #0x30
10000d728: 92401dad    	and	x13, x13, #0xff
10000d72c: 8b180b10    	add	x16, x24, x24, lsl #2
10000d730: 8b1005b0    	add	x16, x13, x16, lsl #1
10000d734: aa1003f8    	mov	x24, x16
10000d738: cb0c01cd    	sub	x13, x14, x12
10000d73c: cb0e0190    	sub	x16, x12, x14
10000d740: cb100163    	sub	x3, x11, x16
10000d744: aa0e03e2    	mov	x2, x14
10000d748: b50009e3    	cbnz	x3, 0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d74c: 14000007    	b	0x10000d768 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d750: aa0d03ee    	mov	x14, x13
10000d754: cb0c01cd    	sub	x13, x14, x12
10000d758: cb0e0190    	sub	x16, x12, x14
10000d75c: cb100163    	sub	x3, x11, x16
10000d760: aa0e03e2    	mov	x2, x14
10000d764: b5000903    	cbnz	x3, 0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d768: 39400228    	ldrb	w8, [x17]
10000d76c: 7100b51f    	cmp	w8, #0x2d
10000d770: 1a9f17e9    	cset	w9, eq
10000d774: cb09000a    	sub	x10, x0, x9
10000d778: f1000d5f    	cmp	x10, #0x3
10000d77c: 54ffe10b    	b.lt	0x10000d39c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d780: 8b090229    	add	x9, x17, x9
10000d784: 3940092a    	ldrb	w10, [x9, #0x2]
10000d788: 79400129    	ldrh	w9, [x9]
10000d78c: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d790: b203c129    	orr	x9, x9, #0x2020202020202020
10000d794: eb07013f    	cmp	x9, x7
10000d798: 54000160    	b.eq	0x10000d7c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4e8>
10000d79c: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d7a0: f28c2dca    	movk	x10, #0x616e
10000d7a4: f2a40dca    	movk	x10, #0x206e, lsl #16
10000d7a8: eb0a013f    	cmp	x9, x10
10000d7ac: 54ffdf81    	b.ne	0x10000d39c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d7b0: 7100b51f    	cmp	w8, #0x2d
10000d7b4: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000d7b8: 52800028    	mov	w8, #0x1                ; =1
10000d7bc: 3607df41    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d7c0: 17fffefa    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d7c4: 7100b51f    	cmp	w8, #0x2d
10000d7c8: 1e690d41    	fcsel	d1, d10, d9, eq
10000d7cc: 52800028    	mov	w8, #0x1                ; =1
10000d7d0: 3607dea1    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000d7d4: 17fffef5    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d7d8: 1b1b7dd0    	mul	w16, w14, w27
10000d7dc: 0b4e220e    	add	w14, w16, w14, lsr #8
10000d7e0: 12009dce    	and	w14, w14, #0xff00ff
10000d7e4: 52800030    	mov	w16, #0x1               ; =1
10000d7e8: 72a00c90    	movk	w16, #0x64, lsl #16
10000d7ec: 1b107dce    	mul	w14, w14, w16
10000d7f0: 53107dce    	lsr	w14, w14, #16
10000d7f4: 5284e210    	mov	w16, #0x2710            ; =10000
10000d7f8: 9b103b18    	madd	x24, x24, x16, x14
10000d7fc: 910011ad    	add	x13, x13, #0x4
10000d800: eb0f01bf    	cmp	x13, x15
10000d804: 54fff501    	b.ne	0x10000d6a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3c8>
10000d808: aa0d03ee    	mov	x14, x13
10000d80c: cb0c01ad    	sub	x13, x13, x12
10000d810: cb0e0190    	sub	x16, x12, x14
10000d814: cb100163    	sub	x3, x11, x16
10000d818: aa0e03e2    	mov	x2, x14
10000d81c: b5000343    	cbnz	x3, 0x10000d884 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5a8>
10000d820: 17ffffd2    	b	0x10000d768 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d824: 9b1e7f0e    	mul	x14, x24, x30
10000d828: 9b1b7e02    	mul	x2, x16, x27
10000d82c: 8b502050    	add	x16, x2, x16, lsr #8
10000d830: 92001e02    	and	x2, x16, #0xff000000ff
10000d834: 9b197c42    	mul	x2, x2, x25
10000d838: d350fe10    	lsr	x16, x16, #16
10000d83c: 92001e10    	and	x16, x16, #0xff000000ff
10000d840: 9b1a0a10    	madd	x16, x16, x26, x2
10000d844: 8b5081d8    	add	x24, x14, x16, lsr #32
10000d848: cb0d01ee    	sub	x14, x15, x13
10000d84c: f10021df    	cmp	x14, #0x8
10000d850: 54ffedeb    	b.lt	0x10000d60c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000d854: 17ffff75    	b	0x10000d628 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x34c>
10000d858: aa0b03f8    	mov	x24, x11
10000d85c: cb09010b    	sub	x11, x8, x9
10000d860: eb0f011f    	cmp	x8, x15
10000d864: 54ffe781    	b.ne	0x10000d554 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x278>
10000d868: d280000d    	mov	x13, #0x0               ; =0
10000d86c: d2800010    	mov	x16, #0x0               ; =0
10000d870: d280000c    	mov	x12, #0x0               ; =0
10000d874: d2800002    	mov	x2, #0x0                ; =0
10000d878: aa0803ee    	mov	x14, x8
10000d87c: aa0b03e3    	mov	x3, x11
10000d880: b4fff74b    	cbz	x11, 0x10000d768 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x48c>
10000d884: eb0f01df    	cmp	x14, x15
10000d888: 540005a0    	b.eq	0x10000d93c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d88c: 394001d1    	ldrb	w17, [x14]
10000d890: 321b0231    	orr	w17, w17, #0x20
10000d894: 7101963f    	cmp	w17, #0x65
10000d898: 54000521    	b.ne	0x10000d93c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d89c: 910005c0    	add	x0, x14, #0x1
10000d8a0: eb0f001f    	cmp	x0, x15
10000d8a4: 54000180    	b.eq	0x10000d8d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f8>
10000d8a8: 39400011    	ldrb	w17, [x0]
10000d8ac: 910009c4    	add	x4, x14, #0x2
10000d8b0: 7100ae3f    	cmp	w17, #0x2b
10000d8b4: 9a800080    	csel	x0, x4, x0, eq
10000d8b8: 7100b63f    	cmp	w17, #0x2d
10000d8bc: 52800031    	mov	w17, #0x1               ; =1
10000d8c0: 1a9113f1    	csel	w17, wzr, w17, ne
10000d8c4: 9a841000    	csel	x0, x0, x4, ne
10000d8c8: eb0f001f    	cmp	x0, x15
10000d8cc: 540000a1    	b.ne	0x10000d8e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x604>
10000d8d0: 1400001b    	b	0x10000d93c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d8d4: 52800011    	mov	w17, #0x0               ; =0
10000d8d8: eb0f001f    	cmp	x0, x15
10000d8dc: 54000300    	b.eq	0x10000d93c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d8e0: 39c00004    	ldrsb	w4, [x0]
10000d8e4: 5100c084    	sub	w4, w4, #0x30
10000d8e8: 7100249f    	cmp	w4, #0x9
10000d8ec: 54000288    	b.hi	0x10000d93c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d8f0: d280000e    	mov	x14, #0x0               ; =0
10000d8f4: 14000004    	b	0x10000d904 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x628>
10000d8f8: 91000400    	add	x0, x0, #0x1
10000d8fc: eb0f001f    	cmp	x0, x15
10000d900: 54000820    	b.eq	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000d904: 39c00004    	ldrsb	w4, [x0]
10000d908: 5100c085    	sub	w5, w4, #0x30
10000d90c: 710024bf    	cmp	w5, #0x9
10000d910: 540007a8    	b.hi	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x728>
10000d914: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d918: eb0501df    	cmp	x14, x5
10000d91c: 54fffeec    	b.gt	0x10000d8f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000d920: 12001c84    	and	w4, w4, #0xff
10000d924: 5100c084    	sub	w4, w4, #0x30
10000d928: 92401c84    	and	x4, x4, #0xff
10000d92c: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000d930: 8b050485    	add	x5, x4, x5, lsl #1
10000d934: aa0503ee    	mov	x14, x5
10000d938: 17fffff0    	b	0x10000d8f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x61c>
10000d93c: d2800011    	mov	x17, #0x0               ; =0
10000d940: f100507f    	cmp	x3, #0x14
10000d944: 540006cb    	b.lt	0x10000da1c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000d948: eb0f013f    	cmp	x9, x15
10000d94c: 54000200    	b.eq	0x10000d98c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6b0>
10000d950: aa0903e0    	mov	x0, x9
10000d954: 14000007    	b	0x10000d970 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x694>
10000d958: 7100c09f    	cmp	w4, #0x30
10000d95c: 1a9f17e4    	cset	w4, eq
10000d960: cb040063    	sub	x3, x3, x4
10000d964: 91000400    	add	x0, x0, #0x1
10000d968: eb0f001f    	cmp	x0, x15
10000d96c: 540000c0    	b.eq	0x10000d984 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a8>
10000d970: 39400004    	ldrb	w4, [x0]
10000d974: 7100c09f    	cmp	w4, #0x30
10000d978: 54ffff00    	b.eq	0x10000d958 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d97c: 7100b89f    	cmp	w4, #0x2e
10000d980: 54fffec0    	b.eq	0x10000d958 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d984: f100507f    	cmp	x3, #0x14
10000d988: 540004ab    	b.lt	0x10000da1c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x740>
10000d98c: eb08013f    	cmp	x9, x8
10000d990: 54000e20    	b.eq	0x10000db54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x878>
10000d994: d2800018    	mov	x24, #0x0               ; =0
10000d998: aa0903ef    	mov	x15, x9
10000d99c: 388015f0    	ldrsb	x16, [x15], #0x1
10000d9a0: 9b1b4310    	madd	x16, x24, x27, x16
10000d9a4: d100c218    	sub	x24, x16, #0x30
10000d9a8: eb17031f    	cmp	x24, x23
10000d9ac: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000d9b0: 54ffff61    	b.ne	0x10000d99c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6c0>
10000d9b4: d10006f0    	sub	x16, x23, #0x1
10000d9b8: eb10031f    	cmp	x24, x16
10000d9bc: 54000168    	b.hi	0x10000d9e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x70c>
10000d9c0: aa0c03ef    	mov	x15, x12
10000d9c4: eb02019f    	cmp	x12, x2
10000d9c8: 540000e0    	b.eq	0x10000d9e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x708>
10000d9cc: 388015e8    	ldrsb	x8, [x15], #0x1
10000d9d0: 9b1b2308    	madd	x8, x24, x27, x8
10000d9d4: d100c118    	sub	x24, x8, #0x30
10000d9d8: eb17031f    	cmp	x24, x23
10000d9dc: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000d9e0: 54ffff61    	b.ne	0x10000d9cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000d9e4: aa0c03e8    	mov	x8, x12
10000d9e8: cb0f0108    	sub	x8, x8, x15
10000d9ec: 8b110110    	add	x16, x8, x17
10000d9f0: 390013ff    	strb	wzr, [sp, #0x4]
10000d9f4: b90003ff    	str	wzr, [sp]
10000d9f8: 5280002f    	mov	w15, #0x1               ; =1
10000d9fc: b50003d8    	cbnz	x24, 0x10000da74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000da00: 14000045    	b	0x10000db14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000da04: 7100023f    	cmp	w17, #0x0
10000da08: da8e05d1    	cneg	x17, x14, ne
10000da0c: 8b100230    	add	x16, x17, x16
10000da10: aa0003ee    	mov	x14, x0
10000da14: f100507f    	cmp	x3, #0x14
10000da18: 54fff98a    	b.ge	0x10000d948 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000da1c: 390013ff    	strb	wzr, [sp, #0x4]
10000da20: b90003ff    	str	wzr, [sp]
10000da24: b50001f0    	cbnz	x16, 0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x784>
10000da28: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000da2c: eb08031f    	cmp	x24, x8
10000da30: 54000188    	b.hi	0x10000da60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x784>
10000da34: 9e630301    	ucvtf	d1, x24
10000da38: 1e614022    	fneg	d2, d1
10000da3c: 7100b79f    	cmp	w28, #0x2d
10000da40: 1e610c41    	fcsel	d1, d2, d1, eq
10000da44: 1e680da2    	fcsel	d2, d13, d8, eq
10000da48: f100031f    	cmp	x24, #0x0
10000da4c: 1e621c21    	fcsel	d1, d1, d2, ne
10000da50: 52800028    	mov	w8, #0x1                ; =1
10000da54: 2a0803e8    	mov	w8, w8
10000da58: 3607ca61    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000da5c: 17fffe53    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000da60: d1005e08    	sub	x8, x16, #0x17
10000da64: b100b51f    	cmn	x8, #0x2d
10000da68: 54000162    	b.hs	0x10000da94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b8>
10000da6c: 5280000f    	mov	w15, #0x0               ; =0
10000da70: b4000538    	cbz	x24, 0x10000db14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000da74: b1055a1f    	cmn	x16, #0x156
10000da78: 540004eb    	b.lt	0x10000db14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000da7c: f104d21f    	cmp	x16, #0x134
10000da80: 5400012d    	b.le	0x10000daa4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7c8>
10000da84: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000da88: d2800008    	mov	x8, #0x0                ; =0
10000da8c: 350004af    	cbnz	w15, 0x10000db20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000da90: 140000b3    	b	0x10000dd5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000da94: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000da98: eb08031f    	cmp	x24, x8
10000da9c: 54000669    	b.ls	0x10000db68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x88c>
10000daa0: 5280000f    	mov	w15, #0x0               ; =0
10000daa4: dac01300    	clz	x0, x24
10000daa8: 9ac02302    	lsl	x2, x24, x0
10000daac: 531f7a03    	lsl	w3, w16, #1
10000dab0: 110ab068    	add	w8, w3, #0x2ac
10000dab4: d0000185    	adrp	x5, 0x10003f000 <__ZL5Lhint+0x1050>
10000dab8: 911ae0a5    	add	x5, x5, #0x6b8
10000dabc: f86858b1    	ldr	x17, [x5, w8, uxtw #3]
10000dac0: 9b027e28    	mul	x8, x17, x2
10000dac4: 9bc27e31    	umulh	x17, x17, x2
10000dac8: 2a3103e4    	mvn	w4, w17
10000dacc: f240209f    	tst	x4, #0x1ff
10000dad0: 540000c1    	b.ne	0x10000dae8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x80c>
10000dad4: 110ab463    	add	w3, w3, #0x2ad
10000dad8: f86358a3    	ldr	x3, [x5, w3, uxtw #3]
10000dadc: 9bc27c62    	umulh	x2, x3, x2
10000dae0: ab080048    	adds	x8, x2, x8
10000dae4: 9a913631    	cinc	x17, x17, hs
10000dae8: d37ffe24    	lsr	x4, x17, #63
10000daec: 91002483    	add	x3, x4, #0x9
10000daf0: 9ac32622    	lsr	x2, x17, x3
10000daf4: 1b067e05    	mul	w5, w16, w6
10000daf8: 4b000080    	sub	w0, w4, w0
10000dafc: 0b854000    	add	w0, w0, w5, asr #16
10000db00: 1100fc00    	add	w0, w0, #0x3f
10000db04: 310ffc1f    	cmn	w0, #0x3ff
10000db08: 5400048c    	b.gt	0x10000db98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8bc>
10000db0c: 3110f41f    	cmn	w0, #0x43d
10000db10: 54000cc2    	b.hs	0x10000dca8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9cc>
10000db14: 52800011    	mov	w17, #0x0               ; =0
10000db18: d2800008    	mov	x8, #0x0                ; =0
10000db1c: 3400120f    	cbz	w15, 0x10000dd5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000db20: 52800002    	mov	w2, #0x0                ; =0
10000db24: d2800000    	mov	x0, #0x0                ; =0
10000db28: b1000704    	adds	x4, x24, #0x1
10000db2c: 54001102    	b.hs	0x10000dd4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000db30: b1055a1f    	cmn	x16, #0x156
10000db34: 540010cb    	b.lt	0x10000dd4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa70>
10000db38: f104d21f    	cmp	x16, #0x134
10000db3c: 5400066d    	b.le	0x10000dc08 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x92c>
10000db40: d2800000    	mov	x0, #0x0                ; =0
10000db44: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000db48: eb00011f    	cmp	x8, x0
10000db4c: 54001040    	b.eq	0x10000dd54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000db50: 140000a7    	b	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000db54: d2800018    	mov	x24, #0x0               ; =0
10000db58: aa0c03ef    	mov	x15, x12
10000db5c: eb02019f    	cmp	x12, x2
10000db60: 54fff361    	b.ne	0x10000d9cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6f0>
10000db64: 17ffffa0    	b	0x10000d9e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x708>
10000db68: 9e630301    	ucvtf	d1, x24
10000db6c: d0000188    	adrp	x8, 0x10003f000 <__ZL5Lhint+0x1050>
10000db70: 91174108    	add	x8, x8, #0x5d0
10000db74: b7f81130    	tbnz	x16, #0x3f, 0x10000dd98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xabc>
10000db78: fc707902    	ldr	d2, [x8, x16, lsl #3]
10000db7c: 1e610841    	fmul	d1, d2, d1
10000db80: 1e614022    	fneg	d2, d1
10000db84: 7100b79f    	cmp	w28, #0x2d
10000db88: 1e610c41    	fcsel	d1, d2, d1, eq
10000db8c: 52800028    	mov	w8, #0x1                ; =1
10000db90: 3607c0a1    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000db94: 17fffe05    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000db98: 92400444    	and	x4, x2, #0x3
10000db9c: 9ac32043    	lsl	x3, x2, x3
10000dba0: eb11007f    	cmp	x3, x17
10000dba4: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000dba8: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000dbac: 91001208    	add	x8, x16, #0x4
10000dbb0: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000dbb4: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000dbb8: 9a823108    	csel	x8, x8, x2, lo
10000dbbc: 92400111    	and	x17, x8, #0x1
10000dbc0: 8b080222    	add	x2, x17, x8
10000dbc4: ca080223    	eor	x3, x17, x8
10000dbc8: 8a080228    	and	x8, x17, x8
10000dbcc: 8b430508    	add	x8, x8, x3, lsr #1
10000dbd0: d376fc51    	lsr	x17, x2, #54
10000dbd4: f100023f    	cmp	x17, #0x0
10000dbd8: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000dbdc: 1a820442    	cinc	w2, w2, ne
10000dbe0: 0b000040    	add	w0, w2, w0
10000dbe4: 711ffc1f    	cmp	w0, #0x7ff
10000dbe8: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000dbec: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000dbf0: 8a110108    	and	x8, x8, x17
10000dbf4: 9a9f0108    	csel	x8, x8, xzr, eq
10000dbf8: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000dbfc: 1ad16c11    	umin	w17, w0, w17
10000dc00: 36000aef    	tbz	w15, #0x0, 0x10000dd5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000dc04: 17ffffc7    	b	0x10000db20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000dc08: dac01083    	clz	x3, x4
10000dc0c: 9ac32084    	lsl	x4, x4, x3
10000dc10: 531f7a05    	lsl	w5, w16, #1
10000dc14: 110ab0a0    	add	w0, w5, #0x2ac
10000dc18: d0000187    	adrp	x7, 0x10003f000 <__ZL5Lhint+0x1050>
10000dc1c: 911ae0e7    	add	x7, x7, #0x6b8
10000dc20: f86058e2    	ldr	x2, [x7, w0, uxtw #3]
10000dc24: 9b047c40    	mul	x0, x2, x4
10000dc28: 9bc47c42    	umulh	x2, x2, x4
10000dc2c: 2a2203e6    	mvn	w6, w2
10000dc30: f24020df    	tst	x6, #0x1ff
10000dc34: 540000c1    	b.ne	0x10000dc4c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x970>
10000dc38: 110ab4a5    	add	w5, w5, #0x2ad
10000dc3c: f86558e5    	ldr	x5, [x7, w5, uxtw #3]
10000dc40: 9bc47ca4    	umulh	x4, x5, x4
10000dc44: ab000080    	adds	x0, x4, x0
10000dc48: 9a823442    	cinc	x2, x2, hs
10000dc4c: d37ffc46    	lsr	x6, x2, #63
10000dc50: 910024c5    	add	x5, x6, #0x9
10000dc54: 9ac52444    	lsr	x4, x2, x5
10000dc58: 528a4d47    	mov	w7, #0x526a             ; =21098
10000dc5c: 72a00067    	movk	w7, #0x3, lsl #16
10000dc60: 1b077e07    	mul	w7, w16, w7
10000dc64: 4b0300c3    	sub	w3, w6, w3
10000dc68: 0b874063    	add	w3, w3, w7, asr #16
10000dc6c: 1100fc63    	add	w3, w3, #0x3f
10000dc70: 310ffc7f    	cmn	w3, #0x3ff
10000dc74: 540002ec    	b.gt	0x10000dcd0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f4>
10000dc78: 3110f47f    	cmn	w3, #0x43d
10000dc7c: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dc80: f28dcd27    	movk	x7, #0x6e69
10000dc84: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dc88: 540009a2    	b.hs	0x10000ddbc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xae0>
10000dc8c: d2800000    	mov	x0, #0x0                ; =0
10000dc90: 52800002    	mov	w2, #0x0                ; =0
10000dc94: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dc98: 72a00066    	movk	w6, #0x3, lsl #16
10000dc9c: eb00011f    	cmp	x8, x0
10000dca0: 540005a0    	b.eq	0x10000dd54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000dca4: 14000052    	b	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000dca8: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000dcac: 4b000108    	sub	w8, w8, w0
10000dcb0: 9ac82448    	lsr	x8, x2, x8
10000dcb4: 92400111    	and	x17, x8, #0x1
10000dcb8: 8b080231    	add	x17, x17, x8
10000dcbc: d341fe28    	lsr	x8, x17, #1
10000dcc0: f24b0e3f    	tst	x17, #0x1e0000000000000
10000dcc4: 1a9f07f1    	cset	w17, ne
10000dcc8: 3707f2cf    	tbnz	w15, #0x0, 0x10000db20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x844>
10000dccc: 14000024    	b	0x10000dd5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa80>
10000dcd0: 92400486    	and	x6, x4, #0x3
10000dcd4: 9ac52085    	lsl	x5, x4, x5
10000dcd8: eb0200bf    	cmp	x5, x2
10000dcdc: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000dce0: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000dce4: 91001200    	add	x0, x16, #0x4
10000dce8: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000dcec: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000dcf0: 9a843000    	csel	x0, x0, x4, lo
10000dcf4: 92400002    	and	x2, x0, #0x1
10000dcf8: 8b000044    	add	x4, x2, x0
10000dcfc: ca000045    	eor	x5, x2, x0
10000dd00: 8a000040    	and	x0, x2, x0
10000dd04: 8b450400    	add	x0, x0, x5, lsr #1
10000dd08: d376fc82    	lsr	x2, x4, #54
10000dd0c: f100005f    	cmp	x2, #0x0
10000dd10: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000dd14: 1a840484    	cinc	w4, w4, ne
10000dd18: 0b030083    	add	w3, w4, w3
10000dd1c: 711ffc7f    	cmp	w3, #0x7ff
10000dd20: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000dd24: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000dd28: 8a020000    	and	x0, x0, x2
10000dd2c: 9a9f0000    	csel	x0, x0, xzr, eq
10000dd30: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000dd34: 1ac26c62    	umin	w2, w3, w2
10000dd38: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dd3c: 72a00066    	movk	w6, #0x3, lsl #16
10000dd40: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000dd44: f28dcd27    	movk	x7, #0x6e69
10000dd48: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000dd4c: eb00011f    	cmp	x8, x0
10000dd50: 540004e1    	b.ne	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000dd54: 6b02023f    	cmp	w17, w2
10000dd58: 540004a1    	b.ne	0x10000ddec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb10>
10000dd5c: 2a1103e2    	mov	w2, w17
10000dd60: 7100b79f    	cmp	w28, #0x2d
10000dd64: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000dd68: 9a9f0129    	csel	x9, x9, xzr, eq
10000dd6c: aa02d129    	orr	x9, x9, x2, lsl #52
10000dd70: aa080129    	orr	x9, x9, x8
10000dd74: 9e670121    	fmov	d1, x9
10000dd78: f100011f    	cmp	x8, #0x0
10000dd7c: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000dd80: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000dd84: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000dd88: 7a480044    	ccmp	w2, w8, #0x4, eq
10000dd8c: 1a9f07e8    	cset	w8, ne
10000dd90: 3607b0a1    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000dd94: 17fffd85    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000dd98: cb100d08    	sub	x8, x8, x16, lsl #3
10000dd9c: fd400102    	ldr	d2, [x8]
10000dda0: 1e621821    	fdiv	d1, d1, d2
10000dda4: 1e614022    	fneg	d2, d1
10000dda8: 7100b79f    	cmp	w28, #0x2d
10000ddac: 1e610c41    	fcsel	d1, d2, d1, eq
10000ddb0: 52800028    	mov	w8, #0x1                ; =1
10000ddb4: 3607af81    	tbz	w1, #0x0, 0x10000d3a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc8>
10000ddb8: 17fffd7c    	b	0x10000d3a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000ddbc: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000ddc0: 4b030000    	sub	w0, w0, w3
10000ddc4: 9ac02480    	lsr	x0, x4, x0
10000ddc8: 92400002    	and	x2, x0, #0x1
10000ddcc: 8b000042    	add	x2, x2, x0
10000ddd0: d341fc40    	lsr	x0, x2, #1
10000ddd4: f24b0c5f    	tst	x2, #0x1e0000000000000
10000ddd8: 1a9f07e2    	cset	w2, ne
10000dddc: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dde0: 72a00066    	movk	w6, #0x3, lsl #16
10000dde4: eb00011f    	cmp	x8, x0
10000dde8: 54fffb60    	b.eq	0x10000dd54 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa78>
10000ddec: dac01311    	clz	x17, x24
10000ddf0: 9ad12300    	lsl	x0, x24, x17
10000ddf4: 531f7a02    	lsl	w2, w16, #1
10000ddf8: 110ab048    	add	w8, w2, #0x2ac
10000ddfc: d0000183    	adrp	x3, 0x10003f000 <__ZL5Lhint+0x1050>
10000de00: 911ae063    	add	x3, x3, #0x6b8
10000de04: f868d863    	ldr	x3, [x3, w8, sxtw #3]
10000de08: 9bc07c68    	umulh	x8, x3, x0
10000de0c: 2a2803e4    	mvn	w4, w8
10000de10: f240209f    	tst	x4, #0x1ff
10000de14: 54000121    	b.ne	0x10000de38 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb5c>
10000de18: 9b007c63    	mul	x3, x3, x0
10000de1c: 110ab442    	add	w2, w2, #0x2ad
10000de20: d0000184    	adrp	x4, 0x10003f000 <__ZL5Lhint+0x1050>
10000de24: 911ae084    	add	x4, x4, #0x6b8
10000de28: f862d882    	ldr	x2, [x4, w2, sxtw #3]
10000de2c: 9bc07c40    	umulh	x0, x2, x0
10000de30: ab03001f    	cmn	x0, x3
10000de34: 9a883508    	cinc	x8, x8, hs
10000de38: d37ffd00    	lsr	x0, x8, #63
10000de3c: 52000000    	eor	w0, w0, #0x1
10000de40: 9ac02108    	lsl	x8, x8, x0
10000de44: 1b067e02    	mul	w2, w16, w6
10000de48: 13107c42    	asr	w2, w2, #16
10000de4c: 4b110051    	sub	w17, w2, w17
10000de50: 4b000231    	sub	w17, w17, w0
10000de54: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000de58: 2b000222    	adds	w2, w17, w0
10000de5c: 54fff825    	b.pl	0x10000dd60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa84>
10000de60: a900e3f0    	stp	x16, x24, [sp, #0x8]
10000de64: f9000fee    	str	x14, [sp, #0x18]
10000de68: 390083ea    	strb	w10, [sp, #0x20]
10000de6c: 5280002a    	mov	w10, #0x1               ; =1
10000de70: 390087ea    	strb	w10, [sp, #0x21]
10000de74: 39008bef    	strb	w15, [sp, #0x22]
10000de78: b94003ea    	ldr	w10, [sp]
10000de7c: 910023ee    	add	x14, sp, #0x8
10000de80: b801b1ca    	stur	w10, [x14, #0x1b]
10000de84: 394013ea    	ldrb	w10, [sp, #0x4]
10000de88: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000de8c: a902afe9    	stp	x9, x11, [sp, #0x28]
10000de90: a903b7ec    	stp	x12, x13, [sp, #0x38]
10000de94: f90027ff    	str	xzr, [sp, #0x48]
10000de98: 910023e0    	add	x0, sp, #0x8
10000de9c: aa1903fa    	mov	x26, x25
10000dea0: aa0103f9    	mov	x25, x1
10000dea4: aa0803e1    	mov	x1, x8
10000dea8: 52800023    	mov	w3, #0x1                ; =1
10000deac: 4ea01c0e    	mov.16b	v14, v0
10000deb0: aa0703f5    	mov	x21, x7
10000deb4: 94001512    	bl	0x1000132fc <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000deb8: aa1503e7    	mov	x7, x21
10000debc: b202d7f5    	mov	x21, #-0x3030303030303031 ; =-3472328296227680305
10000dec0: f299fa15    	movk	x21, #0xcfd0
10000dec4: 528a4d46    	mov	w6, #0x526a             ; =21098
10000dec8: 72a00066    	movk	w6, #0x3, lsl #16
10000decc: 529c201e    	mov	w30, #0xe100            ; =57600
10000ded0: 72a0bebe    	movk	w30, #0x5f5, lsl #16
10000ded4: 4eae1dc0    	mov.16b	v0, v14
10000ded8: aa0003e8    	mov	x8, x0
10000dedc: aa0103e2    	mov	x2, x1
10000dee0: aa1903e1    	mov	x1, x25
10000dee4: aa1a03f9    	mov	x25, x26
10000dee8: d280003a    	mov	x26, #0x1               ; =1
10000deec: f2c4e21a    	movk	x26, #0x2710, lsl #32
10000def0: 17ffff9c    	b	0x10000dd60 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa84>
10000def4: 6f00e400    	movi.2d	v0, #0000000000000000
10000def8: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000defc: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000df00: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000df04: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000df08: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000df0c: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000df10: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000df14: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000df18: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000df1c: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000df20: 9103c3ff    	add	sp, sp, #0xf0
10000df24: d65f03c0    	ret
10000df28: 52800200    	mov	w0, #0x10               ; =16
10000df2c: 9400b477    	bl	0x10003b108 <_strtod_l+0x10003b108>
10000df30: aa0003f3    	mov	x19, x0
10000df34: b00001e1    	adrp	x1, 0x10004a000 <GCC_except_table251+0x14>
10000df38: 9128b421    	add	x1, x1, #0xa2d
10000df3c: 9400b3f2    	bl	0x10003af04 <_strtod_l+0x10003af04>
10000df40: aa1303e0    	mov	x0, x19
10000df44: 9400b39d    	bl	0x10003adb8 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000df48: aa0003f4    	mov	x20, x0
10000df4c: aa1303e0    	mov	x0, x19
10000df50: 9400b47d    	bl	0x10003b144 <_strtod_l+0x10003b144>
10000df54: aa1403e0    	mov	x0, x20
10000df58: 9400b3b8    	bl	0x10003ae38 <_strtod_l+0x10003ae38>
