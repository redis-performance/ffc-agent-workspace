0000000000013590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   13590:	d10303ff 	sub	sp, sp, #0xc0
   13594:	6d0523e9 	stp	d9, d8, [sp, #80]
   13598:	a9067bfd 	stp	x29, x30, [sp, #96]
   1359c:	a9076ffc 	stp	x28, x27, [sp, #112]
   135a0:	a90867fa 	stp	x26, x25, [sp, #128]
   135a4:	a9095ff8 	stp	x24, x23, [sp, #144]
   135a8:	a90a57f6 	stp	x22, x21, [sp, #160]
   135ac:	a90b4ff4 	stp	x20, x19, [sp, #176]
   135b0:	910183fd 	add	x29, sp, #0x60
   135b4:	a9405013 	ldp	x19, x20, [x0]
   135b8:	eb14027f 	cmp	x19, x20
   135bc:	54005fa0 	b.eq	141b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc20>  // b.none
   135c0:	d2b4ec97 	mov	x23, #0xa7640000            	// #2808348672
   135c4:	d2800c87 	mov	x7, #0x64                  	// #100
   135c8:	b203c3e5 	mov	x5, #0x2020202020202020    	// #2314885530818453536
   135cc:	b202d7f5 	mov	x21, #0xcfcfcfcfcfcfcfcf    	// #-3472328296227680305
   135d0:	b207c7f6 	mov	x22, #0x606060606060606     	// #434041037028460038
   135d4:	d2800039 	mov	x25, #0x1                   	// #1
   135d8:	2f00e408 	movi	d8, #0x0
   135dc:	2f00e400 	movi	d0, #0x0
   135e0:	529c201a 	mov	w26, #0xe100                	// #57600
   135e4:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   135e8:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   135ec:	5280015b 	mov	w27, #0xa                   	// #10
   135f0:	f2d6d677 	movk	x23, #0xb6b3, lsl #32
   135f4:	f2c84807 	movk	x7, #0x4240, lsl #32
   135f8:	f28dcd25 	movk	x5, #0x6e69
   135fc:	f299fa15 	movk	x21, #0xcfd0
   13600:	b202e2d6 	orr	x22, x22, #0x4444444444444444
   13604:	f2c4e219 	movk	x25, #0x2710, lsl #32
   13608:	72a0beba 	movk	w26, #0x5f5, lsl #16
   1360c:	f2e1bc17 	movk	x23, #0xde0, lsl #48
   13610:	f2e001e7 	movk	x7, #0xf, lsl #48
   13614:	f2a40cc5 	movk	x5, #0x2066, lsl #16
   13618:	14000007 	b	13634 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   1361c:	d503201f 	nop
   13620:	1e612000 	fcmp	d0, d1
   13624:	91008273 	add	x19, x19, #0x20
   13628:	1e61cc00 	fcsel	d0, d0, d1, gt
   1362c:	eb14027f 	cmp	x19, x20
   13630:	54005c20 	b.eq	141b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc24>  // b.none
   13634:	f940066c 	ldr	x12, [x19, #8]
   13638:	b4005a4c 	cbz	x12, 14180 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>
   1363c:	f9400271 	ldr	x17, [x19]
   13640:	3940023c 	ldrb	w28, [x17]
   13644:	8b0c0228 	add	x8, x17, x12
   13648:	aa1103ea 	mov	x10, x17
   1364c:	7100b79f 	cmp	w28, #0x2d
   13650:	2a1c03eb 	mov	w11, w28
   13654:	1a9f17e9 	cset	w9, eq	// eq = none
   13658:	54000141 	b.ne	13680 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xf0>  // b.any
   1365c:	f100059f 	cmp	x12, #0x1
   13660:	540055e0 	b.eq	1411c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb8c>  // b.none
   13664:	aa1103ea 	mov	x10, x17
   13668:	38401d4b 	ldrb	w11, [x10, #1]!
   1366c:	5100c16c 	sub	w12, w11, #0x30
   13670:	7100b97f 	cmp	w11, #0x2e
   13674:	7a491980 	ccmp	w12, #0x9, #0x0, ne	// ne = any
   13678:	54005528 	b.hi	1411c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb8c>  // b.pmore
   1367c:	d503201f 	nop
   13680:	eb08015f 	cmp	x10, x8
   13684:	54000860 	b.eq	13790 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x200>  // b.none
   13688:	5100c16c 	sub	w12, w11, #0x30
   1368c:	7100259f 	cmp	w12, #0x9
   13690:	54000ee8 	b.hi	1386c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2dc>  // b.pmore
   13694:	9100054f 	add	x15, x10, #0x1
   13698:	2a0b03eb 	mov	w11, w11
   1369c:	d100c178 	sub	x24, x11, #0x30
   136a0:	eb0801ff 	cmp	x15, x8
   136a4:	54000780 	b.eq	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   136a8:	394001eb 	ldrb	w11, [x15]
   136ac:	5100c16c 	sub	w12, w11, #0x30
   136b0:	7100259f 	cmp	w12, #0x9
   136b4:	54000e08 	b.hi	13874 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   136b8:	9100094f 	add	x15, x10, #0x2
   136bc:	d100c16b 	sub	x11, x11, #0x30
   136c0:	8b180b0c 	add	x12, x24, x24, lsl #2
   136c4:	8b0c056c 	add	x12, x11, x12, lsl #1
   136c8:	aa0c03f8 	mov	x24, x12
   136cc:	eb0801ff 	cmp	x15, x8
   136d0:	54000620 	b.eq	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   136d4:	394001eb 	ldrb	w11, [x15]
   136d8:	5100c16c 	sub	w12, w11, #0x30
   136dc:	7100259f 	cmp	w12, #0x9
   136e0:	54000ca8 	b.hi	13874 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   136e4:	91000d4f 	add	x15, x10, #0x3
   136e8:	d100c16b 	sub	x11, x11, #0x30
   136ec:	8b180b0c 	add	x12, x24, x24, lsl #2
   136f0:	8b0c056c 	add	x12, x11, x12, lsl #1
   136f4:	aa0c03f8 	mov	x24, x12
   136f8:	eb0801ff 	cmp	x15, x8
   136fc:	540004c0 	b.eq	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   13700:	394001eb 	ldrb	w11, [x15]
   13704:	5100c16c 	sub	w12, w11, #0x30
   13708:	7100259f 	cmp	w12, #0x9
   1370c:	54000b48 	b.hi	13874 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   13710:	9100114f 	add	x15, x10, #0x4
   13714:	d100c16b 	sub	x11, x11, #0x30
   13718:	8b180b0c 	add	x12, x24, x24, lsl #2
   1371c:	8b0c056c 	add	x12, x11, x12, lsl #1
   13720:	aa0c03f8 	mov	x24, x12
   13724:	eb0801ff 	cmp	x15, x8
   13728:	54000360 	b.eq	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   1372c:	394001eb 	ldrb	w11, [x15]
   13730:	5100c16c 	sub	w12, w11, #0x30
   13734:	7100259f 	cmp	w12, #0x9
   13738:	540009e8 	b.hi	13874 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   1373c:	9100154f 	add	x15, x10, #0x5
   13740:	d100c16c 	sub	x12, x11, #0x30
   13744:	8b180b0b 	add	x11, x24, x24, lsl #2
   13748:	8b0b058b 	add	x11, x12, x11, lsl #1
   1374c:	eb0801ff 	cmp	x15, x8
   13750:	54004c80 	b.eq	140e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb50>  // b.none
   13754:	d503201f 	nop
   13758:	d503201f 	nop
   1375c:	d503201f 	nop
   13760:	394001ec 	ldrb	w12, [x15]
   13764:	5100c18d 	sub	w13, w12, #0x30
   13768:	710025bf 	cmp	w13, #0x9
   1376c:	54004be8 	b.hi	140e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb58>  // b.pmore
   13770:	910005ef 	add	x15, x15, #0x1
   13774:	d100c18c 	sub	x12, x12, #0x30
   13778:	8b0b0978 	add	x24, x11, x11, lsl #2
   1377c:	8b180598 	add	x24, x12, x24, lsl #1
   13780:	aa1803eb 	mov	x11, x24
   13784:	eb0801ff 	cmp	x15, x8
   13788:	54fffec1 	b.ne	13760 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1d0>  // b.any
   1378c:	14000002 	b	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>
   13790:	aa1f03f8 	mov	x24, xzr
   13794:	cb0a010b 	sub	x11, x8, x10
   13798:	aa1f03ee 	mov	x14, xzr
   1379c:	aa1f03f0 	mov	x16, xzr
   137a0:	aa1f03ec 	mov	x12, xzr
   137a4:	aa1f03f2 	mov	x18, xzr
   137a8:	aa0803ef 	mov	x15, x8
   137ac:	aa0803ed 	mov	x13, x8
   137b0:	aa0b03e0 	mov	x0, x11
   137b4:	b4004b0b 	cbz	x11, 14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   137b8:	eb0801bf 	cmp	x13, x8
   137bc:	54000c40 	b.eq	13944 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b4>  // b.none
   137c0:	394001b1 	ldrb	w17, [x13]
   137c4:	321b0231 	orr	w17, w17, #0x20
   137c8:	7101963f 	cmp	w17, #0x65
   137cc:	54000481 	b.ne	1385c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.any
   137d0:	910005a2 	add	x2, x13, #0x1
   137d4:	eb08005f 	cmp	x2, x8
   137d8:	54000420 	b.eq	1385c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.none
   137dc:	394005b1 	ldrb	w17, [x13, #1]
   137e0:	528005a3 	mov	w3, #0x2d                  	// #45
   137e4:	7100ae3f 	cmp	w17, #0x2b
   137e8:	7a431224 	ccmp	w17, w3, #0x4, ne	// ne = any
   137ec:	910009a3 	add	x3, x13, #0x2
   137f0:	9a820062 	csel	x2, x3, x2, eq	// eq = none
   137f4:	eb08005f 	cmp	x2, x8
   137f8:	54000320 	b.eq	1385c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.none
   137fc:	39400043 	ldrb	w3, [x2]
   13800:	5100c063 	sub	w3, w3, #0x30
   13804:	7100247f 	cmp	w3, #0x9
   13808:	540002a8 	b.hi	1385c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.pmore
   1380c:	aa1f03ed 	mov	x13, xzr
   13810:	14000007 	b	1382c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x29c>
   13814:	d503201f 	nop
   13818:	d503201f 	nop
   1381c:	d503201f 	nop
   13820:	91000442 	add	x2, x2, #0x1
   13824:	eb08005f 	cmp	x2, x8
   13828:	54001c80 	b.eq	13bb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x628>  // b.none
   1382c:	39400043 	ldrb	w3, [x2]
   13830:	5100c063 	sub	w3, w3, #0x30
   13834:	7100247f 	cmp	w3, #0x9
   13838:	54001c28 	b.hi	13bbc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x62c>  // b.pmore
   1383c:	12be0004 	mov	w4, #0xfffffff             	// #268435455
   13840:	eb0401bf 	cmp	x13, x4
   13844:	54fffeec 	b.gt	13820 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x290>
   13848:	92401c63 	and	x3, x3, #0xff
   1384c:	8b0d09a4 	add	x4, x13, x13, lsl #2
   13850:	8b040464 	add	x4, x3, x4, lsl #1
   13854:	aa0403ed 	mov	x13, x4
   13858:	17fffff2 	b	13820 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x290>
   1385c:	aa1f03f1 	mov	x17, xzr
   13860:	f100501f 	cmp	x0, #0x14
   13864:	5400078a 	b.ge	13954 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3c4>  // b.tcont
   13868:	140000db 	b	13bd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>
   1386c:	aa1f03f8 	mov	x24, xzr
   13870:	aa0a03ef 	mov	x15, x10
   13874:	cb0a01eb 	sub	x11, x15, x10
   13878:	eb0801ff 	cmp	x15, x8
   1387c:	540043e0 	b.eq	140f8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb68>  // b.none
   13880:	394001ec 	ldrb	w12, [x15]
   13884:	7100b99f 	cmp	w12, #0x2e
   13888:	54000c81 	b.ne	13a18 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x488>  // b.any
   1388c:	910005ec 	add	x12, x15, #0x1
   13890:	cb0c010e 	sub	x14, x8, x12
   13894:	f10041df 	cmp	x14, #0x10
   13898:	54000dab 	b.lt	13a4c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4bc>  // b.tstop
   1389c:	910025ed 	add	x13, x15, #0x9
   138a0:	f85f81b0 	ldur	x16, [x13, #-8]
   138a4:	8b160212 	add	x18, x16, x22
   138a8:	8b150210 	add	x16, x16, x21
   138ac:	aa100252 	orr	x18, x18, x16
   138b0:	f201c25f 	tst	x18, #0x8080808080808080
   138b4:	540003a1 	b.ne	13928 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x398>  // b.any
   138b8:	f94001b2 	ldr	x18, [x13]
   138bc:	8b160240 	add	x0, x18, x22
   138c0:	8b150252 	add	x18, x18, x21
   138c4:	aa120000 	orr	x0, x0, x18
   138c8:	f201c01f 	tst	x0, #0x8080808080808080
   138cc:	54003041 	b.ne	13ed4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x944>  // b.any
   138d0:	9b1b7e00 	mul	x0, x16, x27
   138d4:	d10041ce 	sub	x14, x14, #0x10
   138d8:	910041ad 	add	x13, x13, #0x10
   138dc:	f1003ddf 	cmp	x14, #0xf
   138e0:	8b502010 	add	x16, x0, x16, lsr #8
   138e4:	92001e00 	and	x0, x16, #0xff000000ff
   138e8:	d350fe10 	lsr	x16, x16, #16
   138ec:	9b077c00 	mul	x0, x0, x7
   138f0:	92001e10 	and	x16, x16, #0xff000000ff
   138f4:	9b190210 	madd	x16, x16, x25, x0
   138f8:	9b1b7e40 	mul	x0, x18, x27
   138fc:	8b522012 	add	x18, x0, x18, lsr #8
   13900:	92001e40 	and	x0, x18, #0xff000000ff
   13904:	d350fe52 	lsr	x18, x18, #16
   13908:	9b077c00 	mul	x0, x0, x7
   1390c:	92001e52 	and	x18, x18, #0xff000000ff
   13910:	9b190252 	madd	x18, x18, x25, x0
   13914:	9b1a7f00 	mul	x0, x24, x26
   13918:	8b508010 	add	x16, x0, x16, lsr #32
   1391c:	9b1a7e10 	mul	x16, x16, x26
   13920:	8b528218 	add	x24, x16, x18, lsr #32
   13924:	54fffbec 	b.gt	138a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x310>
   13928:	d10021ad 	sub	x13, x13, #0x8
   1392c:	cb0d010e 	sub	x14, x8, x13
   13930:	f10021df 	cmp	x14, #0x8
   13934:	5400094a 	b.ge	13a5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4cc>  // b.tcont
   13938:	f10011df 	cmp	x14, #0x4
   1393c:	54000b6a 	b.ge	13aa8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x518>  // b.tcont
   13940:	14000064 	b	13ad0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x540>
   13944:	aa1f03f1 	mov	x17, xzr
   13948:	aa0803ed 	mov	x13, x8
   1394c:	f100501f 	cmp	x0, #0x14
   13950:	5400142b 	b.lt	13bd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>  // b.tstop
   13954:	eb08015f 	cmp	x10, x8
   13958:	54000200 	b.eq	13998 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x408>  // b.none
   1395c:	aa0a03e2 	mov	x2, x10
   13960:	14000007 	b	1397c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3ec>
   13964:	7100c07f 	cmp	w3, #0x30
   13968:	91000442 	add	x2, x2, #0x1
   1396c:	1a9f17e3 	cset	w3, eq	// eq = none
   13970:	eb08005f 	cmp	x2, x8
   13974:	cb030000 	sub	x0, x0, x3
   13978:	540000c0 	b.eq	13990 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x400>  // b.none
   1397c:	39400043 	ldrb	w3, [x2]
   13980:	7100c07f 	cmp	w3, #0x30
   13984:	54ffff00 	b.eq	13964 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>  // b.none
   13988:	7100b87f 	cmp	w3, #0x2e
   1398c:	54fffec0 	b.eq	13964 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>  // b.none
   13990:	f100501f 	cmp	x0, #0x14
   13994:	5400120b 	b.lt	13bd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>  // b.tstop
   13998:	eb0f015f 	cmp	x10, x15
   1399c:	540004e0 	b.eq	13a38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a8>  // b.none
   139a0:	aa1f03f8 	mov	x24, xzr
   139a4:	aa0a03e8 	mov	x8, x10
   139a8:	38401510 	ldrb	w16, [x8], #1
   139ac:	9b1b4310 	madd	x16, x24, x27, x16
   139b0:	d100c218 	sub	x24, x16, #0x30
   139b4:	eb17031f 	cmp	x24, x23
   139b8:	fa4f3104 	ccmp	x8, x15, #0x4, cc	// cc = lo, ul, last
   139bc:	54ffff61 	b.ne	139a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x418>  // b.any
   139c0:	d10006f0 	sub	x16, x23, #0x1
   139c4:	eb10031f 	cmp	x24, x16
   139c8:	540001a8 	b.hi	139fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x46c>  // b.pmore
   139cc:	eb12019f 	cmp	x12, x18
   139d0:	aa0c03e8 	mov	x8, x12
   139d4:	54000120 	b.eq	139f8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x468>  // b.none
   139d8:	d503201f 	nop
   139dc:	d503201f 	nop
   139e0:	3840150f 	ldrb	w15, [x8], #1
   139e4:	9b1b3f0f 	madd	x15, x24, x27, x15
   139e8:	d100c1f8 	sub	x24, x15, #0x30
   139ec:	eb17031f 	cmp	x24, x23
   139f0:	fa523104 	ccmp	x8, x18, #0x4, cc	// cc = lo, ul, last
   139f4:	54ffff61 	b.ne	139e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x450>  // b.any
   139f8:	aa0c03ef 	mov	x15, x12
   139fc:	cb0801e8 	sub	x8, x15, x8
   13a00:	5280002f 	mov	w15, #0x1                   	// #1
   13a04:	390013ff 	strb	wzr, [sp, #4]
   13a08:	b90003ff 	str	wzr, [sp]
   13a0c:	8b110110 	add	x16, x8, x17
   13a10:	b5001118 	cbnz	x24, 13c30 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6a0>
   13a14:	140000b0 	b	13cd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>
   13a18:	aa1f03ee 	mov	x14, xzr
   13a1c:	aa1f03f0 	mov	x16, xzr
   13a20:	aa1f03ec 	mov	x12, xzr
   13a24:	aa1f03f2 	mov	x18, xzr
   13a28:	aa0f03ed 	mov	x13, x15
   13a2c:	aa0b03e0 	mov	x0, x11
   13a30:	b5ffec4b 	cbnz	x11, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   13a34:	140001b8 	b	14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   13a38:	aa1f03f8 	mov	x24, xzr
   13a3c:	eb12019f 	cmp	x12, x18
   13a40:	aa0c03e8 	mov	x8, x12
   13a44:	54fffce1 	b.ne	139e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x450>  // b.any
   13a48:	17ffffec 	b	139f8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x468>
   13a4c:	aa0c03ed 	mov	x13, x12
   13a50:	cb0c010e 	sub	x14, x8, x12
   13a54:	f10021df 	cmp	x14, #0x8
   13a58:	54fff70b 	b.lt	13938 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>  // b.tstop
   13a5c:	f94001ae 	ldr	x14, [x13]
   13a60:	8b1601d0 	add	x16, x14, x22
   13a64:	8b1501ce 	add	x14, x14, x21
   13a68:	aa0e0210 	orr	x16, x16, x14
   13a6c:	f201c21f 	tst	x16, #0x8080808080808080
   13a70:	540001c1 	b.ne	13aa8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x518>  // b.any
   13a74:	9b1b7dd2 	mul	x18, x14, x27
   13a78:	9b1a7f10 	mul	x16, x24, x26
   13a7c:	910021ad 	add	x13, x13, #0x8
   13a80:	8b4e224e 	add	x14, x18, x14, lsr #8
   13a84:	92001dd2 	and	x18, x14, #0xff000000ff
   13a88:	d350fdce 	lsr	x14, x14, #16
   13a8c:	9b077e52 	mul	x18, x18, x7
   13a90:	92001dce 	and	x14, x14, #0xff000000ff
   13a94:	9b1949ce 	madd	x14, x14, x25, x18
   13a98:	8b4e8218 	add	x24, x16, x14, lsr #32
   13a9c:	cb0d010e 	sub	x14, x8, x13
   13aa0:	f10011df 	cmp	x14, #0x4
   13aa4:	5400016b 	b.lt	13ad0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x540>  // b.tstop
   13aa8:	b94001ae 	ldr	w14, [x13]
   13aac:	5288c8d0 	mov	w16, #0x4646                	// #17990
   13ab0:	5299fa12 	mov	w18, #0xcfd0                	// #53200
   13ab4:	72a8c8d0 	movk	w16, #0x4646, lsl #16
   13ab8:	72b9f9f2 	movk	w18, #0xcfcf, lsl #16
   13abc:	0b1001d0 	add	w16, w14, w16
   13ac0:	0b1201ce 	add	w14, w14, w18
   13ac4:	2a0e0210 	orr	w16, w16, w14
   13ac8:	7201c21f 	tst	w16, #0x80808080
   13acc:	54000500 	b.eq	13b6c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>  // b.none
   13ad0:	eb0801bf 	cmp	x13, x8
   13ad4:	54000640 	b.eq	13b9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   13ad8:	394001ae 	ldrb	w14, [x13]
   13adc:	5100c1d0 	sub	w16, w14, #0x30
   13ae0:	7100261f 	cmp	w16, #0x9
   13ae4:	54002f28 	b.hi	140c8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb38>  // b.pmore
   13ae8:	910005ae 	add	x14, x13, #0x1
   13aec:	92401e10 	and	x16, x16, #0xff
   13af0:	8b180b12 	add	x18, x24, x24, lsl #2
   13af4:	8b120612 	add	x18, x16, x18, lsl #1
   13af8:	aa1203f8 	mov	x24, x18
   13afc:	eb0801df 	cmp	x14, x8
   13b00:	540004e0 	b.eq	13b9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   13b04:	394001d0 	ldrb	w16, [x14]
   13b08:	5100c210 	sub	w16, w16, #0x30
   13b0c:	7100261f 	cmp	w16, #0x9
   13b10:	54002cc8 	b.hi	140a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb18>  // b.pmore
   13b14:	910009ae 	add	x14, x13, #0x2
   13b18:	92401e10 	and	x16, x16, #0xff
   13b1c:	8b180b12 	add	x18, x24, x24, lsl #2
   13b20:	8b120612 	add	x18, x16, x18, lsl #1
   13b24:	aa1203f8 	mov	x24, x18
   13b28:	eb0801df 	cmp	x14, x8
   13b2c:	54000380 	b.eq	13b9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   13b30:	394001d0 	ldrb	w16, [x14]
   13b34:	5100c210 	sub	w16, w16, #0x30
   13b38:	7100261f 	cmp	w16, #0x9
   13b3c:	54002c48 	b.hi	140c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb34>  // b.pmore
   13b40:	91000dad 	add	x13, x13, #0x3
   13b44:	92401e0e 	and	x14, x16, #0xff
   13b48:	8b180b10 	add	x16, x24, x24, lsl #2
   13b4c:	8b1005d0 	add	x16, x14, x16, lsl #1
   13b50:	aa1003f8 	mov	x24, x16
   13b54:	cb0d0190 	sub	x16, x12, x13
   13b58:	cb0c01ae 	sub	x14, x13, x12
   13b5c:	aa0d03f2 	mov	x18, x13
   13b60:	cb100160 	sub	x0, x11, x16
   13b64:	b5ffe2a0 	cbnz	x0, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   13b68:	1400016b 	b	14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   13b6c:	1b1b7dd0 	mul	w16, w14, w27
   13b70:	910011ad 	add	x13, x13, #0x4
   13b74:	0b4e220e 	add	w14, w16, w14, lsr #8
   13b78:	52800030 	mov	w16, #0x1                   	// #1
   13b7c:	72a00c90 	movk	w16, #0x64, lsl #16
   13b80:	12009dce 	and	w14, w14, #0xff00ff
   13b84:	1b107dce 	mul	w14, w14, w16
   13b88:	5284e210 	mov	w16, #0x2710                	// #10000
   13b8c:	53107dce 	lsr	w14, w14, #16
   13b90:	9b103b18 	madd	x24, x24, x16, x14
   13b94:	eb0801bf 	cmp	x13, x8
   13b98:	54fffa01 	b.ne	13ad8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x548>  // b.any
   13b9c:	aa0803ed 	mov	x13, x8
   13ba0:	cb080190 	sub	x16, x12, x8
   13ba4:	cb0c010e 	sub	x14, x8, x12
   13ba8:	aa0d03f2 	mov	x18, x13
   13bac:	cb100160 	sub	x0, x11, x16
   13bb0:	b5ffe040 	cbnz	x0, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   13bb4:	14000158 	b	14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   13bb8:	aa0803e2 	mov	x2, x8
   13bbc:	7100b63f 	cmp	w17, #0x2d
   13bc0:	da8d15b1 	cneg	x17, x13, eq	// eq = none
   13bc4:	aa0203ed 	mov	x13, x2
   13bc8:	8b100230 	add	x16, x17, x16
   13bcc:	f100501f 	cmp	x0, #0x14
   13bd0:	54ffec2a 	b.ge	13954 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3c4>  // b.tcont
   13bd4:	390013ff 	strb	wzr, [sp, #4]
   13bd8:	b90003ff 	str	wzr, [sp]
   13bdc:	b5000210 	cbnz	x16, 13c1c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x68c>
   13be0:	d2e00408 	mov	x8, #0x20000000000000      	// #9007199254740992
   13be4:	eb08031f 	cmp	x24, x8
   13be8:	540001a8 	b.hi	13c1c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x68c>  // b.pmore
   13bec:	9e630301 	ucvtf	d1, x24
   13bf0:	7100b79f 	cmp	w28, #0x2d
   13bf4:	d2f00008 	mov	x8, #0x8000000000000000    	// #-9223372036854775808
   13bf8:	1e614022 	fneg	d2, d1
   13bfc:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   13c00:	9e670102 	fmov	d2, x8
   13c04:	1e680c42 	fcsel	d2, d2, d8, eq	// eq = none
   13c08:	f100031f 	cmp	x24, #0x0
   13c0c:	9a9f13e8 	csel	x8, xzr, xzr, ne	// ne = any
   13c10:	1e621c21 	fcsel	d1, d1, d2, ne	// ne = any
   13c14:	b5002bc8 	cbnz	x8, 1418c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   13c18:	17fffe82 	b	13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   13c1c:	d1005e08 	sub	x8, x16, #0x17
   13c20:	b100b51f 	cmn	x8, #0x2d
   13c24:	54000142 	b.cs	13c4c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6bc>  // b.hs, b.nlast
   13c28:	2a1f03ef 	mov	w15, wzr
   13c2c:	b4000558 	cbz	x24, 13cd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>
   13c30:	b1055a1f 	cmn	x16, #0x156
   13c34:	5400050b 	b.lt	13cd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>  // b.tstop
   13c38:	f104d21f 	cmp	x16, #0x134
   13c3c:	5400010d 	b.le	13c5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6cc>
   13c40:	aa1f03e8 	mov	x8, xzr
   13c44:	5280fff1 	mov	w17, #0x7ff                 	// #2047
   13c48:	14000025 	b	13cdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   13c4c:	d2e00408 	mov	x8, #0x20000000000000      	// #9007199254740992
   13c50:	eb08031f 	cmp	x24, x8
   13c54:	54000b49 	b.ls	13dbc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x82c>  // b.plast
   13c58:	2a1f03ef 	mov	w15, wzr
   13c5c:	531f7a02 	lsl	w2, w16, #1
   13c60:	90000204 	adrp	x4, 53000 <Lhint+0xd38>
   13c64:	9126c084 	add	x4, x4, #0x9b0
   13c68:	dac01312 	clz	x18, x24
   13c6c:	110ab048 	add	w8, w2, #0x2ac
   13c70:	9ad22300 	lsl	x0, x24, x18
   13c74:	f868d891 	ldr	x17, [x4, w8, sxtw #3]
   13c78:	9b007e28 	mul	x8, x17, x0
   13c7c:	9bc07e31 	umulh	x17, x17, x0
   13c80:	2a3103e3 	mvn	w3, w17
   13c84:	f240207f 	tst	x3, #0x1ff
   13c88:	540000c1 	b.ne	13ca0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x710>  // b.any
   13c8c:	110ab442 	add	w2, w2, #0x2ad
   13c90:	f862d882 	ldr	x2, [x4, w2, sxtw #3]
   13c94:	9bc07c40 	umulh	x0, x2, x0
   13c98:	ab080008 	adds	x8, x0, x8
   13c9c:	9a913631 	cinc	x17, x17, cs	// cs = hs, nlast
   13ca0:	528a4d44 	mov	w4, #0x526a                	// #21098
   13ca4:	52001652 	eor	w18, w18, #0x3f
   13ca8:	d37ffe23 	lsr	x3, x17, #63
   13cac:	72a00064 	movk	w4, #0x3, lsl #16
   13cb0:	91002462 	add	x2, x3, #0x9
   13cb4:	1b047e04 	mul	w4, w16, w4
   13cb8:	9ac22620 	lsr	x0, x17, x2
   13cbc:	0b844252 	add	w18, w18, w4, asr #16
   13cc0:	0b030252 	add	w18, w18, w3
   13cc4:	310ffe5f 	cmn	w18, #0x3ff
   13cc8:	5400088c 	b.gt	13dd8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x848>
   13ccc:	3110f65f 	cmn	w18, #0x43d
   13cd0:	54000ee2 	b.cs	13eac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x91c>  // b.hs, b.nlast
   13cd4:	aa1f03e8 	mov	x8, xzr
   13cd8:	2a1f03f1 	mov	w17, wzr
   13cdc:	340001ef 	cbz	w15, 13d18 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x788>
   13ce0:	b1000703 	adds	x3, x24, #0x1
   13ce4:	2a1f03f2 	mov	w18, wzr
   13ce8:	aa1f03e0 	mov	x0, xzr
   13cec:	540000e2 	b.cs	13d08 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x778>  // b.hs, b.nlast
   13cf0:	b1055a1f 	cmn	x16, #0x156
   13cf4:	540000ab 	b.lt	13d08 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x778>  // b.tstop
   13cf8:	f104d21f 	cmp	x16, #0x134
   13cfc:	5400012d 	b.le	13d20 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x790>
   13d00:	aa1f03e0 	mov	x0, xzr
   13d04:	5280fff2 	mov	w18, #0x7ff                 	// #2047
   13d08:	eb00011f 	cmp	x8, x0
   13d0c:	540012a1 	b.ne	13f60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>  // b.any
   13d10:	6b12023f 	cmp	w17, w18
   13d14:	54001261 	b.ne	13f60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>  // b.any
   13d18:	2a1103e2 	mov	w2, w17
   13d1c:	140000d4 	b	1406c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xadc>
   13d20:	531f7a04 	lsl	w4, w16, #1
   13d24:	90000206 	adrp	x6, 53000 <Lhint+0xd38>
   13d28:	9126c0c6 	add	x6, x6, #0x9b0
   13d2c:	dac01062 	clz	x2, x3
   13d30:	aa0503fe 	mov	x30, x5
   13d34:	110ab092 	add	w18, w4, #0x2ac
   13d38:	9ac22063 	lsl	x3, x3, x2
   13d3c:	f872d8c0 	ldr	x0, [x6, w18, sxtw #3]
   13d40:	9b037c12 	mul	x18, x0, x3
   13d44:	9bc37c00 	umulh	x0, x0, x3
   13d48:	2a2003e5 	mvn	w5, w0
   13d4c:	f24020bf 	tst	x5, #0x1ff
   13d50:	540000c1 	b.ne	13d68 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d8>  // b.any
   13d54:	110ab484 	add	w4, w4, #0x2ad
   13d58:	f864d8c4 	ldr	x4, [x6, w4, sxtw #3]
   13d5c:	9bc37c83 	umulh	x3, x4, x3
   13d60:	ab120072 	adds	x18, x3, x18
   13d64:	9a803400 	cinc	x0, x0, cs	// cs = hs, nlast
   13d68:	528a4d46 	mov	w6, #0x526a                	// #21098
   13d6c:	d37ffc05 	lsr	x5, x0, #63
   13d70:	72a00066 	movk	w6, #0x3, lsl #16
   13d74:	4b0200a2 	sub	w2, w5, w2
   13d78:	910024a4 	add	x4, x5, #0x9
   13d7c:	1b067e06 	mul	w6, w16, w6
   13d80:	9ac42403 	lsr	x3, x0, x4
   13d84:	0b864042 	add	w2, w2, w6, asr #16
   13d88:	1100fc42 	add	w2, w2, #0x3f
   13d8c:	310ffc5f 	cmn	w2, #0x3ff
   13d90:	5400054c 	b.gt	13e38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x8a8>
   13d94:	3110f45f 	cmn	w2, #0x43d
   13d98:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   13d9c:	54000c82 	b.cs	13f2c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x99c>  // b.hs, b.nlast
   13da0:	aa1f03e0 	mov	x0, xzr
   13da4:	2a1f03f2 	mov	w18, wzr
   13da8:	aa1e03e5 	mov	x5, x30
   13dac:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   13db0:	eb1f011f 	cmp	x8, xzr
   13db4:	54fffae0 	b.eq	13d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   13db8:	1400006a 	b	13f60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>
   13dbc:	9e630301 	ucvtf	d1, x24
   13dc0:	90000208 	adrp	x8, 53000 <Lhint+0xd38>
   13dc4:	91232108 	add	x8, x8, #0x8c8
   13dc8:	b7f80a10 	tbnz	x16, #63, 13f08 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x978>
   13dcc:	fc707902 	ldr	d2, [x8, x16, lsl #3]
   13dd0:	1e610841 	fmul	d1, d2, d1
   13dd4:	14000050 	b	13f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x984>
   13dd8:	9ac22002 	lsl	x2, x0, x2
   13ddc:	92400403 	and	x3, x0, #0x3
   13de0:	eb11005f 	cmp	x2, x17
   13de4:	fa410860 	ccmp	x3, #0x1, #0x0, eq	// eq = none
   13de8:	fa420902 	ccmp	x8, #0x2, #0x2, eq	// eq = none
   13dec:	91001208 	add	x8, x16, #0x4
   13df0:	fa5c3902 	ccmp	x8, #0x1c, #0x2, cc	// cc = lo, ul, last
   13df4:	927ed408 	and	x8, x0, #0xfffffffffffffc
   13df8:	9a803108 	csel	x8, x8, x0, cc	// cc = lo, ul, last
   13dfc:	92400111 	and	x17, x8, #0x1
   13e00:	8b080228 	add	x8, x17, x8
   13e04:	52807ff1 	mov	w17, #0x3ff                 	// #1023
   13e08:	d376fd00 	lsr	x0, x8, #54
   13e0c:	d341fd08 	lsr	x8, x8, #1
   13e10:	f100001f 	cmp	x0, #0x0
   13e14:	924bf908 	and	x8, x8, #0xffefffffffffffff
   13e18:	1a910631 	cinc	w17, w17, ne	// ne = any
   13e1c:	0b120231 	add	w17, w17, w18
   13e20:	5280fff2 	mov	w18, #0x7ff                 	// #2047
   13e24:	711ffe3f 	cmp	w17, #0x7ff
   13e28:	1a923231 	csel	w17, w17, w18, cc	// cc = lo, ul, last
   13e2c:	fa403800 	ccmp	x0, #0x0, #0x0, cc	// cc = lo, ul, last
   13e30:	9a9f0108 	csel	x8, x8, xzr, eq	// eq = none
   13e34:	17ffffaa 	b	13cdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   13e38:	9ac42064 	lsl	x4, x3, x4
   13e3c:	92400465 	and	x5, x3, #0x3
   13e40:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   13e44:	eb00009f 	cmp	x4, x0
   13e48:	fa4108a0 	ccmp	x5, #0x1, #0x0, eq	// eq = none
   13e4c:	aa1e03e5 	mov	x5, x30
   13e50:	fa420a42 	ccmp	x18, #0x2, #0x2, eq	// eq = none
   13e54:	91001212 	add	x18, x16, #0x4
   13e58:	fa5c3a42 	ccmp	x18, #0x1c, #0x2, cc	// cc = lo, ul, last
   13e5c:	927ed472 	and	x18, x3, #0xfffffffffffffc
   13e60:	9a833252 	csel	x18, x18, x3, cc	// cc = lo, ul, last
   13e64:	92400240 	and	x0, x18, #0x1
   13e68:	8b120000 	add	x0, x0, x18
   13e6c:	52807ff2 	mov	w18, #0x3ff                 	// #1023
   13e70:	d376fc03 	lsr	x3, x0, #54
   13e74:	d341fc00 	lsr	x0, x0, #1
   13e78:	f100007f 	cmp	x3, #0x0
   13e7c:	924bf800 	and	x0, x0, #0xffefffffffffffff
   13e80:	1a920652 	cinc	w18, w18, ne	// ne = any
   13e84:	0b020252 	add	w18, w18, w2
   13e88:	5280ffe2 	mov	w2, #0x7ff                 	// #2047
   13e8c:	711ffe5f 	cmp	w18, #0x7ff
   13e90:	1a823252 	csel	w18, w18, w2, cc	// cc = lo, ul, last
   13e94:	fa403860 	ccmp	x3, #0x0, #0x0, cc	// cc = lo, ul, last
   13e98:	9a9f0000 	csel	x0, x0, xzr, eq	// eq = none
   13e9c:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   13ea0:	eb00011f 	cmp	x8, x0
   13ea4:	54fff360 	b.eq	13d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   13ea8:	1400002e 	b	13f60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>
   13eac:	12807fa8 	mov	w8, #0xfffffc02            	// #-1022
   13eb0:	4b120108 	sub	w8, w8, w18
   13eb4:	9ac82408 	lsr	x8, x0, x8
   13eb8:	92400111 	and	x17, x8, #0x1
   13ebc:	8b080231 	add	x17, x17, x8
   13ec0:	d341fe28 	lsr	x8, x17, #1
   13ec4:	d375fe31 	lsr	x17, x17, #53
   13ec8:	f100023f 	cmp	x17, #0x0
   13ecc:	1a9f07f1 	cset	w17, ne	// ne = any
   13ed0:	17ffff83 	b	13cdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   13ed4:	9b1b7e12 	mul	x18, x16, x27
   13ed8:	9b1a7f0e 	mul	x14, x24, x26
   13edc:	8b502250 	add	x16, x18, x16, lsr #8
   13ee0:	92001e12 	and	x18, x16, #0xff000000ff
   13ee4:	d350fe10 	lsr	x16, x16, #16
   13ee8:	9b077e52 	mul	x18, x18, x7
   13eec:	92001e10 	and	x16, x16, #0xff000000ff
   13ef0:	9b194a10 	madd	x16, x16, x25, x18
   13ef4:	8b5081d8 	add	x24, x14, x16, lsr #32
   13ef8:	cb0d010e 	sub	x14, x8, x13
   13efc:	f10021df 	cmp	x14, #0x8
   13f00:	54ffd1cb 	b.lt	13938 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>  // b.tstop
   13f04:	17fffed6 	b	13a5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4cc>
   13f08:	cb100d08 	sub	x8, x8, x16, lsl #3
   13f0c:	fd400102 	ldr	d2, [x8]
   13f10:	1e621821 	fdiv	d1, d1, d2
   13f14:	1e614022 	fneg	d2, d1
   13f18:	7100b79f 	cmp	w28, #0x2d
   13f1c:	aa1f03e8 	mov	x8, xzr
   13f20:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   13f24:	b500135f 	cbnz	xzr, 1418c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   13f28:	17fffdbe 	b	13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   13f2c:	12807fb2 	mov	w18, #0xfffffc02            	// #-1022
   13f30:	aa1e03e5 	mov	x5, x30
   13f34:	4b020252 	sub	w18, w18, w2
   13f38:	9ad22472 	lsr	x18, x3, x18
   13f3c:	92400240 	and	x0, x18, #0x1
   13f40:	8b120012 	add	x18, x0, x18
   13f44:	d341fe40 	lsr	x0, x18, #1
   13f48:	d375fe52 	lsr	x18, x18, #53
   13f4c:	f100025f 	cmp	x18, #0x0
   13f50:	1a9f07f2 	cset	w18, ne	// ne = any
   13f54:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   13f58:	eb00011f 	cmp	x8, x0
   13f5c:	54ffeda0 	b.eq	13d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   13f60:	531f7a00 	lsl	w0, w16, #1
   13f64:	90000202 	adrp	x2, 53000 <Lhint+0xd38>
   13f68:	9126c042 	add	x2, x2, #0x9b0
   13f6c:	dac01311 	clz	x17, x24
   13f70:	110ab008 	add	w8, w0, #0x2ac
   13f74:	9ad12312 	lsl	x18, x24, x17
   13f78:	f868d842 	ldr	x2, [x2, w8, sxtw #3]
   13f7c:	9bd27c48 	umulh	x8, x2, x18
   13f80:	2a2803e3 	mvn	w3, w8
   13f84:	f240207f 	tst	x3, #0x1ff
   13f88:	54000121 	b.ne	13fac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa1c>  // b.any
   13f8c:	110ab400 	add	w0, w0, #0x2ad
   13f90:	90000203 	adrp	x3, 53000 <Lhint+0xd38>
   13f94:	9126c063 	add	x3, x3, #0x9b0
   13f98:	9b127c42 	mul	x2, x2, x18
   13f9c:	f860d860 	ldr	x0, [x3, w0, sxtw #3]
   13fa0:	9bd27c12 	umulh	x18, x0, x18
   13fa4:	ab02025f 	cmn	x18, x2
   13fa8:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
   13fac:	528a4d40 	mov	w0, #0x526a                	// #21098
   13fb0:	d37ffd12 	lsr	x18, x8, #63
   13fb4:	72a00060 	movk	w0, #0x3, lsl #16
   13fb8:	52000252 	eor	w18, w18, #0x1
   13fbc:	1b007e00 	mul	w0, w16, w0
   13fc0:	9ad22108 	lsl	x8, x8, x18
   13fc4:	13107c00 	asr	w0, w0, #16
   13fc8:	4b110011 	sub	w17, w0, w17
   13fcc:	4b120231 	sub	w17, w17, w18
   13fd0:	128f7972 	mov	w18, #0xffff8434            	// #-31692
   13fd4:	2b120222 	adds	w2, w17, w18
   13fd8:	540004a5 	b.pl	1406c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xadc>  // b.nfrst
   13fdc:	390083e9 	strb	w9, [sp, #32]
   13fe0:	52800029 	mov	w9, #0x1                   	// #1
   13fe4:	f9000fed 	str	x13, [sp, #24]
   13fe8:	910023ed 	add	x13, sp, #0x8
   13fec:	910023e0 	add	x0, sp, #0x8
   13ff0:	52800023 	mov	w3, #0x1                   	// #1
   13ff4:	2a0103f9 	mov	w25, w1
   13ff8:	aa0803e1 	mov	x1, x8
   13ffc:	1e604009 	fmov	d9, d0
   14000:	aa0703fa 	mov	x26, x7
   14004:	aa0503f5 	mov	x21, x5
   14008:	a900e3f0 	stp	x16, x24, [sp, #8]
   1400c:	390087e9 	strb	w9, [sp, #33]
   14010:	b94003e9 	ldr	w9, [sp]
   14014:	39008bef 	strb	w15, [sp, #34]
   14018:	a902afea 	stp	x10, x11, [sp, #40]
   1401c:	a903bbec 	stp	x12, x14, [sp, #56]
   14020:	f90027ff 	str	xzr, [sp, #72]
   14024:	b801b1a9 	stur	w9, [x13, #27]
   14028:	394013e9 	ldrb	w9, [sp, #4]
   1402c:	3801f1a9 	sturb	w9, [x13, #31]
   14030:	94000fec 	bl	17fe0 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   14034:	aa1503e5 	mov	x5, x21
   14038:	b202d7f5 	mov	x21, #0xcfcfcfcfcfcfcfcf    	// #-3472328296227680305
   1403c:	aa1a03e7 	mov	x7, x26
   14040:	529c201a 	mov	w26, #0xe100                	// #57600
   14044:	1e604120 	fmov	d0, d9
   14048:	aa0103e2 	mov	x2, x1
   1404c:	2a1903e1 	mov	w1, w25
   14050:	d2800039 	mov	x25, #0x1                   	// #1
   14054:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   14058:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   1405c:	aa0003e8 	mov	x8, x0
   14060:	f299fa15 	movk	x21, #0xcfd0
   14064:	72a0beba 	movk	w26, #0x5f5, lsl #16
   14068:	f2c4e219 	movk	x25, #0x2710, lsl #32
   1406c:	7100b79f 	cmp	w28, #0x2d
   14070:	1a9f17e9 	cset	w9, eq	// eq = none
   14074:	f100031f 	cmp	x24, #0x0
   14078:	d3410129 	lsl	x9, x9, #63
   1407c:	7a401840 	ccmp	w2, #0x0, #0x0, ne	// ne = any
   14080:	aa02d129 	orr	x9, x9, x2, lsl #52
   14084:	fa400900 	ccmp	x8, #0x0, #0x0, eq	// eq = none
   14088:	aa080129 	orr	x9, x9, x8
   1408c:	5280ffe8 	mov	w8, #0x7ff                 	// #2047
   14090:	9e670121 	fmov	d1, x9
   14094:	7a481044 	ccmp	w2, w8, #0x4, ne	// ne = any
   14098:	52800048 	mov	w8, #0x2                   	// #2
   1409c:	9a9f0108 	csel	x8, x8, xzr, eq	// eq = none
   140a0:	b5000768 	cbnz	x8, 1418c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   140a4:	17fffd5f 	b	13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   140a8:	aa0e03ed 	mov	x13, x14
   140ac:	cb0e0190 	sub	x16, x12, x14
   140b0:	cb0c01ce 	sub	x14, x14, x12
   140b4:	aa0d03f2 	mov	x18, x13
   140b8:	cb100160 	sub	x0, x11, x16
   140bc:	b5ffb7e0 	cbnz	x0, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   140c0:	14000015 	b	14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   140c4:	aa0e03ed 	mov	x13, x14
   140c8:	cb0d0190 	sub	x16, x12, x13
   140cc:	cb0c01ae 	sub	x14, x13, x12
   140d0:	aa0d03f2 	mov	x18, x13
   140d4:	cb100160 	sub	x0, x11, x16
   140d8:	b5ffb700 	cbnz	x0, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   140dc:	1400000e 	b	14114 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   140e0:	aa0b03f8 	mov	x24, x11
   140e4:	17fffdac 	b	13794 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>
   140e8:	aa0b03f8 	mov	x24, x11
   140ec:	cb0a01eb 	sub	x11, x15, x10
   140f0:	eb0801ff 	cmp	x15, x8
   140f4:	54ffbc61 	b.ne	13880 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2f0>  // b.any
   140f8:	aa1f03ee 	mov	x14, xzr
   140fc:	aa1f03f0 	mov	x16, xzr
   14100:	aa1f03ec 	mov	x12, xzr
   14104:	aa1f03f2 	mov	x18, xzr
   14108:	aa0803ed 	mov	x13, x8
   1410c:	aa0b03e0 	mov	x0, x11
   14110:	b5ffb54b 	cbnz	x11, 137b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   14114:	7100b79f 	cmp	w28, #0x2d
   14118:	54000041 	b.ne	14120 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb90>  // b.any
   1411c:	91000631 	add	x17, x17, #0x1
   14120:	cb110108 	sub	x8, x8, x17
   14124:	f1000d1f 	cmp	x8, #0x3
   14128:	540002cb 	b.lt	14180 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>  // b.tstop
   1412c:	39400a28 	ldrb	w8, [x17, #2]
   14130:	79400229 	ldrh	w9, [x17]
   14134:	aa084128 	orr	x8, x9, x8, lsl #16
   14138:	b203c108 	orr	x8, x8, #0x2020202020202020
   1413c:	eb05011f 	cmp	x8, x5
   14140:	540002a0 	b.eq	14194 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc04>  // b.none
   14144:	b203c3e9 	mov	x9, #0x2020202020202020    	// #2314885530818453536
   14148:	f28c2dc9 	movk	x9, #0x616e
   1414c:	f2a40dc9 	movk	x9, #0x206e, lsl #16
   14150:	eb09011f 	cmp	x8, x9
   14154:	54000161 	b.ne	14180 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>  // b.any
   14158:	d2efff09 	mov	x9, #0x7ff8000000000000    	// #9221120237041090560
   1415c:	7100b79f 	cmp	w28, #0x2d
   14160:	aa1f03e8 	mov	x8, xzr
   14164:	9e670121 	fmov	d1, x9
   14168:	d2ffff09 	mov	x9, #0xfff8000000000000    	// #-2251799813685248
   1416c:	9e670122 	fmov	d2, x9
   14170:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   14174:	b50000df 	cbnz	xzr, 1418c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   14178:	17fffd2a 	b	13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   1417c:	d503201f 	nop
   14180:	2f00e401 	movi	d1, #0x0
   14184:	52800028 	mov	w8, #0x1                   	// #1
   14188:	b4ffa4c8 	cbz	x8, 13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   1418c:	3707a4a1 	tbnz	w1, #0, 13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   14190:	14000012 	b	141d8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc48>
   14194:	9e6700c1 	fmov	d1, x6
   14198:	7100b79f 	cmp	w28, #0x2d
   1419c:	aa1f03e8 	mov	x8, xzr
   141a0:	9e6703c2 	fmov	d2, x30
   141a4:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   141a8:	b5ffff3f 	cbnz	xzr, 1418c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   141ac:	17fffd1d 	b	13620 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   141b0:	2f00e400 	movi	d0, #0x0
   141b4:	6d4523e9 	ldp	d9, d8, [sp, #80]
   141b8:	a94b4ff4 	ldp	x20, x19, [sp, #176]
   141bc:	a94a57f6 	ldp	x22, x21, [sp, #160]
   141c0:	a9495ff8 	ldp	x24, x23, [sp, #144]
   141c4:	a94867fa 	ldp	x26, x25, [sp, #128]
   141c8:	a9476ffc 	ldp	x28, x27, [sp, #112]
   141cc:	a9467bfd 	ldp	x29, x30, [sp, #96]
   141d0:	910303ff 	add	sp, sp, #0xc0
   141d4:	d65f03c0 	ret
   141d8:	52800200 	mov	w0, #0x10                  	// #16
   141dc:	97ffc75d 	bl	5f50 <__cxa_allocate_exception@plt>
   141e0:	aa0003f3 	mov	x19, x0
   141e4:	d00001c1 	adrp	x1, 4e000 <absl::lts_20250814::strings_internal::ParsedFloat absl::lts_20250814::strings_internal::ParseFloat<10>(char const*, char const*, absl::lts_20250814::chars_format)+0x260>
   141e8:	91257821 	add	x1, x1, #0x95e
   141ec:	97ffc73d 	bl	5ee0 <std::runtime_error::runtime_error(char const*)@plt>
   141f0:	f0000341 	adrp	x1, 7f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
   141f4:	f0000342 	adrp	x2, 7f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
   141f8:	aa1303e0 	mov	x0, x19
   141fc:	f947ec21 	ldr	x1, [x1, #4056]
   14200:	f947b442 	ldr	x2, [x2, #3944]
   14204:	97ffc85b 	bl	6370 <__cxa_throw@plt>
   14208:	aa0003f4 	mov	x20, x0
   1420c:	aa1303e0 	mov	x0, x19
   14210:	97ffc794 	bl	6060 <__cxa_free_exception@plt>
   14214:	aa1403e0 	mov	x0, x20
   14218:	97ffc85a 	bl	6380 <_Unwind_Resume@plt>
   1421c:	d503201f 	nop

