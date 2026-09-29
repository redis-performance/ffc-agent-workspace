
/Users/oly/redislabs/ffc-agent-workspace/simple_fastfloat_benchmark/build/m6-peel2/benchmarks/benchmark32:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000707c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE>:
10000707c: d10103ff    	sub	sp, sp, #0x40
100007080: 6d0123e9    	stp	d9, d8, [sp, #0x10]
100007084: a9024ff4    	stp	x20, x19, [sp, #0x20]
100007088: a9037bfd    	stp	x29, x30, [sp, #0x30]
10000708c: 9100c3fd    	add	x29, sp, #0x30
100007090: b9000fff    	str	wzr, [sp, #0xc]
100007094: a9405013    	ldp	x19, x20, [x0]
100007098: 6f00e408    	movi.2d	v8, #0000000000000000
10000709c: eb14027f    	cmp	x19, x20
1000070a0: 54000320    	b.eq	0x100007104 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x88>
1000070a4: 39805e68    	ldrsb	x8, [x19, #0x17]
1000070a8: b7f80128    	tbnz	x8, #0x3f, 0x1000070cc <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x50>
1000070ac: aa1303e0    	mov	x0, x19
1000070b0: 8b080261    	add	x1, x19, x8
1000070b4: 910033e2    	add	x2, sp, #0xc
1000070b8: 528000a3    	mov	w3, #0x5                ; =5
1000070bc: 528005c4    	mov	w4, #0x2e               ; =46
1000070c0: 97ffef0a    	bl	0x100002ce8 <_ffc_from_chars_float_options>
1000070c4: 34000121    	cbz	w1, 0x1000070e8 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x6c>
1000070c8: 14000015    	b	0x10000711c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
1000070cc: a9402260    	ldp	x0, x8, [x19]
1000070d0: 8b080001    	add	x1, x0, x8
1000070d4: 910033e2    	add	x2, sp, #0xc
1000070d8: 528000a3    	mov	w3, #0x5                ; =5
1000070dc: 528005c4    	mov	w4, #0x2e               ; =46
1000070e0: 97ffef02    	bl	0x100002ce8 <_ffc_from_chars_float_options>
1000070e4: 350001c1    	cbnz	w1, 0x10000711c <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0xa0>
1000070e8: bd400fe0    	ldr	s0, [sp, #0xc]
1000070ec: 1e22c000    	fcvt	d0, s0
1000070f0: 1e602100    	fcmp	d8, d0
1000070f4: 1e60cd08    	fcsel	d8, d8, d0, gt
1000070f8: 91006273    	add	x19, x19, #0x18
1000070fc: eb14027f    	cmp	x19, x20
100007100: 54fffd21    	b.ne	0x1000070a4 <__Z11findmax_ffcRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE+0x28>
100007104: 4ea81d00    	mov.16b	v0, v8
100007108: a9437bfd    	ldp	x29, x30, [sp, #0x30]
10000710c: a9424ff4    	ldp	x20, x19, [sp, #0x20]
100007110: 6d4123e9    	ldp	d9, d8, [sp, #0x10]
100007114: 910103ff    	add	sp, sp, #0x40
100007118: d65f03c0    	ret
10000711c: 52800200    	mov	w0, #0x10               ; =16
100007120: 9400b0e9    	bl	0x1000334c4 <_strtof_l+0x1000334c4>
100007124: aa0003f3    	mov	x19, x0
100007128: f00001a1    	adrp	x1, 0x10003e000 <GCC_except_table187+0x4>
10000712c: 913ac821    	add	x1, x1, #0xeb2
100007130: 9400b067    	bl	0x1000332cc <_strtof_l+0x1000332cc>
100007134: aa1303e0    	mov	x0, x19
100007138: 9400b012    	bl	0x100033180 <__Z23findmax_absl_from_charsRNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE.cold.1>
10000713c: aa0003f4    	mov	x20, x0
100007140: aa1303e0    	mov	x0, x19
100007144: 9400b0ef    	bl	0x100033500 <_strtof_l+0x100033500>
100007148: aa1403e0    	mov	x0, x20
10000714c: 9400b02d    	bl	0x100033200 <_strtof_l+0x100033200>
