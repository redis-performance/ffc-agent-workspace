
simple_fastfloat_benchmark/build/m6-scan-compact/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000cbb0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000cbb0: d103c3ff    	sub	sp, sp, #0xf0
10000cbb4: 6d053bef    	stp	d15, d14, [sp, #0x50]
10000cbb8: 6d0633ed    	stp	d13, d12, [sp, #0x60]
10000cbbc: 6d072beb    	stp	d11, d10, [sp, #0x70]
10000cbc0: 6d0823e9    	stp	d9, d8, [sp, #0x80]
10000cbc4: a9096ffc    	stp	x28, x27, [sp, #0x90]
10000cbc8: a90a67fa    	stp	x26, x25, [sp, #0xa0]
10000cbcc: a90b5ff8    	stp	x24, x23, [sp, #0xb0]
10000cbd0: a90c57f6    	stp	x22, x21, [sp, #0xc0]
10000cbd4: a90d4ff4    	stp	x20, x19, [sp, #0xd0]
10000cbd8: a90e7bfd    	stp	x29, x30, [sp, #0xe0]
10000cbdc: 910383fd    	add	x29, sp, #0xe0
10000cbe0: a9405013    	ldp	x19, x20, [x0]
10000cbe4: eb14027f    	cmp	x19, x20
10000cbe8: 540058c0    	b.eq	0x10000d700 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb50>
10000cbec: d2b4ec95    	mov	x21, #0xa7640000        ; =2808348672
10000cbf0: f2d6d675    	movk	x21, #0xb6b3, lsl #32
10000cbf4: f2e1bc15    	movk	x21, #0xde0, lsl #48
10000cbf8: 528a4d56    	mov	w22, #0x526a            ; =21098
10000cbfc: 72a00076    	movk	w22, #0x3, lsl #16
10000cc00: 6f00e408    	movi.2d	v8, #0000000000000000
10000cc04: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000cc08: f28dcd27    	movk	x7, #0x6e69
10000cc0c: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000cc10: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000cc14: 9e670109    	fmov	d9, x8
10000cc18: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000cc1c: 9e67010a    	fmov	d10, x8
10000cc20: b203c3f8    	mov	x24, #0x2020202020202020 ; =2314885530818453536
10000cc24: f28c2dd8    	movk	x24, #0x616e
10000cc28: f2a40dd8    	movk	x24, #0x206e, lsl #16
10000cc2c: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000cc30: 9e67010b    	fmov	d11, x8
10000cc34: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000cc38: 9e67010c    	fmov	d12, x8
10000cc3c: 5280015a    	mov	w26, #0xa               ; =10
10000cc40: d0000197    	adrp	x23, 0x10003e000 <__ZL5Lhint+0x840>
10000cc44: 913b22f7    	add	x23, x23, #0xec8
10000cc48: 52800026    	mov	w6, #0x1                ; =1
10000cc4c: 5280fffe    	mov	w30, #0x7ff             ; =2047
10000cc50: d2f00019    	mov	x25, #-0x8000000000000000 ; =-9223372036854775808
10000cc54: 9e67032d    	fmov	d13, x25
10000cc58: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000cc5c: b202e084    	orr	x4, x4, #0x4444444444444444
10000cc60: 6f00e400    	movi.2d	v0, #0000000000000000
10000cc64: 14000009    	b	0x10000cc88 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xd8>
10000cc68: 52800008    	mov	w8, #0x0                ; =0
10000cc6c: 37000041    	tbnz	w1, #0x0, 0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000cc70: 36005628    	tbz	w8, #0x0, 0x10000d734 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb84>
10000cc74: 1e612000    	fcmp	d0, d1
10000cc78: 1e61cc00    	fcsel	d0, d0, d1, gt
10000cc7c: 91006273    	add	x19, x19, #0x18
10000cc80: eb14027f    	cmp	x19, x20
10000cc84: 54005400    	b.eq	0x10000d704 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb54>
10000cc88: 39805e60    	ldrsb	x0, [x19, #0x17]
10000cc8c: b7f800a0    	tbnz	x0, #0x3f, 0x10000cca0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xf0>
10000cc90: aa1303f1    	mov	x17, x19
10000cc94: 6f00e401    	movi.2d	v1, #0000000000000000
10000cc98: b50000a0    	cbnz	x0, 0x10000ccac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xfc>
10000cc9c: 17fffff3    	b	0x10000cc68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb8>
10000cca0: a9400271    	ldp	x17, x0, [x19]
10000cca4: 6f00e401    	movi.2d	v1, #0000000000000000
10000cca8: b4fffe00    	cbz	x0, 0x10000cc68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb8>
10000ccac: 3940023b    	ldrb	w27, [x17]
10000ccb0: aa1b03eb    	mov	x11, x27
10000ccb4: aa1103e9    	mov	x9, x17
10000ccb8: 7100b77f    	cmp	w27, #0x2d
10000ccbc: 1a9f17ea    	cset	w10, eq
10000ccc0: 54000161    	b.ne	0x10000ccec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x13c>
10000ccc4: f100041f    	cmp	x0, #0x1
10000ccc8: 54001720    	b.eq	0x10000cfac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3fc>
10000cccc: aa1103e9    	mov	x9, x17
10000ccd0: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000ccd4: 12001d0b    	and	w11, w8, #0xff
10000ccd8: 7100b91f    	cmp	w8, #0x2e
10000ccdc: 54000080    	b.eq	0x10000ccec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x13c>
10000cce0: 5100c108    	sub	w8, w8, #0x30
10000cce4: 7100251f    	cmp	w8, #0x9
10000cce8: 54001628    	b.hi	0x10000cfac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3fc>
10000ccec: 8b000230    	add	x16, x17, x0
10000ccf0: eb10013f    	cmp	x9, x16
10000ccf4: 540008c0    	b.eq	0x10000ce0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x25c>
10000ccf8: 13001d68    	sxtb	w8, w11
10000ccfc: 5100c108    	sub	w8, w8, #0x30
10000cd00: 7100251f    	cmp	w8, #0x9
10000cd04: 54000848    	b.hi	0x10000ce0c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x25c>
10000cd08: 91000528    	add	x8, x9, #0x1
10000cd0c: 93401d6b    	sxtb	x11, w11
10000cd10: d100c17c    	sub	x28, x11, #0x30
10000cd14: eb10011f    	cmp	x8, x16
10000cd18: 540007e0    	b.eq	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd1c: 39c0010b    	ldrsb	w11, [x8]
10000cd20: 5100c16c    	sub	w12, w11, #0x30
10000cd24: 7100259f    	cmp	w12, #0x9
10000cd28: 54000768    	b.hi	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd2c: 93407d6b    	sxtw	x11, w11
10000cd30: 91000928    	add	x8, x9, #0x2
10000cd34: d100c16b    	sub	x11, x11, #0x30
10000cd38: aa1c03ec    	mov	x12, x28
10000cd3c: 8b0c099c    	add	x28, x12, x12, lsl #2
10000cd40: 8b1c057c    	add	x28, x11, x28, lsl #1
10000cd44: eb10011f    	cmp	x8, x16
10000cd48: 54000660    	b.eq	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd4c: 39c0010b    	ldrsb	w11, [x8]
10000cd50: 5100c16c    	sub	w12, w11, #0x30
10000cd54: 7100259f    	cmp	w12, #0x9
10000cd58: 540005e8    	b.hi	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd5c: 93407d6b    	sxtw	x11, w11
10000cd60: 91000d28    	add	x8, x9, #0x3
10000cd64: d100c16b    	sub	x11, x11, #0x30
10000cd68: aa1c03ec    	mov	x12, x28
10000cd6c: 8b0c099c    	add	x28, x12, x12, lsl #2
10000cd70: 8b1c057c    	add	x28, x11, x28, lsl #1
10000cd74: eb10011f    	cmp	x8, x16
10000cd78: 540004e0    	b.eq	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd7c: 39c0010b    	ldrsb	w11, [x8]
10000cd80: 5100c16c    	sub	w12, w11, #0x30
10000cd84: 7100259f    	cmp	w12, #0x9
10000cd88: 54000468    	b.hi	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cd8c: 93407d6b    	sxtw	x11, w11
10000cd90: 91001128    	add	x8, x9, #0x4
10000cd94: d100c16b    	sub	x11, x11, #0x30
10000cd98: aa1c03ec    	mov	x12, x28
10000cd9c: 8b0c099c    	add	x28, x12, x12, lsl #2
10000cda0: 8b1c057c    	add	x28, x11, x28, lsl #1
10000cda4: eb10011f    	cmp	x8, x16
10000cda8: 54000360    	b.eq	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cdac: 39c0010b    	ldrsb	w11, [x8]
10000cdb0: 5100c16c    	sub	w12, w11, #0x30
10000cdb4: 7100259f    	cmp	w12, #0x9
10000cdb8: 540002e8    	b.hi	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000cdbc: 93407d6b    	sxtw	x11, w11
10000cdc0: 91001528    	add	x8, x9, #0x5
10000cdc4: d100c16c    	sub	x12, x11, #0x30
10000cdc8: 8b1c0b8b    	add	x11, x28, x28, lsl #2
10000cdcc: 8b0b058b    	add	x11, x12, x11, lsl #1
10000cdd0: eb10011f    	cmp	x8, x16
10000cdd4: 54001440    	b.eq	0x10000d05c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4ac>
10000cdd8: 39c0010c    	ldrsb	w12, [x8]
10000cddc: 5100c18d    	sub	w13, w12, #0x30
10000cde0: 710025bf    	cmp	w13, #0x9
10000cde4: 540013c8    	b.hi	0x10000d05c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4ac>
10000cde8: 93407d8c    	sxtw	x12, w12
10000cdec: d100c18c    	sub	x12, x12, #0x30
10000cdf0: 8b0b097c    	add	x28, x11, x11, lsl #2
10000cdf4: 8b1c059c    	add	x28, x12, x28, lsl #1
10000cdf8: 91000508    	add	x8, x8, #0x1
10000cdfc: aa1c03eb    	mov	x11, x28
10000ce00: eb10011f    	cmp	x8, x16
10000ce04: 54fffea1    	b.ne	0x10000cdd8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x228>
10000ce08: 14000003    	b	0x10000ce14 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x264>
10000ce0c: d280001c    	mov	x28, #0x0               ; =0
10000ce10: aa0903e8    	mov	x8, x9
10000ce14: cb09010b    	sub	x11, x8, x9
10000ce18: eb10011f    	cmp	x8, x16
10000ce1c: 54001280    	b.eq	0x10000d06c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000ce20: 3940010c    	ldrb	w12, [x8]
10000ce24: 7100b99f    	cmp	w12, #0x2e
10000ce28: 54001221    	b.ne	0x10000d06c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000ce2c: 9100050c    	add	x12, x8, #0x1
10000ce30: cb0c020e    	sub	x14, x16, x12
10000ce34: aa0c03ed    	mov	x13, x12
10000ce38: f10021df    	cmp	x14, #0x8
10000ce3c: 540003ab    	b.lt	0x10000ceb0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x300>
10000ce40: f94001af    	ldr	x15, [x13]
10000ce44: 8b0401e2    	add	x2, x15, x4
10000ce48: b202d7e3    	mov	x3, #-0x3030303030303031 ; =-3472328296227680305
10000ce4c: f299fa03    	movk	x3, #0xcfd0
10000ce50: 8b0301ef    	add	x15, x15, x3
10000ce54: aa0f0042    	orr	x2, x2, x15
10000ce58: f201c05f    	tst	x2, #0x8080808080808080
10000ce5c: 540002a1    	b.ne	0x10000ceb0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x300>
10000ce60: 529c2002    	mov	w2, #0xe100             ; =57600
10000ce64: 72a0bea2    	movk	w2, #0x5f5, lsl #16
10000ce68: 9b027f82    	mul	x2, x28, x2
10000ce6c: 9b1a7de3    	mul	x3, x15, x26
10000ce70: 8b4f206f    	add	x15, x3, x15, lsr #8
10000ce74: 92001de3    	and	x3, x15, #0xff000000ff
10000ce78: d2800c85    	mov	x5, #0x64               ; =100
10000ce7c: f2c84805    	movk	x5, #0x4240, lsl #32
10000ce80: f2e001e5    	movk	x5, #0xf, lsl #48
10000ce84: 9b057c63    	mul	x3, x3, x5
10000ce88: d350fdef    	lsr	x15, x15, #16
10000ce8c: 92001def    	and	x15, x15, #0xff000000ff
10000ce90: d2800025    	mov	x5, #0x1                ; =1
10000ce94: f2c4e205    	movk	x5, #0x2710, lsl #32
10000ce98: 9b050def    	madd	x15, x15, x5, x3
10000ce9c: 8b4f805c    	add	x28, x2, x15, lsr #32
10000cea0: 910021ad    	add	x13, x13, #0x8
10000cea4: d10021ce    	sub	x14, x14, #0x8
10000cea8: f1001ddf    	cmp	x14, #0x7
10000ceac: 54fffcac    	b.gt	0x10000ce40 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x290>
10000ceb0: f10011df    	cmp	x14, #0x4
10000ceb4: 5400016b    	b.lt	0x10000cee0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x330>
10000ceb8: b94001ae    	ldr	w14, [x13]
10000cebc: 5288c8cf    	mov	w15, #0x4646            ; =17990
10000cec0: 72a8c8cf    	movk	w15, #0x4646, lsl #16
10000cec4: 0b0f01cf    	add	w15, w14, w15
10000cec8: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000cecc: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000ced0: 0b0201ce    	add	w14, w14, w2
10000ced4: 2a0e01ef    	orr	w15, w15, w14
10000ced8: 7201c1ff    	tst	w15, #0x80808080
10000cedc: 540009a0    	b.eq	0x10000d010 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x460>
10000cee0: eb1001bf    	cmp	x13, x16
10000cee4: 54000ae0    	b.eq	0x10000d040 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x490>
10000cee8: 39c001ae    	ldrsb	w14, [x13]
10000ceec: 5100c1cf    	sub	w15, w14, #0x30
10000cef0: 710025ff    	cmp	w15, #0x9
10000cef4: 54000508    	b.hi	0x10000cf94 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3e4>
10000cef8: 12001dcf    	and	w15, w14, #0xff
10000cefc: 910005ae    	add	x14, x13, #0x1
10000cf00: 5100c1ef    	sub	w15, w15, #0x30
10000cf04: 92401def    	and	x15, x15, #0xff
10000cf08: aa1c03e2    	mov	x2, x28
10000cf0c: 8b02085c    	add	x28, x2, x2, lsl #2
10000cf10: 8b1c05fc    	add	x28, x15, x28, lsl #1
10000cf14: eb1001df    	cmp	x14, x16
10000cf18: 54000400    	b.eq	0x10000cf98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3e8>
10000cf1c: 39c001cf    	ldrsb	w15, [x14]
10000cf20: 5100c1e2    	sub	w2, w15, #0x30
10000cf24: 7100245f    	cmp	w2, #0x9
10000cf28: 54000388    	b.hi	0x10000cf98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3e8>
10000cf2c: 12001def    	and	w15, w15, #0xff
10000cf30: 910009ae    	add	x14, x13, #0x2
10000cf34: 5100c1ef    	sub	w15, w15, #0x30
10000cf38: 92401def    	and	x15, x15, #0xff
10000cf3c: aa1c03e2    	mov	x2, x28
10000cf40: 8b02085c    	add	x28, x2, x2, lsl #2
10000cf44: 8b1c05fc    	add	x28, x15, x28, lsl #1
10000cf48: eb1001df    	cmp	x14, x16
10000cf4c: 54000260    	b.eq	0x10000cf98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3e8>
10000cf50: 39c001cf    	ldrsb	w15, [x14]
10000cf54: 5100c1e2    	sub	w2, w15, #0x30
10000cf58: 7100245f    	cmp	w2, #0x9
10000cf5c: 540001e8    	b.hi	0x10000cf98 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3e8>
10000cf60: 12001def    	and	w15, w15, #0xff
10000cf64: 91000dae    	add	x14, x13, #0x3
10000cf68: 5100c1ed    	sub	w13, w15, #0x30
10000cf6c: 92401dad    	and	x13, x13, #0xff
10000cf70: 8b1c0b8f    	add	x15, x28, x28, lsl #2
10000cf74: 8b0f05af    	add	x15, x13, x15, lsl #1
10000cf78: aa0f03fc    	mov	x28, x15
10000cf7c: cb0c01cd    	sub	x13, x14, x12
10000cf80: cb0e018f    	sub	x15, x12, x14
10000cf84: cb0f0163    	sub	x3, x11, x15
10000cf88: aa0e03e2    	mov	x2, x14
10000cf8c: b50007e3    	cbnz	x3, 0x10000d088 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4d8>
10000cf90: 14000007    	b	0x10000cfac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3fc>
10000cf94: aa0d03ee    	mov	x14, x13
10000cf98: cb0c01cd    	sub	x13, x14, x12
10000cf9c: cb0e018f    	sub	x15, x12, x14
10000cfa0: cb0f0163    	sub	x3, x11, x15
10000cfa4: aa0e03e2    	mov	x2, x14
10000cfa8: b5000703    	cbnz	x3, 0x10000d088 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4d8>
10000cfac: 39400228    	ldrb	w8, [x17]
10000cfb0: 7100b51f    	cmp	w8, #0x2d
10000cfb4: 1a9f17e9    	cset	w9, eq
10000cfb8: cb09000a    	sub	x10, x0, x9
10000cfbc: f1000d5f    	cmp	x10, #0x3
10000cfc0: 54ffe54b    	b.lt	0x10000cc68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb8>
10000cfc4: 8b090229    	add	x9, x17, x9
10000cfc8: 3940092a    	ldrb	w10, [x9, #0x2]
10000cfcc: 79400129    	ldrh	w9, [x9]
10000cfd0: aa0a4129    	orr	x9, x9, x10, lsl #16
10000cfd4: b203c129    	orr	x9, x9, #0x2020202020202020
10000cfd8: eb07013f    	cmp	x9, x7
10000cfdc: 54000100    	b.eq	0x10000cffc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x44c>
10000cfe0: eb18013f    	cmp	x9, x24
10000cfe4: 54ffe421    	b.ne	0x10000cc68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb8>
10000cfe8: 7100b51f    	cmp	w8, #0x2d
10000cfec: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000cff0: 52800028    	mov	w8, #0x1                ; =1
10000cff4: 3607e3e1    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000cff8: 17ffff1f    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000cffc: 7100b51f    	cmp	w8, #0x2d
10000d000: 1e690d41    	fcsel	d1, d10, d9, eq
10000d004: 52800028    	mov	w8, #0x1                ; =1
10000d008: 3607e341    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d00c: 17ffff1a    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000d010: 1b1a7dcf    	mul	w15, w14, w26
10000d014: 0b4e21ee    	add	w14, w15, w14, lsr #8
10000d018: 12009dce    	and	w14, w14, #0xff00ff
10000d01c: 5280002f    	mov	w15, #0x1               ; =1
10000d020: 72a00c8f    	movk	w15, #0x64, lsl #16
10000d024: 1b0f7dce    	mul	w14, w14, w15
10000d028: 53107dce    	lsr	w14, w14, #16
10000d02c: 5284e20f    	mov	w15, #0x2710            ; =10000
10000d030: 9b0f3b9c    	madd	x28, x28, x15, x14
10000d034: 910011ad    	add	x13, x13, #0x4
10000d038: eb1001bf    	cmp	x13, x16
10000d03c: 54fff561    	b.ne	0x10000cee8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x338>
10000d040: aa0d03ee    	mov	x14, x13
10000d044: cb0c01ad    	sub	x13, x13, x12
10000d048: cb0e018f    	sub	x15, x12, x14
10000d04c: cb0f0163    	sub	x3, x11, x15
10000d050: aa0e03e2    	mov	x2, x14
10000d054: b50001a3    	cbnz	x3, 0x10000d088 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4d8>
10000d058: 17ffffd5    	b	0x10000cfac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3fc>
10000d05c: aa0b03fc    	mov	x28, x11
10000d060: cb09010b    	sub	x11, x8, x9
10000d064: eb10011f    	cmp	x8, x16
10000d068: 54ffedc1    	b.ne	0x10000ce20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x270>
10000d06c: d280000d    	mov	x13, #0x0               ; =0
10000d070: d280000f    	mov	x15, #0x0               ; =0
10000d074: d280000c    	mov	x12, #0x0               ; =0
10000d078: d2800002    	mov	x2, #0x0                ; =0
10000d07c: aa0803ee    	mov	x14, x8
10000d080: aa0b03e3    	mov	x3, x11
10000d084: b4fff94b    	cbz	x11, 0x10000cfac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3fc>
10000d088: eb1001df    	cmp	x14, x16
10000d08c: 54000240    	b.eq	0x10000d0d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x524>
10000d090: 394001d1    	ldrb	w17, [x14]
10000d094: 321b0231    	orr	w17, w17, #0x20
10000d098: 7101963f    	cmp	w17, #0x65
10000d09c: 540001c1    	b.ne	0x10000d0d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x524>
10000d0a0: 910005c0    	add	x0, x14, #0x1
10000d0a4: eb10001f    	cmp	x0, x16
10000d0a8: 540001e0    	b.eq	0x10000d0e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x534>
10000d0ac: 39400011    	ldrb	w17, [x0]
10000d0b0: 910009c4    	add	x4, x14, #0x2
10000d0b4: 7100ae3f    	cmp	w17, #0x2b
10000d0b8: 9a800080    	csel	x0, x4, x0, eq
10000d0bc: 7100b63f    	cmp	w17, #0x2d
10000d0c0: 1a8613f1    	csel	w17, wzr, w6, ne
10000d0c4: 9a841000    	csel	x0, x0, x4, ne
10000d0c8: eb10001f    	cmp	x0, x16
10000d0cc: 54000121    	b.ne	0x10000d0f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x540>
10000d0d0: 1400001f    	b	0x10000d14c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x59c>
10000d0d4: d2800011    	mov	x17, #0x0               ; =0
10000d0d8: f100507f    	cmp	x3, #0x14
10000d0dc: 5400054a    	b.ge	0x10000d184 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5d4>
10000d0e0: 1400005a    	b	0x10000d248 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x698>
10000d0e4: 52800011    	mov	w17, #0x0               ; =0
10000d0e8: eb10001f    	cmp	x0, x16
10000d0ec: 54000300    	b.eq	0x10000d14c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x59c>
10000d0f0: 39c00004    	ldrsb	w4, [x0]
10000d0f4: 5100c084    	sub	w4, w4, #0x30
10000d0f8: 7100249f    	cmp	w4, #0x9
10000d0fc: 54000288    	b.hi	0x10000d14c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x59c>
10000d100: d280000e    	mov	x14, #0x0               ; =0
10000d104: 14000004    	b	0x10000d114 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x564>
10000d108: 91000400    	add	x0, x0, #0x1
10000d10c: eb10001f    	cmp	x0, x16
10000d110: 540002a0    	b.eq	0x10000d164 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d114: 39c00004    	ldrsb	w4, [x0]
10000d118: 5100c085    	sub	w5, w4, #0x30
10000d11c: 710024bf    	cmp	w5, #0x9
10000d120: 54000228    	b.hi	0x10000d164 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d124: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d128: eb0501df    	cmp	x14, x5
10000d12c: 54fffeec    	b.gt	0x10000d108 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x558>
10000d130: 12001c84    	and	w4, w4, #0xff
10000d134: 5100c084    	sub	w4, w4, #0x30
10000d138: 92401c84    	and	x4, x4, #0xff
10000d13c: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000d140: 8b050485    	add	x5, x4, x5, lsl #1
10000d144: aa0503ee    	mov	x14, x5
10000d148: 17fffff0    	b	0x10000d108 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x558>
10000d14c: d2800011    	mov	x17, #0x0               ; =0
10000d150: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d154: b202e084    	orr	x4, x4, #0x4444444444444444
10000d158: f100507f    	cmp	x3, #0x14
10000d15c: 5400014a    	b.ge	0x10000d184 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5d4>
10000d160: 1400003a    	b	0x10000d248 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x698>
10000d164: 7100023f    	cmp	w17, #0x0
10000d168: da8e05d1    	cneg	x17, x14, ne
10000d16c: 8b0f022f    	add	x15, x17, x15
10000d170: aa0003ee    	mov	x14, x0
10000d174: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d178: b202e084    	orr	x4, x4, #0x4444444444444444
10000d17c: f100507f    	cmp	x3, #0x14
10000d180: 5400064b    	b.lt	0x10000d248 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x698>
10000d184: eb10013f    	cmp	x9, x16
10000d188: 54000240    	b.eq	0x10000d1d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x620>
10000d18c: aa0903e0    	mov	x0, x9
10000d190: 14000007    	b	0x10000d1ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5fc>
10000d194: 7100c09f    	cmp	w4, #0x30
10000d198: 1a9f17e4    	cset	w4, eq
10000d19c: cb040063    	sub	x3, x3, x4
10000d1a0: 91000400    	add	x0, x0, #0x1
10000d1a4: eb10001f    	cmp	x0, x16
10000d1a8: 540000c0    	b.eq	0x10000d1c0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x610>
10000d1ac: 39400004    	ldrb	w4, [x0]
10000d1b0: 7100c09f    	cmp	w4, #0x30
10000d1b4: 54ffff00    	b.eq	0x10000d194 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e4>
10000d1b8: 7100b89f    	cmp	w4, #0x2e
10000d1bc: 54fffec0    	b.eq	0x10000d194 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e4>
10000d1c0: f100507f    	cmp	x3, #0x14
10000d1c4: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d1c8: b202e084    	orr	x4, x4, #0x4444444444444444
10000d1cc: 540003eb    	b.lt	0x10000d248 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x698>
10000d1d0: eb08013f    	cmp	x9, x8
10000d1d4: 54000e20    	b.eq	0x10000d398 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7e8>
10000d1d8: d280001c    	mov	x28, #0x0               ; =0
10000d1dc: aa0903ef    	mov	x15, x9
10000d1e0: 388015f0    	ldrsb	x16, [x15], #0x1
10000d1e4: 9b1a4390    	madd	x16, x28, x26, x16
10000d1e8: d100c21c    	sub	x28, x16, #0x30
10000d1ec: eb15039f    	cmp	x28, x21
10000d1f0: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000d1f4: 54ffff61    	b.ne	0x10000d1e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x630>
10000d1f8: d10006b0    	sub	x16, x21, #0x1
10000d1fc: eb10039f    	cmp	x28, x16
10000d200: 54000168    	b.hi	0x10000d22c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d204: aa0c03ef    	mov	x15, x12
10000d208: eb02019f    	cmp	x12, x2
10000d20c: 540000e0    	b.eq	0x10000d228 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x678>
10000d210: 388015e8    	ldrsb	x8, [x15], #0x1
10000d214: 9b1a2388    	madd	x8, x28, x26, x8
10000d218: d100c11c    	sub	x28, x8, #0x30
10000d21c: eb15039f    	cmp	x28, x21
10000d220: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000d224: 54ffff61    	b.ne	0x10000d210 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d228: aa0c03e8    	mov	x8, x12
10000d22c: cb0f0108    	sub	x8, x8, x15
10000d230: 8b11010f    	add	x15, x8, x17
10000d234: 390013ff    	strb	wzr, [sp, #0x4]
10000d238: b90003ff    	str	wzr, [sp]
10000d23c: 52800030    	mov	w16, #0x1               ; =1
10000d240: b50002fc    	cbnz	x28, 0x10000d29c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6ec>
10000d244: 1400003e    	b	0x10000d33c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000d248: 390013ff    	strb	wzr, [sp, #0x4]
10000d24c: b90003ff    	str	wzr, [sp]
10000d250: b50001cf    	cbnz	x15, 0x10000d288 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d8>
10000d254: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d258: eb08039f    	cmp	x28, x8
10000d25c: 54000168    	b.hi	0x10000d288 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d8>
10000d260: 9e630381    	ucvtf	d1, x28
10000d264: 1e614022    	fneg	d2, d1
10000d268: 7100b77f    	cmp	w27, #0x2d
10000d26c: 1e610c41    	fcsel	d1, d2, d1, eq
10000d270: 1e680da2    	fcsel	d2, d13, d8, eq
10000d274: f100039f    	cmp	x28, #0x0
10000d278: 1e621c21    	fcsel	d1, d1, d2, ne
10000d27c: 2a0603e8    	mov	w8, w6
10000d280: 3607cf81    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d284: 17fffe7c    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000d288: d1005de8    	sub	x8, x15, #0x17
10000d28c: b100b51f    	cmn	x8, #0x2d
10000d290: 54000162    	b.hs	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x70c>
10000d294: 52800010    	mov	w16, #0x0               ; =0
10000d298: b400053c    	cbz	x28, 0x10000d33c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000d29c: b10559ff    	cmn	x15, #0x156
10000d2a0: 540004eb    	b.lt	0x10000d33c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x78c>
10000d2a4: f104d1ff    	cmp	x15, #0x134
10000d2a8: 5400012d    	b.le	0x10000d2cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x71c>
10000d2ac: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000d2b0: d2800008    	mov	x8, #0x0                ; =0
10000d2b4: 350004b0    	cbnz	w16, 0x10000d348 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000d2b8: 14000091    	b	0x10000d4fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94c>
10000d2bc: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d2c0: eb08039f    	cmp	x28, x8
10000d2c4: 54000749    	b.ls	0x10000d3ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7fc>
10000d2c8: 52800010    	mov	w16, #0x0               ; =0
10000d2cc: dac01380    	clz	x0, x28
10000d2d0: 9ac02382    	lsl	x2, x28, x0
10000d2d4: 531f79e3    	lsl	w3, w15, #1
10000d2d8: 110ab068    	add	w8, w3, #0x2ac
10000d2dc: f8685af1    	ldr	x17, [x23, w8, uxtw #3]
10000d2e0: 9b027e28    	mul	x8, x17, x2
10000d2e4: 9bc27e31    	umulh	x17, x17, x2
10000d2e8: 2a3103e4    	mvn	w4, w17
10000d2ec: f240209f    	tst	x4, #0x1ff
10000d2f0: 540000c1    	b.ne	0x10000d308 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x758>
10000d2f4: 110ab463    	add	w3, w3, #0x2ad
10000d2f8: f8635ae3    	ldr	x3, [x23, w3, uxtw #3]
10000d2fc: 9bc27c62    	umulh	x2, x3, x2
10000d300: ab080048    	adds	x8, x2, x8
10000d304: 9a913631    	cinc	x17, x17, hs
10000d308: d37ffe24    	lsr	x4, x17, #63
10000d30c: 91002483    	add	x3, x4, #0x9
10000d310: 9ac32622    	lsr	x2, x17, x3
10000d314: 1b167de5    	mul	w5, w15, w22
10000d318: 4b000080    	sub	w0, w4, w0
10000d31c: 0b854000    	add	w0, w0, w5, asr #16
10000d320: 1100fc00    	add	w0, w0, #0x3f
10000d324: 310ffc1f    	cmn	w0, #0x3ff
10000d328: 540005ac    	b.gt	0x10000d3dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000d32c: 3110f41f    	cmn	w0, #0x43d
10000d330: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d334: b202e084    	orr	x4, x4, #0x4444444444444444
10000d338: 54000d02    	b.hs	0x10000d4d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x928>
10000d33c: 52800011    	mov	w17, #0x0               ; =0
10000d340: d2800008    	mov	x8, #0x0                ; =0
10000d344: 34000dd0    	cbz	w16, 0x10000d4fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94c>
10000d348: 5280fff9    	mov	w25, #0x7ff             ; =2047
10000d34c: 52800002    	mov	w2, #0x0                ; =0
10000d350: d2800000    	mov	x0, #0x0                ; =0
10000d354: b1000784    	adds	x4, x28, #0x1
10000d358: 540000e2    	b.hs	0x10000d374 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7c4>
10000d35c: b10559ff    	cmn	x15, #0x156
10000d360: 540000ab    	b.lt	0x10000d374 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7c4>
10000d364: f104d1ff    	cmp	x15, #0x134
10000d368: 5400074d    	b.le	0x10000d450 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8a0>
10000d36c: d2800000    	mov	x0, #0x0                ; =0
10000d370: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000d374: eb00011f    	cmp	x8, x0
10000d378: 54001401    	b.ne	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa48>
10000d37c: 6b02023f    	cmp	w17, w2
10000d380: 540013c1    	b.ne	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa48>
10000d384: 5280fffe    	mov	w30, #0x7ff             ; =2047
10000d388: d2f00019    	mov	x25, #-0x8000000000000000 ; =-9223372036854775808
10000d38c: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d390: b202e084    	orr	x4, x4, #0x4444444444444444
10000d394: 1400005a    	b	0x10000d4fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94c>
10000d398: d280001c    	mov	x28, #0x0               ; =0
10000d39c: aa0c03ef    	mov	x15, x12
10000d3a0: eb02019f    	cmp	x12, x2
10000d3a4: 54fff361    	b.ne	0x10000d210 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x660>
10000d3a8: 17ffffa0    	b	0x10000d228 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x678>
10000d3ac: 9e630381    	ucvtf	d1, x28
10000d3b0: b0000188    	adrp	x8, 0x10003e000 <__ZL5Lhint+0x840>
10000d3b4: 91378108    	add	x8, x8, #0xde0
10000d3b8: b7f80f8f    	tbnz	x15, #0x3f, 0x10000d5a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f8>
10000d3bc: fc6f7902    	ldr	d2, [x8, x15, lsl #3]
10000d3c0: 1e610841    	fmul	d1, d2, d1
10000d3c4: 1e614022    	fneg	d2, d1
10000d3c8: 7100b77f    	cmp	w27, #0x2d
10000d3cc: 1e610c41    	fcsel	d1, d2, d1, eq
10000d3d0: 52800028    	mov	w8, #0x1                ; =1
10000d3d4: 3607c4e1    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d3d8: 17fffe27    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000d3dc: 92400444    	and	x4, x2, #0x3
10000d3e0: 9ac32043    	lsl	x3, x2, x3
10000d3e4: eb11007f    	cmp	x3, x17
10000d3e8: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000d3ec: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000d3f0: 910011e8    	add	x8, x15, #0x4
10000d3f4: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000d3f8: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000d3fc: 9a823108    	csel	x8, x8, x2, lo
10000d400: 92400111    	and	x17, x8, #0x1
10000d404: 8b080222    	add	x2, x17, x8
10000d408: ca080223    	eor	x3, x17, x8
10000d40c: 8a080228    	and	x8, x17, x8
10000d410: 8b430508    	add	x8, x8, x3, lsr #1
10000d414: d376fc51    	lsr	x17, x2, #54
10000d418: f100023f    	cmp	x17, #0x0
10000d41c: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000d420: 1a820442    	cinc	w2, w2, ne
10000d424: 0b000040    	add	w0, w2, w0
10000d428: 711ffc1f    	cmp	w0, #0x7ff
10000d42c: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000d430: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000d434: 8a110108    	and	x8, x8, x17
10000d438: 9a9f0108    	csel	x8, x8, xzr, eq
10000d43c: 1ade6c11    	umin	w17, w0, w30
10000d440: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d444: b202e084    	orr	x4, x4, #0x4444444444444444
10000d448: 360005b0    	tbz	w16, #0x0, 0x10000d4fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94c>
10000d44c: 17ffffbf    	b	0x10000d348 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000d450: dac01083    	clz	x3, x4
10000d454: 9ac32084    	lsl	x4, x4, x3
10000d458: 531f79e5    	lsl	w5, w15, #1
10000d45c: 110ab0a0    	add	w0, w5, #0x2ac
10000d460: f8605ae2    	ldr	x2, [x23, w0, uxtw #3]
10000d464: 9b047c40    	mul	x0, x2, x4
10000d468: 9bc47c42    	umulh	x2, x2, x4
10000d46c: 2a2203e6    	mvn	w6, w2
10000d470: aa0703fe    	mov	x30, x7
10000d474: f24020df    	tst	x6, #0x1ff
10000d478: 540000c1    	b.ne	0x10000d490 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8e0>
10000d47c: 110ab4a5    	add	w5, w5, #0x2ad
10000d480: f8655ae5    	ldr	x5, [x23, w5, uxtw #3]
10000d484: 9bc47ca4    	umulh	x4, x5, x4
10000d488: ab000080    	adds	x0, x4, x0
10000d48c: 9a823442    	cinc	x2, x2, hs
10000d490: d37ffc46    	lsr	x6, x2, #63
10000d494: 910024c5    	add	x5, x6, #0x9
10000d498: 9ac52444    	lsr	x4, x2, x5
10000d49c: 1b167de7    	mul	w7, w15, w22
10000d4a0: 4b0300c3    	sub	w3, w6, w3
10000d4a4: 0b874063    	add	w3, w3, w7, asr #16
10000d4a8: 1100fc63    	add	w3, w3, #0x3f
10000d4ac: 310ffc7f    	cmn	w3, #0x3ff
10000d4b0: 5400040c    	b.gt	0x10000d530 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x980>
10000d4b4: 3110f47f    	cmn	w3, #0x43d
10000d4b8: aa1e03e7    	mov	x7, x30
10000d4bc: 54000882    	b.hs	0x10000d5cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa1c>
10000d4c0: d2800000    	mov	x0, #0x0                ; =0
10000d4c4: 52800002    	mov	w2, #0x0                ; =0
10000d4c8: 52800026    	mov	w6, #0x1                ; =1
10000d4cc: eb00011f    	cmp	x8, x0
10000d4d0: 54fff560    	b.eq	0x10000d37c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d4d4: 14000049    	b	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa48>
10000d4d8: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000d4dc: 4b000108    	sub	w8, w8, w0
10000d4e0: 9ac82448    	lsr	x8, x2, x8
10000d4e4: 92400111    	and	x17, x8, #0x1
10000d4e8: 8b080231    	add	x17, x17, x8
10000d4ec: d341fe28    	lsr	x8, x17, #1
10000d4f0: f24b0e3f    	tst	x17, #0x1e0000000000000
10000d4f4: 1a9f07f1    	cset	w17, ne
10000d4f8: 3707f290    	tbnz	w16, #0x0, 0x10000d348 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000d4fc: 2a1103e2    	mov	w2, w17
10000d500: 7100b77f    	cmp	w27, #0x2d
10000d504: 9a9f0329    	csel	x9, x25, xzr, eq
10000d508: aa02d129    	orr	x9, x9, x2, lsl #52
10000d50c: aa080129    	orr	x9, x9, x8
10000d510: 9e670121    	fmov	d1, x9
10000d514: f100011f    	cmp	x8, #0x0
10000d518: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000d51c: fa400b84    	ccmp	x28, #0x0, #0x4, eq
10000d520: 7a5e0044    	ccmp	w2, w30, #0x4, eq
10000d524: 1a9f07e8    	cset	w8, ne
10000d528: 3607ba41    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d52c: 17fffdd2    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000d530: 92400486    	and	x6, x4, #0x3
10000d534: 9ac52085    	lsl	x5, x4, x5
10000d538: eb0200bf    	cmp	x5, x2
10000d53c: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000d540: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000d544: 910011e0    	add	x0, x15, #0x4
10000d548: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000d54c: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000d550: 9a843000    	csel	x0, x0, x4, lo
10000d554: 92400002    	and	x2, x0, #0x1
10000d558: 8b000044    	add	x4, x2, x0
10000d55c: ca000045    	eor	x5, x2, x0
10000d560: 8a000040    	and	x0, x2, x0
10000d564: 8b450400    	add	x0, x0, x5, lsr #1
10000d568: d376fc82    	lsr	x2, x4, #54
10000d56c: f100005f    	cmp	x2, #0x0
10000d570: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000d574: 1a840484    	cinc	w4, w4, ne
10000d578: 0b030083    	add	w3, w4, w3
10000d57c: 711ffc7f    	cmp	w3, #0x7ff
10000d580: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000d584: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000d588: 8a020000    	and	x0, x0, x2
10000d58c: 9a9f0000    	csel	x0, x0, xzr, eq
10000d590: 1ad96c62    	umin	w2, w3, w25
10000d594: aa1e03e7    	mov	x7, x30
10000d598: 52800026    	mov	w6, #0x1                ; =1
10000d59c: eb00011f    	cmp	x8, x0
10000d5a0: 54ffeee0    	b.eq	0x10000d37c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d5a4: 14000015    	b	0x10000d5f8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa48>
10000d5a8: cb0f0d08    	sub	x8, x8, x15, lsl #3
10000d5ac: fd400102    	ldr	d2, [x8]
10000d5b0: 1e621821    	fdiv	d1, d1, d2
10000d5b4: 1e614022    	fneg	d2, d1
10000d5b8: 7100b77f    	cmp	w27, #0x2d
10000d5bc: 1e610c41    	fcsel	d1, d2, d1, eq
10000d5c0: 52800028    	mov	w8, #0x1                ; =1
10000d5c4: 3607b561    	tbz	w1, #0x0, 0x10000cc70 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc0>
10000d5c8: 17fffdab    	b	0x10000cc74 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc4>
10000d5cc: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000d5d0: 4b030000    	sub	w0, w0, w3
10000d5d4: 9ac02480    	lsr	x0, x4, x0
10000d5d8: 92400002    	and	x2, x0, #0x1
10000d5dc: 8b000042    	add	x2, x2, x0
10000d5e0: d341fc40    	lsr	x0, x2, #1
10000d5e4: f24b0c5f    	tst	x2, #0x1e0000000000000
10000d5e8: 1a9f07e2    	cset	w2, ne
10000d5ec: 52800026    	mov	w6, #0x1                ; =1
10000d5f0: eb00011f    	cmp	x8, x0
10000d5f4: 54ffec40    	b.eq	0x10000d37c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d5f8: dac01391    	clz	x17, x28
10000d5fc: 9ad12380    	lsl	x0, x28, x17
10000d600: 531f79e2    	lsl	w2, w15, #1
10000d604: 110ab048    	add	w8, w2, #0x2ac
10000d608: f868dae3    	ldr	x3, [x23, w8, sxtw #3]
10000d60c: 9bc07c68    	umulh	x8, x3, x0
10000d610: 2a2803e4    	mvn	w4, w8
10000d614: f240209f    	tst	x4, #0x1ff
10000d618: 5280fffe    	mov	w30, #0x7ff             ; =2047
10000d61c: d2f00019    	mov	x25, #-0x8000000000000000 ; =-9223372036854775808
10000d620: 540000e1    	b.ne	0x10000d63c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa8c>
10000d624: 9b007c63    	mul	x3, x3, x0
10000d628: 110ab442    	add	w2, w2, #0x2ad
10000d62c: f862dae2    	ldr	x2, [x23, w2, sxtw #3]
10000d630: 9bc07c40    	umulh	x0, x2, x0
10000d634: ab03001f    	cmn	x0, x3
10000d638: 9a883508    	cinc	x8, x8, hs
10000d63c: d37ffd00    	lsr	x0, x8, #63
10000d640: 52000000    	eor	w0, w0, #0x1
10000d644: 9ac02108    	lsl	x8, x8, x0
10000d648: 1b167de2    	mul	w2, w15, w22
10000d64c: 13107c42    	asr	w2, w2, #16
10000d650: 4b110051    	sub	w17, w2, w17
10000d654: 4b000231    	sub	w17, w17, w0
10000d658: 128f7960    	mov	w0, #-0x7bcc            ; =-31692
10000d65c: 2b000222    	adds	w2, w17, w0
10000d660: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d664: b202e084    	orr	x4, x4, #0x4444444444444444
10000d668: 54fff4c5    	b.pl	0x10000d500 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x950>
10000d66c: a900f3ef    	stp	x15, x28, [sp, #0x8]
10000d670: f9000fee    	str	x14, [sp, #0x18]
10000d674: 390083ea    	strb	w10, [sp, #0x20]
10000d678: 390087e6    	strb	w6, [sp, #0x21]
10000d67c: 39008bf0    	strb	w16, [sp, #0x22]
10000d680: b94003ea    	ldr	w10, [sp]
10000d684: 910023ee    	add	x14, sp, #0x8
10000d688: b801b1ca    	stur	w10, [x14, #0x1b]
10000d68c: 394013ea    	ldrb	w10, [sp, #0x4]
10000d690: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000d694: a902afe9    	stp	x9, x11, [sp, #0x28]
10000d698: a903b7ec    	stp	x12, x13, [sp, #0x38]
10000d69c: f90027ff    	str	xzr, [sp, #0x48]
10000d6a0: 910023e0    	add	x0, sp, #0x8
10000d6a4: aa0103f6    	mov	x22, x1
10000d6a8: aa0803e1    	mov	x1, x8
10000d6ac: 52800023    	mov	w3, #0x1                ; =1
10000d6b0: 4ea01c0e    	mov.16b	v14, v0
10000d6b4: aa1703f9    	mov	x25, x23
10000d6b8: aa1803f7    	mov	x23, x24
10000d6bc: aa0703f8    	mov	x24, x7
10000d6c0: 94001512    	bl	0x100012b08 <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000d6c4: b207c7e4    	mov	x4, #0x606060606060606  ; =434041037028460038
10000d6c8: b202e084    	orr	x4, x4, #0x4444444444444444
10000d6cc: 5280fffe    	mov	w30, #0x7ff             ; =2047
10000d6d0: 52800026    	mov	w6, #0x1                ; =1
10000d6d4: aa1803e7    	mov	x7, x24
10000d6d8: aa1703f8    	mov	x24, x23
10000d6dc: aa1903f7    	mov	x23, x25
10000d6e0: d2f00019    	mov	x25, #-0x8000000000000000 ; =-9223372036854775808
10000d6e4: 4eae1dc0    	mov.16b	v0, v14
10000d6e8: aa0003e8    	mov	x8, x0
10000d6ec: aa0103e2    	mov	x2, x1
10000d6f0: aa1603e1    	mov	x1, x22
10000d6f4: 528a4d56    	mov	w22, #0x526a            ; =21098
10000d6f8: 72a00076    	movk	w22, #0x3, lsl #16
10000d6fc: 17ffff81    	b	0x10000d500 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x950>
10000d700: 6f00e400    	movi.2d	v0, #0000000000000000
10000d704: a94e7bfd    	ldp	x29, x30, [sp, #0xe0]
10000d708: a94d4ff4    	ldp	x20, x19, [sp, #0xd0]
10000d70c: a94c57f6    	ldp	x22, x21, [sp, #0xc0]
10000d710: a94b5ff8    	ldp	x24, x23, [sp, #0xb0]
10000d714: a94a67fa    	ldp	x26, x25, [sp, #0xa0]
10000d718: a9496ffc    	ldp	x28, x27, [sp, #0x90]
10000d71c: 6d4823e9    	ldp	d9, d8, [sp, #0x80]
10000d720: 6d472beb    	ldp	d11, d10, [sp, #0x70]
10000d724: 6d4633ed    	ldp	d13, d12, [sp, #0x60]
10000d728: 6d453bef    	ldp	d15, d14, [sp, #0x50]
10000d72c: 9103c3ff    	add	sp, sp, #0xf0
10000d730: d65f03c0    	ret
10000d734: 52800200    	mov	w0, #0x10               ; =16
10000d738: 9400b477    	bl	0x10003a914 <_strtod_l+0x10003a914>
10000d73c: aa0003f3    	mov	x19, x0
10000d740: b00001e1    	adrp	x1, 0x10004a000 <_strtod_l+0x10004a000>
10000d744: 9108f421    	add	x1, x1, #0x23d
10000d748: 9400b3f2    	bl	0x10003a710 <_strtod_l+0x10003a710>
10000d74c: aa1303e0    	mov	x0, x19
10000d750: 9400b39d    	bl	0x10003a5c4 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000d754: aa0003f4    	mov	x20, x0
10000d758: aa1303e0    	mov	x0, x19
10000d75c: 9400b47d    	bl	0x10003a950 <_strtod_l+0x10003a950>
10000d760: aa1403e0    	mov	x0, x20
10000d764: 9400b3b8    	bl	0x10003a644 <_strtod_l+0x10003a644>
