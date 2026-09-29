
simple_fastfloat_benchmark/build/m6-scan-neon16-compact/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000d030 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000d030: d10483ff    	sub	sp, sp, #0x120
10000d034: 6d083bef    	stp	d15, d14, [sp, #0x80]
10000d038: 6d0933ed    	stp	d13, d12, [sp, #0x90]
10000d03c: 6d0a2beb    	stp	d11, d10, [sp, #0xa0]
10000d040: 6d0b23e9    	stp	d9, d8, [sp, #0xb0]
10000d044: a90c6ffc    	stp	x28, x27, [sp, #0xc0]
10000d048: a90d67fa    	stp	x26, x25, [sp, #0xd0]
10000d04c: a90e5ff8    	stp	x24, x23, [sp, #0xe0]
10000d050: a90f57f6    	stp	x22, x21, [sp, #0xf0]
10000d054: a9104ff4    	stp	x20, x19, [sp, #0x100]
10000d058: a9117bfd    	stp	x29, x30, [sp, #0x110]
10000d05c: 910443fd    	add	x29, sp, #0x110
10000d060: a9405013    	ldp	x19, x20, [x0]
10000d064: eb14027f    	cmp	x19, x20
10000d068: 54005ee0    	b.eq	0x10000dc44 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc14>
10000d06c: d2b4ec95    	mov	x21, #0xa7640000        ; =2808348672
10000d070: f2d6d675    	movk	x21, #0xb6b3, lsl #32
10000d074: f2e1bc15    	movk	x21, #0xde0, lsl #48
10000d078: 529c2016    	mov	w22, #0xe100            ; =57600
10000d07c: 72a0beb6    	movk	w22, #0x5f5, lsl #16
10000d080: 528a4d59    	mov	w25, #0x526a            ; =21098
10000d084: 72a00079    	movk	w25, #0x3, lsl #16
10000d088: 6f00e408    	movi.2d	v8, #0000000000000000
10000d08c: b203c3e7    	mov	x7, #0x2020202020202020 ; =2314885530818453536
10000d090: f28dcd27    	movk	x7, #0x6e69
10000d094: f2a40cc7    	movk	x7, #0x2066, lsl #16
10000d098: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d09c: 9e670109    	fmov	d9, x8
10000d0a0: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d0a4: 9e67010a    	fmov	d10, x8
10000d0a8: b203c3f8    	mov	x24, #0x2020202020202020 ; =2314885530818453536
10000d0ac: f28c2dd8    	movk	x24, #0x616e
10000d0b0: f2a40dd8    	movk	x24, #0x206e, lsl #16
10000d0b4: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d0b8: 9e67010b    	fmov	d11, x8
10000d0bc: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d0c0: 9e67010c    	fmov	d12, x8
10000d0c4: d000019b    	adrp	x27, 0x10003f000 <__ZL13FFC_SPACE_LUT+0xe0>
10000d0c8: 9110e37b    	add	x27, x27, #0x438
10000d0cc: 5280015c    	mov	w28, #0xa               ; =10
10000d0d0: 128f7966    	mov	w6, #-0x7bcc            ; =-31692
10000d0d4: 5280003e    	mov	w30, #0x1               ; =1
10000d0d8: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d0dc: 9e67010d    	fmov	d13, x8
10000d0e0: 4f06e605    	movi.16b	v5, #0xd0
10000d0e4: d0000168    	adrp	x8, 0x10003b000 <_strtod_l+0x10003b000>
10000d0e8: fd402d0e    	ldr	d14, [x8, #0x58]
10000d0ec: d0000168    	adrp	x8, 0x10003b000 <_strtod_l+0x10003b000>
10000d0f0: 3dc05106    	ldr	q6, [x8, #0x140]
10000d0f4: d0000168    	adrp	x8, 0x10003b000 <_strtod_l+0x10003b000>
10000d0f8: 3dc05507    	ldr	q7, [x8, #0x150]
10000d0fc: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d100: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d104: f2e00464    	movk	x4, #0x23, lsl #48
10000d108: 6f00e400    	movi.2d	v0, #0000000000000000
10000d10c: 14000009    	b	0x10000d130 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x100>
10000d110: 52800008    	mov	w8, #0x0                ; =0
10000d114: 37000041    	tbnz	w1, #0x0, 0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000d118: 36005b08    	tbz	w8, #0x0, 0x10000dc78 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc48>
10000d11c: 1e612000    	fcmp	d0, d1
10000d120: 1e61cc00    	fcsel	d0, d0, d1, gt
10000d124: 91006273    	add	x19, x19, #0x18
10000d128: eb14027f    	cmp	x19, x20
10000d12c: 540058e0    	b.eq	0x10000dc48 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xc18>
10000d130: 39805e60    	ldrsb	x0, [x19, #0x17]
10000d134: b7f800a0    	tbnz	x0, #0x3f, 0x10000d148 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x118>
10000d138: aa1303f1    	mov	x17, x19
10000d13c: 6f00e401    	movi.2d	v1, #0000000000000000
10000d140: b50000a0    	cbnz	x0, 0x10000d154 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x124>
10000d144: 17fffff3    	b	0x10000d110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d148: a9400271    	ldp	x17, x0, [x19]
10000d14c: 6f00e401    	movi.2d	v1, #0000000000000000
10000d150: b4fffe00    	cbz	x0, 0x10000d110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d154: 39400237    	ldrb	w23, [x17]
10000d158: aa1703eb    	mov	x11, x23
10000d15c: aa1103e9    	mov	x9, x17
10000d160: 7100b6ff    	cmp	w23, #0x2d
10000d164: 1a9f17ea    	cset	w10, eq
10000d168: 54000161    	b.ne	0x10000d194 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x164>
10000d16c: f100041f    	cmp	x0, #0x1
10000d170: 54001be0    	b.eq	0x10000d4ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000d174: aa1103e9    	mov	x9, x17
10000d178: 38c01d28    	ldrsb	w8, [x9, #0x1]!
10000d17c: 12001d0b    	and	w11, w8, #0xff
10000d180: 7100b91f    	cmp	w8, #0x2e
10000d184: 54000080    	b.eq	0x10000d194 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x164>
10000d188: 5100c108    	sub	w8, w8, #0x30
10000d18c: 7100251f    	cmp	w8, #0x9
10000d190: 54001ae8    	b.hi	0x10000d4ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000d194: 8b000230    	add	x16, x17, x0
10000d198: eb10013f    	cmp	x9, x16
10000d19c: 540008c0    	b.eq	0x10000d2b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x284>
10000d1a0: 13001d68    	sxtb	w8, w11
10000d1a4: 5100c108    	sub	w8, w8, #0x30
10000d1a8: 7100251f    	cmp	w8, #0x9
10000d1ac: 54000848    	b.hi	0x10000d2b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x284>
10000d1b0: 91000528    	add	x8, x9, #0x1
10000d1b4: 93401d6b    	sxtb	x11, w11
10000d1b8: d100c17a    	sub	x26, x11, #0x30
10000d1bc: eb10011f    	cmp	x8, x16
10000d1c0: 540007e0    	b.eq	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d1c4: 39c0010b    	ldrsb	w11, [x8]
10000d1c8: 5100c16c    	sub	w12, w11, #0x30
10000d1cc: 7100259f    	cmp	w12, #0x9
10000d1d0: 54000768    	b.hi	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d1d4: 93407d6b    	sxtw	x11, w11
10000d1d8: 91000928    	add	x8, x9, #0x2
10000d1dc: d100c16b    	sub	x11, x11, #0x30
10000d1e0: aa1a03ec    	mov	x12, x26
10000d1e4: 8b0c099a    	add	x26, x12, x12, lsl #2
10000d1e8: 8b1a057a    	add	x26, x11, x26, lsl #1
10000d1ec: eb10011f    	cmp	x8, x16
10000d1f0: 54000660    	b.eq	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d1f4: 39c0010b    	ldrsb	w11, [x8]
10000d1f8: 5100c16c    	sub	w12, w11, #0x30
10000d1fc: 7100259f    	cmp	w12, #0x9
10000d200: 540005e8    	b.hi	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d204: 93407d6b    	sxtw	x11, w11
10000d208: 91000d28    	add	x8, x9, #0x3
10000d20c: d100c16b    	sub	x11, x11, #0x30
10000d210: aa1a03ec    	mov	x12, x26
10000d214: 8b0c099a    	add	x26, x12, x12, lsl #2
10000d218: 8b1a057a    	add	x26, x11, x26, lsl #1
10000d21c: eb10011f    	cmp	x8, x16
10000d220: 540004e0    	b.eq	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d224: 39c0010b    	ldrsb	w11, [x8]
10000d228: 5100c16c    	sub	w12, w11, #0x30
10000d22c: 7100259f    	cmp	w12, #0x9
10000d230: 54000468    	b.hi	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d234: 93407d6b    	sxtw	x11, w11
10000d238: 91001128    	add	x8, x9, #0x4
10000d23c: d100c16b    	sub	x11, x11, #0x30
10000d240: aa1a03ec    	mov	x12, x26
10000d244: 8b0c099a    	add	x26, x12, x12, lsl #2
10000d248: 8b1a057a    	add	x26, x11, x26, lsl #1
10000d24c: eb10011f    	cmp	x8, x16
10000d250: 54000360    	b.eq	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d254: 39c0010b    	ldrsb	w11, [x8]
10000d258: 5100c16c    	sub	w12, w11, #0x30
10000d25c: 7100259f    	cmp	w12, #0x9
10000d260: 540002e8    	b.hi	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d264: 93407d6b    	sxtw	x11, w11
10000d268: 91001528    	add	x8, x9, #0x5
10000d26c: d100c16c    	sub	x12, x11, #0x30
10000d270: 8b1a0b4b    	add	x11, x26, x26, lsl #2
10000d274: 8b0b058b    	add	x11, x12, x11, lsl #1
10000d278: eb10011f    	cmp	x8, x16
10000d27c: 54001780    	b.eq	0x10000d56c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x53c>
10000d280: 39c0010c    	ldrsb	w12, [x8]
10000d284: 5100c18d    	sub	w13, w12, #0x30
10000d288: 710025bf    	cmp	w13, #0x9
10000d28c: 54001708    	b.hi	0x10000d56c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x53c>
10000d290: 93407d8c    	sxtw	x12, w12
10000d294: d100c18c    	sub	x12, x12, #0x30
10000d298: 8b0b097a    	add	x26, x11, x11, lsl #2
10000d29c: 8b1a059a    	add	x26, x12, x26, lsl #1
10000d2a0: 91000508    	add	x8, x8, #0x1
10000d2a4: aa1a03eb    	mov	x11, x26
10000d2a8: eb10011f    	cmp	x8, x16
10000d2ac: 54fffea1    	b.ne	0x10000d280 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x250>
10000d2b0: 14000003    	b	0x10000d2bc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x28c>
10000d2b4: d280001a    	mov	x26, #0x0               ; =0
10000d2b8: aa0903e8    	mov	x8, x9
10000d2bc: cb09010b    	sub	x11, x8, x9
10000d2c0: eb10011f    	cmp	x8, x16
10000d2c4: 540015c0    	b.eq	0x10000d57c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x54c>
10000d2c8: 3940010c    	ldrb	w12, [x8]
10000d2cc: 7100b99f    	cmp	w12, #0x2e
10000d2d0: 54001561    	b.ne	0x10000d57c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x54c>
10000d2d4: 9100050c    	add	x12, x8, #0x1
10000d2d8: cb0c020e    	sub	x14, x16, x12
10000d2dc: aa0c03ed    	mov	x13, x12
10000d2e0: f10041df    	cmp	x14, #0x10
10000d2e4: 540002eb    	b.lt	0x10000d340 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x310>
10000d2e8: 3dc001a3    	ldr	q3, [x13]
10000d2ec: 4e258462    	add.16b	v2, v3, v5
10000d2f0: 6e30a844    	umaxv.16b	b4, v2
10000d2f4: 1e26008f    	fmov	w15, s4
10000d2f8: 710025ff    	cmp	w15, #0x9
10000d2fc: 540002a8    	b.hi	0x10000d350 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x320>
10000d300: 2e2ec043    	umull.8h	v3, v2, v14
10000d304: 6e024042    	ext.16b	v2, v2, v2, #0x8
10000d308: 2e2ec042    	umull.8h	v2, v2, v14
10000d30c: 4e62bc62    	addp.8h	v2, v3, v2
10000d310: 4e669c42    	mul.8h	v2, v2, v6
10000d314: 6e602842    	uaddlp.4s	v2, v2
10000d318: 4ea79c42    	mul.4s	v2, v2, v7
10000d31c: 6ea02842    	uaddlp.2d	v2, v2
10000d320: 4e183c4f    	mov.d	x15, v2[1]
10000d324: 9e660042    	fmov	x2, d2
10000d328: 9b043f4f    	madd	x15, x26, x4, x15
10000d32c: 9b163c5a    	madd	x26, x2, x22, x15
10000d330: 910041ad    	add	x13, x13, #0x10
10000d334: d10041ce    	sub	x14, x14, #0x10
10000d338: f1003ddf    	cmp	x14, #0xf
10000d33c: 54fffd6c    	b.gt	0x10000d2e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x2b8>
10000d340: f10021df    	cmp	x14, #0x8
10000d344: 540001ab    	b.lt	0x10000d378 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x348>
10000d348: f94001ae    	ldr	x14, [x13]
10000d34c: 14000002    	b	0x10000d354 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x324>
10000d350: 9e66006e    	fmov	x14, d3
10000d354: b207c7ef    	mov	x15, #0x606060606060606 ; =434041037028460038
10000d358: b202e1ef    	orr	x15, x15, #0x4444444444444444
10000d35c: 8b0f01cf    	add	x15, x14, x15
10000d360: b202d7e2    	mov	x2, #-0x3030303030303031 ; =-3472328296227680305
10000d364: f299fa02    	movk	x2, #0xcfd0
10000d368: 8b0201ce    	add	x14, x14, x2
10000d36c: aa0e01ef    	orr	x15, x15, x14
10000d370: f201c1ff    	tst	x15, #0x8080808080808080
10000d374: 54000320    	b.eq	0x10000d3d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3a8>
10000d378: cb0d020e    	sub	x14, x16, x13
10000d37c: f10011df    	cmp	x14, #0x4
10000d380: 5400050b    	b.lt	0x10000d420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3f0>
10000d384: b94001ae    	ldr	w14, [x13]
10000d388: 5288c8cf    	mov	w15, #0x4646            ; =17990
10000d38c: 72a8c8cf    	movk	w15, #0x4646, lsl #16
10000d390: 0b0f01cf    	add	w15, w14, w15
10000d394: 5299fa02    	mov	w2, #0xcfd0             ; =53200
10000d398: 72b9f9e2    	movk	w2, #0xcfcf, lsl #16
10000d39c: 0b0201ce    	add	w14, w14, w2
10000d3a0: 2a0e01ef    	orr	w15, w15, w14
10000d3a4: 7201c1ff    	tst	w15, #0x80808080
10000d3a8: 540003c1    	b.ne	0x10000d420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3f0>
10000d3ac: 1b1c7dcf    	mul	w15, w14, w28
10000d3b0: 0b4e21ee    	add	w14, w15, w14, lsr #8
10000d3b4: 12009dce    	and	w14, w14, #0xff00ff
10000d3b8: 5280002f    	mov	w15, #0x1               ; =1
10000d3bc: 72a00c8f    	movk	w15, #0x64, lsl #16
10000d3c0: 1b0f7dce    	mul	w14, w14, w15
10000d3c4: 53107dce    	lsr	w14, w14, #16
10000d3c8: 5284e20f    	mov	w15, #0x2710            ; =10000
10000d3cc: 9b0f3b5a    	madd	x26, x26, x15, x14
10000d3d0: 910011ad    	add	x13, x13, #0x4
10000d3d4: 14000013    	b	0x10000d420 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3f0>
10000d3d8: 9b167f4f    	mul	x15, x26, x22
10000d3dc: 9b1c7dc2    	mul	x2, x14, x28
10000d3e0: 8b4e204e    	add	x14, x2, x14, lsr #8
10000d3e4: 92001dc2    	and	x2, x14, #0xff000000ff
10000d3e8: d2800c83    	mov	x3, #0x64               ; =100
10000d3ec: f2c84803    	movk	x3, #0x4240, lsl #32
10000d3f0: f2e001e3    	movk	x3, #0xf, lsl #48
10000d3f4: 9b037c42    	mul	x2, x2, x3
10000d3f8: d350fdce    	lsr	x14, x14, #16
10000d3fc: 92001dce    	and	x14, x14, #0xff000000ff
10000d400: d2800023    	mov	x3, #0x1                ; =1
10000d404: f2c4e203    	movk	x3, #0x2710, lsl #32
10000d408: 9b0309ce    	madd	x14, x14, x3, x2
10000d40c: 8b4e81fa    	add	x26, x15, x14, lsr #32
10000d410: 910021ad    	add	x13, x13, #0x8
10000d414: cb0d020e    	sub	x14, x16, x13
10000d418: f10011df    	cmp	x14, #0x4
10000d41c: 54fffb4a    	b.ge	0x10000d384 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x354>
10000d420: eb1001bf    	cmp	x13, x16
10000d424: 54000580    	b.eq	0x10000d4d4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4a4>
10000d428: 39c001ae    	ldrsb	w14, [x13]
10000d42c: 5100c1cf    	sub	w15, w14, #0x30
10000d430: 710025ff    	cmp	w15, #0x9
10000d434: 540008e8    	b.hi	0x10000d550 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x520>
10000d438: 12001dcf    	and	w15, w14, #0xff
10000d43c: 910005ae    	add	x14, x13, #0x1
10000d440: 5100c1ef    	sub	w15, w15, #0x30
10000d444: 92401def    	and	x15, x15, #0xff
10000d448: aa1a03e2    	mov	x2, x26
10000d44c: 8b02085a    	add	x26, x2, x2, lsl #2
10000d450: 8b1a05fa    	add	x26, x15, x26, lsl #1
10000d454: eb1001df    	cmp	x14, x16
10000d458: 54000400    	b.eq	0x10000d4d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4a8>
10000d45c: 39c001cf    	ldrsb	w15, [x14]
10000d460: 5100c1e2    	sub	w2, w15, #0x30
10000d464: 7100245f    	cmp	w2, #0x9
10000d468: 54000388    	b.hi	0x10000d4d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4a8>
10000d46c: 12001def    	and	w15, w15, #0xff
10000d470: 910009ae    	add	x14, x13, #0x2
10000d474: 5100c1ef    	sub	w15, w15, #0x30
10000d478: 92401def    	and	x15, x15, #0xff
10000d47c: aa1a03e2    	mov	x2, x26
10000d480: 8b02085a    	add	x26, x2, x2, lsl #2
10000d484: 8b1a05fa    	add	x26, x15, x26, lsl #1
10000d488: eb1001df    	cmp	x14, x16
10000d48c: 54000260    	b.eq	0x10000d4d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4a8>
10000d490: 39c001cf    	ldrsb	w15, [x14]
10000d494: 5100c1e2    	sub	w2, w15, #0x30
10000d498: 7100245f    	cmp	w2, #0x9
10000d49c: 540001e8    	b.hi	0x10000d4d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4a8>
10000d4a0: 12001def    	and	w15, w15, #0xff
10000d4a4: 91000dae    	add	x14, x13, #0x3
10000d4a8: 5100c1ed    	sub	w13, w15, #0x30
10000d4ac: 92401dad    	and	x13, x13, #0xff
10000d4b0: 8b1a0b4f    	add	x15, x26, x26, lsl #2
10000d4b4: 8b0f05af    	add	x15, x13, x15, lsl #1
10000d4b8: aa0f03fa    	mov	x26, x15
10000d4bc: cb0c01cd    	sub	x13, x14, x12
10000d4c0: cb0e018f    	sub	x15, x12, x14
10000d4c4: cb0f0163    	sub	x3, x11, x15
10000d4c8: aa0e03e2    	mov	x2, x14
10000d4cc: b5000663    	cbnz	x3, 0x10000d598 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x568>
10000d4d0: 14000007    	b	0x10000d4ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000d4d4: aa0d03ee    	mov	x14, x13
10000d4d8: cb0c01cd    	sub	x13, x14, x12
10000d4dc: cb0e018f    	sub	x15, x12, x14
10000d4e0: cb0f0163    	sub	x3, x11, x15
10000d4e4: aa0e03e2    	mov	x2, x14
10000d4e8: b5000583    	cbnz	x3, 0x10000d598 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x568>
10000d4ec: 39400228    	ldrb	w8, [x17]
10000d4f0: 7100b51f    	cmp	w8, #0x2d
10000d4f4: 1a9f17e9    	cset	w9, eq
10000d4f8: cb09000a    	sub	x10, x0, x9
10000d4fc: f1000d5f    	cmp	x10, #0x3
10000d500: 54ffe08b    	b.lt	0x10000d110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d504: 8b090229    	add	x9, x17, x9
10000d508: 3940092a    	ldrb	w10, [x9, #0x2]
10000d50c: 79400129    	ldrh	w9, [x9]
10000d510: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d514: b203c129    	orr	x9, x9, #0x2020202020202020
10000d518: eb07013f    	cmp	x9, x7
10000d51c: 54000100    	b.eq	0x10000d53c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x50c>
10000d520: eb18013f    	cmp	x9, x24
10000d524: 54ffdf61    	b.ne	0x10000d110 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe0>
10000d528: 7100b51f    	cmp	w8, #0x2d
10000d52c: 1e6b0d81    	fcsel	d1, d12, d11, eq
10000d530: 52800028    	mov	w8, #0x1                ; =1
10000d534: 3607df21    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000d538: 17fffef9    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000d53c: 7100b51f    	cmp	w8, #0x2d
10000d540: 1e690d41    	fcsel	d1, d10, d9, eq
10000d544: 52800028    	mov	w8, #0x1                ; =1
10000d548: 3607de81    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000d54c: 17fffef4    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000d550: aa0d03ee    	mov	x14, x13
10000d554: cb0c01ad    	sub	x13, x13, x12
10000d558: cb0e018f    	sub	x15, x12, x14
10000d55c: cb0f0163    	sub	x3, x11, x15
10000d560: aa0e03e2    	mov	x2, x14
10000d564: b50001a3    	cbnz	x3, 0x10000d598 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x568>
10000d568: 17ffffe1    	b	0x10000d4ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000d56c: aa0b03fa    	mov	x26, x11
10000d570: cb09010b    	sub	x11, x8, x9
10000d574: eb10011f    	cmp	x8, x16
10000d578: 54ffea81    	b.ne	0x10000d2c8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x298>
10000d57c: d280000d    	mov	x13, #0x0               ; =0
10000d580: d280000f    	mov	x15, #0x0               ; =0
10000d584: d280000c    	mov	x12, #0x0               ; =0
10000d588: d2800002    	mov	x2, #0x0                ; =0
10000d58c: aa0803ee    	mov	x14, x8
10000d590: aa0b03e3    	mov	x3, x11
10000d594: b4fffacb    	cbz	x11, 0x10000d4ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x4bc>
10000d598: eb1001df    	cmp	x14, x16
10000d59c: 54000240    	b.eq	0x10000d5e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d5a0: 394001d1    	ldrb	w17, [x14]
10000d5a4: 321b0231    	orr	w17, w17, #0x20
10000d5a8: 7101963f    	cmp	w17, #0x65
10000d5ac: 540001c1    	b.ne	0x10000d5e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d5b0: 910005c0    	add	x0, x14, #0x1
10000d5b4: eb10001f    	cmp	x0, x16
10000d5b8: 540001e0    	b.eq	0x10000d5f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5c4>
10000d5bc: 39400011    	ldrb	w17, [x0]
10000d5c0: 910009c4    	add	x4, x14, #0x2
10000d5c4: 7100ae3f    	cmp	w17, #0x2b
10000d5c8: 9a800080    	csel	x0, x4, x0, eq
10000d5cc: 7100b63f    	cmp	w17, #0x2d
10000d5d0: 1a9e13f1    	csel	w17, wzr, w30, ne
10000d5d4: 9a841000    	csel	x0, x0, x4, ne
10000d5d8: eb10001f    	cmp	x0, x16
10000d5dc: 54000121    	b.ne	0x10000d600 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5d0>
10000d5e0: 1400001f    	b	0x10000d65c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x62c>
10000d5e4: d2800011    	mov	x17, #0x0               ; =0
10000d5e8: f100507f    	cmp	x3, #0x14
10000d5ec: 5400058a    	b.ge	0x10000d69c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000d5f0: 1400005d    	b	0x10000d764 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x734>
10000d5f4: 52800011    	mov	w17, #0x0               ; =0
10000d5f8: eb10001f    	cmp	x0, x16
10000d5fc: 54000300    	b.eq	0x10000d65c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x62c>
10000d600: 39c00004    	ldrsb	w4, [x0]
10000d604: 5100c084    	sub	w4, w4, #0x30
10000d608: 7100249f    	cmp	w4, #0x9
10000d60c: 54000288    	b.hi	0x10000d65c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x62c>
10000d610: d280000e    	mov	x14, #0x0               ; =0
10000d614: 14000004    	b	0x10000d624 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d618: 91000400    	add	x0, x0, #0x1
10000d61c: eb10001f    	cmp	x0, x16
10000d620: 540002c0    	b.eq	0x10000d678 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d624: 39c00004    	ldrsb	w4, [x0]
10000d628: 5100c085    	sub	w5, w4, #0x30
10000d62c: 710024bf    	cmp	w5, #0x9
10000d630: 54000248    	b.hi	0x10000d678 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x648>
10000d634: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d638: eb0501df    	cmp	x14, x5
10000d63c: 54fffeec    	b.gt	0x10000d618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e8>
10000d640: 12001c84    	and	w4, w4, #0xff
10000d644: 5100c084    	sub	w4, w4, #0x30
10000d648: 92401c84    	and	x4, x4, #0xff
10000d64c: 8b0e09c5    	add	x5, x14, x14, lsl #2
10000d650: 8b050485    	add	x5, x4, x5, lsl #1
10000d654: aa0503ee    	mov	x14, x5
10000d658: 17fffff0    	b	0x10000d618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5e8>
10000d65c: d2800011    	mov	x17, #0x0               ; =0
10000d660: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d664: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d668: f2e00464    	movk	x4, #0x23, lsl #48
10000d66c: f100507f    	cmp	x3, #0x14
10000d670: 5400016a    	b.ge	0x10000d69c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x66c>
10000d674: 1400003c    	b	0x10000d764 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x734>
10000d678: 7100023f    	cmp	w17, #0x0
10000d67c: da8e05d1    	cneg	x17, x14, ne
10000d680: 8b0f022f    	add	x15, x17, x15
10000d684: aa0003ee    	mov	x14, x0
10000d688: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d68c: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d690: f2e00464    	movk	x4, #0x23, lsl #48
10000d694: f100507f    	cmp	x3, #0x14
10000d698: 5400066b    	b.lt	0x10000d764 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x734>
10000d69c: eb10013f    	cmp	x9, x16
10000d6a0: 54000260    	b.eq	0x10000d6ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6bc>
10000d6a4: aa0903e0    	mov	x0, x9
10000d6a8: 14000007    	b	0x10000d6c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x694>
10000d6ac: 7100c09f    	cmp	w4, #0x30
10000d6b0: 1a9f17e4    	cset	w4, eq
10000d6b4: cb040063    	sub	x3, x3, x4
10000d6b8: 91000400    	add	x0, x0, #0x1
10000d6bc: eb10001f    	cmp	x0, x16
10000d6c0: 540000c0    	b.eq	0x10000d6d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a8>
10000d6c4: 39400004    	ldrb	w4, [x0]
10000d6c8: 7100c09f    	cmp	w4, #0x30
10000d6cc: 54ffff00    	b.eq	0x10000d6ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d6d0: 7100b89f    	cmp	w4, #0x2e
10000d6d4: 54fffec0    	b.eq	0x10000d6ac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x67c>
10000d6d8: f100507f    	cmp	x3, #0x14
10000d6dc: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d6e0: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d6e4: f2e00464    	movk	x4, #0x23, lsl #48
10000d6e8: 540003eb    	b.lt	0x10000d764 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x734>
10000d6ec: eb08013f    	cmp	x9, x8
10000d6f0: 54000e00    	b.eq	0x10000d8b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x880>
10000d6f4: d280001a    	mov	x26, #0x0               ; =0
10000d6f8: aa0903ef    	mov	x15, x9
10000d6fc: 388015f0    	ldrsb	x16, [x15], #0x1
10000d700: 9b1c4350    	madd	x16, x26, x28, x16
10000d704: d100c21a    	sub	x26, x16, #0x30
10000d708: eb15035f    	cmp	x26, x21
10000d70c: fa4831e4    	ccmp	x15, x8, #0x4, lo
10000d710: 54ffff61    	b.ne	0x10000d6fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6cc>
10000d714: d10006b0    	sub	x16, x21, #0x1
10000d718: eb10035f    	cmp	x26, x16
10000d71c: 54000168    	b.hi	0x10000d748 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x718>
10000d720: aa0c03ef    	mov	x15, x12
10000d724: eb02019f    	cmp	x12, x2
10000d728: 540000e0    	b.eq	0x10000d744 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x714>
10000d72c: 388015e8    	ldrsb	x8, [x15], #0x1
10000d730: 9b1c2348    	madd	x8, x26, x28, x8
10000d734: d100c11a    	sub	x26, x8, #0x30
10000d738: eb15035f    	cmp	x26, x21
10000d73c: fa4231e4    	ccmp	x15, x2, #0x4, lo
10000d740: 54ffff61    	b.ne	0x10000d72c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6fc>
10000d744: aa0c03e8    	mov	x8, x12
10000d748: cb0f0108    	sub	x8, x8, x15
10000d74c: 8b11010f    	add	x15, x8, x17
10000d750: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000d754: b9002bff    	str	wzr, [sp, #0x28]
10000d758: 52800030    	mov	w16, #0x1               ; =1
10000d75c: b50002fa    	cbnz	x26, 0x10000d7b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x788>
10000d760: 1400003f    	b	0x10000d85c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000d764: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000d768: b9002bff    	str	wzr, [sp, #0x28]
10000d76c: b50001cf    	cbnz	x15, 0x10000d7a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x774>
10000d770: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d774: eb08035f    	cmp	x26, x8
10000d778: 54000168    	b.hi	0x10000d7a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x774>
10000d77c: 9e630341    	ucvtf	d1, x26
10000d780: 1e614022    	fneg	d2, d1
10000d784: 7100b6ff    	cmp	w23, #0x2d
10000d788: 1e610c41    	fcsel	d1, d2, d1, eq
10000d78c: 1e680da2    	fcsel	d2, d13, d8, eq
10000d790: f100035f    	cmp	x26, #0x0
10000d794: 1e621c21    	fcsel	d1, d1, d2, ne
10000d798: 2a1e03e8    	mov	w8, w30
10000d79c: 3607cbe1    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000d7a0: 17fffe5f    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000d7a4: d1005de8    	sub	x8, x15, #0x17
10000d7a8: b100b51f    	cmn	x8, #0x2d
10000d7ac: 54000162    	b.hs	0x10000d7d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7a8>
10000d7b0: 52800010    	mov	w16, #0x0               ; =0
10000d7b4: b400055a    	cbz	x26, 0x10000d85c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000d7b8: b10559ff    	cmn	x15, #0x156
10000d7bc: 5400050b    	b.lt	0x10000d85c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x82c>
10000d7c0: f104d1ff    	cmp	x15, #0x134
10000d7c4: 5400012d    	b.le	0x10000d7e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7b8>
10000d7c8: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000d7cc: d2800008    	mov	x8, #0x0                ; =0
10000d7d0: 350004d0    	cbnz	w16, 0x10000d868 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000d7d4: 14000093    	b	0x10000da20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f0>
10000d7d8: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d7dc: eb08035f    	cmp	x26, x8
10000d7e0: 54000729    	b.ls	0x10000d8c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x894>
10000d7e4: 52800010    	mov	w16, #0x0               ; =0
10000d7e8: dac01340    	clz	x0, x26
10000d7ec: 9ac02342    	lsl	x2, x26, x0
10000d7f0: 531f79e3    	lsl	w3, w15, #1
10000d7f4: 110ab068    	add	w8, w3, #0x2ac
10000d7f8: f8685b71    	ldr	x17, [x27, w8, uxtw #3]
10000d7fc: 9b027e28    	mul	x8, x17, x2
10000d800: 9bc27e31    	umulh	x17, x17, x2
10000d804: 2a3103e4    	mvn	w4, w17
10000d808: f240209f    	tst	x4, #0x1ff
10000d80c: 540000c1    	b.ne	0x10000d824 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7f4>
10000d810: 110ab463    	add	w3, w3, #0x2ad
10000d814: f8635b63    	ldr	x3, [x27, w3, uxtw #3]
10000d818: 9bc27c62    	umulh	x2, x3, x2
10000d81c: ab080048    	adds	x8, x2, x8
10000d820: 9a913631    	cinc	x17, x17, hs
10000d824: d37ffe24    	lsr	x4, x17, #63
10000d828: 91002483    	add	x3, x4, #0x9
10000d82c: 9ac32622    	lsr	x2, x17, x3
10000d830: 1b197de5    	mul	w5, w15, w25
10000d834: 4b000080    	sub	w0, w4, w0
10000d838: 0b854000    	add	w0, w0, w5, asr #16
10000d83c: 1100fc00    	add	w0, w0, #0x3f
10000d840: 310ffc1f    	cmn	w0, #0x3ff
10000d844: 5400058c    	b.gt	0x10000d8f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8c4>
10000d848: 3110f41f    	cmn	w0, #0x43d
10000d84c: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d850: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d854: f2e00464    	movk	x4, #0x23, lsl #48
10000d858: 54000d22    	b.hs	0x10000d9fc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9cc>
10000d85c: 52800011    	mov	w17, #0x0               ; =0
10000d860: d2800008    	mov	x8, #0x0                ; =0
10000d864: 34000df0    	cbz	w16, 0x10000da20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f0>
10000d868: 52800002    	mov	w2, #0x0                ; =0
10000d86c: d2800000    	mov	x0, #0x0                ; =0
10000d870: b1000744    	adds	x4, x26, #0x1
10000d874: 540000e2    	b.hs	0x10000d890 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x860>
10000d878: b10559ff    	cmn	x15, #0x156
10000d87c: 540000ab    	b.lt	0x10000d890 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x860>
10000d880: f104d1ff    	cmp	x15, #0x134
10000d884: 5400076d    	b.le	0x10000d970 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x940>
10000d888: d2800000    	mov	x0, #0x0                ; =0
10000d88c: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000d890: eb00011f    	cmp	x8, x0
10000d894: 540014e1    	b.ne	0x10000db30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb00>
10000d898: 6b02023f    	cmp	w17, w2
10000d89c: 540014a1    	b.ne	0x10000db30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb00>
10000d8a0: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d8a4: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d8a8: f2e00464    	movk	x4, #0x23, lsl #48
10000d8ac: 1400005d    	b	0x10000da20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f0>
10000d8b0: d280001a    	mov	x26, #0x0               ; =0
10000d8b4: aa0c03ef    	mov	x15, x12
10000d8b8: eb02019f    	cmp	x12, x2
10000d8bc: 54fff381    	b.ne	0x10000d72c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6fc>
10000d8c0: 17ffffa1    	b	0x10000d744 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x714>
10000d8c4: 9e630341    	ucvtf	d1, x26
10000d8c8: d0000188    	adrp	x8, 0x10003f000 <__ZL13FFC_SPACE_LUT+0xe0>
10000d8cc: 910d4108    	add	x8, x8, #0x350
10000d8d0: b7f8106f    	tbnz	x15, #0x3f, 0x10000dadc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xaac>
10000d8d4: fc6f7902    	ldr	d2, [x8, x15, lsl #3]
10000d8d8: 1e610841    	fmul	d1, d2, d1
10000d8dc: 1e614022    	fneg	d2, d1
10000d8e0: 7100b6ff    	cmp	w23, #0x2d
10000d8e4: 1e610c41    	fcsel	d1, d2, d1, eq
10000d8e8: 52800028    	mov	w8, #0x1                ; =1
10000d8ec: 3607c161    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000d8f0: 17fffe0b    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000d8f4: 92400444    	and	x4, x2, #0x3
10000d8f8: 9ac32043    	lsl	x3, x2, x3
10000d8fc: eb11007f    	cmp	x3, x17
10000d900: fa410880    	ccmp	x4, #0x1, #0x0, eq
10000d904: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000d908: 910011e8    	add	x8, x15, #0x4
10000d90c: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000d910: 927ed448    	and	x8, x2, #0xfffffffffffffc
10000d914: 9a823108    	csel	x8, x8, x2, lo
10000d918: 92400111    	and	x17, x8, #0x1
10000d91c: 8b080222    	add	x2, x17, x8
10000d920: ca080223    	eor	x3, x17, x8
10000d924: 8a080228    	and	x8, x17, x8
10000d928: 8b430508    	add	x8, x8, x3, lsr #1
10000d92c: d376fc51    	lsr	x17, x2, #54
10000d930: f100023f    	cmp	x17, #0x0
10000d934: 52807fe2    	mov	w2, #0x3ff              ; =1023
10000d938: 1a820442    	cinc	w2, w2, ne
10000d93c: 0b000040    	add	w0, w2, w0
10000d940: 711ffc1f    	cmp	w0, #0x7ff
10000d944: fa403a20    	ccmp	x17, #0x0, #0x0, lo
10000d948: 92ffe211    	mov	x17, #0xefffffffffffff  ; =67553994410557439
10000d94c: 8a110108    	and	x8, x8, x17
10000d950: 9a9f0108    	csel	x8, x8, xzr, eq
10000d954: 5280fff1    	mov	w17, #0x7ff             ; =2047
10000d958: 1ad16c11    	umin	w17, w0, w17
10000d95c: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000d960: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000d964: f2e00464    	movk	x4, #0x23, lsl #48
10000d968: 360005d0    	tbz	w16, #0x0, 0x10000da20 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f0>
10000d96c: 17ffffbf    	b	0x10000d868 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000d970: dac01083    	clz	x3, x4
10000d974: 9ac32084    	lsl	x4, x4, x3
10000d978: 531f79e5    	lsl	w5, w15, #1
10000d97c: 110ab0a0    	add	w0, w5, #0x2ac
10000d980: f8605b62    	ldr	x2, [x27, w0, uxtw #3]
10000d984: 9b047c40    	mul	x0, x2, x4
10000d988: 9bc47c42    	umulh	x2, x2, x4
10000d98c: 2a2203e6    	mvn	w6, w2
10000d990: aa0703fe    	mov	x30, x7
10000d994: f24020df    	tst	x6, #0x1ff
10000d998: 540000c1    	b.ne	0x10000d9b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x980>
10000d99c: 110ab4a5    	add	w5, w5, #0x2ad
10000d9a0: f8655b65    	ldr	x5, [x27, w5, uxtw #3]
10000d9a4: 9bc47ca4    	umulh	x4, x5, x4
10000d9a8: ab000080    	adds	x0, x4, x0
10000d9ac: 9a823442    	cinc	x2, x2, hs
10000d9b0: d37ffc46    	lsr	x6, x2, #63
10000d9b4: 910024c5    	add	x5, x6, #0x9
10000d9b8: 9ac52444    	lsr	x4, x2, x5
10000d9bc: 1b197de7    	mul	w7, w15, w25
10000d9c0: 4b0300c3    	sub	w3, w6, w3
10000d9c4: 0b874063    	add	w3, w3, w7, asr #16
10000d9c8: 1100fc63    	add	w3, w3, #0x3f
10000d9cc: 310ffc7f    	cmn	w3, #0x3ff
10000d9d0: 5400046c    	b.gt	0x10000da5c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa2c>
10000d9d4: 3110f47f    	cmn	w3, #0x43d
10000d9d8: aa1e03e7    	mov	x7, x30
10000d9dc: 54000922    	b.hs	0x10000db00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xad0>
10000d9e0: d2800000    	mov	x0, #0x0                ; =0
10000d9e4: 52800002    	mov	w2, #0x0                ; =0
10000d9e8: 128f7966    	mov	w6, #-0x7bcc            ; =-31692
10000d9ec: 5280003e    	mov	w30, #0x1               ; =1
10000d9f0: eb00011f    	cmp	x8, x0
10000d9f4: 54fff520    	b.eq	0x10000d898 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x868>
10000d9f8: 1400004e    	b	0x10000db30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb00>
10000d9fc: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000da00: 4b000108    	sub	w8, w8, w0
10000da04: 9ac82448    	lsr	x8, x2, x8
10000da08: 92400111    	and	x17, x8, #0x1
10000da0c: 8b080231    	add	x17, x17, x8
10000da10: d341fe28    	lsr	x8, x17, #1
10000da14: f24b0e3f    	tst	x17, #0x1e0000000000000
10000da18: 1a9f07f1    	cset	w17, ne
10000da1c: 3707f270    	tbnz	w16, #0x0, 0x10000d868 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x838>
10000da20: 2a1103e2    	mov	w2, w17
10000da24: 7100b6ff    	cmp	w23, #0x2d
10000da28: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000da2c: 9a9f0129    	csel	x9, x9, xzr, eq
10000da30: aa02d129    	orr	x9, x9, x2, lsl #52
10000da34: aa080129    	orr	x9, x9, x8
10000da38: 9e670121    	fmov	d1, x9
10000da3c: f100011f    	cmp	x8, #0x0
10000da40: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000da44: fa400b44    	ccmp	x26, #0x0, #0x4, eq
10000da48: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000da4c: 7a480044    	ccmp	w2, w8, #0x4, eq
10000da50: 1a9f07e8    	cset	w8, ne
10000da54: 3607b621    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000da58: 17fffdb1    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000da5c: 92400486    	and	x6, x4, #0x3
10000da60: 9ac52085    	lsl	x5, x4, x5
10000da64: eb0200bf    	cmp	x5, x2
10000da68: fa4108c0    	ccmp	x6, #0x1, #0x0, eq
10000da6c: fa420802    	ccmp	x0, #0x2, #0x2, eq
10000da70: 910011e0    	add	x0, x15, #0x4
10000da74: fa5c3802    	ccmp	x0, #0x1c, #0x2, lo
10000da78: 927ed480    	and	x0, x4, #0xfffffffffffffc
10000da7c: 9a843000    	csel	x0, x0, x4, lo
10000da80: 92400002    	and	x2, x0, #0x1
10000da84: 8b000044    	add	x4, x2, x0
10000da88: ca000045    	eor	x5, x2, x0
10000da8c: 8a000040    	and	x0, x2, x0
10000da90: 8b450400    	add	x0, x0, x5, lsr #1
10000da94: d376fc82    	lsr	x2, x4, #54
10000da98: f100005f    	cmp	x2, #0x0
10000da9c: 52807fe4    	mov	w4, #0x3ff              ; =1023
10000daa0: 1a840484    	cinc	w4, w4, ne
10000daa4: 0b030083    	add	w3, w4, w3
10000daa8: 711ffc7f    	cmp	w3, #0x7ff
10000daac: fa403840    	ccmp	x2, #0x0, #0x0, lo
10000dab0: 92ffe202    	mov	x2, #0xefffffffffffff   ; =67553994410557439
10000dab4: 8a020000    	and	x0, x0, x2
10000dab8: 9a9f0000    	csel	x0, x0, xzr, eq
10000dabc: 5280ffe2    	mov	w2, #0x7ff              ; =2047
10000dac0: 1ac26c62    	umin	w2, w3, w2
10000dac4: aa1e03e7    	mov	x7, x30
10000dac8: 128f7966    	mov	w6, #-0x7bcc            ; =-31692
10000dacc: 5280003e    	mov	w30, #0x1               ; =1
10000dad0: eb00011f    	cmp	x8, x0
10000dad4: 54ffee20    	b.eq	0x10000d898 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x868>
10000dad8: 14000016    	b	0x10000db30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb00>
10000dadc: cb0f0d08    	sub	x8, x8, x15, lsl #3
10000dae0: fd400102    	ldr	d2, [x8]
10000dae4: 1e621821    	fdiv	d1, d1, d2
10000dae8: 1e614022    	fneg	d2, d1
10000daec: 7100b6ff    	cmp	w23, #0x2d
10000daf0: 1e610c41    	fcsel	d1, d2, d1, eq
10000daf4: 52800028    	mov	w8, #0x1                ; =1
10000daf8: 3607b101    	tbz	w1, #0x0, 0x10000d118 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xe8>
10000dafc: 17fffd88    	b	0x10000d11c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xec>
10000db00: 12807fa0    	mov	w0, #-0x3fe             ; =-1022
10000db04: 4b030000    	sub	w0, w0, w3
10000db08: 9ac02480    	lsr	x0, x4, x0
10000db0c: 92400002    	and	x2, x0, #0x1
10000db10: 8b000042    	add	x2, x2, x0
10000db14: d341fc40    	lsr	x0, x2, #1
10000db18: f24b0c5f    	tst	x2, #0x1e0000000000000
10000db1c: 1a9f07e2    	cset	w2, ne
10000db20: 128f7966    	mov	w6, #-0x7bcc            ; =-31692
10000db24: 5280003e    	mov	w30, #0x1               ; =1
10000db28: eb00011f    	cmp	x8, x0
10000db2c: 54ffeb60    	b.eq	0x10000d898 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x868>
10000db30: dac01351    	clz	x17, x26
10000db34: 9ad12340    	lsl	x0, x26, x17
10000db38: 531f79e2    	lsl	w2, w15, #1
10000db3c: 110ab048    	add	w8, w2, #0x2ac
10000db40: f868db63    	ldr	x3, [x27, w8, sxtw #3]
10000db44: 9bc07c68    	umulh	x8, x3, x0
10000db48: 2a2803e4    	mvn	w4, w8
10000db4c: f240209f    	tst	x4, #0x1ff
10000db50: 540000e1    	b.ne	0x10000db6c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb3c>
10000db54: 9b007c63    	mul	x3, x3, x0
10000db58: 110ab442    	add	w2, w2, #0x2ad
10000db5c: f862db62    	ldr	x2, [x27, w2, sxtw #3]
10000db60: 9bc07c40    	umulh	x0, x2, x0
10000db64: ab03001f    	cmn	x0, x3
10000db68: 9a883508    	cinc	x8, x8, hs
10000db6c: d37ffd00    	lsr	x0, x8, #63
10000db70: 52000000    	eor	w0, w0, #0x1
10000db74: 9ac02108    	lsl	x8, x8, x0
10000db78: 1b197de2    	mul	w2, w15, w25
10000db7c: 13107c42    	asr	w2, w2, #16
10000db80: 4b110051    	sub	w17, w2, w17
10000db84: 4b000231    	sub	w17, w17, w0
10000db88: 2b060222    	adds	w2, w17, w6
10000db8c: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000db90: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000db94: f2e00464    	movk	x4, #0x23, lsl #48
10000db98: 54fff465    	b.pl	0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f4>
10000db9c: a9036bef    	stp	x15, x26, [sp, #0x30]
10000dba0: f90023ee    	str	x14, [sp, #0x40]
10000dba4: 390123ea    	strb	w10, [sp, #0x48]
10000dba8: 390127fe    	strb	w30, [sp, #0x49]
10000dbac: 39012bf0    	strb	w16, [sp, #0x4a]
10000dbb0: b9402bea    	ldr	w10, [sp, #0x28]
10000dbb4: 9100c3ee    	add	x14, sp, #0x30
10000dbb8: b801b1ca    	stur	w10, [x14, #0x1b]
10000dbbc: 3940b3ea    	ldrb	w10, [sp, #0x2c]
10000dbc0: 3801f1ca    	sturb	w10, [x14, #0x1f]
10000dbc4: a9052fe9    	stp	x9, x11, [sp, #0x50]
10000dbc8: a90637ec    	stp	x12, x13, [sp, #0x60]
10000dbcc: f9003bff    	str	xzr, [sp, #0x70]
10000dbd0: 9100c3e0    	add	x0, sp, #0x30
10000dbd4: aa0103f9    	mov	x25, x1
10000dbd8: aa0803e1    	mov	x1, x8
10000dbdc: 52800023    	mov	w3, #0x1                ; =1
10000dbe0: 4ea01c0f    	mov.16b	v15, v0
10000dbe4: aa1b03f6    	mov	x22, x27
10000dbe8: aa1803fb    	mov	x27, x24
10000dbec: aa0703f8    	mov	x24, x7
10000dbf0: ad001be7    	stp	q7, q6, [sp]
10000dbf4: 94001516    	bl	0x10001304c <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000dbf8: d2adf824    	mov	x4, #0x6fc10000         ; =1874919424
10000dbfc: f2d0de44    	movk	x4, #0x86f2, lsl #32
10000dc00: f2e00464    	movk	x4, #0x23, lsl #48
10000dc04: ad401be7    	ldp	q7, q6, [sp]
10000dc08: 4f06e605    	movi.16b	v5, #0xd0
10000dc0c: 5280003e    	mov	w30, #0x1               ; =1
10000dc10: 128f7966    	mov	w6, #-0x7bcc            ; =-31692
10000dc14: aa1803e7    	mov	x7, x24
10000dc18: aa1b03f8    	mov	x24, x27
10000dc1c: aa1603fb    	mov	x27, x22
10000dc20: 529c2016    	mov	w22, #0xe100            ; =57600
10000dc24: 72a0beb6    	movk	w22, #0x5f5, lsl #16
10000dc28: 4eaf1de0    	mov.16b	v0, v15
10000dc2c: aa0003e8    	mov	x8, x0
10000dc30: aa0103e2    	mov	x2, x1
10000dc34: aa1903e1    	mov	x1, x25
10000dc38: 528a4d59    	mov	w25, #0x526a            ; =21098
10000dc3c: 72a00079    	movk	w25, #0x3, lsl #16
10000dc40: 17ffff79    	b	0x10000da24 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9f4>
10000dc44: 6f00e400    	movi.2d	v0, #0000000000000000
10000dc48: a9517bfd    	ldp	x29, x30, [sp, #0x110]
10000dc4c: a9504ff4    	ldp	x20, x19, [sp, #0x100]
10000dc50: a94f57f6    	ldp	x22, x21, [sp, #0xf0]
10000dc54: a94e5ff8    	ldp	x24, x23, [sp, #0xe0]
10000dc58: a94d67fa    	ldp	x26, x25, [sp, #0xd0]
10000dc5c: a94c6ffc    	ldp	x28, x27, [sp, #0xc0]
10000dc60: 6d4b23e9    	ldp	d9, d8, [sp, #0xb0]
10000dc64: 6d4a2beb    	ldp	d11, d10, [sp, #0xa0]
10000dc68: 6d4933ed    	ldp	d13, d12, [sp, #0x90]
10000dc6c: 6d483bef    	ldp	d15, d14, [sp, #0x80]
10000dc70: 910483ff    	add	sp, sp, #0x120
10000dc74: d65f03c0    	ret
10000dc78: 52800200    	mov	w0, #0x10               ; =16
10000dc7c: 9400b477    	bl	0x10003ae58 <_strtod_l+0x10003ae58>
10000dc80: aa0003f3    	mov	x19, x0
10000dc84: b00001e1    	adrp	x1, 0x10004a000 <GCC_except_table349+0x20>
10000dc88: 911eb421    	add	x1, x1, #0x7ad
10000dc8c: 9400b3f2    	bl	0x10003ac54 <_strtod_l+0x10003ac54>
10000dc90: aa1303e0    	mov	x0, x19
10000dc94: 9400b39d    	bl	0x10003ab08 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000dc98: aa0003f4    	mov	x20, x0
10000dc9c: aa1303e0    	mov	x0, x19
10000dca0: 9400b47d    	bl	0x10003ae94 <_strtod_l+0x10003ae94>
10000dca4: aa1403e0    	mov	x0, x20
10000dca8: 9400b3b8    	bl	0x10003ab88 <_strtod_l+0x10003ab88>
