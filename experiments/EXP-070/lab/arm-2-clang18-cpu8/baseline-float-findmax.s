000000000000ba00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    ba00:	fc1d0fe8 	str	d8, [sp, #-48]!
    ba04:	a9017bfd 	stp	x29, x30, [sp, #16]
    ba08:	a9024ff4 	stp	x20, x19, [sp, #32]
    ba0c:	910043fd 	add	x29, sp, #0x10
    ba10:	a9405013 	ldp	x19, x20, [x0]
    ba14:	2f00e408 	movi	d8, #0x0
    ba18:	b81fc3bf 	stur	wzr, [x29, #-4]
    ba1c:	eb14027f 	cmp	x19, x20
    ba20:	540001e0 	b.eq	ba5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5c>  // b.none
    ba24:	a9402260 	ldp	x0, x8, [x19]
    ba28:	d10013a2 	sub	x2, x29, #0x4
    ba2c:	528000a3 	mov	w3, #0x5                   	// #5
    ba30:	528005c4 	mov	w4, #0x2e                  	// #46
    ba34:	8b080001 	add	x1, x0, x8
    ba38:	97fff31e 	bl	86b0 <ffc_from_chars_float_options>
    ba3c:	350001a1 	cbnz	w1, ba70 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x70>
    ba40:	bc5fc3a0 	ldur	s0, [x29, #-4]
    ba44:	91008273 	add	x19, x19, #0x20
    ba48:	1e22c000 	fcvt	d0, s0
    ba4c:	1e602100 	fcmp	d8, d0
    ba50:	1e60cd08 	fcsel	d8, d8, d0, gt
    ba54:	eb14027f 	cmp	x19, x20
    ba58:	54fffe61 	b.ne	ba24 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x24>  // b.any
    ba5c:	1e604100 	fmov	d0, d8
    ba60:	a9424ff4 	ldp	x20, x19, [sp, #32]
    ba64:	a9417bfd 	ldp	x29, x30, [sp, #16]
    ba68:	fc4307e8 	ldr	d8, [sp], #48
    ba6c:	d65f03c0 	ret
    ba70:	52800200 	mov	w0, #0x10                  	// #16
    ba74:	97ffe8d7 	bl	5dd0 <__cxa_allocate_exception@plt>
    ba78:	aa0003f3 	mov	x19, x0
    ba7c:	d00001c1 	adrp	x1, 45000 <_IO_stdin_used+0x1e0>
    ba80:	91025c21 	add	x1, x1, #0x97
    ba84:	97ffe8b7 	bl	5d60 <std::runtime_error::runtime_error(char const*)@plt>
    ba88:	90000321 	adrp	x1, 6f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
    ba8c:	90000322 	adrp	x2, 6f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
    ba90:	aa1303e0 	mov	x0, x19
    ba94:	f947ec21 	ldr	x1, [x1, #4056]
    ba98:	f947b442 	ldr	x2, [x2, #3944]
    ba9c:	97ffe9c1 	bl	61a0 <__cxa_throw@plt>
    baa0:	aa0003f4 	mov	x20, x0
    baa4:	aa1303e0 	mov	x0, x19
    baa8:	97ffe90a 	bl	5ed0 <__cxa_free_exception@plt>
    baac:	aa1403e0 	mov	x0, x20
    bab0:	97ffe9c0 	bl	61b0 <_Unwind_Resume@plt>
    bab4:	d503201f 	nop
    bab8:	d503201f 	nop
    babc:	d503201f 	nop

