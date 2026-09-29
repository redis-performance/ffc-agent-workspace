
simple_fastfloat_benchmark/build/apple-m6/benchmarks/benchmark32:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100006fac <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE>:
100006fac: d10103ff    	sub	sp, sp, #0x40
100006fb0: 6d0123e9    	stp	d9, d8, [sp, #0x10]
100006fb4: a9024ff4    	stp	x20, x19, [sp, #0x20]
100006fb8: a9037bfd    	stp	x29, x30, [sp, #0x30]
100006fbc: 9100c3fd    	add	x29, sp, #0x30
100006fc0: b9000fff    	str	wzr, [sp, #0xc]
100006fc4: a9405013    	ldp	x19, x20, [x0]
100006fc8: 6f00e408    	movi.2d	v8, #0000000000000000
100006fcc: eb14027f    	cmp	x19, x20
100006fd0: 54000320    	b.eq	0x100007034 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x88>
100006fd4: 39805e68    	ldrsb	x8, [x19, #0x17]
100006fd8: b7f80128    	tbnz	x8, #0x3f, 0x100006ffc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x50>
100006fdc: aa1303e0    	mov	x0, x19
100006fe0: 8b080261    	add	x1, x19, x8
100006fe4: 910033e2    	add	x2, sp, #0xc
100006fe8: 528000a3    	mov	w3, #0x5                ; =5
100006fec: 528005c4    	mov	w4, #0x2e               ; =46
100006ff0: 97ffef2c    	bl	0x100002ca0 <_ffc_from_chars_float_options>
100006ff4: 34000121    	cbz	w1, 0x100007018 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c>
100006ff8: 14000015    	b	0x10000704c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
100006ffc: a9402260    	ldp	x0, x8, [x19]
100007000: 8b080001    	add	x1, x0, x8
100007004: 910033e2    	add	x2, sp, #0xc
100007008: 528000a3    	mov	w3, #0x5                ; =5
10000700c: 528005c4    	mov	w4, #0x2e               ; =46
100007010: 97ffef24    	bl	0x100002ca0 <_ffc_from_chars_float_options>
100007014: 350001c1    	cbnz	w1, 0x10000704c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
100007018: bd400fe0    	ldr	s0, [sp, #0xc]
10000701c: 1e22c000    	fcvt	d0, s0
100007020: 1e602100    	fcmp	d8, d0
100007024: 1e60cd08    	fcsel	d8, d8, d0, gt
100007028: 91006273    	add	x19, x19, #0x18
10000702c: eb14027f    	cmp	x19, x20
100007030: 54fffd21    	b.ne	0x100006fd4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x28>
100007034: 4ea81d00    	mov.16b	v0, v8
100007038: a9437bfd    	ldp	x29, x30, [sp, #0x30]
10000703c: a9424ff4    	ldp	x20, x19, [sp, #0x20]
100007040: 6d4123e9    	ldp	d9, d8, [sp, #0x10]
100007044: 910103ff    	add	sp, sp, #0x40
100007048: d65f03c0    	ret
10000704c: 52800200    	mov	w0, #0x10               ; =16
100007050: 9400b0e9    	bl	0x1000333f4 <_strtof_l+0x1000333f4>
100007054: aa0003f3    	mov	x19, x0
100007058: f00001a1    	adrp	x1, 0x10003e000 <GCC_except_table198+0x4>
10000705c: 91378821    	add	x1, x1, #0xde2
100007060: 9400b067    	bl	0x1000331fc <_strtof_l+0x1000331fc>
100007064: aa1303e0    	mov	x0, x19
100007068: 9400b012    	bl	0x1000330b0 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE.cold.1>
10000706c: aa0003f4    	mov	x20, x0
100007070: aa1303e0    	mov	x0, x19
100007074: 9400b0ef    	bl	0x100033430 <_strtof_l+0x100033430>
100007078: aa1403e0    	mov	x0, x20
10000707c: 9400b02d    	bl	0x100033130 <_strtof_l+0x100033130>
