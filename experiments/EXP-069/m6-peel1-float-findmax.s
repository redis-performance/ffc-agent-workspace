
/Users/oly/redislabs/ffc-agent-workspace/simple_fastfloat_benchmark/build/m6-peel1/benchmarks/benchmark32:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100006fe0 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE>:
100006fe0: d10103ff    	sub	sp, sp, #0x40
100006fe4: 6d0123e9    	stp	d9, d8, [sp, #0x10]
100006fe8: a9024ff4    	stp	x20, x19, [sp, #0x20]
100006fec: a9037bfd    	stp	x29, x30, [sp, #0x30]
100006ff0: 9100c3fd    	add	x29, sp, #0x30
100006ff4: b9000fff    	str	wzr, [sp, #0xc]
100006ff8: a9405013    	ldp	x19, x20, [x0]
100006ffc: 6f00e408    	movi.2d	v8, #0000000000000000
100007000: eb14027f    	cmp	x19, x20
100007004: 54000320    	b.eq	0x100007068 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x88>
100007008: 39805e68    	ldrsb	x8, [x19, #0x17]
10000700c: b7f80128    	tbnz	x8, #0x3f, 0x100007030 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x50>
100007010: aa1303e0    	mov	x0, x19
100007014: 8b080261    	add	x1, x19, x8
100007018: 910033e2    	add	x2, sp, #0xc
10000701c: 528000a3    	mov	w3, #0x5                ; =5
100007020: 528005c4    	mov	w4, #0x2e               ; =46
100007024: 97ffef24    	bl	0x100002cb4 <_ffc_from_chars_float_options>
100007028: 34000121    	cbz	w1, 0x10000704c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c>
10000702c: 14000015    	b	0x100007080 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
100007030: a9402260    	ldp	x0, x8, [x19]
100007034: 8b080001    	add	x1, x0, x8
100007038: 910033e2    	add	x2, sp, #0xc
10000703c: 528000a3    	mov	w3, #0x5                ; =5
100007040: 528005c4    	mov	w4, #0x2e               ; =46
100007044: 97ffef1c    	bl	0x100002cb4 <_ffc_from_chars_float_options>
100007048: 350001c1    	cbnz	w1, 0x100007080 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
10000704c: bd400fe0    	ldr	s0, [sp, #0xc]
100007050: 1e22c000    	fcvt	d0, s0
100007054: 1e602100    	fcmp	d8, d0
100007058: 1e60cd08    	fcsel	d8, d8, d0, gt
10000705c: 91006273    	add	x19, x19, #0x18
100007060: eb14027f    	cmp	x19, x20
100007064: 54fffd21    	b.ne	0x100007008 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x28>
100007068: 4ea81d00    	mov.16b	v0, v8
10000706c: a9437bfd    	ldp	x29, x30, [sp, #0x30]
100007070: a9424ff4    	ldp	x20, x19, [sp, #0x20]
100007074: 6d4123e9    	ldp	d9, d8, [sp, #0x10]
100007078: 910103ff    	add	sp, sp, #0x40
10000707c: d65f03c0    	ret
100007080: 52800200    	mov	w0, #0x10               ; =16
100007084: 9400b0e9    	bl	0x100033428 <_strtof_l+0x100033428>
100007088: aa0003f3    	mov	x19, x0
10000708c: f00001a1    	adrp	x1, 0x10003e000 <GCC_except_table191+0x2c>
100007090: 91384821    	add	x1, x1, #0xe12
100007094: 9400b067    	bl	0x100033230 <_strtof_l+0x100033230>
100007098: aa1303e0    	mov	x0, x19
10000709c: 9400b012    	bl	0x1000330e4 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE.cold.1>
1000070a0: aa0003f4    	mov	x20, x0
1000070a4: aa1303e0    	mov	x0, x19
1000070a8: 9400b0ef    	bl	0x100033464 <_strtof_l+0x100033464>
1000070ac: aa1403e0    	mov	x0, x20
1000070b0: 9400b02d    	bl	0x100033164 <_strtof_l+0x100033164>
