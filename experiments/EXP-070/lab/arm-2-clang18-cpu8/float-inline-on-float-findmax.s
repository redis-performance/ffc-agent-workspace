000000000000d280 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    d280:	d10303ff 	sub	sp, sp, #0xc0
    d284:	fd002be8 	str	d8, [sp, #80]
    d288:	a9067bfd 	stp	x29, x30, [sp, #96]
    d28c:	a9076ffc 	stp	x28, x27, [sp, #112]
    d290:	a90867fa 	stp	x26, x25, [sp, #128]
    d294:	a9095ff8 	stp	x24, x23, [sp, #144]
    d298:	a90a57f6 	stp	x22, x21, [sp, #160]
    d29c:	a90b4ff4 	stp	x20, x19, [sp, #176]
    d2a0:	910183fd 	add	x29, sp, #0x60
    d2a4:	a9405013 	ldp	x19, x20, [x0]
    d2a8:	eb14027f 	cmp	x19, x20
    d2ac:	54005d80 	b.eq	de5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbdc>  // b.none
    d2b0:	d2b4ec97 	mov	x23, #0xa7640000            	// #2808348672
    d2b4:	d2800c86 	mov	x6, #0x64                  	// #100
    d2b8:	b203c3e4 	mov	x4, #0x2020202020202020    	// #2314885530818453536
    d2bc:	b202d7f5 	mov	x21, #0xcfcfcfcfcfcfcfcf    	// #-3472328296227680305
    d2c0:	b207c7f6 	mov	x22, #0x606060606060606     	// #434041037028460038
    d2c4:	d2800027 	mov	x7, #0x1                   	// #1
    d2c8:	2f00e408 	movi	d8, #0x0
    d2cc:	529c201a 	mov	w26, #0xe100                	// #57600
    d2d0:	528a4d5e 	mov	w30, #0x526a                	// #21098
    d2d4:	12bf9019 	mov	w25, #0x37fffff             	// #58720255
    d2d8:	52aff005 	mov	w5, #0x7f800000            	// #2139095040
    d2dc:	5280015c 	mov	w28, #0xa                   	// #10
    d2e0:	f2d6d677 	movk	x23, #0xb6b3, lsl #32
    d2e4:	f2c84806 	movk	x6, #0x4240, lsl #32
    d2e8:	f28dcd24 	movk	x4, #0x6e69
    d2ec:	f299fa15 	movk	x21, #0xcfd0
    d2f0:	b202e2d6 	orr	x22, x22, #0x4444444444444444
    d2f4:	f2c4e207 	movk	x7, #0x2710, lsl #32
    d2f8:	72a0beba 	movk	w26, #0x5f5, lsl #16
    d2fc:	72a0007e 	movk	w30, #0x3, lsl #16
    d300:	f2e1bc17 	movk	x23, #0xde0, lsl #48
    d304:	f2e001e6 	movk	x6, #0xf, lsl #48
    d308:	f2a40cc4 	movk	x4, #0x2066, lsl #16
    d30c:	1400000f 	b	d348 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc8>
    d310:	d503201f 	nop
    d314:	d503201f 	nop
    d318:	d503201f 	nop
    d31c:	d503201f 	nop
    d320:	7100b77f 	cmp	w27, #0x2d
    d324:	52bff008 	mov	w8, #0xff800000            	// #-8388608
    d328:	1a850108 	csel	w8, w8, w5, eq	// eq = none
    d32c:	1e270100 	fmov	s0, w8
    d330:	91008273 	add	x19, x19, #0x20
    d334:	1e22c000 	fcvt	d0, s0
    d338:	1e602100 	fcmp	d8, d0
    d33c:	1e60cd08 	fcsel	d8, d8, d0, gt
    d340:	eb14027f 	cmp	x19, x20
    d344:	540058e0 	b.eq	de60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe0>  // b.none
    d348:	f940066c 	ldr	x12, [x19, #8]
    d34c:	b40059ec 	cbz	x12, de88 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc08>
    d350:	f9400271 	ldr	x17, [x19]
    d354:	3940023b 	ldrb	w27, [x17]
    d358:	8b0c0228 	add	x8, x17, x12
    d35c:	aa1103ea 	mov	x10, x17
    d360:	7100b77f 	cmp	w27, #0x2d
    d364:	2a1b03eb 	mov	w11, w27
    d368:	1a9f17e9 	cset	w9, eq	// eq = none
    d36c:	540001a1 	b.ne	d3a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x120>  // b.any
    d370:	f100059f 	cmp	x12, #0x1
    d374:	540054c0 	b.eq	de0c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb8c>  // b.none
    d378:	aa1103ea 	mov	x10, x17
    d37c:	38401d4b 	ldrb	w11, [x10, #1]!
    d380:	5100c16c 	sub	w12, w11, #0x30
    d384:	7100b97f 	cmp	w11, #0x2e
    d388:	7a491980 	ccmp	w12, #0x9, #0x0, ne	// ne = any
    d38c:	54005408 	b.hi	de0c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb8c>  // b.pmore
    d390:	d503201f 	nop
    d394:	d503201f 	nop
    d398:	d503201f 	nop
    d39c:	d503201f 	nop
    d3a0:	eb08015f 	cmp	x10, x8
    d3a4:	540008e0 	b.eq	d4c0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x240>  // b.none
    d3a8:	5100c16c 	sub	w12, w11, #0x30
    d3ac:	7100259f 	cmp	w12, #0x9
    d3b0:	54000f08 	b.hi	d590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x310>  // b.pmore
    d3b4:	9100054f 	add	x15, x10, #0x1
    d3b8:	2a0b03eb 	mov	w11, w11
    d3bc:	d100c178 	sub	x24, x11, #0x30
    d3c0:	eb0801ff 	cmp	x15, x8
    d3c4:	54000800 	b.eq	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>  // b.none
    d3c8:	394001eb 	ldrb	w11, [x15]
    d3cc:	5100c16c 	sub	w12, w11, #0x30
    d3d0:	7100259f 	cmp	w12, #0x9
    d3d4:	54000e28 	b.hi	d598 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x318>  // b.pmore
    d3d8:	9100094f 	add	x15, x10, #0x2
    d3dc:	d100c16b 	sub	x11, x11, #0x30
    d3e0:	8b180b0c 	add	x12, x24, x24, lsl #2
    d3e4:	8b0c056c 	add	x12, x11, x12, lsl #1
    d3e8:	aa0c03f8 	mov	x24, x12
    d3ec:	eb0801ff 	cmp	x15, x8
    d3f0:	540006a0 	b.eq	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>  // b.none
    d3f4:	394001eb 	ldrb	w11, [x15]
    d3f8:	5100c16c 	sub	w12, w11, #0x30
    d3fc:	7100259f 	cmp	w12, #0x9
    d400:	54000cc8 	b.hi	d598 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x318>  // b.pmore
    d404:	91000d4f 	add	x15, x10, #0x3
    d408:	d100c16b 	sub	x11, x11, #0x30
    d40c:	8b180b0c 	add	x12, x24, x24, lsl #2
    d410:	8b0c056c 	add	x12, x11, x12, lsl #1
    d414:	aa0c03f8 	mov	x24, x12
    d418:	eb0801ff 	cmp	x15, x8
    d41c:	54000540 	b.eq	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>  // b.none
    d420:	394001eb 	ldrb	w11, [x15]
    d424:	5100c16c 	sub	w12, w11, #0x30
    d428:	7100259f 	cmp	w12, #0x9
    d42c:	54000b68 	b.hi	d598 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x318>  // b.pmore
    d430:	9100114f 	add	x15, x10, #0x4
    d434:	d100c16b 	sub	x11, x11, #0x30
    d438:	8b180b0c 	add	x12, x24, x24, lsl #2
    d43c:	8b0c056c 	add	x12, x11, x12, lsl #1
    d440:	aa0c03f8 	mov	x24, x12
    d444:	eb0801ff 	cmp	x15, x8
    d448:	540003e0 	b.eq	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>  // b.none
    d44c:	394001eb 	ldrb	w11, [x15]
    d450:	5100c16c 	sub	w12, w11, #0x30
    d454:	7100259f 	cmp	w12, #0x9
    d458:	54000a08 	b.hi	d598 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x318>  // b.pmore
    d45c:	9100154f 	add	x15, x10, #0x5
    d460:	d100c16c 	sub	x12, x11, #0x30
    d464:	8b180b0b 	add	x11, x24, x24, lsl #2
    d468:	8b0b058b 	add	x11, x12, x11, lsl #1
    d46c:	eb0801ff 	cmp	x15, x8
    d470:	54004b00 	b.eq	ddd0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb50>  // b.none
    d474:	d503201f 	nop
    d478:	d503201f 	nop
    d47c:	d503201f 	nop
    d480:	394001ec 	ldrb	w12, [x15]
    d484:	5100c18d 	sub	w13, w12, #0x30
    d488:	710025bf 	cmp	w13, #0x9
    d48c:	54004a68 	b.hi	ddd8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb58>  // b.pmore
    d490:	910005ef 	add	x15, x15, #0x1
    d494:	d100c18c 	sub	x12, x12, #0x30
    d498:	8b0b0978 	add	x24, x11, x11, lsl #2
    d49c:	8b180598 	add	x24, x12, x24, lsl #1
    d4a0:	aa1803eb 	mov	x11, x24
    d4a4:	eb0801ff 	cmp	x15, x8
    d4a8:	54fffec1 	b.ne	d480 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x200>  // b.any
    d4ac:	14000006 	b	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>
    d4b0:	d503201f 	nop
    d4b4:	d503201f 	nop
    d4b8:	d503201f 	nop
    d4bc:	d503201f 	nop
    d4c0:	aa1f03f8 	mov	x24, xzr
    d4c4:	cb0a010b 	sub	x11, x8, x10
    d4c8:	aa1f03ee 	mov	x14, xzr
    d4cc:	aa1f03f0 	mov	x16, xzr
    d4d0:	aa1f03ec 	mov	x12, xzr
    d4d4:	aa1f03f2 	mov	x18, xzr
    d4d8:	aa0803ef 	mov	x15, x8
    d4dc:	aa0803ed 	mov	x13, x8
    d4e0:	aa0b03e0 	mov	x0, x11
    d4e4:	b400490b 	cbz	x11, de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    d4e8:	eb0801bf 	cmp	x13, x8
    d4ec:	54000be0 	b.eq	d668 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3e8>  // b.none
    d4f0:	394001b1 	ldrb	w17, [x13]
    d4f4:	321b0231 	orr	w17, w17, #0x20
    d4f8:	7101963f 	cmp	w17, #0x65
    d4fc:	54000421 	b.ne	d580 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x300>  // b.any
    d500:	910005a1 	add	x1, x13, #0x1
    d504:	eb08003f 	cmp	x1, x8
    d508:	540003c0 	b.eq	d580 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x300>  // b.none
    d50c:	394005b1 	ldrb	w17, [x13, #1]
    d510:	528005a2 	mov	w2, #0x2d                  	// #45
    d514:	7100ae3f 	cmp	w17, #0x2b
    d518:	7a421224 	ccmp	w17, w2, #0x4, ne	// ne = any
    d51c:	910009a2 	add	x2, x13, #0x2
    d520:	9a810041 	csel	x1, x2, x1, eq	// eq = none
    d524:	eb08003f 	cmp	x1, x8
    d528:	540002c0 	b.eq	d580 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x300>  // b.none
    d52c:	39400022 	ldrb	w2, [x1]
    d530:	5100c042 	sub	w2, w2, #0x30
    d534:	7100245f 	cmp	w2, #0x9
    d538:	54000248 	b.hi	d580 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x300>  // b.pmore
    d53c:	aa1f03ed 	mov	x13, xzr
    d540:	14000004 	b	d550 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2d0>
    d544:	91000421 	add	x1, x1, #0x1
    d548:	eb08003f 	cmp	x1, x8
    d54c:	54001c60 	b.eq	d8d8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x658>  // b.none
    d550:	39400022 	ldrb	w2, [x1]
    d554:	5100c042 	sub	w2, w2, #0x30
    d558:	7100245f 	cmp	w2, #0x9
    d55c:	54001c08 	b.hi	d8dc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x65c>  // b.pmore
    d560:	12be0003 	mov	w3, #0xfffffff             	// #268435455
    d564:	eb0301bf 	cmp	x13, x3
    d568:	54fffeec 	b.gt	d544 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2c4>
    d56c:	92401c42 	and	x2, x2, #0xff
    d570:	8b0d09a3 	add	x3, x13, x13, lsl #2
    d574:	8b030443 	add	x3, x2, x3, lsl #1
    d578:	aa0303ed 	mov	x13, x3
    d57c:	17fffff2 	b	d544 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2c4>
    d580:	aa1f03f1 	mov	x17, xzr
    d584:	f100501f 	cmp	x0, #0x14
    d588:	5400078a 	b.ge	d678 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3f8>  // b.tcont
    d58c:	140000dd 	b	d900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x680>
    d590:	aa1f03f8 	mov	x24, xzr
    d594:	aa0a03ef 	mov	x15, x10
    d598:	cb0a01eb 	sub	x11, x15, x10
    d59c:	eb0801ff 	cmp	x15, x8
    d5a0:	54004240 	b.eq	dde8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb68>  // b.none
    d5a4:	394001ec 	ldrb	w12, [x15]
    d5a8:	7100b99f 	cmp	w12, #0x2e
    d5ac:	54000c61 	b.ne	d738 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4b8>  // b.any
    d5b0:	910005ec 	add	x12, x15, #0x1
    d5b4:	cb0c010e 	sub	x14, x8, x12
    d5b8:	f10041df 	cmp	x14, #0x10
    d5bc:	54000d8b 	b.lt	d76c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4ec>  // b.tstop
    d5c0:	910025ed 	add	x13, x15, #0x9
    d5c4:	f85f81b0 	ldur	x16, [x13, #-8]
    d5c8:	8b160212 	add	x18, x16, x22
    d5cc:	8b150210 	add	x16, x16, x21
    d5d0:	aa100252 	orr	x18, x18, x16
    d5d4:	f201c25f 	tst	x18, #0x8080808080808080
    d5d8:	540003a1 	b.ne	d64c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3cc>  // b.any
    d5dc:	f94001b2 	ldr	x18, [x13]
    d5e0:	8b160240 	add	x0, x18, x22
    d5e4:	8b150252 	add	x18, x18, x21
    d5e8:	aa120000 	orr	x0, x0, x18
    d5ec:	f201c01f 	tst	x0, #0x8080808080808080
    d5f0:	54003021 	b.ne	dbf4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x974>  // b.any
    d5f4:	9b1c7e00 	mul	x0, x16, x28
    d5f8:	d10041ce 	sub	x14, x14, #0x10
    d5fc:	910041ad 	add	x13, x13, #0x10
    d600:	f1003ddf 	cmp	x14, #0xf
    d604:	8b502010 	add	x16, x0, x16, lsr #8
    d608:	92001e00 	and	x0, x16, #0xff000000ff
    d60c:	d350fe10 	lsr	x16, x16, #16
    d610:	9b067c00 	mul	x0, x0, x6
    d614:	92001e10 	and	x16, x16, #0xff000000ff
    d618:	9b070210 	madd	x16, x16, x7, x0
    d61c:	9b1c7e40 	mul	x0, x18, x28
    d620:	8b522012 	add	x18, x0, x18, lsr #8
    d624:	92001e40 	and	x0, x18, #0xff000000ff
    d628:	d350fe52 	lsr	x18, x18, #16
    d62c:	9b067c00 	mul	x0, x0, x6
    d630:	92001e52 	and	x18, x18, #0xff000000ff
    d634:	9b070252 	madd	x18, x18, x7, x0
    d638:	9b1a7f00 	mul	x0, x24, x26
    d63c:	8b508010 	add	x16, x0, x16, lsr #32
    d640:	9b1a7e10 	mul	x16, x16, x26
    d644:	8b528218 	add	x24, x16, x18, lsr #32
    d648:	54fffbec 	b.gt	d5c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x344>
    d64c:	d10021ad 	sub	x13, x13, #0x8
    d650:	cb0d010e 	sub	x14, x8, x13
    d654:	f10021df 	cmp	x14, #0x8
    d658:	5400092a 	b.ge	d77c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4fc>  // b.tcont
    d65c:	f10011df 	cmp	x14, #0x4
    d660:	54000b4a 	b.ge	d7c8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x548>  // b.tcont
    d664:	14000063 	b	d7f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x570>
    d668:	aa1f03f1 	mov	x17, xzr
    d66c:	aa0803ed 	mov	x13, x8
    d670:	f100501f 	cmp	x0, #0x14
    d674:	5400146b 	b.lt	d900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x680>  // b.tstop
    d678:	eb08015f 	cmp	x10, x8
    d67c:	54000200 	b.eq	d6bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43c>  // b.none
    d680:	aa0a03e1 	mov	x1, x10
    d684:	14000007 	b	d6a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x420>
    d688:	7100c05f 	cmp	w2, #0x30
    d68c:	91000421 	add	x1, x1, #0x1
    d690:	1a9f17e2 	cset	w2, eq	// eq = none
    d694:	eb08003f 	cmp	x1, x8
    d698:	cb020000 	sub	x0, x0, x2
    d69c:	540000c0 	b.eq	d6b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x434>  // b.none
    d6a0:	39400022 	ldrb	w2, [x1]
    d6a4:	7100c05f 	cmp	w2, #0x30
    d6a8:	54ffff00 	b.eq	d688 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x408>  // b.none
    d6ac:	7100b85f 	cmp	w2, #0x2e
    d6b0:	54fffec0 	b.eq	d688 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x408>  // b.none
    d6b4:	f100501f 	cmp	x0, #0x14
    d6b8:	5400124b 	b.lt	d900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x680>  // b.tstop
    d6bc:	eb0f015f 	cmp	x10, x15
    d6c0:	540004c0 	b.eq	d758 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4d8>  // b.none
    d6c4:	aa1f03f8 	mov	x24, xzr
    d6c8:	aa0a03e8 	mov	x8, x10
    d6cc:	38401510 	ldrb	w16, [x8], #1
    d6d0:	9b1c4310 	madd	x16, x24, x28, x16
    d6d4:	d100c218 	sub	x24, x16, #0x30
    d6d8:	eb17031f 	cmp	x24, x23
    d6dc:	fa4f3104 	ccmp	x8, x15, #0x4, cc	// cc = lo, ul, last
    d6e0:	54ffff61 	b.ne	d6cc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x44c>  // b.any
    d6e4:	d10006f0 	sub	x16, x23, #0x1
    d6e8:	eb10031f 	cmp	x24, x16
    d6ec:	54000188 	b.hi	d71c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x49c>  // b.pmore
    d6f0:	eb12019f 	cmp	x12, x18
    d6f4:	aa0c03e8 	mov	x8, x12
    d6f8:	54000100 	b.eq	d718 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x498>  // b.none
    d6fc:	d503201f 	nop
    d700:	3840150f 	ldrb	w15, [x8], #1
    d704:	9b1c3f0f 	madd	x15, x24, x28, x15
    d708:	d100c1f8 	sub	x24, x15, #0x30
    d70c:	eb17031f 	cmp	x24, x23
    d710:	fa523104 	ccmp	x8, x18, #0x4, cc	// cc = lo, ul, last
    d714:	54ffff61 	b.ne	d700 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x480>  // b.any
    d718:	aa0c03ef 	mov	x15, x12
    d71c:	cb0801e8 	sub	x8, x15, x8
    d720:	5280002f 	mov	w15, #0x1                   	// #1
    d724:	381fc3bf 	sturb	wzr, [x29, #-4]
    d728:	b81f83bf 	stur	wzr, [x29, #-8]
    d72c:	8b110110 	add	x16, x8, x17
    d730:	b5001138 	cbnz	x24, d954 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6d4>
    d734:	140000b0 	b	d9f4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x774>
    d738:	aa1f03ee 	mov	x14, xzr
    d73c:	aa1f03f0 	mov	x16, xzr
    d740:	aa1f03ec 	mov	x12, xzr
    d744:	aa1f03f2 	mov	x18, xzr
    d748:	aa0f03ed 	mov	x13, x15
    d74c:	aa0b03e0 	mov	x0, x11
    d750:	b5ffeccb 	cbnz	x11, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    d754:	140001ac 	b	de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    d758:	aa1f03f8 	mov	x24, xzr
    d75c:	eb12019f 	cmp	x12, x18
    d760:	aa0c03e8 	mov	x8, x12
    d764:	54fffce1 	b.ne	d700 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x480>  // b.any
    d768:	17ffffec 	b	d718 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x498>
    d76c:	aa0c03ed 	mov	x13, x12
    d770:	cb0c010e 	sub	x14, x8, x12
    d774:	f10021df 	cmp	x14, #0x8
    d778:	54fff72b 	b.lt	d65c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3dc>  // b.tstop
    d77c:	f94001ae 	ldr	x14, [x13]
    d780:	8b1601d0 	add	x16, x14, x22
    d784:	8b1501ce 	add	x14, x14, x21
    d788:	aa0e0210 	orr	x16, x16, x14
    d78c:	f201c21f 	tst	x16, #0x8080808080808080
    d790:	540001c1 	b.ne	d7c8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x548>  // b.any
    d794:	9b1c7dd2 	mul	x18, x14, x28
    d798:	9b1a7f10 	mul	x16, x24, x26
    d79c:	910021ad 	add	x13, x13, #0x8
    d7a0:	8b4e224e 	add	x14, x18, x14, lsr #8
    d7a4:	92001dd2 	and	x18, x14, #0xff000000ff
    d7a8:	d350fdce 	lsr	x14, x14, #16
    d7ac:	9b067e52 	mul	x18, x18, x6
    d7b0:	92001dce 	and	x14, x14, #0xff000000ff
    d7b4:	9b0749ce 	madd	x14, x14, x7, x18
    d7b8:	8b4e8218 	add	x24, x16, x14, lsr #32
    d7bc:	cb0d010e 	sub	x14, x8, x13
    d7c0:	f10011df 	cmp	x14, #0x4
    d7c4:	5400016b 	b.lt	d7f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x570>  // b.tstop
    d7c8:	b94001ae 	ldr	w14, [x13]
    d7cc:	5288c8d0 	mov	w16, #0x4646                	// #17990
    d7d0:	5299fa12 	mov	w18, #0xcfd0                	// #53200
    d7d4:	72a8c8d0 	movk	w16, #0x4646, lsl #16
    d7d8:	72b9f9f2 	movk	w18, #0xcfcf, lsl #16
    d7dc:	0b1001d0 	add	w16, w14, w16
    d7e0:	0b1201ce 	add	w14, w14, w18
    d7e4:	2a0e0210 	orr	w16, w16, w14
    d7e8:	7201c21f 	tst	w16, #0x80808080
    d7ec:	54000500 	b.eq	d88c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x60c>  // b.none
    d7f0:	eb0801bf 	cmp	x13, x8
    d7f4:	54000640 	b.eq	d8bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x63c>  // b.none
    d7f8:	394001ae 	ldrb	w14, [x13]
    d7fc:	5100c1d0 	sub	w16, w14, #0x30
    d800:	7100261f 	cmp	w16, #0x9
    d804:	54002da8 	b.hi	ddb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb38>  // b.pmore
    d808:	910005ae 	add	x14, x13, #0x1
    d80c:	92401e10 	and	x16, x16, #0xff
    d810:	8b180b12 	add	x18, x24, x24, lsl #2
    d814:	8b120612 	add	x18, x16, x18, lsl #1
    d818:	aa1203f8 	mov	x24, x18
    d81c:	eb0801df 	cmp	x14, x8
    d820:	540004e0 	b.eq	d8bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x63c>  // b.none
    d824:	394001d0 	ldrb	w16, [x14]
    d828:	5100c210 	sub	w16, w16, #0x30
    d82c:	7100261f 	cmp	w16, #0x9
    d830:	54002b48 	b.hi	dd98 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb18>  // b.pmore
    d834:	910009ae 	add	x14, x13, #0x2
    d838:	92401e10 	and	x16, x16, #0xff
    d83c:	8b180b12 	add	x18, x24, x24, lsl #2
    d840:	8b120612 	add	x18, x16, x18, lsl #1
    d844:	aa1203f8 	mov	x24, x18
    d848:	eb0801df 	cmp	x14, x8
    d84c:	54000380 	b.eq	d8bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x63c>  // b.none
    d850:	394001d0 	ldrb	w16, [x14]
    d854:	5100c210 	sub	w16, w16, #0x30
    d858:	7100261f 	cmp	w16, #0x9
    d85c:	54002ac8 	b.hi	ddb4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb34>  // b.pmore
    d860:	91000dad 	add	x13, x13, #0x3
    d864:	92401e0e 	and	x14, x16, #0xff
    d868:	8b180b10 	add	x16, x24, x24, lsl #2
    d86c:	8b1005d0 	add	x16, x14, x16, lsl #1
    d870:	aa1003f8 	mov	x24, x16
    d874:	cb0d0190 	sub	x16, x12, x13
    d878:	cb0c01ae 	sub	x14, x13, x12
    d87c:	aa0d03f2 	mov	x18, x13
    d880:	cb100160 	sub	x0, x11, x16
    d884:	b5ffe320 	cbnz	x0, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    d888:	1400015f 	b	de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    d88c:	1b1c7dd0 	mul	w16, w14, w28
    d890:	910011ad 	add	x13, x13, #0x4
    d894:	0b4e220e 	add	w14, w16, w14, lsr #8
    d898:	52800030 	mov	w16, #0x1                   	// #1
    d89c:	72a00c90 	movk	w16, #0x64, lsl #16
    d8a0:	12009dce 	and	w14, w14, #0xff00ff
    d8a4:	1b107dce 	mul	w14, w14, w16
    d8a8:	5284e210 	mov	w16, #0x2710                	// #10000
    d8ac:	53107dce 	lsr	w14, w14, #16
    d8b0:	9b103b18 	madd	x24, x24, x16, x14
    d8b4:	eb0801bf 	cmp	x13, x8
    d8b8:	54fffa01 	b.ne	d7f8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x578>  // b.any
    d8bc:	aa0803ed 	mov	x13, x8
    d8c0:	cb080190 	sub	x16, x12, x8
    d8c4:	cb0c010e 	sub	x14, x8, x12
    d8c8:	aa0d03f2 	mov	x18, x13
    d8cc:	cb100160 	sub	x0, x11, x16
    d8d0:	b5ffe0c0 	cbnz	x0, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    d8d4:	1400014c 	b	de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    d8d8:	aa0803e1 	mov	x1, x8
    d8dc:	7100b63f 	cmp	w17, #0x2d
    d8e0:	da8d15b1 	cneg	x17, x13, eq	// eq = none
    d8e4:	aa0103ed 	mov	x13, x1
    d8e8:	8b100230 	add	x16, x17, x16
    d8ec:	f100501f 	cmp	x0, #0x14
    d8f0:	54ffec4a 	b.ge	d678 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3f8>  // b.tcont
    d8f4:	d503201f 	nop
    d8f8:	d503201f 	nop
    d8fc:	d503201f 	nop
    d900:	381fc3bf 	sturb	wzr, [x29, #-4]
    d904:	b81f83bf 	stur	wzr, [x29, #-8]
    d908:	b50001d0 	cbnz	x16, d940 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6c0>
    d90c:	52a02008 	mov	w8, #0x1000000             	// #16777216
    d910:	eb08031f 	cmp	x24, x8
    d914:	54000168 	b.hi	d940 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6c0>  // b.pmore
    d918:	9e230300 	ucvtf	s0, x24
    d91c:	7100b77f 	cmp	w27, #0x2d
    d920:	1e260008 	fmov	w8, s0
    d924:	52010109 	eor	w9, w8, #0x80000000
    d928:	1a891108 	csel	w8, w8, w9, ne	// ne = any
    d92c:	1a9f17e9 	cset	w9, eq	// eq = none
    d930:	f100031f 	cmp	x24, #0x0
    d934:	53010129 	lsl	w9, w9, #31
    d938:	1a891108 	csel	w8, w8, w9, ne	// ne = any
    d93c:	17fffe7c 	b	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>
    d940:	d1002e08 	sub	x8, x16, #0xb
    d944:	b100551f 	cmn	x8, #0x15
    d948:	54000142 	b.cs	d970 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6f0>  // b.hs, b.nlast
    d94c:	2a1f03ef 	mov	w15, wzr
    d950:	b4000538 	cbz	x24, d9f4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x774>
    d954:	b101021f 	cmn	x16, #0x40
    d958:	540004eb 	b.lt	d9f4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x774>  // b.tstop
    d95c:	f1009a1f 	cmp	x16, #0x26
    d960:	5400010d 	b.le	d980 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x700>
    d964:	aa1f03e8 	mov	x8, xzr
    d968:	52801ff1 	mov	w17, #0xff                  	// #255
    d96c:	14000024 	b	d9fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x77c>
    d970:	52a02008 	mov	w8, #0x1000000             	// #16777216
    d974:	eb08031f 	cmp	x24, x8
    d978:	54000aa9 	b.ls	dacc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x84c>  // b.plast
    d97c:	2a1f03ef 	mov	w15, wzr
    d980:	531f7a01 	lsl	w1, w16, #1
    d984:	f00001c2 	adrp	x2, 48000 <_IO_stdin_used+0xde0>
    d988:	91218042 	add	x2, x2, #0x860
    d98c:	dac01312 	clz	x18, x24
    d990:	b24097e3 	mov	x3, #0x3fffffffff          	// #274877906943
    d994:	110ab028 	add	w8, w1, #0x2ac
    d998:	9ad22300 	lsl	x0, x24, x18
    d99c:	f868d851 	ldr	x17, [x2, w8, sxtw #3]
    d9a0:	9b007e28 	mul	x8, x17, x0
    d9a4:	9bc07e31 	umulh	x17, x17, x0
    d9a8:	ea31007f 	bics	xzr, x3, x17
    d9ac:	540000c1 	b.ne	d9c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x744>  // b.any
    d9b0:	110ab421 	add	w1, w1, #0x2ad
    d9b4:	f861d841 	ldr	x1, [x2, w1, sxtw #3]
    d9b8:	9bc07c20 	umulh	x0, x1, x0
    d9bc:	ab080008 	adds	x8, x0, x8
    d9c0:	9a913631 	cinc	x17, x17, cs	// cs = hs, nlast
    d9c4:	1b1e7e03 	mul	w3, w16, w30
    d9c8:	52001652 	eor	w18, w18, #0x3f
    d9cc:	528004c1 	mov	w1, #0x26                  	// #38
    d9d0:	d37ffe22 	lsr	x2, x17, #63
    d9d4:	b37ffe21 	bfxil	x1, x17, #63, #1
    d9d8:	0b834252 	add	w18, w18, w3, asr #16
    d9dc:	9ac12620 	lsr	x0, x17, x1
    d9e0:	0b020252 	add	w18, w18, w2
    d9e4:	3101fe5f 	cmn	w18, #0x7f
    d9e8:	5400086c 	b.gt	daf4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x874>
    d9ec:	3102f65f 	cmn	w18, #0xbd
    d9f0:	54000f02 	b.cs	dbd0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x950>  // b.hs, b.nlast
    d9f4:	aa1f03e8 	mov	x8, xzr
    d9f8:	2a1f03f1 	mov	w17, wzr
    d9fc:	34000e6f 	cbz	w15, dbc8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x948>
    da00:	b1000702 	adds	x2, x24, #0x1
    da04:	2a1f03f2 	mov	w18, wzr
    da08:	aa1f03e0 	mov	x0, xzr
    da0c:	54000d62 	b.cs	dbb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x938>  // b.hs, b.nlast
    da10:	b101021f 	cmn	x16, #0x40
    da14:	54000d2b 	b.lt	dbb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x938>  // b.tstop
    da18:	f1009a1f 	cmp	x16, #0x26
    da1c:	540000cd 	b.le	da34 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7b4>
    da20:	aa1f03e0 	mov	x0, xzr
    da24:	52801ff2 	mov	w18, #0xff                  	// #255
    da28:	eb1f011f 	cmp	x8, xzr
    da2c:	54000ca0 	b.eq	dbc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>  // b.none
    da30:	14000093 	b	dc7c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9fc>
    da34:	531f7a03 	lsl	w3, w16, #1
    da38:	f00001c4 	adrp	x4, 48000 <_IO_stdin_used+0xde0>
    da3c:	91218084 	add	x4, x4, #0x860
    da40:	dac01041 	clz	x1, x2
    da44:	b24097e5 	mov	x5, #0x3fffffffff          	// #274877906943
    da48:	110ab072 	add	w18, w3, #0x2ac
    da4c:	9ac12042 	lsl	x2, x2, x1
    da50:	f872d880 	ldr	x0, [x4, w18, sxtw #3]
    da54:	9b027c12 	mul	x18, x0, x2
    da58:	9bc27c00 	umulh	x0, x0, x2
    da5c:	ea2000bf 	bics	xzr, x5, x0
    da60:	540000c1 	b.ne	da78 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7f8>  // b.any
    da64:	110ab463 	add	w3, w3, #0x2ad
    da68:	f863d883 	ldr	x3, [x4, w3, sxtw #3]
    da6c:	9bc27c62 	umulh	x2, x3, x2
    da70:	ab120052 	adds	x18, x2, x18
    da74:	9a803400 	cinc	x0, x0, cs	// cs = hs, nlast
    da78:	d37ffc04 	lsr	x4, x0, #63
    da7c:	1b1e7e05 	mul	w5, w16, w30
    da80:	528004c3 	mov	w3, #0x26                  	// #38
    da84:	4b010081 	sub	w1, w4, w1
    da88:	b37ffc03 	bfxil	x3, x0, #63, #1
    da8c:	0b854021 	add	w1, w1, w5, asr #16
    da90:	9ac32402 	lsr	x2, x0, x3
    da94:	1100fc21 	add	w1, w1, #0x3f
    da98:	3101fc3f 	cmn	w1, #0x7f
    da9c:	540005ac 	b.gt	db50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x8d0>
    daa0:	3102f43f 	cmn	w1, #0xbd
    daa4:	52aff005 	mov	w5, #0x7f800000            	// #2139095040
    daa8:	54000d02 	b.cs	dc48 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9c8>  // b.hs, b.nlast
    daac:	b203c3e4 	mov	x4, #0x2020202020202020    	// #2314885530818453536
    dab0:	aa1f03e0 	mov	x0, xzr
    dab4:	2a1f03f2 	mov	w18, wzr
    dab8:	f28dcd24 	movk	x4, #0x6e69
    dabc:	f2a40cc4 	movk	x4, #0x2066, lsl #16
    dac0:	eb1f011f 	cmp	x8, xzr
    dac4:	540007e0 	b.eq	dbc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>  // b.none
    dac8:	1400006d 	b	dc7c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9fc>
    dacc:	9e230300 	ucvtf	s0, x24
    dad0:	f00001c8 	adrp	x8, 48000 <_IO_stdin_used+0xde0>
    dad4:	9120c108 	add	x8, x8, #0x830
    dad8:	b7f80a90 	tbnz	x16, #63, dc28 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9a8>
    dadc:	bc707901 	ldr	s1, [x8, x16, lsl #2]
    dae0:	1e200820 	fmul	s0, s1, s0
    dae4:	1e260008 	fmov	w8, s0
    dae8:	7100b77f 	cmp	w27, #0x2d
    daec:	54ffc201 	b.ne	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>  // b.any
    daf0:	14000054 	b	dc40 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9c0>
    daf4:	9ac12001 	lsl	x1, x0, x1
    daf8:	92400402 	and	x2, x0, #0x3
    dafc:	eb11003f 	cmp	x1, x17
    db00:	fa410840 	ccmp	x2, #0x1, #0x0, eq	// eq = none
    db04:	fa420902 	ccmp	x8, #0x2, #0x2, eq	// eq = none
    db08:	91004608 	add	x8, x16, #0x11
    db0c:	fa5c3902 	ccmp	x8, #0x1c, #0x2, cc	// cc = lo, ul, last
    db10:	927e5c08 	and	x8, x0, #0x3fffffc
    db14:	9a803108 	csel	x8, x8, x0, cc	// cc = lo, ul, last
    db18:	92400111 	and	x17, x8, #0x1
    db1c:	8b080228 	add	x8, x17, x8
    db20:	52800ff1 	mov	w17, #0x7f                  	// #127
    db24:	d359fd00 	lsr	x0, x8, #25
    db28:	8a480728 	and	x8, x25, x8, lsr #1
    db2c:	f100001f 	cmp	x0, #0x0
    db30:	1a910631 	cinc	w17, w17, ne	// ne = any
    db34:	0b120231 	add	w17, w17, w18
    db38:	52801ff2 	mov	w18, #0xff                  	// #255
    db3c:	7103fe3f 	cmp	w17, #0xff
    db40:	1a923231 	csel	w17, w17, w18, cc	// cc = lo, ul, last
    db44:	fa403800 	ccmp	x0, #0x0, #0x0, cc	// cc = lo, ul, last
    db48:	9a9f0108 	csel	x8, x8, xzr, eq	// eq = none
    db4c:	17ffffac 	b	d9fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x77c>
    db50:	9ac32043 	lsl	x3, x2, x3
    db54:	92400444 	and	x4, x2, #0x3
    db58:	52aff005 	mov	w5, #0x7f800000            	// #2139095040
    db5c:	eb00007f 	cmp	x3, x0
    db60:	fa410880 	ccmp	x4, #0x1, #0x0, eq	// eq = none
    db64:	b203c3e4 	mov	x4, #0x2020202020202020    	// #2314885530818453536
    db68:	fa420a42 	ccmp	x18, #0x2, #0x2, eq	// eq = none
    db6c:	91004612 	add	x18, x16, #0x11
    db70:	f28dcd24 	movk	x4, #0x6e69
    db74:	fa5c3a42 	ccmp	x18, #0x1c, #0x2, cc	// cc = lo, ul, last
    db78:	927e5c52 	and	x18, x2, #0x3fffffc
    db7c:	f2a40cc4 	movk	x4, #0x2066, lsl #16
    db80:	9a823252 	csel	x18, x18, x2, cc	// cc = lo, ul, last
    db84:	92400240 	and	x0, x18, #0x1
    db88:	8b120000 	add	x0, x0, x18
    db8c:	52800ff2 	mov	w18, #0x7f                  	// #127
    db90:	d359fc02 	lsr	x2, x0, #25
    db94:	8a400720 	and	x0, x25, x0, lsr #1
    db98:	f100005f 	cmp	x2, #0x0
    db9c:	1a920652 	cinc	w18, w18, ne	// ne = any
    dba0:	0b010252 	add	w18, w18, w1
    dba4:	52801fe1 	mov	w1, #0xff                  	// #255
    dba8:	7103fe5f 	cmp	w18, #0xff
    dbac:	1a813252 	csel	w18, w18, w1, cc	// cc = lo, ul, last
    dbb0:	fa403840 	ccmp	x2, #0x0, #0x0, cc	// cc = lo, ul, last
    dbb4:	9a9f0000 	csel	x0, x0, xzr, eq	// eq = none
    dbb8:	eb00011f 	cmp	x8, x0
    dbbc:	54000601 	b.ne	dc7c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9fc>  // b.any
    dbc0:	6b12023f 	cmp	w17, w18
    dbc4:	540005c1 	b.ne	dc7c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9fc>  // b.any
    dbc8:	2a1103e2 	mov	w2, w17
    dbcc:	14000068 	b	dd6c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xaec>
    dbd0:	12800fa8 	mov	w8, #0xffffff82            	// #-126
    dbd4:	4b120108 	sub	w8, w8, w18
    dbd8:	9ac82408 	lsr	x8, x0, x8
    dbdc:	92400111 	and	x17, x8, #0x1
    dbe0:	8b080231 	add	x17, x17, x8
    dbe4:	f2680a3f 	tst	x17, #0x7000000
    dbe8:	d341fe28 	lsr	x8, x17, #1
    dbec:	1a9f07f1 	cset	w17, ne	// ne = any
    dbf0:	17ffff83 	b	d9fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x77c>
    dbf4:	9b1c7e12 	mul	x18, x16, x28
    dbf8:	9b1a7f0e 	mul	x14, x24, x26
    dbfc:	8b502250 	add	x16, x18, x16, lsr #8
    dc00:	92001e12 	and	x18, x16, #0xff000000ff
    dc04:	d350fe10 	lsr	x16, x16, #16
    dc08:	9b067e52 	mul	x18, x18, x6
    dc0c:	92001e10 	and	x16, x16, #0xff000000ff
    dc10:	9b074a10 	madd	x16, x16, x7, x18
    dc14:	8b5081d8 	add	x24, x14, x16, lsr #32
    dc18:	cb0d010e 	sub	x14, x8, x13
    dc1c:	f10021df 	cmp	x14, #0x8
    dc20:	54ffd1eb 	b.lt	d65c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3dc>  // b.tstop
    dc24:	17fffed6 	b	d77c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4fc>
    dc28:	cb100908 	sub	x8, x8, x16, lsl #2
    dc2c:	bd400101 	ldr	s1, [x8]
    dc30:	1e211800 	fdiv	s0, s0, s1
    dc34:	1e260008 	fmov	w8, s0
    dc38:	7100b77f 	cmp	w27, #0x2d
    dc3c:	54ffb781 	b.ne	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>  // b.any
    dc40:	52010108 	eor	w8, w8, #0x80000000
    dc44:	17fffdba 	b	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>
    dc48:	12800fb2 	mov	w18, #0xffffff82            	// #-126
    dc4c:	b203c3e4 	mov	x4, #0x2020202020202020    	// #2314885530818453536
    dc50:	4b010252 	sub	w18, w18, w1
    dc54:	f28dcd24 	movk	x4, #0x6e69
    dc58:	9ad22452 	lsr	x18, x2, x18
    dc5c:	f2a40cc4 	movk	x4, #0x2066, lsl #16
    dc60:	92400240 	and	x0, x18, #0x1
    dc64:	8b120012 	add	x18, x0, x18
    dc68:	f2680a5f 	tst	x18, #0x7000000
    dc6c:	d341fe40 	lsr	x0, x18, #1
    dc70:	1a9f07f2 	cset	w18, ne	// ne = any
    dc74:	eb00011f 	cmp	x8, x0
    dc78:	54fffa40 	b.eq	dbc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>  // b.none
    dc7c:	531f7a00 	lsl	w0, w16, #1
    dc80:	f00001c1 	adrp	x1, 48000 <_IO_stdin_used+0xde0>
    dc84:	91218021 	add	x1, x1, #0x860
    dc88:	dac01311 	clz	x17, x24
    dc8c:	b24097e2 	mov	x2, #0x3fffffffff          	// #274877906943
    dc90:	110ab008 	add	w8, w0, #0x2ac
    dc94:	9ad12312 	lsl	x18, x24, x17
    dc98:	f868d821 	ldr	x1, [x1, w8, sxtw #3]
    dc9c:	9bd27c28 	umulh	x8, x1, x18
    dca0:	ea28005f 	bics	xzr, x2, x8
    dca4:	54000121 	b.ne	dcc8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa48>  // b.any
    dca8:	110ab400 	add	w0, w0, #0x2ad
    dcac:	f00001c2 	adrp	x2, 48000 <_IO_stdin_used+0xde0>
    dcb0:	91218042 	add	x2, x2, #0x860
    dcb4:	9b127c21 	mul	x1, x1, x18
    dcb8:	f860d840 	ldr	x0, [x2, w0, sxtw #3]
    dcbc:	9bd27c12 	umulh	x18, x0, x18
    dcc0:	ab01025f 	cmn	x18, x1
    dcc4:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
    dcc8:	1b1e7e00 	mul	w0, w16, w30
    dccc:	d37ffd12 	lsr	x18, x8, #63
    dcd0:	52000252 	eor	w18, w18, #0x1
    dcd4:	13107c00 	asr	w0, w0, #16
    dcd8:	9ad22108 	lsl	x8, x8, x18
    dcdc:	4b110011 	sub	w17, w0, w17
    dce0:	4b120231 	sub	w17, w17, w18
    dce4:	128fed12 	mov	w18, #0xffff8097            	// #-32617
    dce8:	2b120222 	adds	w2, w17, w18
    dcec:	54000405 	b.pl	dd6c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xaec>  // b.nfrst
    dcf0:	390083e9 	strb	w9, [sp, #32]
    dcf4:	52800029 	mov	w9, #0x1                   	// #1
    dcf8:	f9000fed 	str	x13, [sp, #24]
    dcfc:	910023ed 	add	x13, sp, #0x8
    dd00:	910023e0 	add	x0, sp, #0x8
    dd04:	aa0803e1 	mov	x1, x8
    dd08:	2a1f03e3 	mov	w3, wzr
    dd0c:	aa0603f9 	mov	x25, x6
    dd10:	a900e3f0 	stp	x16, x24, [sp, #8]
    dd14:	39008bef 	strb	w15, [sp, #34]
    dd18:	a902afea 	stp	x10, x11, [sp, #40]
    dd1c:	390087e9 	strb	w9, [sp, #33]
    dd20:	b85f83a9 	ldur	w9, [x29, #-8]
    dd24:	a903bbec 	stp	x12, x14, [sp, #56]
    dd28:	f90027ff 	str	xzr, [sp, #72]
    dd2c:	b801b1a9 	stur	w9, [x13, #27]
    dd30:	385fc3a9 	ldurb	w9, [x29, #-4]
    dd34:	3801f1a9 	sturb	w9, [x13, #31]
    dd38:	94000c92 	bl	10f80 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
    dd3c:	b203c3e4 	mov	x4, #0x2020202020202020    	// #2314885530818453536
    dd40:	528a4d5e 	mov	w30, #0x526a                	// #21098
    dd44:	d2800027 	mov	x7, #0x1                   	// #1
    dd48:	52aff005 	mov	w5, #0x7f800000            	// #2139095040
    dd4c:	aa1903e6 	mov	x6, x25
    dd50:	12bf9019 	mov	w25, #0x37fffff             	// #58720255
    dd54:	aa0003e8 	mov	x8, x0
    dd58:	aa0103e2 	mov	x2, x1
    dd5c:	f28dcd24 	movk	x4, #0x6e69
    dd60:	72a0007e 	movk	w30, #0x3, lsl #16
    dd64:	f2c4e207 	movk	x7, #0x2710, lsl #32
    dd68:	f2a40cc4 	movk	x4, #0x2066, lsl #16
    dd6c:	7100b77f 	cmp	w27, #0x2d
    dd70:	1a9f17e9 	cset	w9, eq	// eq = none
    dd74:	f100031f 	cmp	x24, #0x0
    dd78:	7a401840 	ccmp	w2, #0x0, #0x0, ne	// ne = any
    dd7c:	fa400900 	ccmp	x8, #0x0, #0x0, eq	// eq = none
    dd80:	54000840 	b.eq	de88 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc08>  // b.none
    dd84:	7103fc5f 	cmp	w2, #0xff
    dd88:	54000800 	b.eq	de88 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc08>  // b.none
    dd8c:	2a097d08 	orr	w8, w8, w9, lsl #31
    dd90:	2a025d08 	orr	w8, w8, w2, lsl #23
    dd94:	17fffd66 	b	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>
    dd98:	aa0e03ed 	mov	x13, x14
    dd9c:	cb0e0190 	sub	x16, x12, x14
    dda0:	cb0c01ce 	sub	x14, x14, x12
    dda4:	aa0d03f2 	mov	x18, x13
    dda8:	cb100160 	sub	x0, x11, x16
    ddac:	b5ffb9e0 	cbnz	x0, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    ddb0:	14000015 	b	de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    ddb4:	aa0e03ed 	mov	x13, x14
    ddb8:	cb0d0190 	sub	x16, x12, x13
    ddbc:	cb0c01ae 	sub	x14, x13, x12
    ddc0:	aa0d03f2 	mov	x18, x13
    ddc4:	cb100160 	sub	x0, x11, x16
    ddc8:	b5ffb900 	cbnz	x0, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    ddcc:	1400000e 	b	de04 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb84>
    ddd0:	aa0b03f8 	mov	x24, x11
    ddd4:	17fffdbc 	b	d4c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x244>
    ddd8:	aa0b03f8 	mov	x24, x11
    dddc:	cb0a01eb 	sub	x11, x15, x10
    dde0:	eb0801ff 	cmp	x15, x8
    dde4:	54ffbe01 	b.ne	d5a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x324>  // b.any
    dde8:	aa1f03ee 	mov	x14, xzr
    ddec:	aa1f03f0 	mov	x16, xzr
    ddf0:	aa1f03ec 	mov	x12, xzr
    ddf4:	aa1f03f2 	mov	x18, xzr
    ddf8:	aa0803ed 	mov	x13, x8
    ddfc:	aa0b03e0 	mov	x0, x11
    de00:	b5ffb74b 	cbnz	x11, d4e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x268>
    de04:	7100b77f 	cmp	w27, #0x2d
    de08:	54000041 	b.ne	de10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb90>  // b.any
    de0c:	91000631 	add	x17, x17, #0x1
    de10:	cb110108 	sub	x8, x8, x17
    de14:	f1000d1f 	cmp	x8, #0x3
    de18:	5400038b 	b.lt	de88 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc08>  // b.tstop
    de1c:	39400a28 	ldrb	w8, [x17, #2]
    de20:	79400229 	ldrh	w9, [x17]
    de24:	aa084128 	orr	x8, x9, x8, lsl #16
    de28:	b203c108 	orr	x8, x8, #0x2020202020202020
    de2c:	eb04011f 	cmp	x8, x4
    de30:	54ffa780 	b.eq	d320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa0>  // b.none
    de34:	b203c3e9 	mov	x9, #0x2020202020202020    	// #2314885530818453536
    de38:	f28c2dc9 	movk	x9, #0x616e
    de3c:	f2a40dc9 	movk	x9, #0x206e, lsl #16
    de40:	eb09011f 	cmp	x8, x9
    de44:	54000221 	b.ne	de88 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc08>  // b.any
    de48:	7100b77f 	cmp	w27, #0x2d
    de4c:	52aff808 	mov	w8, #0x7fc00000            	// #2143289344
    de50:	52bff809 	mov	w9, #0xffc00000            	// #-4194304
    de54:	1a880128 	csel	w8, w9, w8, eq	// eq = none
    de58:	17fffd35 	b	d32c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xac>
    de5c:	2f00e408 	movi	d8, #0x0
    de60:	1e604100 	fmov	d0, d8
    de64:	fd402be8 	ldr	d8, [sp, #80]
    de68:	a94b4ff4 	ldp	x20, x19, [sp, #176]
    de6c:	a94a57f6 	ldp	x22, x21, [sp, #160]
    de70:	a9495ff8 	ldp	x24, x23, [sp, #144]
    de74:	a94867fa 	ldp	x26, x25, [sp, #128]
    de78:	a9476ffc 	ldp	x28, x27, [sp, #112]
    de7c:	a9467bfd 	ldp	x29, x30, [sp, #96]
    de80:	910303ff 	add	sp, sp, #0xc0
    de84:	d65f03c0 	ret
    de88:	52800200 	mov	w0, #0x10                  	// #16
    de8c:	97ffdfd1 	bl	5dd0 <__cxa_allocate_exception@plt>
    de90:	aa0003f3 	mov	x19, x0
    de94:	d00001c1 	adrp	x1, 47000 <absl::lts_20250814::strings_internal::ParsedFloat absl::lts_20250814::strings_internal::ParseFloat<16>(char const*, char const*, absl::lts_20250814::chars_format)+0x280>
    de98:	91125c21 	add	x1, x1, #0x497
    de9c:	97ffdfb1 	bl	5d60 <std::runtime_error::runtime_error(char const*)@plt>
    dea0:	d0000301 	adrp	x1, 6f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
    dea4:	d0000302 	adrp	x2, 6f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
    dea8:	aa1303e0 	mov	x0, x19
    deac:	f947ec21 	ldr	x1, [x1, #4056]
    deb0:	f947b442 	ldr	x2, [x2, #3944]
    deb4:	97ffe0bb 	bl	61a0 <__cxa_throw@plt>
    deb8:	aa0003f4 	mov	x20, x0
    debc:	aa1303e0 	mov	x0, x19
    dec0:	97ffe004 	bl	5ed0 <__cxa_free_exception@plt>
    dec4:	aa1403e0 	mov	x0, x20
    dec8:	97ffe0ba 	bl	61b0 <_Unwind_Resume@plt>
    decc:	d503201f 	nop

