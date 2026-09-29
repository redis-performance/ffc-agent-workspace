
simple_fastfloat_benchmark/build/m6-scan-neon16-outlined/benchmarks/benchmark:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000cfdc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb>:
10000cfdc: d10483ff    	sub	sp, sp, #0x120
10000cfe0: 6d083bef    	stp	d15, d14, [sp, #0x80]
10000cfe4: 6d0933ed    	stp	d13, d12, [sp, #0x90]
10000cfe8: 6d0a2beb    	stp	d11, d10, [sp, #0xa0]
10000cfec: 6d0b23e9    	stp	d9, d8, [sp, #0xb0]
10000cff0: a90c6ffc    	stp	x28, x27, [sp, #0xc0]
10000cff4: a90d67fa    	stp	x26, x25, [sp, #0xd0]
10000cff8: a90e5ff8    	stp	x24, x23, [sp, #0xe0]
10000cffc: a90f57f6    	stp	x22, x21, [sp, #0xf0]
10000d000: a9104ff4    	stp	x20, x19, [sp, #0x100]
10000d004: a9117bfd    	stp	x29, x30, [sp, #0x110]
10000d008: 910443fd    	add	x29, sp, #0x110
10000d00c: a9407014    	ldp	x20, x28, [x0]
10000d010: eb1c029f    	cmp	x20, x28
10000d014: 540058e0    	b.eq	0x10000db30 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb54>
10000d018: aa0103f9    	mov	x25, x1
10000d01c: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d020: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d024: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d028: 6f00e409    	movi.2d	v9, #0000000000000000
10000d02c: d2effe08    	mov	x8, #0x7ff0000000000000 ; =9218868437227405312
10000d030: 9e67010a    	fmov	d10, x8
10000d034: d2fffe08    	mov	x8, #-0x10000000000000  ; =-4503599627370496
10000d038: 9e67010b    	fmov	d11, x8
10000d03c: d2efff08    	mov	x8, #0x7ff8000000000000 ; =9221120237041090560
10000d040: 9e67010c    	fmov	d12, x8
10000d044: d2ffff08    	mov	x8, #-0x8000000000000   ; =-2251799813685248
10000d048: 9e67010d    	fmov	d13, x8
10000d04c: d0000183    	adrp	x3, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d050: 910e6063    	add	x3, x3, #0x398
10000d054: 52800144    	mov	w4, #0xa                ; =10
10000d058: d2f00008    	mov	x8, #-0x8000000000000000 ; =-9223372036854775808
10000d05c: 9e67010e    	fmov	d14, x8
10000d060: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d064: 6f00e408    	movi.2d	v8, #0000000000000000
10000d068: b9000fe1    	str	w1, [sp, #0xc]
10000d06c: 14000009    	b	0x10000d090 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb4>
10000d070: 52800008    	mov	w8, #0x0                ; =0
10000d074: 37000059    	tbnz	w25, #0x0, 0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000d078: 36005788    	tbz	w8, #0x0, 0x10000db68 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb8c>
10000d07c: 1e6f2100    	fcmp	d8, d15
10000d080: 1e6fcd08    	fcsel	d8, d8, d15, gt
10000d084: 91006294    	add	x20, x20, #0x18
10000d088: eb1c029f    	cmp	x20, x28
10000d08c: 54005540    	b.eq	0x10000db34 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb58>
10000d090: 39805e96    	ldrsb	x22, [x20, #0x17]
10000d094: b7f800b6    	tbnz	x22, #0x3f, 0x10000d0a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xcc>
10000d098: aa1403f3    	mov	x19, x20
10000d09c: 6f00e40f    	movi.2d	v15, #0000000000000000
10000d0a0: b50000b6    	cbnz	x22, 0x10000d0b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xd8>
10000d0a4: 17fffff3    	b	0x10000d070 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94>
10000d0a8: a9405a93    	ldp	x19, x22, [x20]
10000d0ac: 6f00e40f    	movi.2d	v15, #0000000000000000
10000d0b0: b4fffe16    	cbz	x22, 0x10000d070 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94>
10000d0b4: 39400266    	ldrb	w6, [x19]
10000d0b8: aa0603e8    	mov	x8, x6
10000d0bc: aa1303fb    	mov	x27, x19
10000d0c0: 7100b4df    	cmp	w6, #0x2d
10000d0c4: 1a9f17e7    	cset	w7, eq
10000d0c8: 54000161    	b.ne	0x10000d0f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x118>
10000d0cc: f10006df    	cmp	x22, #0x1
10000d0d0: 54001d20    	b.eq	0x10000d474 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x498>
10000d0d4: aa1303fb    	mov	x27, x19
10000d0d8: 38c01f69    	ldrsb	w9, [x27, #0x1]!
10000d0dc: 12001d28    	and	w8, w9, #0xff
10000d0e0: 7100b93f    	cmp	w9, #0x2e
10000d0e4: 54000080    	b.eq	0x10000d0f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x118>
10000d0e8: 5100c129    	sub	w9, w9, #0x30
10000d0ec: 7100253f    	cmp	w9, #0x9
10000d0f0: 54001c28    	b.hi	0x10000d474 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x498>
10000d0f4: 8b160275    	add	x21, x19, x22
10000d0f8: eb15037f    	cmp	x27, x21
10000d0fc: 540008c0    	b.eq	0x10000d214 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x238>
10000d100: 13001d09    	sxtb	w9, w8
10000d104: 5100c129    	sub	w9, w9, #0x30
10000d108: 7100253f    	cmp	w9, #0x9
10000d10c: 54000848    	b.hi	0x10000d214 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x238>
10000d110: 9100077a    	add	x26, x27, #0x1
10000d114: 93401d08    	sxtb	x8, w8
10000d118: d100c118    	sub	x24, x8, #0x30
10000d11c: eb15035f    	cmp	x26, x21
10000d120: 540007e0    	b.eq	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d124: 39c00348    	ldrsb	w8, [x26]
10000d128: 5100c109    	sub	w9, w8, #0x30
10000d12c: 7100253f    	cmp	w9, #0x9
10000d130: 54000768    	b.hi	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d134: 93407d08    	sxtw	x8, w8
10000d138: 91000b7a    	add	x26, x27, #0x2
10000d13c: d100c108    	sub	x8, x8, #0x30
10000d140: aa1803e9    	mov	x9, x24
10000d144: 8b090938    	add	x24, x9, x9, lsl #2
10000d148: 8b180518    	add	x24, x8, x24, lsl #1
10000d14c: eb15035f    	cmp	x26, x21
10000d150: 54000660    	b.eq	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d154: 39c00348    	ldrsb	w8, [x26]
10000d158: 5100c109    	sub	w9, w8, #0x30
10000d15c: 7100253f    	cmp	w9, #0x9
10000d160: 540005e8    	b.hi	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d164: 93407d08    	sxtw	x8, w8
10000d168: 91000f7a    	add	x26, x27, #0x3
10000d16c: d100c108    	sub	x8, x8, #0x30
10000d170: aa1803e9    	mov	x9, x24
10000d174: 8b090938    	add	x24, x9, x9, lsl #2
10000d178: 8b180518    	add	x24, x8, x24, lsl #1
10000d17c: eb15035f    	cmp	x26, x21
10000d180: 540004e0    	b.eq	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d184: 39c00348    	ldrsb	w8, [x26]
10000d188: 5100c109    	sub	w9, w8, #0x30
10000d18c: 7100253f    	cmp	w9, #0x9
10000d190: 54000468    	b.hi	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d194: 93407d08    	sxtw	x8, w8
10000d198: 9100137a    	add	x26, x27, #0x4
10000d19c: d100c108    	sub	x8, x8, #0x30
10000d1a0: aa1803e9    	mov	x9, x24
10000d1a4: 8b090938    	add	x24, x9, x9, lsl #2
10000d1a8: 8b180518    	add	x24, x8, x24, lsl #1
10000d1ac: eb15035f    	cmp	x26, x21
10000d1b0: 54000360    	b.eq	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d1b4: 39c00348    	ldrsb	w8, [x26]
10000d1b8: 5100c109    	sub	w9, w8, #0x30
10000d1bc: 7100253f    	cmp	w9, #0x9
10000d1c0: 540002e8    	b.hi	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d1c4: 93407d08    	sxtw	x8, w8
10000d1c8: 9100177a    	add	x26, x27, #0x5
10000d1cc: d100c109    	sub	x9, x8, #0x30
10000d1d0: 8b180b08    	add	x8, x24, x24, lsl #2
10000d1d4: 8b080528    	add	x8, x9, x8, lsl #1
10000d1d8: eb15035f    	cmp	x26, x21
10000d1dc: 540018a0    	b.eq	0x10000d4f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x514>
10000d1e0: 39c00349    	ldrsb	w9, [x26]
10000d1e4: 5100c12a    	sub	w10, w9, #0x30
10000d1e8: 7100255f    	cmp	w10, #0x9
10000d1ec: 54001828    	b.hi	0x10000d4f0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x514>
10000d1f0: 93407d29    	sxtw	x9, w9
10000d1f4: d100c129    	sub	x9, x9, #0x30
10000d1f8: 8b080918    	add	x24, x8, x8, lsl #2
10000d1fc: 8b180538    	add	x24, x9, x24, lsl #1
10000d200: 9100075a    	add	x26, x26, #0x1
10000d204: aa1803e8    	mov	x8, x24
10000d208: eb15035f    	cmp	x26, x21
10000d20c: 54fffea1    	b.ne	0x10000d1e0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x204>
10000d210: 14000003    	b	0x10000d21c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x240>
10000d214: d2800018    	mov	x24, #0x0               ; =0
10000d218: aa1b03fa    	mov	x26, x27
10000d21c: cb1b035e    	sub	x30, x26, x27
10000d220: eb15035f    	cmp	x26, x21
10000d224: 540016e0    	b.eq	0x10000d500 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x524>
10000d228: 39400348    	ldrb	w8, [x26]
10000d22c: 7100b91f    	cmp	w8, #0x2e
10000d230: 54001681    	b.ne	0x10000d500 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x524>
10000d234: 29041be7    	stp	w7, w6, [sp, #0x20]
10000d238: aa1c03f7    	mov	x23, x28
10000d23c: 91000759    	add	x25, x26, #0x1
10000d240: cb1902bc    	sub	x28, x21, x25
10000d244: f100439f    	cmp	x28, #0x10
10000d248: a9017bf9    	stp	x25, x30, [sp, #0x10]
10000d24c: 540001ab    	b.lt	0x10000d280 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x2a4>
10000d250: 3dc00320    	ldr	q0, [x25]
10000d254: 9400173a    	bl	0x100012f3c <__ZL28ffc_parse_sixteen_ascii_neonPKc>
10000d258: b100041f    	cmn	x0, #0x1
10000d25c: 54000120    	b.eq	0x10000d280 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x2a4>
10000d260: d2adf828    	mov	x8, #0x6fc10000         ; =1874919424
10000d264: f2d0de48    	movk	x8, #0x86f2, lsl #32
10000d268: f2e00468    	movk	x8, #0x23, lsl #48
10000d26c: 9b080318    	madd	x24, x24, x8, x0
10000d270: 91004339    	add	x25, x25, #0x10
10000d274: d100439c    	sub	x28, x28, #0x10
10000d278: f1003f9f    	cmp	x28, #0xf
10000d27c: 54fffeac    	b.gt	0x10000d250 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x274>
10000d280: f100239f    	cmp	x28, #0x8
10000d284: 540002cb    	b.lt	0x10000d2dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x300>
10000d288: f9400328    	ldr	x8, [x25]
10000d28c: b207c7e9    	mov	x9, #0x606060606060606  ; =434041037028460038
10000d290: b202e129    	orr	x9, x9, #0x4444444444444444
10000d294: 8b090109    	add	x9, x8, x9
10000d298: b202d7ea    	mov	x10, #-0x3030303030303031 ; =-3472328296227680305
10000d29c: f299fa0a    	movk	x10, #0xcfd0
10000d2a0: 8b0a0108    	add	x8, x8, x10
10000d2a4: aa080129    	orr	x9, x9, x8
10000d2a8: f201c13f    	tst	x9, #0x8080808080808080
10000d2ac: 52800144    	mov	w4, #0xa                ; =10
10000d2b0: 540001e0    	b.eq	0x10000d2ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x310>
10000d2b4: aa1703fc    	mov	x28, x23
10000d2b8: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d2bc: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d2c0: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d2c4: d0000183    	adrp	x3, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d2c8: 910e6063    	add	x3, x3, #0x398
10000d2cc: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d2d0: 29441be7    	ldp	w7, w6, [sp, #0x20]
10000d2d4: a9417be1    	ldp	x1, x30, [sp, #0x10]
10000d2d8: 14000022    	b	0x10000d360 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x384>
10000d2dc: d0000183    	adrp	x3, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d2e0: 910e6063    	add	x3, x3, #0x398
10000d2e4: 52800144    	mov	w4, #0xa                ; =10
10000d2e8: 14000015    	b	0x10000d33c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x360>
10000d2ec: 529c2009    	mov	w9, #0xe100             ; =57600
10000d2f0: 72a0bea9    	movk	w9, #0x5f5, lsl #16
10000d2f4: 9b097f09    	mul	x9, x24, x9
10000d2f8: 9b047d0a    	mul	x10, x8, x4
10000d2fc: 8b482148    	add	x8, x10, x8, lsr #8
10000d300: 92001d0a    	and	x10, x8, #0xff000000ff
10000d304: d2800c8b    	mov	x11, #0x64              ; =100
10000d308: f2c8480b    	movk	x11, #0x4240, lsl #32
10000d30c: f2e001eb    	movk	x11, #0xf, lsl #48
10000d310: 9b0b7d4a    	mul	x10, x10, x11
10000d314: d350fd08    	lsr	x8, x8, #16
10000d318: 92001d08    	and	x8, x8, #0xff000000ff
10000d31c: d280002b    	mov	x11, #0x1               ; =1
10000d320: f2c4e20b    	movk	x11, #0x2710, lsl #32
10000d324: 9b0b2908    	madd	x8, x8, x11, x10
10000d328: 8b488138    	add	x24, x9, x8, lsr #32
10000d32c: 91002339    	add	x25, x25, #0x8
10000d330: cb1902bc    	sub	x28, x21, x25
10000d334: d0000183    	adrp	x3, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d338: 910e6063    	add	x3, x3, #0x398
10000d33c: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d340: 29441be7    	ldp	w7, w6, [sp, #0x20]
10000d344: a9417be1    	ldp	x1, x30, [sp, #0x10]
10000d348: f100139f    	cmp	x28, #0x4
10000d34c: aa1703fc    	mov	x28, x23
10000d350: d2b4ec97    	mov	x23, #0xa7640000        ; =2808348672
10000d354: f2d6d677    	movk	x23, #0xb6b3, lsl #32
10000d358: f2e1bc17    	movk	x23, #0xde0, lsl #48
10000d35c: 5400016b    	b.lt	0x10000d388 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3ac>
10000d360: b9400328    	ldr	w8, [x25]
10000d364: 5288c8c9    	mov	w9, #0x4646             ; =17990
10000d368: 72a8c8c9    	movk	w9, #0x4646, lsl #16
10000d36c: 0b090109    	add	w9, w8, w9
10000d370: 5299fa0a    	mov	w10, #0xcfd0            ; =53200
10000d374: 72b9f9ea    	movk	w10, #0xcfcf, lsl #16
10000d378: 0b0a0108    	add	w8, w8, w10
10000d37c: 2a080129    	orr	w9, w9, w8
10000d380: 7201c13f    	tst	w9, #0x80808080
10000d384: 54000520    	b.eq	0x10000d428 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x44c>
10000d388: eb15033f    	cmp	x25, x21
10000d38c: 54000660    	b.eq	0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x47c>
10000d390: 39c00328    	ldrsb	w8, [x25]
10000d394: 5100c109    	sub	w9, w8, #0x30
10000d398: 7100253f    	cmp	w9, #0x9
10000d39c: 540005e8    	b.hi	0x10000d458 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x47c>
10000d3a0: 12001d08    	and	w8, w8, #0xff
10000d3a4: 9100072a    	add	x10, x25, #0x1
10000d3a8: 5100c108    	sub	w8, w8, #0x30
10000d3ac: 92401d08    	and	x8, x8, #0xff
10000d3b0: aa1803e9    	mov	x9, x24
10000d3b4: 8b090938    	add	x24, x9, x9, lsl #2
10000d3b8: 8b180518    	add	x24, x8, x24, lsl #1
10000d3bc: eb15015f    	cmp	x10, x21
10000d3c0: 540004e0    	b.eq	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x480>
10000d3c4: 39c00148    	ldrsb	w8, [x10]
10000d3c8: 5100c109    	sub	w9, w8, #0x30
10000d3cc: 7100253f    	cmp	w9, #0x9
10000d3d0: 54000468    	b.hi	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x480>
10000d3d4: 12001d08    	and	w8, w8, #0xff
10000d3d8: 91000b2a    	add	x10, x25, #0x2
10000d3dc: 5100c108    	sub	w8, w8, #0x30
10000d3e0: 92401d08    	and	x8, x8, #0xff
10000d3e4: aa1803e9    	mov	x9, x24
10000d3e8: 8b090938    	add	x24, x9, x9, lsl #2
10000d3ec: 8b180518    	add	x24, x8, x24, lsl #1
10000d3f0: eb15015f    	cmp	x10, x21
10000d3f4: 54000340    	b.eq	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x480>
10000d3f8: 39c00148    	ldrsb	w8, [x10]
10000d3fc: 5100c109    	sub	w9, w8, #0x30
10000d400: 7100253f    	cmp	w9, #0x9
10000d404: 540002c8    	b.hi	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x480>
10000d408: 12001d08    	and	w8, w8, #0xff
10000d40c: 91000f2a    	add	x10, x25, #0x3
10000d410: 5100c108    	sub	w8, w8, #0x30
10000d414: 92401d08    	and	x8, x8, #0xff
10000d418: 8b180b09    	add	x9, x24, x24, lsl #2
10000d41c: 8b090509    	add	x9, x8, x9, lsl #1
10000d420: aa0903f8    	mov	x24, x9
10000d424: 1400000e    	b	0x10000d45c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x480>
10000d428: 1b047d09    	mul	w9, w8, w4
10000d42c: 0b482128    	add	w8, w9, w8, lsr #8
10000d430: 12009d08    	and	w8, w8, #0xff00ff
10000d434: 52800029    	mov	w9, #0x1                ; =1
10000d438: 72a00c89    	movk	w9, #0x64, lsl #16
10000d43c: 1b097d08    	mul	w8, w8, w9
10000d440: 53107d08    	lsr	w8, w8, #16
10000d444: 5284e209    	mov	w9, #0x2710             ; =10000
10000d448: 9b092318    	madd	x24, x24, x9, x8
10000d44c: 91001339    	add	x25, x25, #0x4
10000d450: eb15033f    	cmp	x25, x21
10000d454: 54fff9e1    	b.ne	0x10000d390 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x3b4>
10000d458: aa1903ea    	mov	x10, x25
10000d45c: cb010149    	sub	x9, x10, x1
10000d460: cb0a002b    	sub	x11, x1, x10
10000d464: cb0b03cc    	sub	x12, x30, x11
10000d468: aa0a03e8    	mov	x8, x10
10000d46c: b9400ff9    	ldr	w25, [sp, #0xc]
10000d470: b500056c    	cbnz	x12, 0x10000d51c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x540>
10000d474: 39400268    	ldrb	w8, [x19]
10000d478: 7100b51f    	cmp	w8, #0x2d
10000d47c: 1a9f17e9    	cset	w9, eq
10000d480: cb0902ca    	sub	x10, x22, x9
10000d484: f1000d5f    	cmp	x10, #0x3
10000d488: 54ffdf4b    	b.lt	0x10000d070 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94>
10000d48c: 8b090269    	add	x9, x19, x9
10000d490: 3940092a    	ldrb	w10, [x9, #0x2]
10000d494: 79400129    	ldrh	w9, [x9]
10000d498: aa0a4129    	orr	x9, x9, x10, lsl #16
10000d49c: b203c129    	orr	x9, x9, #0x2020202020202020
10000d4a0: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d4a4: f28dcd2a    	movk	x10, #0x6e69
10000d4a8: f2a40cca    	movk	x10, #0x2066, lsl #16
10000d4ac: eb0a013f    	cmp	x9, x10
10000d4b0: 54000160    	b.eq	0x10000d4dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x500>
10000d4b4: b203c3ea    	mov	x10, #0x2020202020202020 ; =2314885530818453536
10000d4b8: f28c2dca    	movk	x10, #0x616e
10000d4bc: f2a40dca    	movk	x10, #0x206e, lsl #16
10000d4c0: eb0a013f    	cmp	x9, x10
10000d4c4: 54ffdd61    	b.ne	0x10000d070 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x94>
10000d4c8: 7100b51f    	cmp	w8, #0x2d
10000d4cc: 1e6c0daf    	fcsel	d15, d13, d12, eq
10000d4d0: 52800028    	mov	w8, #0x1                ; =1
10000d4d4: 3607dd39    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000d4d8: 17fffee9    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000d4dc: 7100b51f    	cmp	w8, #0x2d
10000d4e0: 1e6a0d6f    	fcsel	d15, d11, d10, eq
10000d4e4: 52800028    	mov	w8, #0x1                ; =1
10000d4e8: 3607dc99    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000d4ec: 17fffee4    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000d4f0: aa0803f8    	mov	x24, x8
10000d4f4: cb1b035e    	sub	x30, x26, x27
10000d4f8: eb15035f    	cmp	x26, x21
10000d4fc: 54ffe961    	b.ne	0x10000d228 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x24c>
10000d500: d2800009    	mov	x9, #0x0                ; =0
10000d504: d280000b    	mov	x11, #0x0               ; =0
10000d508: d2800001    	mov	x1, #0x0                ; =0
10000d50c: d2800008    	mov	x8, #0x0                ; =0
10000d510: aa1a03ea    	mov	x10, x26
10000d514: aa1e03ec    	mov	x12, x30
10000d518: b4fffafe    	cbz	x30, 0x10000d474 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x498>
10000d51c: eb15015f    	cmp	x10, x21
10000d520: 54000580    	b.eq	0x10000d5d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d524: 3940014d    	ldrb	w13, [x10]
10000d528: 321b01ad    	orr	w13, w13, #0x20
10000d52c: 710195bf    	cmp	w13, #0x65
10000d530: 54000501    	b.ne	0x10000d5d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d534: 9100054e    	add	x14, x10, #0x1
10000d538: eb1501df    	cmp	x14, x21
10000d53c: 54000180    	b.eq	0x10000d56c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x590>
10000d540: 394001cd    	ldrb	w13, [x14]
10000d544: 9100094f    	add	x15, x10, #0x2
10000d548: 7100adbf    	cmp	w13, #0x2b
10000d54c: 9a8e01ee    	csel	x14, x15, x14, eq
10000d550: 7100b5bf    	cmp	w13, #0x2d
10000d554: 5280002d    	mov	w13, #0x1               ; =1
10000d558: 1a8d13ed    	csel	w13, wzr, w13, ne
10000d55c: 9a8f11ce    	csel	x14, x14, x15, ne
10000d560: eb1501df    	cmp	x14, x21
10000d564: 540000a1    	b.ne	0x10000d578 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x59c>
10000d568: 1400001a    	b	0x10000d5d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d56c: 5280000d    	mov	w13, #0x0               ; =0
10000d570: eb1501df    	cmp	x14, x21
10000d574: 540002e0    	b.eq	0x10000d5d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d578: 39c001cf    	ldrsb	w15, [x14]
10000d57c: 5100c1ef    	sub	w15, w15, #0x30
10000d580: 710025ff    	cmp	w15, #0x9
10000d584: 54000268    	b.hi	0x10000d5d0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5f4>
10000d588: d280000a    	mov	x10, #0x0               ; =0
10000d58c: 14000004    	b	0x10000d59c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5c0>
10000d590: 910005ce    	add	x14, x14, #0x1
10000d594: eb1501df    	cmp	x14, x21
10000d598: 54000800    	b.eq	0x10000d698 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6bc>
10000d59c: 39c001cf    	ldrsb	w15, [x14]
10000d5a0: 5100c1f0    	sub	w16, w15, #0x30
10000d5a4: 7100261f    	cmp	w16, #0x9
10000d5a8: 54000788    	b.hi	0x10000d698 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6bc>
10000d5ac: eb05015f    	cmp	x10, x5
10000d5b0: 54ffff0c    	b.gt	0x10000d590 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d5b4: 12001def    	and	w15, w15, #0xff
10000d5b8: 5100c1ef    	sub	w15, w15, #0x30
10000d5bc: 92401def    	and	x15, x15, #0xff
10000d5c0: 8b0a0950    	add	x16, x10, x10, lsl #2
10000d5c4: 8b1005f0    	add	x16, x15, x16, lsl #1
10000d5c8: aa1003ea    	mov	x10, x16
10000d5cc: 17fffff1    	b	0x10000d590 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x5b4>
10000d5d0: d280000d    	mov	x13, #0x0               ; =0
10000d5d4: f100519f    	cmp	x12, #0x14
10000d5d8: 540006cb    	b.lt	0x10000d6b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d4>
10000d5dc: eb15037f    	cmp	x27, x21
10000d5e0: 54000200    	b.eq	0x10000d620 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x644>
10000d5e4: aa1b03ee    	mov	x14, x27
10000d5e8: 14000007    	b	0x10000d604 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x628>
10000d5ec: 7100c1ff    	cmp	w15, #0x30
10000d5f0: 1a9f17ef    	cset	w15, eq
10000d5f4: cb0f018c    	sub	x12, x12, x15
10000d5f8: 910005ce    	add	x14, x14, #0x1
10000d5fc: eb1501df    	cmp	x14, x21
10000d600: 540000c0    	b.eq	0x10000d618 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x63c>
10000d604: 394001cf    	ldrb	w15, [x14]
10000d608: 7100c1ff    	cmp	w15, #0x30
10000d60c: 54ffff00    	b.eq	0x10000d5ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x610>
10000d610: 7100b9ff    	cmp	w15, #0x2e
10000d614: 54fffec0    	b.eq	0x10000d5ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x610>
10000d618: f100519f    	cmp	x12, #0x14
10000d61c: 540004ab    	b.lt	0x10000d6b0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6d4>
10000d620: eb1a037f    	cmp	x27, x26
10000d624: 54001500    	b.eq	0x10000d8c4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8e8>
10000d628: d2800018    	mov	x24, #0x0               ; =0
10000d62c: aa1b03eb    	mov	x11, x27
10000d630: 3880156c    	ldrsb	x12, [x11], #0x1
10000d634: 9b04330c    	madd	x12, x24, x4, x12
10000d638: d100c198    	sub	x24, x12, #0x30
10000d63c: eb17031f    	cmp	x24, x23
10000d640: fa5a3164    	ccmp	x11, x26, #0x4, lo
10000d644: 54ffff61    	b.ne	0x10000d630 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x654>
10000d648: d10006ec    	sub	x12, x23, #0x1
10000d64c: eb0c031f    	cmp	x24, x12
10000d650: 54000168    	b.hi	0x10000d67c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x6a0>
10000d654: aa0103eb    	mov	x11, x1
10000d658: eb08003f    	cmp	x1, x8
10000d65c: 540000e0    	b.eq	0x10000d678 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x69c>
10000d660: 3880156c    	ldrsb	x12, [x11], #0x1
10000d664: 9b04330c    	madd	x12, x24, x4, x12
10000d668: d100c198    	sub	x24, x12, #0x30
10000d66c: eb17031f    	cmp	x24, x23
10000d670: fa483164    	ccmp	x11, x8, #0x4, lo
10000d674: 54ffff61    	b.ne	0x10000d660 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x684>
10000d678: aa0103fa    	mov	x26, x1
10000d67c: cb0b0348    	sub	x8, x26, x11
10000d680: 8b0d010b    	add	x11, x8, x13
10000d684: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000d688: b9002bff    	str	wzr, [sp, #0x28]
10000d68c: 5280002c    	mov	w12, #0x1               ; =1
10000d690: b50003d8    	cbnz	x24, 0x10000d708 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x72c>
10000d694: 14000045    	b	0x10000d7a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d698: 710001bf    	cmp	w13, #0x0
10000d69c: da8a054d    	cneg	x13, x10, ne
10000d6a0: 8b0b01ab    	add	x11, x13, x11
10000d6a4: aa0e03ea    	mov	x10, x14
10000d6a8: f100519f    	cmp	x12, #0x14
10000d6ac: 54fff98a    	b.ge	0x10000d5dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x600>
10000d6b0: 3900b3ff    	strb	wzr, [sp, #0x2c]
10000d6b4: b9002bff    	str	wzr, [sp, #0x28]
10000d6b8: b50001eb    	cbnz	x11, 0x10000d6f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x718>
10000d6bc: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d6c0: eb08031f    	cmp	x24, x8
10000d6c4: 54000188    	b.hi	0x10000d6f4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x718>
10000d6c8: 9e630300    	ucvtf	d0, x24
10000d6cc: 1e614001    	fneg	d1, d0
10000d6d0: 7100b4df    	cmp	w6, #0x2d
10000d6d4: 1e600c20    	fcsel	d0, d1, d0, eq
10000d6d8: 1e690dc1    	fcsel	d1, d14, d9, eq
10000d6dc: f100031f    	cmp	x24, #0x0
10000d6e0: 1e611c0f    	fcsel	d15, d0, d1, ne
10000d6e4: 52800028    	mov	w8, #0x1                ; =1
10000d6e8: 2a0803e8    	mov	w8, w8
10000d6ec: 3607cc79    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000d6f0: 17fffe63    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000d6f4: d1005d68    	sub	x8, x11, #0x17
10000d6f8: b100b51f    	cmn	x8, #0x2d
10000d6fc: 54000162    	b.hs	0x10000d728 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x74c>
10000d700: 5280000c    	mov	w12, #0x0               ; =0
10000d704: b4000538    	cbz	x24, 0x10000d7a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d708: b105597f    	cmn	x11, #0x156
10000d70c: 540004eb    	b.lt	0x10000d7a8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7cc>
10000d710: f104d17f    	cmp	x11, #0x134
10000d714: 5400012d    	b.le	0x10000d738 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x75c>
10000d718: 5280ffed    	mov	w13, #0x7ff             ; =2047
10000d71c: d2800008    	mov	x8, #0x0                ; =0
10000d720: 350004ac    	cbnz	w12, 0x10000d7b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7d8>
10000d724: 140000c1    	b	0x10000da28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa4c>
10000d728: d2e00408    	mov	x8, #0x20000000000000   ; =9007199254740992
10000d72c: eb08031f    	cmp	x24, x8
10000d730: 54000d49    	b.ls	0x10000d8d8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x8fc>
10000d734: 5280000c    	mov	w12, #0x0               ; =0
10000d738: dac0130e    	clz	x14, x24
10000d73c: 9ace230f    	lsl	x15, x24, x14
10000d740: 531f7970    	lsl	w16, w11, #1
10000d744: 110ab208    	add	w8, w16, #0x2ac
10000d748: f868586d    	ldr	x13, [x3, w8, uxtw #3]
10000d74c: 9b0f7da8    	mul	x8, x13, x15
10000d750: 9bcf7dad    	umulh	x13, x13, x15
10000d754: 2a2d03f1    	mvn	w17, w13
10000d758: f240223f    	tst	x17, #0x1ff
10000d75c: 540000c1    	b.ne	0x10000d774 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x798>
10000d760: 110ab610    	add	w16, w16, #0x2ad
10000d764: f8705870    	ldr	x16, [x3, w16, uxtw #3]
10000d768: 9bcf7e0f    	umulh	x15, x16, x15
10000d76c: ab0801e8    	adds	x8, x15, x8
10000d770: 9a8d35ad    	cinc	x13, x13, hs
10000d774: d37ffdb1    	lsr	x17, x13, #63
10000d778: 91002630    	add	x16, x17, #0x9
10000d77c: 9ad025af    	lsr	x15, x13, x16
10000d780: 528a4d40    	mov	w0, #0x526a             ; =21098
10000d784: 72a00060    	movk	w0, #0x3, lsl #16
10000d788: 1b007d60    	mul	w0, w11, w0
10000d78c: 4b0e022e    	sub	w14, w17, w14
10000d790: 0b8041ce    	add	w14, w14, w0, asr #16
10000d794: 1100fdce    	add	w14, w14, #0x3f
10000d798: 310ffddf    	cmn	w14, #0x3ff
10000d79c: 54000b6c    	b.gt	0x10000d908 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x92c>
10000d7a0: 3110f5df    	cmn	w14, #0x43d
10000d7a4: 54001302    	b.hs	0x10000da04 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa28>
10000d7a8: 5280000d    	mov	w13, #0x0               ; =0
10000d7ac: d2800008    	mov	x8, #0x0                ; =0
10000d7b0: 340013cc    	cbz	w12, 0x10000da28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa4c>
10000d7b4: 5280000f    	mov	w15, #0x0               ; =0
10000d7b8: d280000e    	mov	x14, #0x0               ; =0
10000d7bc: b1000711    	adds	x17, x24, #0x1
10000d7c0: 540000e2    	b.hs	0x10000d7dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x800>
10000d7c4: b105597f    	cmn	x11, #0x156
10000d7c8: 540000ab    	b.lt	0x10000d7dc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x800>
10000d7cc: f104d17f    	cmp	x11, #0x134
10000d7d0: 54000d4d    	b.le	0x10000d978 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x99c>
10000d7d4: d280000e    	mov	x14, #0x0               ; =0
10000d7d8: 5280ffef    	mov	w15, #0x7ff             ; =2047
10000d7dc: eb0e011f    	cmp	x8, x14
10000d7e0: 54000061    	b.ne	0x10000d7ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x810>
10000d7e4: 6b0f01bf    	cmp	w13, w15
10000d7e8: 54001200    	b.eq	0x10000da28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa4c>
10000d7ec: dac0130d    	clz	x13, x24
10000d7f0: 9acd230e    	lsl	x14, x24, x13
10000d7f4: 531f796f    	lsl	w15, w11, #1
10000d7f8: 110ab1e8    	add	w8, w15, #0x2ac
10000d7fc: f868d870    	ldr	x16, [x3, w8, sxtw #3]
10000d800: 9bce7e08    	umulh	x8, x16, x14
10000d804: 2a2803f1    	mvn	w17, w8
10000d808: f240223f    	tst	x17, #0x1ff
10000d80c: 540000e1    	b.ne	0x10000d828 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x84c>
10000d810: 9b0e7e10    	mul	x16, x16, x14
10000d814: 110ab5ef    	add	w15, w15, #0x2ad
10000d818: f86fd86f    	ldr	x15, [x3, w15, sxtw #3]
10000d81c: 9bce7dee    	umulh	x14, x15, x14
10000d820: ab1001df    	cmn	x14, x16
10000d824: 9a883508    	cinc	x8, x8, hs
10000d828: d37ffd0e    	lsr	x14, x8, #63
10000d82c: 520001ce    	eor	w14, w14, #0x1
10000d830: 9ace2108    	lsl	x8, x8, x14
10000d834: 528a4d4f    	mov	w15, #0x526a            ; =21098
10000d838: 72a0006f    	movk	w15, #0x3, lsl #16
10000d83c: 1b0f7d6f    	mul	w15, w11, w15
10000d840: 13107def    	asr	w15, w15, #16
10000d844: 4b0d01ed    	sub	w13, w15, w13
10000d848: 4b0e01ad    	sub	w13, w13, w14
10000d84c: 128f796e    	mov	w14, #-0x7bcc           ; =-31692
10000d850: 2b0e01a2    	adds	w2, w13, w14
10000d854: 54000ec5    	b.pl	0x10000da2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa50>
10000d858: a90363eb    	stp	x11, x24, [sp, #0x30]
10000d85c: f90023ea    	str	x10, [sp, #0x40]
10000d860: 390123e7    	strb	w7, [sp, #0x48]
10000d864: 5280002a    	mov	w10, #0x1               ; =1
10000d868: 390127ea    	strb	w10, [sp, #0x49]
10000d86c: 39012bec    	strb	w12, [sp, #0x4a]
10000d870: b9402bea    	ldr	w10, [sp, #0x28]
10000d874: 9100c3eb    	add	x11, sp, #0x30
10000d878: b801b16a    	stur	w10, [x11, #0x1b]
10000d87c: 3940b3ea    	ldrb	w10, [sp, #0x2c]
10000d880: 3801f16a    	sturb	w10, [x11, #0x1f]
10000d884: a9057bfb    	stp	x27, x30, [sp, #0x50]
10000d888: a90627e1    	stp	x1, x9, [sp, #0x60]
10000d88c: f9003bff    	str	xzr, [sp, #0x70]
10000d890: 9100c3e0    	add	x0, sp, #0x30
10000d894: aa0803e1    	mov	x1, x8
10000d898: 52800023    	mov	w3, #0x1                ; =1
10000d89c: aa0603f3    	mov	x19, x6
10000d8a0: 940015c3    	bl	0x100012fac <__ZL14ffc_digit_comp10ffc_parsed21ffc_adjusted_mantissah>
10000d8a4: aa1303e6    	mov	x6, x19
10000d8a8: 12be0005    	mov	w5, #0xfffffff          ; =268435455
10000d8ac: 52800144    	mov	w4, #0xa                ; =10
10000d8b0: d0000183    	adrp	x3, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d8b4: 910e6063    	add	x3, x3, #0x398
10000d8b8: aa0003e8    	mov	x8, x0
10000d8bc: aa0103e2    	mov	x2, x1
10000d8c0: 1400005b    	b	0x10000da2c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa50>
10000d8c4: d2800018    	mov	x24, #0x0               ; =0
10000d8c8: aa0103eb    	mov	x11, x1
10000d8cc: eb08003f    	cmp	x1, x8
10000d8d0: 54ffec81    	b.ne	0x10000d660 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x684>
10000d8d4: 17ffff69    	b	0x10000d678 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x69c>
10000d8d8: 9e630300    	ucvtf	d0, x24
10000d8dc: d0000188    	adrp	x8, 0x10003f000 <__ZL21FFC_CHAR_TO_DIGIT_LUT+0x80>
10000d8e0: 910ac108    	add	x8, x8, #0x2b0
10000d8e4: b7f80fcb    	tbnz	x11, #0x3f, 0x10000dadc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb00>
10000d8e8: fc6b7901    	ldr	d1, [x8, x11, lsl #3]
10000d8ec: 1e600820    	fmul	d0, d1, d0
10000d8f0: 1e614001    	fneg	d1, d0
10000d8f4: 7100b4df    	cmp	w6, #0x2d
10000d8f8: 1e600c2f    	fcsel	d15, d1, d0, eq
10000d8fc: 52800028    	mov	w8, #0x1                ; =1
10000d900: 3607bbd9    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000d904: 17fffdde    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000d908: 924005f1    	and	x17, x15, #0x3
10000d90c: 9ad021f0    	lsl	x16, x15, x16
10000d910: eb0d021f    	cmp	x16, x13
10000d914: fa410a20    	ccmp	x17, #0x1, #0x0, eq
10000d918: fa420902    	ccmp	x8, #0x2, #0x2, eq
10000d91c: 91001168    	add	x8, x11, #0x4
10000d920: fa5c3902    	ccmp	x8, #0x1c, #0x2, lo
10000d924: 927ed5e8    	and	x8, x15, #0xfffffffffffffc
10000d928: 9a8f3108    	csel	x8, x8, x15, lo
10000d92c: 9240010d    	and	x13, x8, #0x1
10000d930: 8b0801af    	add	x15, x13, x8
10000d934: ca0801b0    	eor	x16, x13, x8
10000d938: 8a0801a8    	and	x8, x13, x8
10000d93c: 8b500508    	add	x8, x8, x16, lsr #1
10000d940: d376fded    	lsr	x13, x15, #54
10000d944: f10001bf    	cmp	x13, #0x0
10000d948: 52807fef    	mov	w15, #0x3ff             ; =1023
10000d94c: 1a8f05ef    	cinc	w15, w15, ne
10000d950: 0b0e01ee    	add	w14, w15, w14
10000d954: 711ffddf    	cmp	w14, #0x7ff
10000d958: fa4039a0    	ccmp	x13, #0x0, #0x0, lo
10000d95c: 92ffe20d    	mov	x13, #0xefffffffffffff  ; =67553994410557439
10000d960: 8a0d0108    	and	x8, x8, x13
10000d964: 9a9f0108    	csel	x8, x8, xzr, eq
10000d968: 5280ffed    	mov	w13, #0x7ff             ; =2047
10000d96c: 1acd6dcd    	umin	w13, w14, w13
10000d970: 360005cc    	tbz	w12, #0x0, 0x10000da28 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa4c>
10000d974: 17ffff90    	b	0x10000d7b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7d8>
10000d978: aa0103f3    	mov	x19, x1
10000d97c: dac01230    	clz	x16, x17
10000d980: 9ad02231    	lsl	x17, x17, x16
10000d984: 531f7960    	lsl	w0, w11, #1
10000d988: 110ab00e    	add	w14, w0, #0x2ac
10000d98c: f86e586f    	ldr	x15, [x3, w14, uxtw #3]
10000d990: 9b117dee    	mul	x14, x15, x17
10000d994: 9bd17def    	umulh	x15, x15, x17
10000d998: 2a2f03e1    	mvn	w1, w15
10000d99c: f240203f    	tst	x1, #0x1ff
10000d9a0: 540000c1    	b.ne	0x10000d9b8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9dc>
10000d9a4: 110ab400    	add	w0, w0, #0x2ad
10000d9a8: f8605860    	ldr	x0, [x3, w0, uxtw #3]
10000d9ac: 9bd17c11    	umulh	x17, x0, x17
10000d9b0: ab0e022e    	adds	x14, x17, x14
10000d9b4: 9a8f35ef    	cinc	x15, x15, hs
10000d9b8: d37ffde1    	lsr	x1, x15, #63
10000d9bc: 91002420    	add	x0, x1, #0x9
10000d9c0: 9ac025f1    	lsr	x17, x15, x0
10000d9c4: 528a4d42    	mov	w2, #0x526a             ; =21098
10000d9c8: 72a00062    	movk	w2, #0x3, lsl #16
10000d9cc: 1b027d62    	mul	w2, w11, w2
10000d9d0: 4b100030    	sub	w16, w1, w16
10000d9d4: 0b824210    	add	w16, w16, w2, asr #16
10000d9d8: 1100fe10    	add	w16, w16, #0x3f
10000d9dc: 310ffe1f    	cmn	w16, #0x3ff
10000d9e0: 5400042c    	b.gt	0x10000da64 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa88>
10000d9e4: 3110f61f    	cmn	w16, #0x43d
10000d9e8: 540008c2    	b.hs	0x10000db00 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xb24>
10000d9ec: d280000e    	mov	x14, #0x0               ; =0
10000d9f0: 5280000f    	mov	w15, #0x0               ; =0
10000d9f4: aa1303e1    	mov	x1, x19
10000d9f8: eb0e011f    	cmp	x8, x14
10000d9fc: 54ffef40    	b.eq	0x10000d7e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x808>
10000da00: 17ffff7b    	b	0x10000d7ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x810>
10000da04: 12807fa8    	mov	w8, #-0x3fe             ; =-1022
10000da08: 4b0e0108    	sub	w8, w8, w14
10000da0c: 9ac825e8    	lsr	x8, x15, x8
10000da10: 9240010d    	and	x13, x8, #0x1
10000da14: 8b0801ad    	add	x13, x13, x8
10000da18: d341fda8    	lsr	x8, x13, #1
10000da1c: f24b0dbf    	tst	x13, #0x1e0000000000000
10000da20: 1a9f07ed    	cset	w13, ne
10000da24: 3707ec8c    	tbnz	w12, #0x0, 0x10000d7b4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x7d8>
10000da28: 2a0d03e2    	mov	w2, w13
10000da2c: 7100b4df    	cmp	w6, #0x2d
10000da30: d2f00009    	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
10000da34: 9a9f0129    	csel	x9, x9, xzr, eq
10000da38: aa02d129    	orr	x9, x9, x2, lsl #52
10000da3c: aa080129    	orr	x9, x9, x8
10000da40: 9e67012f    	fmov	d15, x9
10000da44: f100011f    	cmp	x8, #0x0
10000da48: 7a400840    	ccmp	w2, #0x0, #0x0, eq
10000da4c: fa400b04    	ccmp	x24, #0x0, #0x4, eq
10000da50: 5280ffe8    	mov	w8, #0x7ff              ; =2047
10000da54: 7a480044    	ccmp	w2, w8, #0x4, eq
10000da58: 1a9f07e8    	cset	w8, ne
10000da5c: 3607b0f9    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000da60: 17fffd87    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000da64: 92400621    	and	x1, x17, #0x3
10000da68: 9ac02220    	lsl	x0, x17, x0
10000da6c: eb0f001f    	cmp	x0, x15
10000da70: fa410820    	ccmp	x1, #0x1, #0x0, eq
10000da74: fa4209c2    	ccmp	x14, #0x2, #0x2, eq
10000da78: 9100116e    	add	x14, x11, #0x4
10000da7c: fa5c39c2    	ccmp	x14, #0x1c, #0x2, lo
10000da80: 927ed62e    	and	x14, x17, #0xfffffffffffffc
10000da84: 9a9131ce    	csel	x14, x14, x17, lo
10000da88: 924001cf    	and	x15, x14, #0x1
10000da8c: 8b0e01f1    	add	x17, x15, x14
10000da90: ca0e01e0    	eor	x0, x15, x14
10000da94: 8a0e01ee    	and	x14, x15, x14
10000da98: 8b4005ce    	add	x14, x14, x0, lsr #1
10000da9c: d376fe2f    	lsr	x15, x17, #54
10000daa0: f10001ff    	cmp	x15, #0x0
10000daa4: 52807ff1    	mov	w17, #0x3ff             ; =1023
10000daa8: 1a910631    	cinc	w17, w17, ne
10000daac: 0b100230    	add	w16, w17, w16
10000dab0: 711ffe1f    	cmp	w16, #0x7ff
10000dab4: fa4039e0    	ccmp	x15, #0x0, #0x0, lo
10000dab8: 92ffe20f    	mov	x15, #0xefffffffffffff  ; =67553994410557439
10000dabc: 8a0f01ce    	and	x14, x14, x15
10000dac0: 9a9f01ce    	csel	x14, x14, xzr, eq
10000dac4: 5280ffef    	mov	w15, #0x7ff             ; =2047
10000dac8: 1acf6e0f    	umin	w15, w16, w15
10000dacc: aa1303e1    	mov	x1, x19
10000dad0: eb0e011f    	cmp	x8, x14
10000dad4: 54ffe880    	b.eq	0x10000d7e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x808>
10000dad8: 17ffff45    	b	0x10000d7ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x810>
10000dadc: cb0b0d08    	sub	x8, x8, x11, lsl #3
10000dae0: fd400101    	ldr	d1, [x8]
10000dae4: 1e611800    	fdiv	d0, d0, d1
10000dae8: 1e614001    	fneg	d1, d0
10000daec: 7100b4df    	cmp	w6, #0x2d
10000daf0: 1e600c2f    	fcsel	d15, d1, d0, eq
10000daf4: 52800028    	mov	w8, #0x1                ; =1
10000daf8: 3607ac19    	tbz	w25, #0x0, 0x10000d078 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x9c>
10000dafc: 17fffd60    	b	0x10000d07c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0xa0>
10000db00: 12807fae    	mov	w14, #-0x3fe            ; =-1022
10000db04: 4b1001ce    	sub	w14, w14, w16
10000db08: 9ace262e    	lsr	x14, x17, x14
10000db0c: 924001cf    	and	x15, x14, #0x1
10000db10: 8b0e01ef    	add	x15, x15, x14
10000db14: d341fdee    	lsr	x14, x15, #1
10000db18: f24b0dff    	tst	x15, #0x1e0000000000000
10000db1c: 1a9f07ef    	cset	w15, ne
10000db20: aa1303e1    	mov	x1, x19
10000db24: eb0e011f    	cmp	x8, x14
10000db28: 54ffe5e0    	b.eq	0x10000d7e4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x808>
10000db2c: 17ffff30    	b	0x10000d7ec <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb+0x810>
10000db30: 6f00e408    	movi.2d	v8, #0000000000000000
10000db34: 4ea81d00    	mov.16b	v0, v8
10000db38: a9517bfd    	ldp	x29, x30, [sp, #0x110]
10000db3c: a9504ff4    	ldp	x20, x19, [sp, #0x100]
10000db40: a94f57f6    	ldp	x22, x21, [sp, #0xf0]
10000db44: a94e5ff8    	ldp	x24, x23, [sp, #0xe0]
10000db48: a94d67fa    	ldp	x26, x25, [sp, #0xd0]
10000db4c: a94c6ffc    	ldp	x28, x27, [sp, #0xc0]
10000db50: 6d4b23e9    	ldp	d9, d8, [sp, #0xb0]
10000db54: 6d4a2beb    	ldp	d11, d10, [sp, #0xa0]
10000db58: 6d4933ed    	ldp	d13, d12, [sp, #0x90]
10000db5c: 6d483bef    	ldp	d15, d14, [sp, #0x80]
10000db60: 910483ff    	add	sp, sp, #0x120
10000db64: d65f03c0    	ret
10000db68: 52800200    	mov	w0, #0x10               ; =16
10000db6c: 9400b493    	bl	0x10003adb8 <_strtod_l+0x10003adb8>
10000db70: aa0003f3    	mov	x19, x0
10000db74: b00001e1    	adrp	x1, 0x10004a000 <GCC_except_table368+0x8>
10000db78: 911c3421    	add	x1, x1, #0x70d
10000db7c: 9400b40e    	bl	0x10003abb4 <_strtod_l+0x10003abb4>
10000db80: aa1303e0    	mov	x0, x19
10000db84: 9400b3b9    	bl	0x10003aa68 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEEb.cold.1>
10000db88: aa0003f4    	mov	x20, x0
10000db8c: aa1303e0    	mov	x0, x19
10000db90: 9400b499    	bl	0x10003adf4 <_strtod_l+0x10003adf4>
10000db94: aa1403e0    	mov	x0, x20
10000db98: 9400b3d4    	bl	0x10003aae8 <_strtod_l+0x10003aae8>
