0000000000011d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   11d10:	d10303ff 	sub	sp, sp, #0xc0
   11d14:	6d0523e9 	stp	d9, d8, [sp, #80]
   11d18:	a9067bfd 	stp	x29, x30, [sp, #96]
   11d1c:	a9076ffc 	stp	x28, x27, [sp, #112]
   11d20:	a90867fa 	stp	x26, x25, [sp, #128]
   11d24:	a9095ff8 	stp	x24, x23, [sp, #144]
   11d28:	a90a57f6 	stp	x22, x21, [sp, #160]
   11d2c:	a90b4ff4 	stp	x20, x19, [sp, #176]
   11d30:	910183fd 	add	x29, sp, #0x60
   11d34:	a9405013 	ldp	x19, x20, [x0]
   11d38:	eb14027f 	cmp	x19, x20
   11d3c:	54005fa0 	b.eq	12930 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc20>  // b.none
   11d40:	d2b4ec97 	mov	x23, #0xa7640000            	// #2808348672
   11d44:	d2800c87 	mov	x7, #0x64                  	// #100
   11d48:	b203c3e5 	mov	x5, #0x2020202020202020    	// #2314885530818453536
   11d4c:	b202d7f5 	mov	x21, #0xcfcfcfcfcfcfcfcf    	// #-3472328296227680305
   11d50:	b207c7f6 	mov	x22, #0x606060606060606     	// #434041037028460038
   11d54:	d2800039 	mov	x25, #0x1                   	// #1
   11d58:	2f00e408 	movi	d8, #0x0
   11d5c:	2f00e400 	movi	d0, #0x0
   11d60:	529c201a 	mov	w26, #0xe100                	// #57600
   11d64:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   11d68:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   11d6c:	5280015b 	mov	w27, #0xa                   	// #10
   11d70:	f2d6d677 	movk	x23, #0xb6b3, lsl #32
   11d74:	f2c84807 	movk	x7, #0x4240, lsl #32
   11d78:	f28dcd25 	movk	x5, #0x6e69
   11d7c:	f299fa15 	movk	x21, #0xcfd0
   11d80:	b202e2d6 	orr	x22, x22, #0x4444444444444444
   11d84:	f2c4e219 	movk	x25, #0x2710, lsl #32
   11d88:	72a0beba 	movk	w26, #0x5f5, lsl #16
   11d8c:	f2e1bc17 	movk	x23, #0xde0, lsl #48
   11d90:	f2e001e7 	movk	x7, #0xf, lsl #48
   11d94:	f2a40cc5 	movk	x5, #0x2066, lsl #16
   11d98:	14000007 	b	11db4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   11d9c:	d503201f 	nop
   11da0:	1e612000 	fcmp	d0, d1
   11da4:	91008273 	add	x19, x19, #0x20
   11da8:	1e61cc00 	fcsel	d0, d0, d1, gt
   11dac:	eb14027f 	cmp	x19, x20
   11db0:	54005c20 	b.eq	12934 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc24>  // b.none
   11db4:	f940066c 	ldr	x12, [x19, #8]
   11db8:	b4005a4c 	cbz	x12, 12900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>
   11dbc:	f9400271 	ldr	x17, [x19]
   11dc0:	3940023c 	ldrb	w28, [x17]
   11dc4:	8b0c0228 	add	x8, x17, x12
   11dc8:	aa1103ea 	mov	x10, x17
   11dcc:	7100b79f 	cmp	w28, #0x2d
   11dd0:	2a1c03eb 	mov	w11, w28
   11dd4:	1a9f17e9 	cset	w9, eq	// eq = none
   11dd8:	54000141 	b.ne	11e00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xf0>  // b.any
   11ddc:	f100059f 	cmp	x12, #0x1
   11de0:	540055e0 	b.eq	1289c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb8c>  // b.none
   11de4:	aa1103ea 	mov	x10, x17
   11de8:	38401d4b 	ldrb	w11, [x10, #1]!
   11dec:	5100c16c 	sub	w12, w11, #0x30
   11df0:	7100b97f 	cmp	w11, #0x2e
   11df4:	7a491980 	ccmp	w12, #0x9, #0x0, ne	// ne = any
   11df8:	54005528 	b.hi	1289c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb8c>  // b.pmore
   11dfc:	d503201f 	nop
   11e00:	eb08015f 	cmp	x10, x8
   11e04:	54000860 	b.eq	11f10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x200>  // b.none
   11e08:	5100c16c 	sub	w12, w11, #0x30
   11e0c:	7100259f 	cmp	w12, #0x9
   11e10:	54000ee8 	b.hi	11fec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2dc>  // b.pmore
   11e14:	9100054f 	add	x15, x10, #0x1
   11e18:	2a0b03eb 	mov	w11, w11
   11e1c:	d100c178 	sub	x24, x11, #0x30
   11e20:	eb0801ff 	cmp	x15, x8
   11e24:	54000780 	b.eq	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   11e28:	394001eb 	ldrb	w11, [x15]
   11e2c:	5100c16c 	sub	w12, w11, #0x30
   11e30:	7100259f 	cmp	w12, #0x9
   11e34:	54000e08 	b.hi	11ff4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   11e38:	9100094f 	add	x15, x10, #0x2
   11e3c:	d100c16b 	sub	x11, x11, #0x30
   11e40:	8b180b0c 	add	x12, x24, x24, lsl #2
   11e44:	8b0c056c 	add	x12, x11, x12, lsl #1
   11e48:	aa0c03f8 	mov	x24, x12
   11e4c:	eb0801ff 	cmp	x15, x8
   11e50:	54000620 	b.eq	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   11e54:	394001eb 	ldrb	w11, [x15]
   11e58:	5100c16c 	sub	w12, w11, #0x30
   11e5c:	7100259f 	cmp	w12, #0x9
   11e60:	54000ca8 	b.hi	11ff4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   11e64:	91000d4f 	add	x15, x10, #0x3
   11e68:	d100c16b 	sub	x11, x11, #0x30
   11e6c:	8b180b0c 	add	x12, x24, x24, lsl #2
   11e70:	8b0c056c 	add	x12, x11, x12, lsl #1
   11e74:	aa0c03f8 	mov	x24, x12
   11e78:	eb0801ff 	cmp	x15, x8
   11e7c:	540004c0 	b.eq	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   11e80:	394001eb 	ldrb	w11, [x15]
   11e84:	5100c16c 	sub	w12, w11, #0x30
   11e88:	7100259f 	cmp	w12, #0x9
   11e8c:	54000b48 	b.hi	11ff4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   11e90:	9100114f 	add	x15, x10, #0x4
   11e94:	d100c16b 	sub	x11, x11, #0x30
   11e98:	8b180b0c 	add	x12, x24, x24, lsl #2
   11e9c:	8b0c056c 	add	x12, x11, x12, lsl #1
   11ea0:	aa0c03f8 	mov	x24, x12
   11ea4:	eb0801ff 	cmp	x15, x8
   11ea8:	54000360 	b.eq	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>  // b.none
   11eac:	394001eb 	ldrb	w11, [x15]
   11eb0:	5100c16c 	sub	w12, w11, #0x30
   11eb4:	7100259f 	cmp	w12, #0x9
   11eb8:	540009e8 	b.hi	11ff4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e4>  // b.pmore
   11ebc:	9100154f 	add	x15, x10, #0x5
   11ec0:	d100c16c 	sub	x12, x11, #0x30
   11ec4:	8b180b0b 	add	x11, x24, x24, lsl #2
   11ec8:	8b0b058b 	add	x11, x12, x11, lsl #1
   11ecc:	eb0801ff 	cmp	x15, x8
   11ed0:	54004c80 	b.eq	12860 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb50>  // b.none
   11ed4:	d503201f 	nop
   11ed8:	d503201f 	nop
   11edc:	d503201f 	nop
   11ee0:	394001ec 	ldrb	w12, [x15]
   11ee4:	5100c18d 	sub	w13, w12, #0x30
   11ee8:	710025bf 	cmp	w13, #0x9
   11eec:	54004be8 	b.hi	12868 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb58>  // b.pmore
   11ef0:	910005ef 	add	x15, x15, #0x1
   11ef4:	d100c18c 	sub	x12, x12, #0x30
   11ef8:	8b0b0978 	add	x24, x11, x11, lsl #2
   11efc:	8b180598 	add	x24, x12, x24, lsl #1
   11f00:	aa1803eb 	mov	x11, x24
   11f04:	eb0801ff 	cmp	x15, x8
   11f08:	54fffec1 	b.ne	11ee0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1d0>  // b.any
   11f0c:	14000002 	b	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>
   11f10:	aa1f03f8 	mov	x24, xzr
   11f14:	cb0a010b 	sub	x11, x8, x10
   11f18:	aa1f03ee 	mov	x14, xzr
   11f1c:	aa1f03f0 	mov	x16, xzr
   11f20:	aa1f03ec 	mov	x12, xzr
   11f24:	aa1f03f2 	mov	x18, xzr
   11f28:	aa0803ef 	mov	x15, x8
   11f2c:	aa0803ed 	mov	x13, x8
   11f30:	aa0b03e0 	mov	x0, x11
   11f34:	b4004b0b 	cbz	x11, 12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   11f38:	eb0801bf 	cmp	x13, x8
   11f3c:	54000c40 	b.eq	120c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b4>  // b.none
   11f40:	394001b1 	ldrb	w17, [x13]
   11f44:	321b0231 	orr	w17, w17, #0x20
   11f48:	7101963f 	cmp	w17, #0x65
   11f4c:	54000481 	b.ne	11fdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.any
   11f50:	910005a2 	add	x2, x13, #0x1
   11f54:	eb08005f 	cmp	x2, x8
   11f58:	54000420 	b.eq	11fdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.none
   11f5c:	394005b1 	ldrb	w17, [x13, #1]
   11f60:	528005a3 	mov	w3, #0x2d                  	// #45
   11f64:	7100ae3f 	cmp	w17, #0x2b
   11f68:	7a431224 	ccmp	w17, w3, #0x4, ne	// ne = any
   11f6c:	910009a3 	add	x3, x13, #0x2
   11f70:	9a820062 	csel	x2, x3, x2, eq	// eq = none
   11f74:	eb08005f 	cmp	x2, x8
   11f78:	54000320 	b.eq	11fdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.none
   11f7c:	39400043 	ldrb	w3, [x2]
   11f80:	5100c063 	sub	w3, w3, #0x30
   11f84:	7100247f 	cmp	w3, #0x9
   11f88:	540002a8 	b.hi	11fdc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2cc>  // b.pmore
   11f8c:	aa1f03ed 	mov	x13, xzr
   11f90:	14000007 	b	11fac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x29c>
   11f94:	d503201f 	nop
   11f98:	d503201f 	nop
   11f9c:	d503201f 	nop
   11fa0:	91000442 	add	x2, x2, #0x1
   11fa4:	eb08005f 	cmp	x2, x8
   11fa8:	54001c80 	b.eq	12338 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x628>  // b.none
   11fac:	39400043 	ldrb	w3, [x2]
   11fb0:	5100c063 	sub	w3, w3, #0x30
   11fb4:	7100247f 	cmp	w3, #0x9
   11fb8:	54001c28 	b.hi	1233c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x62c>  // b.pmore
   11fbc:	12be0004 	mov	w4, #0xfffffff             	// #268435455
   11fc0:	eb0401bf 	cmp	x13, x4
   11fc4:	54fffeec 	b.gt	11fa0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x290>
   11fc8:	92401c63 	and	x3, x3, #0xff
   11fcc:	8b0d09a4 	add	x4, x13, x13, lsl #2
   11fd0:	8b040464 	add	x4, x3, x4, lsl #1
   11fd4:	aa0403ed 	mov	x13, x4
   11fd8:	17fffff2 	b	11fa0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x290>
   11fdc:	aa1f03f1 	mov	x17, xzr
   11fe0:	f100501f 	cmp	x0, #0x14
   11fe4:	5400078a 	b.ge	120d4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3c4>  // b.tcont
   11fe8:	140000db 	b	12354 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>
   11fec:	aa1f03f8 	mov	x24, xzr
   11ff0:	aa0a03ef 	mov	x15, x10
   11ff4:	cb0a01eb 	sub	x11, x15, x10
   11ff8:	eb0801ff 	cmp	x15, x8
   11ffc:	540043e0 	b.eq	12878 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb68>  // b.none
   12000:	394001ec 	ldrb	w12, [x15]
   12004:	7100b99f 	cmp	w12, #0x2e
   12008:	54000c81 	b.ne	12198 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x488>  // b.any
   1200c:	910005ec 	add	x12, x15, #0x1
   12010:	cb0c010e 	sub	x14, x8, x12
   12014:	f10041df 	cmp	x14, #0x10
   12018:	54000dab 	b.lt	121cc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4bc>  // b.tstop
   1201c:	910025ed 	add	x13, x15, #0x9
   12020:	f85f81b0 	ldur	x16, [x13, #-8]
   12024:	8b160212 	add	x18, x16, x22
   12028:	8b150210 	add	x16, x16, x21
   1202c:	aa100252 	orr	x18, x18, x16
   12030:	f201c25f 	tst	x18, #0x8080808080808080
   12034:	540003a1 	b.ne	120a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x398>  // b.any
   12038:	f94001b2 	ldr	x18, [x13]
   1203c:	8b160240 	add	x0, x18, x22
   12040:	8b150252 	add	x18, x18, x21
   12044:	aa120000 	orr	x0, x0, x18
   12048:	f201c01f 	tst	x0, #0x8080808080808080
   1204c:	54003041 	b.ne	12654 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x944>  // b.any
   12050:	9b1b7e00 	mul	x0, x16, x27
   12054:	d10041ce 	sub	x14, x14, #0x10
   12058:	910041ad 	add	x13, x13, #0x10
   1205c:	f1003ddf 	cmp	x14, #0xf
   12060:	8b502010 	add	x16, x0, x16, lsr #8
   12064:	92001e00 	and	x0, x16, #0xff000000ff
   12068:	d350fe10 	lsr	x16, x16, #16
   1206c:	9b077c00 	mul	x0, x0, x7
   12070:	92001e10 	and	x16, x16, #0xff000000ff
   12074:	9b190210 	madd	x16, x16, x25, x0
   12078:	9b1b7e40 	mul	x0, x18, x27
   1207c:	8b522012 	add	x18, x0, x18, lsr #8
   12080:	92001e40 	and	x0, x18, #0xff000000ff
   12084:	d350fe52 	lsr	x18, x18, #16
   12088:	9b077c00 	mul	x0, x0, x7
   1208c:	92001e52 	and	x18, x18, #0xff000000ff
   12090:	9b190252 	madd	x18, x18, x25, x0
   12094:	9b1a7f00 	mul	x0, x24, x26
   12098:	8b508010 	add	x16, x0, x16, lsr #32
   1209c:	9b1a7e10 	mul	x16, x16, x26
   120a0:	8b528218 	add	x24, x16, x18, lsr #32
   120a4:	54fffbec 	b.gt	12020 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x310>
   120a8:	d10021ad 	sub	x13, x13, #0x8
   120ac:	cb0d010e 	sub	x14, x8, x13
   120b0:	f10021df 	cmp	x14, #0x8
   120b4:	5400094a 	b.ge	121dc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4cc>  // b.tcont
   120b8:	f10011df 	cmp	x14, #0x4
   120bc:	54000b6a 	b.ge	12228 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x518>  // b.tcont
   120c0:	14000064 	b	12250 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x540>
   120c4:	aa1f03f1 	mov	x17, xzr
   120c8:	aa0803ed 	mov	x13, x8
   120cc:	f100501f 	cmp	x0, #0x14
   120d0:	5400142b 	b.lt	12354 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>  // b.tstop
   120d4:	eb08015f 	cmp	x10, x8
   120d8:	54000200 	b.eq	12118 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x408>  // b.none
   120dc:	aa0a03e2 	mov	x2, x10
   120e0:	14000007 	b	120fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3ec>
   120e4:	7100c07f 	cmp	w3, #0x30
   120e8:	91000442 	add	x2, x2, #0x1
   120ec:	1a9f17e3 	cset	w3, eq	// eq = none
   120f0:	eb08005f 	cmp	x2, x8
   120f4:	cb030000 	sub	x0, x0, x3
   120f8:	540000c0 	b.eq	12110 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x400>  // b.none
   120fc:	39400043 	ldrb	w3, [x2]
   12100:	7100c07f 	cmp	w3, #0x30
   12104:	54ffff00 	b.eq	120e4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>  // b.none
   12108:	7100b87f 	cmp	w3, #0x2e
   1210c:	54fffec0 	b.eq	120e4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>  // b.none
   12110:	f100501f 	cmp	x0, #0x14
   12114:	5400120b 	b.lt	12354 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x644>  // b.tstop
   12118:	eb0f015f 	cmp	x10, x15
   1211c:	540004e0 	b.eq	121b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a8>  // b.none
   12120:	aa1f03f8 	mov	x24, xzr
   12124:	aa0a03e8 	mov	x8, x10
   12128:	38401510 	ldrb	w16, [x8], #1
   1212c:	9b1b4310 	madd	x16, x24, x27, x16
   12130:	d100c218 	sub	x24, x16, #0x30
   12134:	eb17031f 	cmp	x24, x23
   12138:	fa4f3104 	ccmp	x8, x15, #0x4, cc	// cc = lo, ul, last
   1213c:	54ffff61 	b.ne	12128 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x418>  // b.any
   12140:	d10006f0 	sub	x16, x23, #0x1
   12144:	eb10031f 	cmp	x24, x16
   12148:	540001a8 	b.hi	1217c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x46c>  // b.pmore
   1214c:	eb12019f 	cmp	x12, x18
   12150:	aa0c03e8 	mov	x8, x12
   12154:	54000120 	b.eq	12178 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x468>  // b.none
   12158:	d503201f 	nop
   1215c:	d503201f 	nop
   12160:	3840150f 	ldrb	w15, [x8], #1
   12164:	9b1b3f0f 	madd	x15, x24, x27, x15
   12168:	d100c1f8 	sub	x24, x15, #0x30
   1216c:	eb17031f 	cmp	x24, x23
   12170:	fa523104 	ccmp	x8, x18, #0x4, cc	// cc = lo, ul, last
   12174:	54ffff61 	b.ne	12160 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x450>  // b.any
   12178:	aa0c03ef 	mov	x15, x12
   1217c:	cb0801e8 	sub	x8, x15, x8
   12180:	5280002f 	mov	w15, #0x1                   	// #1
   12184:	390013ff 	strb	wzr, [sp, #4]
   12188:	b90003ff 	str	wzr, [sp]
   1218c:	8b110110 	add	x16, x8, x17
   12190:	b5001118 	cbnz	x24, 123b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6a0>
   12194:	140000b0 	b	12454 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>
   12198:	aa1f03ee 	mov	x14, xzr
   1219c:	aa1f03f0 	mov	x16, xzr
   121a0:	aa1f03ec 	mov	x12, xzr
   121a4:	aa1f03f2 	mov	x18, xzr
   121a8:	aa0f03ed 	mov	x13, x15
   121ac:	aa0b03e0 	mov	x0, x11
   121b0:	b5ffec4b 	cbnz	x11, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   121b4:	140001b8 	b	12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   121b8:	aa1f03f8 	mov	x24, xzr
   121bc:	eb12019f 	cmp	x12, x18
   121c0:	aa0c03e8 	mov	x8, x12
   121c4:	54fffce1 	b.ne	12160 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x450>  // b.any
   121c8:	17ffffec 	b	12178 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x468>
   121cc:	aa0c03ed 	mov	x13, x12
   121d0:	cb0c010e 	sub	x14, x8, x12
   121d4:	f10021df 	cmp	x14, #0x8
   121d8:	54fff70b 	b.lt	120b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>  // b.tstop
   121dc:	f94001ae 	ldr	x14, [x13]
   121e0:	8b1601d0 	add	x16, x14, x22
   121e4:	8b1501ce 	add	x14, x14, x21
   121e8:	aa0e0210 	orr	x16, x16, x14
   121ec:	f201c21f 	tst	x16, #0x8080808080808080
   121f0:	540001c1 	b.ne	12228 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x518>  // b.any
   121f4:	9b1b7dd2 	mul	x18, x14, x27
   121f8:	9b1a7f10 	mul	x16, x24, x26
   121fc:	910021ad 	add	x13, x13, #0x8
   12200:	8b4e224e 	add	x14, x18, x14, lsr #8
   12204:	92001dd2 	and	x18, x14, #0xff000000ff
   12208:	d350fdce 	lsr	x14, x14, #16
   1220c:	9b077e52 	mul	x18, x18, x7
   12210:	92001dce 	and	x14, x14, #0xff000000ff
   12214:	9b1949ce 	madd	x14, x14, x25, x18
   12218:	8b4e8218 	add	x24, x16, x14, lsr #32
   1221c:	cb0d010e 	sub	x14, x8, x13
   12220:	f10011df 	cmp	x14, #0x4
   12224:	5400016b 	b.lt	12250 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x540>  // b.tstop
   12228:	b94001ae 	ldr	w14, [x13]
   1222c:	5288c8d0 	mov	w16, #0x4646                	// #17990
   12230:	5299fa12 	mov	w18, #0xcfd0                	// #53200
   12234:	72a8c8d0 	movk	w16, #0x4646, lsl #16
   12238:	72b9f9f2 	movk	w18, #0xcfcf, lsl #16
   1223c:	0b1001d0 	add	w16, w14, w16
   12240:	0b1201ce 	add	w14, w14, w18
   12244:	2a0e0210 	orr	w16, w16, w14
   12248:	7201c21f 	tst	w16, #0x80808080
   1224c:	54000500 	b.eq	122ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>  // b.none
   12250:	eb0801bf 	cmp	x13, x8
   12254:	54000640 	b.eq	1231c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   12258:	394001ae 	ldrb	w14, [x13]
   1225c:	5100c1d0 	sub	w16, w14, #0x30
   12260:	7100261f 	cmp	w16, #0x9
   12264:	54002f28 	b.hi	12848 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb38>  // b.pmore
   12268:	910005ae 	add	x14, x13, #0x1
   1226c:	92401e10 	and	x16, x16, #0xff
   12270:	8b180b12 	add	x18, x24, x24, lsl #2
   12274:	8b120612 	add	x18, x16, x18, lsl #1
   12278:	aa1203f8 	mov	x24, x18
   1227c:	eb0801df 	cmp	x14, x8
   12280:	540004e0 	b.eq	1231c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   12284:	394001d0 	ldrb	w16, [x14]
   12288:	5100c210 	sub	w16, w16, #0x30
   1228c:	7100261f 	cmp	w16, #0x9
   12290:	54002cc8 	b.hi	12828 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb18>  // b.pmore
   12294:	910009ae 	add	x14, x13, #0x2
   12298:	92401e10 	and	x16, x16, #0xff
   1229c:	8b180b12 	add	x18, x24, x24, lsl #2
   122a0:	8b120612 	add	x18, x16, x18, lsl #1
   122a4:	aa1203f8 	mov	x24, x18
   122a8:	eb0801df 	cmp	x14, x8
   122ac:	54000380 	b.eq	1231c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60c>  // b.none
   122b0:	394001d0 	ldrb	w16, [x14]
   122b4:	5100c210 	sub	w16, w16, #0x30
   122b8:	7100261f 	cmp	w16, #0x9
   122bc:	54002c48 	b.hi	12844 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb34>  // b.pmore
   122c0:	91000dad 	add	x13, x13, #0x3
   122c4:	92401e0e 	and	x14, x16, #0xff
   122c8:	8b180b10 	add	x16, x24, x24, lsl #2
   122cc:	8b1005d0 	add	x16, x14, x16, lsl #1
   122d0:	aa1003f8 	mov	x24, x16
   122d4:	cb0d0190 	sub	x16, x12, x13
   122d8:	cb0c01ae 	sub	x14, x13, x12
   122dc:	aa0d03f2 	mov	x18, x13
   122e0:	cb100160 	sub	x0, x11, x16
   122e4:	b5ffe2a0 	cbnz	x0, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   122e8:	1400016b 	b	12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   122ec:	1b1b7dd0 	mul	w16, w14, w27
   122f0:	910011ad 	add	x13, x13, #0x4
   122f4:	0b4e220e 	add	w14, w16, w14, lsr #8
   122f8:	52800030 	mov	w16, #0x1                   	// #1
   122fc:	72a00c90 	movk	w16, #0x64, lsl #16
   12300:	12009dce 	and	w14, w14, #0xff00ff
   12304:	1b107dce 	mul	w14, w14, w16
   12308:	5284e210 	mov	w16, #0x2710                	// #10000
   1230c:	53107dce 	lsr	w14, w14, #16
   12310:	9b103b18 	madd	x24, x24, x16, x14
   12314:	eb0801bf 	cmp	x13, x8
   12318:	54fffa01 	b.ne	12258 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x548>  // b.any
   1231c:	aa0803ed 	mov	x13, x8
   12320:	cb080190 	sub	x16, x12, x8
   12324:	cb0c010e 	sub	x14, x8, x12
   12328:	aa0d03f2 	mov	x18, x13
   1232c:	cb100160 	sub	x0, x11, x16
   12330:	b5ffe040 	cbnz	x0, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   12334:	14000158 	b	12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   12338:	aa0803e2 	mov	x2, x8
   1233c:	7100b63f 	cmp	w17, #0x2d
   12340:	da8d15b1 	cneg	x17, x13, eq	// eq = none
   12344:	aa0203ed 	mov	x13, x2
   12348:	8b100230 	add	x16, x17, x16
   1234c:	f100501f 	cmp	x0, #0x14
   12350:	54ffec2a 	b.ge	120d4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3c4>  // b.tcont
   12354:	390013ff 	strb	wzr, [sp, #4]
   12358:	b90003ff 	str	wzr, [sp]
   1235c:	b5000210 	cbnz	x16, 1239c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x68c>
   12360:	d2e00408 	mov	x8, #0x20000000000000      	// #9007199254740992
   12364:	eb08031f 	cmp	x24, x8
   12368:	540001a8 	b.hi	1239c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x68c>  // b.pmore
   1236c:	9e630301 	ucvtf	d1, x24
   12370:	7100b79f 	cmp	w28, #0x2d
   12374:	d2f00008 	mov	x8, #0x8000000000000000    	// #-9223372036854775808
   12378:	1e614022 	fneg	d2, d1
   1237c:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   12380:	9e670102 	fmov	d2, x8
   12384:	1e680c42 	fcsel	d2, d2, d8, eq	// eq = none
   12388:	f100031f 	cmp	x24, #0x0
   1238c:	9a9f13e8 	csel	x8, xzr, xzr, ne	// ne = any
   12390:	1e621c21 	fcsel	d1, d1, d2, ne	// ne = any
   12394:	b5002bc8 	cbnz	x8, 1290c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   12398:	17fffe82 	b	11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   1239c:	d1005e08 	sub	x8, x16, #0x17
   123a0:	b100b51f 	cmn	x8, #0x2d
   123a4:	54000142 	b.cs	123cc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6bc>  // b.hs, b.nlast
   123a8:	2a1f03ef 	mov	w15, wzr
   123ac:	b4000558 	cbz	x24, 12454 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>
   123b0:	b1055a1f 	cmn	x16, #0x156
   123b4:	5400050b 	b.lt	12454 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x744>  // b.tstop
   123b8:	f104d21f 	cmp	x16, #0x134
   123bc:	5400010d 	b.le	123dc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6cc>
   123c0:	aa1f03e8 	mov	x8, xzr
   123c4:	5280fff1 	mov	w17, #0x7ff                 	// #2047
   123c8:	14000025 	b	1245c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   123cc:	d2e00408 	mov	x8, #0x20000000000000      	// #9007199254740992
   123d0:	eb08031f 	cmp	x24, x8
   123d4:	54000b49 	b.ls	1253c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x82c>  // b.plast
   123d8:	2a1f03ef 	mov	w15, wzr
   123dc:	531f7a02 	lsl	w2, w16, #1
   123e0:	90000204 	adrp	x4, 52000 <FFC_MIN_SAFE_OF_BASE_U64+0xd0>
   123e4:	9104c084 	add	x4, x4, #0x130
   123e8:	dac01312 	clz	x18, x24
   123ec:	110ab048 	add	w8, w2, #0x2ac
   123f0:	9ad22300 	lsl	x0, x24, x18
   123f4:	f868d891 	ldr	x17, [x4, w8, sxtw #3]
   123f8:	9b007e28 	mul	x8, x17, x0
   123fc:	9bc07e31 	umulh	x17, x17, x0
   12400:	2a3103e3 	mvn	w3, w17
   12404:	f240207f 	tst	x3, #0x1ff
   12408:	540000c1 	b.ne	12420 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x710>  // b.any
   1240c:	110ab442 	add	w2, w2, #0x2ad
   12410:	f862d882 	ldr	x2, [x4, w2, sxtw #3]
   12414:	9bc07c40 	umulh	x0, x2, x0
   12418:	ab080008 	adds	x8, x0, x8
   1241c:	9a913631 	cinc	x17, x17, cs	// cs = hs, nlast
   12420:	528a4d44 	mov	w4, #0x526a                	// #21098
   12424:	52001652 	eor	w18, w18, #0x3f
   12428:	d37ffe23 	lsr	x3, x17, #63
   1242c:	72a00064 	movk	w4, #0x3, lsl #16
   12430:	91002462 	add	x2, x3, #0x9
   12434:	1b047e04 	mul	w4, w16, w4
   12438:	9ac22620 	lsr	x0, x17, x2
   1243c:	0b844252 	add	w18, w18, w4, asr #16
   12440:	0b030252 	add	w18, w18, w3
   12444:	310ffe5f 	cmn	w18, #0x3ff
   12448:	5400088c 	b.gt	12558 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x848>
   1244c:	3110f65f 	cmn	w18, #0x43d
   12450:	54000ee2 	b.cs	1262c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x91c>  // b.hs, b.nlast
   12454:	aa1f03e8 	mov	x8, xzr
   12458:	2a1f03f1 	mov	w17, wzr
   1245c:	340001ef 	cbz	w15, 12498 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x788>
   12460:	b1000703 	adds	x3, x24, #0x1
   12464:	2a1f03f2 	mov	w18, wzr
   12468:	aa1f03e0 	mov	x0, xzr
   1246c:	540000e2 	b.cs	12488 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x778>  // b.hs, b.nlast
   12470:	b1055a1f 	cmn	x16, #0x156
   12474:	540000ab 	b.lt	12488 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x778>  // b.tstop
   12478:	f104d21f 	cmp	x16, #0x134
   1247c:	5400012d 	b.le	124a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x790>
   12480:	aa1f03e0 	mov	x0, xzr
   12484:	5280fff2 	mov	w18, #0x7ff                 	// #2047
   12488:	eb00011f 	cmp	x8, x0
   1248c:	540012a1 	b.ne	126e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>  // b.any
   12490:	6b12023f 	cmp	w17, w18
   12494:	54001261 	b.ne	126e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>  // b.any
   12498:	2a1103e2 	mov	w2, w17
   1249c:	140000d4 	b	127ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xadc>
   124a0:	531f7a04 	lsl	w4, w16, #1
   124a4:	90000206 	adrp	x6, 52000 <FFC_MIN_SAFE_OF_BASE_U64+0xd0>
   124a8:	9104c0c6 	add	x6, x6, #0x130
   124ac:	dac01062 	clz	x2, x3
   124b0:	aa0503fe 	mov	x30, x5
   124b4:	110ab092 	add	w18, w4, #0x2ac
   124b8:	9ac22063 	lsl	x3, x3, x2
   124bc:	f872d8c0 	ldr	x0, [x6, w18, sxtw #3]
   124c0:	9b037c12 	mul	x18, x0, x3
   124c4:	9bc37c00 	umulh	x0, x0, x3
   124c8:	2a2003e5 	mvn	w5, w0
   124cc:	f24020bf 	tst	x5, #0x1ff
   124d0:	540000c1 	b.ne	124e8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d8>  // b.any
   124d4:	110ab484 	add	w4, w4, #0x2ad
   124d8:	f864d8c4 	ldr	x4, [x6, w4, sxtw #3]
   124dc:	9bc37c83 	umulh	x3, x4, x3
   124e0:	ab120072 	adds	x18, x3, x18
   124e4:	9a803400 	cinc	x0, x0, cs	// cs = hs, nlast
   124e8:	528a4d46 	mov	w6, #0x526a                	// #21098
   124ec:	d37ffc05 	lsr	x5, x0, #63
   124f0:	72a00066 	movk	w6, #0x3, lsl #16
   124f4:	4b0200a2 	sub	w2, w5, w2
   124f8:	910024a4 	add	x4, x5, #0x9
   124fc:	1b067e06 	mul	w6, w16, w6
   12500:	9ac42403 	lsr	x3, x0, x4
   12504:	0b864042 	add	w2, w2, w6, asr #16
   12508:	1100fc42 	add	w2, w2, #0x3f
   1250c:	310ffc5f 	cmn	w2, #0x3ff
   12510:	5400054c 	b.gt	125b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x8a8>
   12514:	3110f45f 	cmn	w2, #0x43d
   12518:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   1251c:	54000c82 	b.cs	126ac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x99c>  // b.hs, b.nlast
   12520:	aa1f03e0 	mov	x0, xzr
   12524:	2a1f03f2 	mov	w18, wzr
   12528:	aa1e03e5 	mov	x5, x30
   1252c:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   12530:	eb1f011f 	cmp	x8, xzr
   12534:	54fffae0 	b.eq	12490 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   12538:	1400006a 	b	126e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>
   1253c:	9e630301 	ucvtf	d1, x24
   12540:	90000208 	adrp	x8, 52000 <FFC_MIN_SAFE_OF_BASE_U64+0xd0>
   12544:	91012108 	add	x8, x8, #0x48
   12548:	b7f80a10 	tbnz	x16, #63, 12688 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x978>
   1254c:	fc707902 	ldr	d2, [x8, x16, lsl #3]
   12550:	1e610841 	fmul	d1, d2, d1
   12554:	14000050 	b	12694 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x984>
   12558:	9ac22002 	lsl	x2, x0, x2
   1255c:	92400403 	and	x3, x0, #0x3
   12560:	eb11005f 	cmp	x2, x17
   12564:	fa410860 	ccmp	x3, #0x1, #0x0, eq	// eq = none
   12568:	fa420902 	ccmp	x8, #0x2, #0x2, eq	// eq = none
   1256c:	91001208 	add	x8, x16, #0x4
   12570:	fa5c3902 	ccmp	x8, #0x1c, #0x2, cc	// cc = lo, ul, last
   12574:	927ed408 	and	x8, x0, #0xfffffffffffffc
   12578:	9a803108 	csel	x8, x8, x0, cc	// cc = lo, ul, last
   1257c:	92400111 	and	x17, x8, #0x1
   12580:	8b080228 	add	x8, x17, x8
   12584:	52807ff1 	mov	w17, #0x3ff                 	// #1023
   12588:	d376fd00 	lsr	x0, x8, #54
   1258c:	d341fd08 	lsr	x8, x8, #1
   12590:	f100001f 	cmp	x0, #0x0
   12594:	924bf908 	and	x8, x8, #0xffefffffffffffff
   12598:	1a910631 	cinc	w17, w17, ne	// ne = any
   1259c:	0b120231 	add	w17, w17, w18
   125a0:	5280fff2 	mov	w18, #0x7ff                 	// #2047
   125a4:	711ffe3f 	cmp	w17, #0x7ff
   125a8:	1a923231 	csel	w17, w17, w18, cc	// cc = lo, ul, last
   125ac:	fa403800 	ccmp	x0, #0x0, #0x0, cc	// cc = lo, ul, last
   125b0:	9a9f0108 	csel	x8, x8, xzr, eq	// eq = none
   125b4:	17ffffaa 	b	1245c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   125b8:	9ac42064 	lsl	x4, x3, x4
   125bc:	92400465 	and	x5, x3, #0x3
   125c0:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   125c4:	eb00009f 	cmp	x4, x0
   125c8:	fa4108a0 	ccmp	x5, #0x1, #0x0, eq	// eq = none
   125cc:	aa1e03e5 	mov	x5, x30
   125d0:	fa420a42 	ccmp	x18, #0x2, #0x2, eq	// eq = none
   125d4:	91001212 	add	x18, x16, #0x4
   125d8:	fa5c3a42 	ccmp	x18, #0x1c, #0x2, cc	// cc = lo, ul, last
   125dc:	927ed472 	and	x18, x3, #0xfffffffffffffc
   125e0:	9a833252 	csel	x18, x18, x3, cc	// cc = lo, ul, last
   125e4:	92400240 	and	x0, x18, #0x1
   125e8:	8b120000 	add	x0, x0, x18
   125ec:	52807ff2 	mov	w18, #0x3ff                 	// #1023
   125f0:	d376fc03 	lsr	x3, x0, #54
   125f4:	d341fc00 	lsr	x0, x0, #1
   125f8:	f100007f 	cmp	x3, #0x0
   125fc:	924bf800 	and	x0, x0, #0xffefffffffffffff
   12600:	1a920652 	cinc	w18, w18, ne	// ne = any
   12604:	0b020252 	add	w18, w18, w2
   12608:	5280ffe2 	mov	w2, #0x7ff                 	// #2047
   1260c:	711ffe5f 	cmp	w18, #0x7ff
   12610:	1a823252 	csel	w18, w18, w2, cc	// cc = lo, ul, last
   12614:	fa403860 	ccmp	x3, #0x0, #0x0, cc	// cc = lo, ul, last
   12618:	9a9f0000 	csel	x0, x0, xzr, eq	// eq = none
   1261c:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   12620:	eb00011f 	cmp	x8, x0
   12624:	54fff360 	b.eq	12490 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   12628:	1400002e 	b	126e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9d0>
   1262c:	12807fa8 	mov	w8, #0xfffffc02            	// #-1022
   12630:	4b120108 	sub	w8, w8, w18
   12634:	9ac82408 	lsr	x8, x0, x8
   12638:	92400111 	and	x17, x8, #0x1
   1263c:	8b080231 	add	x17, x17, x8
   12640:	d341fe28 	lsr	x8, x17, #1
   12644:	d375fe31 	lsr	x17, x17, #53
   12648:	f100023f 	cmp	x17, #0x0
   1264c:	1a9f07f1 	cset	w17, ne	// ne = any
   12650:	17ffff83 	b	1245c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x74c>
   12654:	9b1b7e12 	mul	x18, x16, x27
   12658:	9b1a7f0e 	mul	x14, x24, x26
   1265c:	8b502250 	add	x16, x18, x16, lsr #8
   12660:	92001e12 	and	x18, x16, #0xff000000ff
   12664:	d350fe10 	lsr	x16, x16, #16
   12668:	9b077e52 	mul	x18, x18, x7
   1266c:	92001e10 	and	x16, x16, #0xff000000ff
   12670:	9b194a10 	madd	x16, x16, x25, x18
   12674:	8b5081d8 	add	x24, x14, x16, lsr #32
   12678:	cb0d010e 	sub	x14, x8, x13
   1267c:	f10021df 	cmp	x14, #0x8
   12680:	54ffd1cb 	b.lt	120b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>  // b.tstop
   12684:	17fffed6 	b	121dc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4cc>
   12688:	cb100d08 	sub	x8, x8, x16, lsl #3
   1268c:	fd400102 	ldr	d2, [x8]
   12690:	1e621821 	fdiv	d1, d1, d2
   12694:	1e614022 	fneg	d2, d1
   12698:	7100b79f 	cmp	w28, #0x2d
   1269c:	aa1f03e8 	mov	x8, xzr
   126a0:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   126a4:	b500135f 	cbnz	xzr, 1290c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   126a8:	17fffdbe 	b	11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   126ac:	12807fb2 	mov	w18, #0xfffffc02            	// #-1022
   126b0:	aa1e03e5 	mov	x5, x30
   126b4:	4b020252 	sub	w18, w18, w2
   126b8:	9ad22472 	lsr	x18, x3, x18
   126bc:	92400240 	and	x0, x18, #0x1
   126c0:	8b120012 	add	x18, x0, x18
   126c4:	d341fe40 	lsr	x0, x18, #1
   126c8:	d375fe52 	lsr	x18, x18, #53
   126cc:	f100025f 	cmp	x18, #0x0
   126d0:	1a9f07f2 	cset	w18, ne	// ne = any
   126d4:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   126d8:	eb00011f 	cmp	x8, x0
   126dc:	54ffeda0 	b.eq	12490 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x780>  // b.none
   126e0:	531f7a00 	lsl	w0, w16, #1
   126e4:	90000202 	adrp	x2, 52000 <FFC_MIN_SAFE_OF_BASE_U64+0xd0>
   126e8:	9104c042 	add	x2, x2, #0x130
   126ec:	dac01311 	clz	x17, x24
   126f0:	110ab008 	add	w8, w0, #0x2ac
   126f4:	9ad12312 	lsl	x18, x24, x17
   126f8:	f868d842 	ldr	x2, [x2, w8, sxtw #3]
   126fc:	9bd27c48 	umulh	x8, x2, x18
   12700:	2a2803e3 	mvn	w3, w8
   12704:	f240207f 	tst	x3, #0x1ff
   12708:	54000121 	b.ne	1272c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa1c>  // b.any
   1270c:	110ab400 	add	w0, w0, #0x2ad
   12710:	90000203 	adrp	x3, 52000 <FFC_MIN_SAFE_OF_BASE_U64+0xd0>
   12714:	9104c063 	add	x3, x3, #0x130
   12718:	9b127c42 	mul	x2, x2, x18
   1271c:	f860d860 	ldr	x0, [x3, w0, sxtw #3]
   12720:	9bd27c12 	umulh	x18, x0, x18
   12724:	ab02025f 	cmn	x18, x2
   12728:	9a883508 	cinc	x8, x8, cs	// cs = hs, nlast
   1272c:	528a4d40 	mov	w0, #0x526a                	// #21098
   12730:	d37ffd12 	lsr	x18, x8, #63
   12734:	72a00060 	movk	w0, #0x3, lsl #16
   12738:	52000252 	eor	w18, w18, #0x1
   1273c:	1b007e00 	mul	w0, w16, w0
   12740:	9ad22108 	lsl	x8, x8, x18
   12744:	13107c00 	asr	w0, w0, #16
   12748:	4b110011 	sub	w17, w0, w17
   1274c:	4b120231 	sub	w17, w17, w18
   12750:	128f7972 	mov	w18, #0xffff8434            	// #-31692
   12754:	2b120222 	adds	w2, w17, w18
   12758:	540004a5 	b.pl	127ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xadc>  // b.nfrst
   1275c:	390083e9 	strb	w9, [sp, #32]
   12760:	52800029 	mov	w9, #0x1                   	// #1
   12764:	f9000fed 	str	x13, [sp, #24]
   12768:	910023ed 	add	x13, sp, #0x8
   1276c:	910023e0 	add	x0, sp, #0x8
   12770:	52800023 	mov	w3, #0x1                   	// #1
   12774:	2a0103f9 	mov	w25, w1
   12778:	aa0803e1 	mov	x1, x8
   1277c:	1e604009 	fmov	d9, d0
   12780:	aa0703fa 	mov	x26, x7
   12784:	aa0503f5 	mov	x21, x5
   12788:	a900e3f0 	stp	x16, x24, [sp, #8]
   1278c:	390087e9 	strb	w9, [sp, #33]
   12790:	b94003e9 	ldr	w9, [sp]
   12794:	39008bef 	strb	w15, [sp, #34]
   12798:	a902afea 	stp	x10, x11, [sp, #40]
   1279c:	a903bbec 	stp	x12, x14, [sp, #56]
   127a0:	f90027ff 	str	xzr, [sp, #72]
   127a4:	b801b1a9 	stur	w9, [x13, #27]
   127a8:	394013e9 	ldrb	w9, [sp, #4]
   127ac:	3801f1a9 	sturb	w9, [x13, #31]
   127b0:	94000fec 	bl	16760 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   127b4:	aa1503e5 	mov	x5, x21
   127b8:	b202d7f5 	mov	x21, #0xcfcfcfcfcfcfcfcf    	// #-3472328296227680305
   127bc:	aa1a03e7 	mov	x7, x26
   127c0:	529c201a 	mov	w26, #0xe100                	// #57600
   127c4:	1e604120 	fmov	d0, d9
   127c8:	aa0103e2 	mov	x2, x1
   127cc:	2a1903e1 	mov	w1, w25
   127d0:	d2800039 	mov	x25, #0x1                   	// #1
   127d4:	d2fffe1e 	mov	x30, #0xfff0000000000000    	// #-4503599627370496
   127d8:	d2effe06 	mov	x6, #0x7ff0000000000000    	// #9218868437227405312
   127dc:	aa0003e8 	mov	x8, x0
   127e0:	f299fa15 	movk	x21, #0xcfd0
   127e4:	72a0beba 	movk	w26, #0x5f5, lsl #16
   127e8:	f2c4e219 	movk	x25, #0x2710, lsl #32
   127ec:	7100b79f 	cmp	w28, #0x2d
   127f0:	1a9f17e9 	cset	w9, eq	// eq = none
   127f4:	f100031f 	cmp	x24, #0x0
   127f8:	d3410129 	lsl	x9, x9, #63
   127fc:	7a401840 	ccmp	w2, #0x0, #0x0, ne	// ne = any
   12800:	aa02d129 	orr	x9, x9, x2, lsl #52
   12804:	fa400900 	ccmp	x8, #0x0, #0x0, eq	// eq = none
   12808:	aa080129 	orr	x9, x9, x8
   1280c:	5280ffe8 	mov	w8, #0x7ff                 	// #2047
   12810:	9e670121 	fmov	d1, x9
   12814:	7a481044 	ccmp	w2, w8, #0x4, ne	// ne = any
   12818:	52800048 	mov	w8, #0x2                   	// #2
   1281c:	9a9f0108 	csel	x8, x8, xzr, eq	// eq = none
   12820:	b5000768 	cbnz	x8, 1290c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   12824:	17fffd5f 	b	11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   12828:	aa0e03ed 	mov	x13, x14
   1282c:	cb0e0190 	sub	x16, x12, x14
   12830:	cb0c01ce 	sub	x14, x14, x12
   12834:	aa0d03f2 	mov	x18, x13
   12838:	cb100160 	sub	x0, x11, x16
   1283c:	b5ffb7e0 	cbnz	x0, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   12840:	14000015 	b	12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   12844:	aa0e03ed 	mov	x13, x14
   12848:	cb0d0190 	sub	x16, x12, x13
   1284c:	cb0c01ae 	sub	x14, x13, x12
   12850:	aa0d03f2 	mov	x18, x13
   12854:	cb100160 	sub	x0, x11, x16
   12858:	b5ffb700 	cbnz	x0, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   1285c:	1400000e 	b	12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb84>
   12860:	aa0b03f8 	mov	x24, x11
   12864:	17fffdac 	b	11f14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x204>
   12868:	aa0b03f8 	mov	x24, x11
   1286c:	cb0a01eb 	sub	x11, x15, x10
   12870:	eb0801ff 	cmp	x15, x8
   12874:	54ffbc61 	b.ne	12000 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2f0>  // b.any
   12878:	aa1f03ee 	mov	x14, xzr
   1287c:	aa1f03f0 	mov	x16, xzr
   12880:	aa1f03ec 	mov	x12, xzr
   12884:	aa1f03f2 	mov	x18, xzr
   12888:	aa0803ed 	mov	x13, x8
   1288c:	aa0b03e0 	mov	x0, x11
   12890:	b5ffb54b 	cbnz	x11, 11f38 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x228>
   12894:	7100b79f 	cmp	w28, #0x2d
   12898:	54000041 	b.ne	128a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb90>  // b.any
   1289c:	91000631 	add	x17, x17, #0x1
   128a0:	cb110108 	sub	x8, x8, x17
   128a4:	f1000d1f 	cmp	x8, #0x3
   128a8:	540002cb 	b.lt	12900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>  // b.tstop
   128ac:	39400a28 	ldrb	w8, [x17, #2]
   128b0:	79400229 	ldrh	w9, [x17]
   128b4:	aa084128 	orr	x8, x9, x8, lsl #16
   128b8:	b203c108 	orr	x8, x8, #0x2020202020202020
   128bc:	eb05011f 	cmp	x8, x5
   128c0:	540002a0 	b.eq	12914 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc04>  // b.none
   128c4:	b203c3e9 	mov	x9, #0x2020202020202020    	// #2314885530818453536
   128c8:	f28c2dc9 	movk	x9, #0x616e
   128cc:	f2a40dc9 	movk	x9, #0x206e, lsl #16
   128d0:	eb09011f 	cmp	x8, x9
   128d4:	54000161 	b.ne	12900 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbf0>  // b.any
   128d8:	d2efff09 	mov	x9, #0x7ff8000000000000    	// #9221120237041090560
   128dc:	7100b79f 	cmp	w28, #0x2d
   128e0:	aa1f03e8 	mov	x8, xzr
   128e4:	9e670121 	fmov	d1, x9
   128e8:	d2ffff09 	mov	x9, #0xfff8000000000000    	// #-2251799813685248
   128ec:	9e670122 	fmov	d2, x9
   128f0:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   128f4:	b50000df 	cbnz	xzr, 1290c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   128f8:	17fffd2a 	b	11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   128fc:	d503201f 	nop
   12900:	2f00e401 	movi	d1, #0x0
   12904:	52800028 	mov	w8, #0x1                   	// #1
   12908:	b4ffa4c8 	cbz	x8, 11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   1290c:	3707a4a1 	tbnz	w1, #0, 11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   12910:	14000012 	b	12958 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc48>
   12914:	9e6700c1 	fmov	d1, x6
   12918:	7100b79f 	cmp	w28, #0x2d
   1291c:	aa1f03e8 	mov	x8, xzr
   12920:	9e6703c2 	fmov	d2, x30
   12924:	1e610c41 	fcsel	d1, d2, d1, eq	// eq = none
   12928:	b5ffff3f 	cbnz	xzr, 1290c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbfc>
   1292c:	17fffd1d 	b	11da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x90>
   12930:	2f00e400 	movi	d0, #0x0
   12934:	6d4523e9 	ldp	d9, d8, [sp, #80]
   12938:	a94b4ff4 	ldp	x20, x19, [sp, #176]
   1293c:	a94a57f6 	ldp	x22, x21, [sp, #160]
   12940:	a9495ff8 	ldp	x24, x23, [sp, #144]
   12944:	a94867fa 	ldp	x26, x25, [sp, #128]
   12948:	a9476ffc 	ldp	x28, x27, [sp, #112]
   1294c:	a9467bfd 	ldp	x29, x30, [sp, #96]
   12950:	910303ff 	add	sp, sp, #0xc0
   12954:	d65f03c0 	ret
   12958:	52800200 	mov	w0, #0x10                  	// #16
   1295c:	97ffcd7d 	bl	5f50 <__cxa_allocate_exception@plt>
   12960:	aa0003f3 	mov	x19, x0
   12964:	f00001c1 	adrp	x1, 4d000 <_IO_stdin_used+0x220>
   12968:	91037821 	add	x1, x1, #0xde
   1296c:	97ffcd5d 	bl	5ee0 <std::runtime_error::runtime_error(char const*)@plt>
   12970:	b0000361 	adrp	x1, 7f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
   12974:	b0000362 	adrp	x2, 7f000 <vtable for __cxxabiv1::__si_class_type_info@CXXABI_1.3>
   12978:	aa1303e0 	mov	x0, x19
   1297c:	f947ec21 	ldr	x1, [x1, #4056]
   12980:	f947b442 	ldr	x2, [x2, #3944]
   12984:	97ffce7b 	bl	6370 <__cxa_throw@plt>
   12988:	aa0003f4 	mov	x20, x0
   1298c:	aa1303e0 	mov	x0, x19
   12990:	97ffcdb4 	bl	6060 <__cxa_free_exception@plt>
   12994:	aa1403e0 	mov	x0, x20
   12998:	97ffce7a 	bl	6380 <_Unwind_Resume@plt>
   1299c:	d503201f 	nop

