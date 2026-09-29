0000000000013fe0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   13fe0:	55                   	push   %rbp
   13fe1:	41 57                	push   %r15
   13fe3:	41 56                	push   %r14
   13fe5:	41 55                	push   %r13
   13fe7:	41 54                	push   %r12
   13fe9:	53                   	push   %rbx
   13fea:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   13ff1:	4c 8b 37             	mov    (%rdi),%r14
   13ff4:	4c 8b 7f 08          	mov    0x8(%rdi),%r15
   13ff8:	4d 39 fe             	cmp    %r15,%r14
   13ffb:	0f 84 4d 0c 00 00    	je     14c4e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc6e>
   14001:	89 f3                	mov    %esi,%ebx
   14003:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   14007:	c5 fb 12 1d 01 f3 03 	vmovddup 0x3f301(%rip),%xmm3        # 53310 <_IO_stdin_used+0x310>
   1400e:	00 
   1400f:	89 74 24 48          	mov    %esi,0x48(%rsp)
   14013:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
   14018:	eb 17                	jmp    14031 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x51>
   1401a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   14020:	c5 fb 5f c2          	vmaxsd %xmm2,%xmm0,%xmm0
   14024:	49 83 c6 20          	add    $0x20,%r14
   14028:	4d 39 fe             	cmp    %r15,%r14
   1402b:	0f 84 21 0c 00 00    	je     14c52 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc72>
   14031:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   14035:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   14039:	ba 01 00 00 00       	mov    $0x1,%edx
   1403e:	48 85 c9             	test   %rcx,%rcx
   14041:	0f 84 c9 0a 00 00    	je     14b10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   14047:	49 8b 36             	mov    (%r14),%rsi
   1404a:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
   1404e:	44 0f b6 26          	movzbl (%rsi),%r12d
   14052:	48 89 f7             	mov    %rsi,%rdi
   14055:	45 89 e0             	mov    %r12d,%r8d
   14058:	41 80 fc 2d          	cmp    $0x2d,%r12b
   1405c:	41 0f 94 c3          	sete   %r11b
   14060:	75 2e                	jne    14090 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb0>
   14062:	48 83 f9 01          	cmp    $0x1,%rcx
   14066:	0f 84 26 0a 00 00    	je     14a92 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab2>
   1406c:	44 0f be 46 01       	movsbl 0x1(%rsi),%r8d
   14071:	41 83 f8 2e          	cmp    $0x2e,%r8d
   14075:	74 0d                	je     14084 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   14077:	41 8d 50 d0          	lea    -0x30(%r8),%edx
   1407b:	83 fa 09             	cmp    $0x9,%edx
   1407e:	0f 87 0e 0a 00 00    	ja     14a92 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab2>
   14084:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
   14088:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1408f:	00 
   14090:	48 39 c7             	cmp    %rax,%rdi
   14093:	44 88 5c 24 4f       	mov    %r11b,0x4f(%rsp)
   14098:	0f 84 0a 01 00 00    	je     141a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1c8>
   1409e:	41 0f be d0          	movsbl %r8b,%edx
   140a2:	83 c2 d0             	add    $0xffffffd0,%edx
   140a5:	83 fa 09             	cmp    $0x9,%edx
   140a8:	0f 87 1a 01 00 00    	ja     141c8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1e8>
   140ae:	48 8d 57 01          	lea    0x1(%rdi),%rdx
   140b2:	49 0f be e8          	movsbq %r8b,%rbp
   140b6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   140ba:	48 39 c2             	cmp    %rax,%rdx
   140bd:	0f 84 e7 00 00 00    	je     141aa <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   140c3:	44 0f be 02          	movsbl (%rdx),%r8d
   140c7:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   140cb:	41 83 f9 09          	cmp    $0x9,%r9d
   140cf:	0f 87 f8 00 00 00    	ja     141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   140d5:	4d 63 c0             	movslq %r8d,%r8
   140d8:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   140dd:	48 8d 57 02          	lea    0x2(%rdi),%rdx
   140e1:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   140e6:	48 39 c2             	cmp    %rax,%rdx
   140e9:	0f 84 bb 00 00 00    	je     141aa <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   140ef:	44 0f be 02          	movsbl (%rdx),%r8d
   140f3:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   140f7:	41 83 f9 09          	cmp    $0x9,%r9d
   140fb:	0f 87 cc 00 00 00    	ja     141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   14101:	4d 63 c0             	movslq %r8d,%r8
   14104:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   14109:	48 8d 57 03          	lea    0x3(%rdi),%rdx
   1410d:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   14112:	48 39 c2             	cmp    %rax,%rdx
   14115:	0f 84 8f 00 00 00    	je     141aa <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   1411b:	44 0f be 02          	movsbl (%rdx),%r8d
   1411f:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   14123:	41 83 f9 09          	cmp    $0x9,%r9d
   14127:	0f 87 a0 00 00 00    	ja     141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   1412d:	4d 63 c0             	movslq %r8d,%r8
   14130:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   14135:	48 8d 57 04          	lea    0x4(%rdi),%rdx
   14139:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   1413e:	48 39 c2             	cmp    %rax,%rdx
   14141:	74 67                	je     141aa <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   14143:	44 0f be 02          	movsbl (%rdx),%r8d
   14147:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   1414b:	41 83 f9 09          	cmp    $0x9,%r9d
   1414f:	77 7c                	ja     141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   14151:	4d 63 c0             	movslq %r8d,%r8
   14154:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   14159:	48 8d 57 05          	lea    0x5(%rdi),%rdx
   1415d:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   14162:	48 39 c2             	cmp    %rax,%rdx
   14165:	74 43                	je     141aa <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   14167:	4c 8d 04 0e          	lea    (%rsi,%rcx,1),%r8
   1416b:	49 29 f8             	sub    %rdi,%r8
   1416e:	49 01 f8             	add    %rdi,%r8
   14171:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   14178:	0f 1f 84 00 00 00 00 
   1417f:	00 
   14180:	44 0f be 0a          	movsbl (%rdx),%r9d
   14184:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   14188:	41 83 fa 09          	cmp    $0x9,%r10d
   1418c:	77 3f                	ja     141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   1418e:	4d 63 c9             	movslq %r9d,%r9
   14191:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   14196:	4b 8d 6c 51 d0       	lea    -0x30(%r9,%r10,2),%rbp
   1419b:	48 ff c2             	inc    %rdx
   1419e:	48 39 c2             	cmp    %rax,%rdx
   141a1:	75 dd                	jne    14180 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1a0>
   141a3:	4c 89 c2             	mov    %r8,%rdx
   141a6:	eb 25                	jmp    141cd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   141a8:	31 ed                	xor    %ebp,%ebp
   141aa:	49 89 c0             	mov    %rax,%r8
   141ad:	49 29 f8             	sub    %rdi,%r8
   141b0:	48 89 c2             	mov    %rax,%rdx
   141b3:	49 89 c3             	mov    %rax,%r11
   141b6:	45 31 c9             	xor    %r9d,%r9d
   141b9:	4c 89 4c 24 60       	mov    %r9,0x60(%rsp)
   141be:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   141c3:	e9 a9 01 00 00       	jmp    14371 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x391>
   141c8:	31 ed                	xor    %ebp,%ebp
   141ca:	48 89 fa             	mov    %rdi,%rdx
   141cd:	49 89 d0             	mov    %rdx,%r8
   141d0:	49 29 f8             	sub    %rdi,%r8
   141d3:	48 39 c2             	cmp    %rax,%rdx
   141d6:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   141db:	0f 84 80 01 00 00    	je     14361 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x381>
   141e1:	80 3a 2e             	cmpb   $0x2e,(%rdx)
   141e4:	0f 85 7c 01 00 00    	jne    14366 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x386>
   141ea:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
   141ee:	49 89 c0             	mov    %rax,%r8
   141f1:	4d 29 d8             	sub    %r11,%r8
   141f4:	49 83 f8 08          	cmp    $0x8,%r8
   141f8:	4d 89 d9             	mov    %r11,%r9
   141fb:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   14200:	0f 8c 9b 00 00 00    	jl     142a1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2c1>
   14206:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1420d:	00 00 00 
   14210:	4d 8b 0b             	mov    (%r11),%r9
   14213:	49 ba 46 46 46 46 46 	movabs $0x4646464646464646,%r10
   1421a:	46 46 46 
   1421d:	4d 01 ca             	add    %r9,%r10
   14220:	48 bb d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rbx
   14227:	cf cf cf 
   1422a:	49 01 d9             	add    %rbx,%r9
   1422d:	4d 09 ca             	or     %r9,%r10
   14230:	48 bb 80 80 80 80 80 	movabs $0x8080808080808080,%rbx
   14237:	80 80 80 
   1423a:	49 85 da             	test   %rbx,%r10
   1423d:	75 62                	jne    142a1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2c1>
   1423f:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
   14246:	4b 8d 1c 89          	lea    (%r9,%r9,4),%rbx
   1424a:	49 c1 e9 08          	shr    $0x8,%r9
   1424e:	49 8d 2c 59          	lea    (%r9,%rbx,2),%rbp
   14252:	49 89 e9             	mov    %rbp,%r9
   14255:	48 bb ff 00 00 00 ff 	movabs $0xff000000ff,%rbx
   1425c:	00 00 00 
   1425f:	49 21 d9             	and    %rbx,%r9
   14262:	49 bd 64 00 00 00 40 	movabs $0xf424000000064,%r13
   14269:	42 0f 00 
   1426c:	4d 0f af cd          	imul   %r13,%r9
   14270:	48 c1 ed 10          	shr    $0x10,%rbp
   14274:	48 21 dd             	and    %rbx,%rbp
   14277:	48 bb 01 00 00 00 10 	movabs $0x271000000001,%rbx
   1427e:	27 00 00 
   14281:	48 0f af eb          	imul   %rbx,%rbp
   14285:	4c 01 cd             	add    %r9,%rbp
   14288:	48 c1 ed 20          	shr    $0x20,%rbp
   1428c:	4c 01 d5             	add    %r10,%rbp
   1428f:	49 83 c3 08          	add    $0x8,%r11
   14293:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
   14297:	49 83 f8 07          	cmp    $0x7,%r8
   1429b:	0f 8f 6f ff ff ff    	jg     14210 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x230>
   142a1:	49 83 f8 04          	cmp    $0x4,%r8
   142a5:	7c 21                	jl     142c8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e8>
   142a7:	45 8b 03             	mov    (%r11),%r8d
   142aa:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
   142b1:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
   142b8:	45 09 c1             	or     %r8d,%r9d
   142bb:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
   142c2:	0f 84 5f 07 00 00    	je     14a27 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa47>
   142c8:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   142cc:	49 39 c3             	cmp    %rax,%r11
   142cf:	0f 84 8a 07 00 00    	je     14a5f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   142d5:	45 0f be 0b          	movsbl (%r11),%r9d
   142d9:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
   142dd:	41 83 f8 09          	cmp    $0x9,%r8d
   142e1:	0f 87 7b 07 00 00    	ja     14a62 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   142e7:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   142ec:	4d 8d 43 01          	lea    0x1(%r11),%r8
   142f0:	41 80 c1 d0          	add    $0xd0,%r9b
   142f4:	45 0f b6 c9          	movzbl %r9b,%r9d
   142f8:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   142fc:	49 39 c0             	cmp    %rax,%r8
   142ff:	0f 84 5a 07 00 00    	je     14a5f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   14305:	45 0f be 08          	movsbl (%r8),%r9d
   14309:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   1430d:	41 83 fa 09          	cmp    $0x9,%r10d
   14311:	0f 87 ea 08 00 00    	ja     14c01 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc21>
   14317:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   1431c:	4d 8d 43 02          	lea    0x2(%r11),%r8
   14320:	41 80 c1 d0          	add    $0xd0,%r9b
   14324:	45 0f b6 c9          	movzbl %r9b,%r9d
   14328:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   1432c:	49 39 c0             	cmp    %rax,%r8
   1432f:	0f 84 2a 07 00 00    	je     14a5f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   14335:	45 0f be 08          	movsbl (%r8),%r9d
   14339:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   1433d:	41 83 fa 09          	cmp    $0x9,%r10d
   14341:	0f 87 ba 08 00 00    	ja     14c01 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc21>
   14347:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
   1434c:	49 83 c3 03          	add    $0x3,%r11
   14350:	41 80 c1 d0          	add    $0xd0,%r9b
   14354:	45 0f b6 c9          	movzbl %r9b,%r9d
   14358:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
   1435c:	e9 01 07 00 00       	jmp    14a62 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   14361:	49 89 c3             	mov    %rax,%r11
   14364:	eb 03                	jmp    14369 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x389>
   14366:	49 89 d3             	mov    %rdx,%r11
   14369:	45 31 c9             	xor    %r9d,%r9d
   1436c:	4c 89 4c 24 60       	mov    %r9,0x60(%rsp)
   14371:	45 31 c9             	xor    %r9d,%r9d
   14374:	45 31 d2             	xor    %r10d,%r10d
   14377:	4c 89 54 24 58       	mov    %r10,0x58(%rsp)
   1437c:	45 31 d2             	xor    %r10d,%r10d
   1437f:	4d 85 c0             	test   %r8,%r8
   14382:	0f 84 04 07 00 00    	je     14a8c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xaac>
   14388:	49 39 c3             	cmp    %rax,%r11
   1438b:	0f 84 98 00 00 00    	je     14429 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x449>
   14391:	41 0f b6 1b          	movzbl (%r11),%ebx
   14395:	83 cb 20             	or     $0x20,%ebx
   14398:	83 fb 65             	cmp    $0x65,%ebx
   1439b:	0f 85 8b 00 00 00    	jne    1442c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   143a1:	49 8d 5b 01          	lea    0x1(%r11),%rbx
   143a5:	48 39 c3             	cmp    %rax,%rbx
   143a8:	0f 84 7e 00 00 00    	je     1442c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   143ae:	45 0f b6 6b 01       	movzbl 0x1(%r11),%r13d
   143b3:	4d 8d 7b 02          	lea    0x2(%r11),%r15
   143b7:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
   143bc:	41 83 c5 d5          	add    $0xffffffd5,%r13d
   143c0:	41 f6 c5 fd          	test   $0xfd,%r13b
   143c4:	49 0f 44 df          	cmove  %r15,%rbx
   143c8:	48 39 c3             	cmp    %rax,%rbx
   143cb:	0f 84 fd 00 00 00    	je     144ce <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4ee>
   143d1:	44 0f be 3b          	movsbl (%rbx),%r15d
   143d5:	41 83 c7 d0          	add    $0xffffffd0,%r15d
   143d9:	41 83 ff 09          	cmp    $0x9,%r15d
   143dd:	0f 87 eb 00 00 00    	ja     144ce <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4ee>
   143e3:	48 01 ce             	add    %rcx,%rsi
   143e6:	31 c9                	xor    %ecx,%ecx
   143e8:	eb 12                	jmp    143fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x41c>
   143ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   143f0:	48 ff c3             	inc    %rbx
   143f3:	48 39 c3             	cmp    %rax,%rbx
   143f6:	0f 84 29 07 00 00    	je     14b25 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb45>
   143fc:	44 0f be 1b          	movsbl (%rbx),%r11d
   14400:	45 8d 7b d0          	lea    -0x30(%r11),%r15d
   14404:	41 83 ff 09          	cmp    $0x9,%r15d
   14408:	0f 87 1a 07 00 00    	ja     14b28 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb48>
   1440e:	48 81 f9 ff ff ff 0f 	cmp    $0xfffffff,%rcx
   14415:	7f d9                	jg     143f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x410>
   14417:	41 80 c3 d0          	add    $0xd0,%r11b
   1441b:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   1441f:	45 0f b6 db          	movzbl %r11b,%r11d
   14423:	49 8d 0c 4b          	lea    (%r11,%rcx,2),%rcx
   14427:	eb c7                	jmp    143f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x410>
   14429:	49 89 c3             	mov    %rax,%r11
   1442c:	31 f6                	xor    %esi,%esi
   1442e:	b3 01                	mov    $0x1,%bl
   14430:	31 c9                	xor    %ecx,%ecx
   14432:	49 83 f8 14          	cmp    $0x14,%r8
   14436:	0f 8c ef 00 00 00    	jl     1452b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   1443c:	48 39 c7             	cmp    %rax,%rdi
   1443f:	74 46                	je     14487 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a7>
   14441:	48 89 f9             	mov    %rdi,%rcx
   14444:	eb 20                	jmp    14466 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x486>
   14446:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1444d:	00 00 00 
   14450:	45 31 ff             	xor    %r15d,%r15d
   14453:	41 80 fd 30          	cmp    $0x30,%r13b
   14457:	41 0f 94 c7          	sete   %r15b
   1445b:	4d 29 f8             	sub    %r15,%r8
   1445e:	48 ff c1             	inc    %rcx
   14461:	48 39 c1             	cmp    %rax,%rcx
   14464:	74 10                	je     14476 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x496>
   14466:	44 0f b6 29          	movzbl (%rcx),%r13d
   1446a:	41 83 fd 30          	cmp    $0x30,%r13d
   1446e:	74 e0                	je     14450 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x470>
   14470:	41 83 fd 2e          	cmp    $0x2e,%r13d
   14474:	74 da                	je     14450 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x470>
   14476:	31 c9                	xor    %ecx,%ecx
   14478:	49 83 f8 14          	cmp    $0x14,%r8
   1447c:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   14481:	0f 8c a4 00 00 00    	jl     1452b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   14487:	48 39 d7             	cmp    %rdx,%rdi
   1448a:	74 59                	je     144e5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x505>
   1448c:	48 89 f8             	mov    %rdi,%rax
   1448f:	31 ed                	xor    %ebp,%ebp
   14491:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   14498:	b6 e0 0d 
   1449b:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   144a0:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
   144a5:	4c 0f be 00          	movsbq (%rax),%r8
   144a9:	49 8d 6c 48 d0       	lea    -0x30(%r8,%rcx,2),%rbp
   144ae:	48 ff c0             	inc    %rax
   144b1:	4c 39 cd             	cmp    %r9,%rbp
   144b4:	73 05                	jae    144bb <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4db>
   144b6:	48 39 d0             	cmp    %rdx,%rax
   144b9:	75 e5                	jne    144a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4c0>
   144bb:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
   144bf:	48 39 cd             	cmp    %rcx,%rbp
   144c2:	77 5a                	ja     1451e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53e>
   144c4:	48 89 d8             	mov    %rbx,%rax
   144c7:	4c 39 d3             	cmp    %r10,%rbx
   144ca:	75 34                	jne    14500 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x520>
   144cc:	eb 4d                	jmp    1451b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   144ce:	31 f6                	xor    %esi,%esi
   144d0:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   144d5:	b3 01                	mov    $0x1,%bl
   144d7:	31 c9                	xor    %ecx,%ecx
   144d9:	49 83 f8 14          	cmp    $0x14,%r8
   144dd:	0f 8d 59 ff ff ff    	jge    1443c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x45c>
   144e3:	eb 46                	jmp    1452b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   144e5:	31 ed                	xor    %ebp,%ebp
   144e7:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   144ee:	b6 e0 0d 
   144f1:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   144f6:	48 89 d8             	mov    %rbx,%rax
   144f9:	4c 39 d3             	cmp    %r10,%rbx
   144fc:	74 1d                	je     1451b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   144fe:	66 90                	xchg   %ax,%ax
   14500:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
   14505:	48 0f be 10          	movsbq (%rax),%rdx
   14509:	48 8d 6c 4a d0       	lea    -0x30(%rdx,%rcx,2),%rbp
   1450e:	48 ff c0             	inc    %rax
   14511:	4c 39 cd             	cmp    %r9,%rbp
   14514:	73 05                	jae    1451b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   14516:	4c 39 d0             	cmp    %r10,%rax
   14519:	75 e5                	jne    14500 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x520>
   1451b:	48 89 da             	mov    %rbx,%rdx
   1451e:	48 29 c2             	sub    %rax,%rdx
   14521:	48 01 f2             	add    %rsi,%rdx
   14524:	b1 01                	mov    $0x1,%cl
   14526:	31 db                	xor    %ebx,%ebx
   14528:	49 89 d1             	mov    %rdx,%r9
   1452b:	84 db                	test   %bl,%bl
   1452d:	74 44                	je     14573 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x593>
   1452f:	4d 85 c9             	test   %r9,%r9
   14532:	75 3f                	jne    14573 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x593>
   14534:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   1453b:	ff 1f 00 
   1453e:	48 ff c0             	inc    %rax
   14541:	48 39 c5             	cmp    %rax,%rbp
   14544:	0f 87 a4 00 00 00    	ja     145ee <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   1454a:	48 85 ed             	test   %rbp,%rbp
   1454d:	0f 84 2e 02 00 00    	je     14781 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a1>
   14553:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14557:	0f 94 c0             	sete   %al
   1455a:	62 f1 df 08 7b d5    	vcvtusi2sd %rbp,%xmm4,%xmm2
   14560:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   14564:	c5 fb 92 c8          	kmovd  %eax,%k1
   14568:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   1456e:	e9 23 02 00 00       	jmp    14796 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7b6>
   14573:	49 8d 41 16          	lea    0x16(%r9),%rax
   14577:	48 83 f8 2d          	cmp    $0x2d,%rax
   1457b:	0f 92 c0             	setb   %al
   1457e:	20 c3                	and    %al,%bl
   14580:	80 fb 01             	cmp    $0x1,%bl
   14583:	75 33                	jne    145b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5d8>
   14585:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   1458c:	ff 1f 00 
   1458f:	48 ff c0             	inc    %rax
   14592:	48 39 c5             	cmp    %rax,%rbp
   14595:	77 57                	ja     145ee <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   14597:	62 f1 df 08 7b cd    	vcvtusi2sd %rbp,%xmm4,%xmm1
   1459d:	4d 85 c9             	test   %r9,%r9
   145a0:	0f 88 51 04 00 00    	js     149f7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   145a6:	48 8d 05 43 30 04 00 	lea    0x43043(%rip),%rax        # 575f0 <FFC_DOUBLE_POWERS_OF_TEN>
   145ad:	c4 a1 73 59 14 c8    	vmulsd (%rax,%r9,8),%xmm1,%xmm2
   145b3:	e9 51 04 00 00       	jmp    14a09 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa29>
   145b8:	31 c0                	xor    %eax,%eax
   145ba:	48 85 ed             	test   %rbp,%rbp
   145bd:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   145c1:	0f 84 dd 03 00 00    	je     149a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9c4>
   145c7:	be 00 00 00 00       	mov    $0x0,%esi
   145cc:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   145d3:	0f 8c 6b 01 00 00    	jl     14744 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x764>
   145d9:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   145e0:	7e 0c                	jle    145ee <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   145e2:	be ff 07 00 00       	mov    $0x7ff,%esi
   145e7:	31 c0                	xor    %eax,%eax
   145e9:	e9 52 01 00 00       	jmp    14740 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x760>
   145ee:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
   145f3:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
   145f8:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
   145ff:	00 
   14600:	48 98                	cltq
   14602:	48 8d 1d d7 30 04 00 	lea    0x430d7(%rip),%rbx        # 576e0 <FFC_POWERS_OF_FIVE>
   14609:	c4 62 fb f6 04 c3    	mulx   (%rbx,%rax,8),%rax,%r8
   1460f:	45 89 c2             	mov    %r8d,%r10d
   14612:	41 f7 d2             	not    %r10d
   14615:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   1461c:	75 1b                	jne    14639 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x659>
   1461e:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   14622:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   14629:	4d 63 d2             	movslq %r10d,%r10
   1462c:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   14632:	48 01 d0             	add    %rdx,%rax
   14635:	49 83 d0 00          	adc    $0x0,%r8
   14639:	4d 89 c2             	mov    %r8,%r10
   1463c:	49 c1 ea 3f          	shr    $0x3f,%r10
   14640:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   14647:	c1 fa 10             	sar    $0x10,%edx
   1464a:	29 f2                	sub    %esi,%edx
   1464c:	42 8d 74 12 3f       	lea    0x3f(%rdx,%r10,1),%esi
   14651:	49 83 c2 09          	add    $0x9,%r10
   14655:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
   1465a:	81 fe 01 fc ff ff    	cmp    $0xfffffc01,%esi
   14660:	7f 15                	jg     14677 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x697>
   14662:	81 fe c3 fb ff ff    	cmp    $0xfffffbc3,%esi
   14668:	0f 83 a0 00 00 00    	jae    1470e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x72e>
   1466e:	31 c0                	xor    %eax,%eax
   14670:	31 f6                	xor    %esi,%esi
   14672:	e9 c4 00 00 00       	jmp    1473b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x75b>
   14677:	49 8d 59 04          	lea    0x4(%r9),%rbx
   1467b:	41 89 d7             	mov    %edx,%r15d
   1467e:	41 83 e7 03          	and    $0x3,%r15d
   14682:	49 83 f7 01          	xor    $0x1,%r15
   14686:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
   1468b:	4d 31 c2             	xor    %r8,%r10
   1468e:	49 89 d0             	mov    %rdx,%r8
   14691:	49 bd fc ff ff ff ff 	movabs $0xfffffffffffffc,%r13
   14698:	ff ff 00 
   1469b:	4d 21 e8             	and    %r13,%r8
   1469e:	4d 09 fa             	or     %r15,%r10
   146a1:	4c 0f 45 c2          	cmovne %rdx,%r8
   146a5:	48 83 f8 02          	cmp    $0x2,%rax
   146a9:	4c 0f 43 c2          	cmovae %rdx,%r8
   146ad:	48 83 fb 1c          	cmp    $0x1c,%rbx
   146b1:	4c 0f 43 c2          	cmovae %rdx,%r8
   146b5:	44 89 c2             	mov    %r8d,%edx
   146b8:	83 e2 01             	and    $0x1,%edx
   146bb:	4c 01 c2             	add    %r8,%rdx
   146be:	48 89 d0             	mov    %rdx,%rax
   146c1:	48 d1 e8             	shr    $1,%rax
   146c4:	49 b8 ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r8
   146cb:	ff ef 7f 
   146ce:	4c 21 c0             	and    %r8,%rax
   146d1:	49 b8 00 00 00 00 00 	movabs $0x40000000000000,%r8
   146d8:	00 40 00 
   146db:	4c 39 c2             	cmp    %r8,%rdx
   146de:	83 de 00             	sbb    $0x0,%esi
   146e1:	81 c6 00 04 00 00    	add    $0x400,%esi
   146e7:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   146ed:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   146f3:	49 0f 43 c2          	cmovae %r10,%rax
   146f7:	4c 39 c2             	cmp    %r8,%rdx
   146fa:	49 0f 43 c2          	cmovae %r10,%rax
   146fe:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   14704:	ba ff 07 00 00       	mov    $0x7ff,%edx
   14709:	0f 43 f2             	cmovae %edx,%esi
   1470c:	eb 2d                	jmp    1473b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x75b>
   1470e:	b8 02 fc ff ff       	mov    $0xfffffc02,%eax
   14713:	29 f0                	sub    %esi,%eax
   14715:	c4 62 fb f7 c2       	shrx   %rax,%rdx,%r8
   1471a:	48 0f a3 c2          	bt     %rax,%rdx
   1471e:	49 83 d0 00          	adc    $0x0,%r8
   14722:	4c 89 c0             	mov    %r8,%rax
   14725:	48 d1 e8             	shr    $1,%rax
   14728:	31 f6                	xor    %esi,%esi
   1472a:	48 ba ff ff ff ff ff 	movabs $0x1fffffffffffff,%rdx
   14731:	ff 1f 00 
   14734:	49 39 d0             	cmp    %rdx,%r8
   14737:	40 0f 97 c6          	seta   %sil
   1473b:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   14740:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   14744:	84 c9                	test   %cl,%cl
   14746:	0f 84 62 02 00 00    	je     149ae <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   1474c:	45 31 c0             	xor    %r8d,%r8d
   1474f:	49 89 ea             	mov    %rbp,%r10
   14752:	49 ff c2             	inc    %r10
   14755:	74 4a                	je     147a1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c1>
   14757:	ba 00 00 00 00       	mov    $0x0,%edx
   1475c:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   14763:	7c 3e                	jl     147a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c3>
   14765:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   1476c:	0f 8e a1 01 00 00    	jle    14913 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x933>
   14772:	ba ff 07 00 00       	mov    $0x7ff,%edx
   14777:	45 31 c0             	xor    %r8d,%r8d
   1477a:	4c 39 c0             	cmp    %r8,%rax
   1477d:	74 29                	je     147a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c8>
   1477f:	eb 2f                	jmp    147b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   14781:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14785:	0f 94 c0             	sete   %al
   14788:	c5 fb 92 c8          	kmovd  %eax,%k1
   1478c:	62 f1 ff 89 10 15 7a 	vmovsd 0x3eb7a(%rip),%xmm2{%k1}{z}        # 53310 <_IO_stdin_used+0x310>
   14793:	eb 03 00 
   14796:	31 d2                	xor    %edx,%edx
   14798:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   1479c:	e9 6f 03 00 00       	jmp    14b10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   147a1:	31 d2                	xor    %edx,%edx
   147a3:	4c 39 c0             	cmp    %r8,%rax
   147a6:	75 08                	jne    147b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   147a8:	39 d6                	cmp    %edx,%esi
   147aa:	0f 84 fe 01 00 00    	je     149ae <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   147b0:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
   147b5:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
   147ba:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
   147c1:	00 
   147c2:	48 98                	cltq
   147c4:	48 8d 35 15 2f 04 00 	lea    0x42f15(%rip),%rsi        # 576e0 <FFC_POWERS_OF_FIVE>
   147cb:	c4 e2 cb f6 04 c6    	mulx   (%rsi,%rax,8),%rsi,%rax
   147d1:	41 89 c2             	mov    %eax,%r10d
   147d4:	41 f7 d2             	not    %r10d
   147d7:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   147de:	75 28                	jne    14808 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x828>
   147e0:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   147e4:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   147eb:	4d 63 d2             	movslq %r10d,%r10
   147ee:	41 89 dd             	mov    %ebx,%r13d
   147f1:	48 8d 1d e8 2e 04 00 	lea    0x42ee8(%rip),%rbx        # 576e0 <FFC_POWERS_OF_FIVE>
   147f8:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   147fe:	44 89 eb             	mov    %r13d,%ebx
   14801:	48 01 f2             	add    %rsi,%rdx
   14804:	48 83 d0 00          	adc    $0x0,%rax
   14808:	48 89 c2             	mov    %rax,%rdx
   1480b:	48 c1 ea 3f          	shr    $0x3f,%rdx
   1480f:	83 f2 01             	xor    $0x1,%edx
   14812:	c4 e2 e9 f7 c0       	shlx   %rdx,%rax,%rax
   14817:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
   1481e:	c1 fe 10             	sar    $0x10,%esi
   14821:	44 01 c2             	add    %r8d,%edx
   14824:	29 d6                	sub    %edx,%esi
   14826:	8d 96 72 04 00 00    	lea    0x472(%rsi),%edx
   1482c:	81 c6 34 84 ff ff    	add    $0xffff8434,%esi
   14832:	81 fa 3d 80 00 00    	cmp    $0x803d,%edx
   14838:	0f 8f 70 01 00 00    	jg     149ae <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   1483e:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   14845:	00 
   14846:	48 89 ac 24 98 00 00 	mov    %rbp,0x98(%rsp)
   1484d:	00 
   1484e:	4c 89 9c 24 a0 00 00 	mov    %r11,0xa0(%rsp)
   14855:	00 
   14856:	0f b6 54 24 4f       	movzbl 0x4f(%rsp),%edx
   1485b:	88 94 24 a8 00 00 00 	mov    %dl,0xa8(%rsp)
   14862:	c6 84 24 a9 00 00 00 	movb   $0x1,0xa9(%rsp)
   14869:	01 
   1486a:	88 8c 24 aa 00 00 00 	mov    %cl,0xaa(%rsp)
   14871:	48 8d 8c 24 ab 00 00 	lea    0xab(%rsp),%rcx
   14878:	00 
   14879:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
   1487d:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
   14883:	48 89 bc 24 b0 00 00 	mov    %rdi,0xb0(%rsp)
   1488a:	00 
   1488b:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   14890:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
   14897:	00 
   14898:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1489d:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   148a4:	00 
   148a5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   148aa:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   148b1:	00 
   148b2:	48 c7 84 24 d0 00 00 	movq   $0x0,0xd0(%rsp)
   148b9:	00 00 00 00 00 
   148be:	c5 fd 10 94 24 90 00 	vmovupd 0x90(%rsp),%ymm2
   148c5:	00 00 
   148c7:	c5 fd 10 8c 24 b0 00 	vmovupd 0xb0(%rsp),%ymm1
   148ce:	00 00 
   148d0:	c5 fd 11 4c 24 20    	vmovupd %ymm1,0x20(%rsp)
   148d6:	c5 fd 11 14 24       	vmovupd %ymm2,(%rsp)
   148db:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
   148e2:	00 00 
   148e4:	48 89 c7             	mov    %rax,%rdi
   148e7:	ba 01 00 00 00       	mov    $0x1,%edx
   148ec:	c5 fb 11 44 24 58    	vmovsd %xmm0,0x58(%rsp)
   148f2:	c5 f9 29 5c 24 70    	vmovapd %xmm3,0x70(%rsp)
   148f8:	c5 f8 77             	vzeroupper
   148fb:	e8 90 48 00 00       	call   19190 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   14900:	c5 f9 28 5c 24 70    	vmovapd 0x70(%rsp),%xmm3
   14906:	c5 fb 10 44 24 58    	vmovsd 0x58(%rsp),%xmm0
   1490c:	89 d6                	mov    %edx,%esi
   1490e:	e9 9b 00 00 00       	jmp    149ae <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   14913:	f3 49 0f bd da       	lzcnt  %r10,%rbx
   14918:	c4 c2 e1 f7 d2       	shlx   %rbx,%r10,%rdx
   1491d:	47 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%r8d
   14924:	00 
   14925:	4d 63 c0             	movslq %r8d,%r8
   14928:	4c 8d 2d b1 2d 04 00 	lea    0x42db1(%rip),%r13        # 576e0 <FFC_POWERS_OF_FIVE>
   1492f:	c4 02 bb f6 54 c5 00 	mulx   0x0(%r13,%r8,8),%r8,%r10
   14936:	45 89 d7             	mov    %r10d,%r15d
   14939:	41 f7 d7             	not    %r15d
   1493c:	41 f7 c7 ff 01 00 00 	test   $0x1ff,%r15d
   14943:	75 1c                	jne    14961 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x981>
   14945:	47 8d 3c 09          	lea    (%r9,%r9,1),%r15d
   14949:	41 81 c7 ad 02 00 00 	add    $0x2ad,%r15d
   14950:	4d 63 ff             	movslq %r15d,%r15
   14953:	c4 82 eb f6 54 fd 00 	mulx   0x0(%r13,%r15,8),%rdx,%rdx
   1495a:	49 01 d0             	add    %rdx,%r8
   1495d:	49 83 d2 00          	adc    $0x0,%r10
   14961:	4d 89 d5             	mov    %r10,%r13
   14964:	49 c1 ed 3f          	shr    $0x3f,%r13
   14968:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   1496f:	c1 fa 10             	sar    $0x10,%edx
   14972:	29 da                	sub    %ebx,%edx
   14974:	42 8d 54 2a 3f       	lea    0x3f(%rdx,%r13,1),%edx
   14979:	49 83 c5 09          	add    $0x9,%r13
   1497d:	c4 42 93 f7 fa       	shrx   %r13,%r10,%r15
   14982:	81 fa 01 fc ff ff    	cmp    $0xfffffc01,%edx
   14988:	0f 8f c7 01 00 00    	jg     14b55 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb75>
   1498e:	81 fa c3 fb ff ff    	cmp    $0xfffffbc3,%edx
   14994:	0f 83 6f 02 00 00    	jae    14c09 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc29>
   1499a:	45 31 c0             	xor    %r8d,%r8d
   1499d:	31 d2                	xor    %edx,%edx
   1499f:	e9 93 02 00 00       	jmp    14c37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc57>
   149a4:	31 f6                	xor    %esi,%esi
   149a6:	84 c9                	test   %cl,%cl
   149a8:	0f 85 9e fd ff ff    	jne    1474c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x76c>
   149ae:	31 c9                	xor    %ecx,%ecx
   149b0:	41 80 fc 2d          	cmp    $0x2d,%r12b
   149b4:	0f 94 c1             	sete   %cl
   149b7:	48 89 f2             	mov    %rsi,%rdx
   149ba:	48 c1 e2 34          	shl    $0x34,%rdx
   149be:	48 c1 e1 3f          	shl    $0x3f,%rcx
   149c2:	48 09 c2             	or     %rax,%rdx
   149c5:	48 09 ca             	or     %rcx,%rdx
   149c8:	48 85 ed             	test   %rbp,%rbp
   149cb:	0f 95 c1             	setne  %cl
   149ce:	48 85 c0             	test   %rax,%rax
   149d1:	0f 94 c0             	sete   %al
   149d4:	c4 e1 f9 6e d2       	vmovq  %rdx,%xmm2
   149d9:	85 f6                	test   %esi,%esi
   149db:	0f 94 c2             	sete   %dl
   149de:	20 c2                	and    %al,%dl
   149e0:	20 ca                	and    %cl,%dl
   149e2:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   149e8:	0f 94 c0             	sete   %al
   149eb:	08 d0                	or     %dl,%al
   149ed:	0f b6 d0             	movzbl %al,%edx
   149f0:	01 d2                	add    %edx,%edx
   149f2:	e9 19 01 00 00       	jmp    14b10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   149f7:	49 c1 e1 03          	shl    $0x3,%r9
   149fb:	48 8d 05 ee 2b 04 00 	lea    0x42bee(%rip),%rax        # 575f0 <FFC_DOUBLE_POWERS_OF_TEN>
   14a02:	4c 29 c8             	sub    %r9,%rax
   14a05:	c5 f3 5e 10          	vdivsd (%rax),%xmm1,%xmm2
   14a09:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   14a0d:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14a11:	0f 94 c0             	sete   %al
   14a14:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   14a18:	c5 fb 92 c8          	kmovd  %eax,%k1
   14a1c:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   14a22:	e9 df 00 00 00       	jmp    14b06 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb26>
   14a27:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
   14a2e:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
   14a32:	41 c1 e8 08          	shr    $0x8,%r8d
   14a36:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
   14a3a:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
   14a41:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
   14a48:	c1 ed 10             	shr    $0x10,%ebp
   14a4b:	4c 01 cd             	add    %r9,%rbp
   14a4e:	49 83 c3 04          	add    $0x4,%r11
   14a52:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   14a56:	49 39 c3             	cmp    %rax,%r11
   14a59:	0f 85 76 f8 ff ff    	jne    142d5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2f5>
   14a5f:	49 89 c3             	mov    %rax,%r11
   14a62:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   14a67:	4d 89 c1             	mov    %r8,%r9
   14a6a:	4d 29 d9             	sub    %r11,%r9
   14a6d:	4d 89 da             	mov    %r11,%r10
   14a70:	4d 29 c2             	sub    %r8,%r10
   14a73:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   14a78:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   14a7d:	4d 29 c8             	sub    %r9,%r8
   14a80:	4d 89 da             	mov    %r11,%r10
   14a83:	4d 85 c0             	test   %r8,%r8
   14a86:	0f 85 fc f8 ff ff    	jne    14388 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>
   14a8c:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14a90:	75 03                	jne    14a95 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab5>
   14a92:	48 ff c6             	inc    %rsi
   14a95:	48 29 f0             	sub    %rsi,%rax
   14a98:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   14a9c:	ba 01 00 00 00       	mov    $0x1,%edx
   14aa1:	48 83 f8 03          	cmp    $0x3,%rax
   14aa5:	7c 69                	jl     14b10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   14aa7:	0f b7 0e             	movzwl (%rsi),%ecx
   14aaa:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   14aae:	c1 e0 10             	shl    $0x10,%eax
   14ab1:	48 09 c8             	or     %rcx,%rax
   14ab4:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
   14abb:	20 20 20 
   14abe:	48 09 c8             	or     %rcx,%rax
   14ac1:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
   14ac8:	20 20 20 
   14acb:	48 39 c8             	cmp    %rcx,%rax
   14ace:	74 21                	je     14af1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb11>
   14ad0:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
   14ad7:	20 20 20 
   14ada:	48 39 c8             	cmp    %rcx,%rax
   14add:	75 31                	jne    14b10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   14adf:	31 c0                	xor    %eax,%eax
   14ae1:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14ae5:	0f 94 c0             	sete   %al
   14ae8:	48 8d 0d 91 e5 03 00 	lea    0x3e591(%rip),%rcx        # 53080 <_IO_stdin_used+0x80>
   14aef:	eb 10                	jmp    14b01 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb21>
   14af1:	31 c0                	xor    %eax,%eax
   14af3:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14af7:	0f 94 c0             	sete   %al
   14afa:	48 8d 0d 6f e5 03 00 	lea    0x3e56f(%rip),%rcx        # 53070 <_IO_stdin_used+0x70>
   14b01:	c5 fb 10 14 c1       	vmovsd (%rcx,%rax,8),%xmm2
   14b06:	31 d2                	xor    %edx,%edx
   14b08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   14b0f:	00 
   14b10:	85 d2                	test   %edx,%edx
   14b12:	0f 84 08 f5 ff ff    	je     14020 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   14b18:	84 db                	test   %bl,%bl
   14b1a:	0f 85 00 f5 ff ff    	jne    14020 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   14b20:	e9 3f 01 00 00       	jmp    14c64 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc84>
   14b25:	48 89 f3             	mov    %rsi,%rbx
   14b28:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   14b2d:	48 89 ce             	mov    %rcx,%rsi
   14b30:	48 f7 de             	neg    %rsi
   14b33:	80 7c 24 68 2d       	cmpb   $0x2d,0x68(%rsp)
   14b38:	48 0f 45 f1          	cmovne %rcx,%rsi
   14b3c:	49 01 f1             	add    %rsi,%r9
   14b3f:	49 89 db             	mov    %rbx,%r11
   14b42:	b3 01                	mov    $0x1,%bl
   14b44:	31 c9                	xor    %ecx,%ecx
   14b46:	49 83 f8 14          	cmp    $0x14,%r8
   14b4a:	0f 8c db f9 ff ff    	jl     1452b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   14b50:	e9 e7 f8 ff ff       	jmp    1443c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x45c>
   14b55:	49 8d 59 04          	lea    0x4(%r9),%rbx
   14b59:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
   14b5e:	44 89 fb             	mov    %r15d,%ebx
   14b61:	83 e3 03             	and    $0x3,%ebx
   14b64:	48 83 f3 01          	xor    $0x1,%rbx
   14b68:	c4 42 91 f7 ef       	shlx   %r13,%r15,%r13
   14b6d:	4d 31 d5             	xor    %r10,%r13
   14b70:	4d 89 fa             	mov    %r15,%r10
   14b73:	4c 89 84 24 88 00 00 	mov    %r8,0x88(%rsp)
   14b7a:	00 
   14b7b:	49 b8 fc ff ff ff ff 	movabs $0xfffffffffffffc,%r8
   14b82:	ff ff 00 
   14b85:	4d 21 c2             	and    %r8,%r10
   14b88:	49 09 dd             	or     %rbx,%r13
   14b8b:	4d 0f 45 d7          	cmovne %r15,%r10
   14b8f:	48 83 bc 24 88 00 00 	cmpq   $0x2,0x88(%rsp)
   14b96:	00 02 
   14b98:	4d 0f 43 d7          	cmovae %r15,%r10
   14b9c:	48 83 7c 24 68 1c    	cmpq   $0x1c,0x68(%rsp)
   14ba2:	4d 0f 43 d7          	cmovae %r15,%r10
   14ba6:	44 89 d3             	mov    %r10d,%ebx
   14ba9:	83 e3 01             	and    $0x1,%ebx
   14bac:	4c 01 d3             	add    %r10,%rbx
   14baf:	49 89 d8             	mov    %rbx,%r8
   14bb2:	49 d1 e8             	shr    $1,%r8
   14bb5:	49 ba ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r10
   14bbc:	ff ef 7f 
   14bbf:	4d 21 d0             	and    %r10,%r8
   14bc2:	49 ba 00 00 00 00 00 	movabs $0x40000000000000,%r10
   14bc9:	00 40 00 
   14bcc:	4c 39 d3             	cmp    %r10,%rbx
   14bcf:	83 da 00             	sbb    $0x0,%edx
   14bd2:	81 c2 00 04 00 00    	add    $0x400,%edx
   14bd8:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   14bde:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   14be4:	4d 0f 43 c7          	cmovae %r15,%r8
   14be8:	4c 39 d3             	cmp    %r10,%rbx
   14beb:	4d 0f 43 c7          	cmovae %r15,%r8
   14bef:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   14bf5:	41 ba ff 07 00 00    	mov    $0x7ff,%r10d
   14bfb:	41 0f 43 d2          	cmovae %r10d,%edx
   14bff:	eb 36                	jmp    14c37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc57>
   14c01:	4d 89 c3             	mov    %r8,%r11
   14c04:	e9 59 fe ff ff       	jmp    14a62 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   14c09:	41 b8 02 fc ff ff    	mov    $0xfffffc02,%r8d
   14c0f:	41 29 d0             	sub    %edx,%r8d
   14c12:	c4 42 bb f7 d7       	shrx   %r8,%r15,%r10
   14c17:	4d 0f a3 c7          	bt     %r8,%r15
   14c1b:	49 83 d2 00          	adc    $0x0,%r10
   14c1f:	4d 89 d0             	mov    %r10,%r8
   14c22:	49 d1 e8             	shr    $1,%r8
   14c25:	31 d2                	xor    %edx,%edx
   14c27:	48 bb ff ff ff ff ff 	movabs $0x1fffffffffffff,%rbx
   14c2e:	ff 1f 00 
   14c31:	49 39 da             	cmp    %rbx,%r10
   14c34:	0f 97 c2             	seta   %dl
   14c37:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   14c3b:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   14c40:	4c 39 c0             	cmp    %r8,%rax
   14c43:	0f 84 5f fb ff ff    	je     147a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c8>
   14c49:	e9 62 fb ff ff       	jmp    147b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   14c4e:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   14c52:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   14c59:	5b                   	pop    %rbx
   14c5a:	41 5c                	pop    %r12
   14c5c:	41 5d                	pop    %r13
   14c5e:	41 5e                	pop    %r14
   14c60:	41 5f                	pop    %r15
   14c62:	5d                   	pop    %rbp
   14c63:	c3                   	ret
   14c64:	bf 10 00 00 00       	mov    $0x10,%edi
   14c69:	e8 12 15 ff ff       	call   6180 <__cxa_allocate_exception@plt>
   14c6e:	48 89 c3             	mov    %rax,%rbx
   14c71:	48 8d 35 32 59 04 00 	lea    0x45932(%rip),%rsi        # 5a5aa <fast_float::powers_of_ten_uint64+0x50a>
   14c78:	48 89 c7             	mov    %rax,%rdi
   14c7b:	e8 a0 14 ff ff       	call   6120 <std::runtime_error::runtime_error(char const*)@plt>
   14c80:	48 8b 35 49 b3 05 00 	mov    0x5b349(%rip),%rsi        # 6ffd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
   14c87:	48 8b 15 d2 b2 05 00 	mov    0x5b2d2(%rip),%rdx        # 6ff60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
   14c8e:	48 89 df             	mov    %rbx,%rdi
   14c91:	e8 aa 18 ff ff       	call   6540 <__cxa_throw@plt>
   14c96:	49 89 c6             	mov    %rax,%r14
   14c99:	48 89 df             	mov    %rbx,%rdi
   14c9c:	e8 cf 15 ff ff       	call   6270 <__cxa_free_exception@plt>
   14ca1:	4c 89 f7             	mov    %r14,%rdi
   14ca4:	e8 a7 18 ff ff       	call   6550 <_Unwind_Resume@plt>
   14ca9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

