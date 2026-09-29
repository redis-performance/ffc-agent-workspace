0000000000014220 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   14220:	55                   	push   %rbp
   14221:	41 57                	push   %r15
   14223:	41 56                	push   %r14
   14225:	41 55                	push   %r13
   14227:	41 54                	push   %r12
   14229:	53                   	push   %rbx
   1422a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   14231:	4c 8b 37             	mov    (%rdi),%r14
   14234:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
   14238:	4d 39 ee             	cmp    %r13,%r14
   1423b:	0f 84 95 0c 00 00    	je     14ed6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xcb6>
   14241:	89 f3                	mov    %esi,%ebx
   14243:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   14247:	c5 fb 12 1d 71 41 04 	vmovddup 0x44171(%rip),%xmm3        # 583c0 <fast_float::powers_of_ten_uint64+0xb0>
   1424e:	00 
   1424f:	89 74 24 50          	mov    %esi,0x50(%rsp)
   14253:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
   14258:	eb 17                	jmp    14271 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x51>
   1425a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   14260:	c5 fb 5f c2          	vmaxsd %xmm2,%xmm0,%xmm0
   14264:	49 83 c6 20          	add    $0x20,%r14
   14268:	4d 39 ee             	cmp    %r13,%r14
   1426b:	0f 84 69 0c 00 00    	je     14eda <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xcba>
   14271:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   14275:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   14279:	ba 01 00 00 00       	mov    $0x1,%edx
   1427e:	48 85 c9             	test   %rcx,%rcx
   14281:	0f 84 19 0b 00 00    	je     14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14287:	49 8b 36             	mov    (%r14),%rsi
   1428a:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
   1428e:	44 0f b6 26          	movzbl (%rsi),%r12d
   14292:	48 89 f7             	mov    %rsi,%rdi
   14295:	45 89 e0             	mov    %r12d,%r8d
   14298:	41 80 fc 2d          	cmp    $0x2d,%r12b
   1429c:	41 0f 94 c3          	sete   %r11b
   142a0:	75 2e                	jne    142d0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb0>
   142a2:	48 83 f9 01          	cmp    $0x1,%rcx
   142a6:	0f 84 74 0a 00 00    	je     14d20 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb00>
   142ac:	44 0f be 46 01       	movsbl 0x1(%rsi),%r8d
   142b1:	41 83 f8 2e          	cmp    $0x2e,%r8d
   142b5:	74 0d                	je     142c4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   142b7:	41 8d 50 d0          	lea    -0x30(%r8),%edx
   142bb:	83 fa 09             	cmp    $0x9,%edx
   142be:	0f 87 5c 0a 00 00    	ja     14d20 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb00>
   142c4:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
   142c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   142cf:	00 
   142d0:	48 39 c7             	cmp    %rax,%rdi
   142d3:	44 88 5c 24 57       	mov    %r11b,0x57(%rsp)
   142d8:	0f 84 33 01 00 00    	je     14411 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f1>
   142de:	41 0f be d0          	movsbl %r8b,%edx
   142e2:	83 c2 d0             	add    $0xffffffd0,%edx
   142e5:	83 fa 09             	cmp    $0x9,%edx
   142e8:	0f 87 3e 01 00 00    	ja     1442c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x20c>
   142ee:	48 8d 57 01          	lea    0x1(%rdi),%rdx
   142f2:	49 0f be e8          	movsbq %r8b,%rbp
   142f6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   142fa:	48 39 c2             	cmp    %rax,%rdx
   142fd:	0f 84 10 01 00 00    	je     14413 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   14303:	44 0f be 02          	movsbl (%rdx),%r8d
   14307:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   1430b:	41 83 f9 09          	cmp    $0x9,%r9d
   1430f:	0f 87 1c 01 00 00    	ja     14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   14315:	4d 63 c0             	movslq %r8d,%r8
   14318:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   1431f:	00 
   14320:	49 01 e9             	add    %rbp,%r9
   14323:	48 8d 57 02          	lea    0x2(%rdi),%rdx
   14327:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   1432b:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   1432f:	48 39 c2             	cmp    %rax,%rdx
   14332:	0f 84 db 00 00 00    	je     14413 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   14338:	44 0f be 02          	movsbl (%rdx),%r8d
   1433c:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   14340:	41 83 f9 09          	cmp    $0x9,%r9d
   14344:	0f 87 e7 00 00 00    	ja     14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   1434a:	4d 63 c0             	movslq %r8d,%r8
   1434d:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   14354:	00 
   14355:	49 01 e9             	add    %rbp,%r9
   14358:	48 8d 57 03          	lea    0x3(%rdi),%rdx
   1435c:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   14360:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   14364:	48 39 c2             	cmp    %rax,%rdx
   14367:	0f 84 a6 00 00 00    	je     14413 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   1436d:	44 0f be 02          	movsbl (%rdx),%r8d
   14371:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   14375:	41 83 f9 09          	cmp    $0x9,%r9d
   14379:	0f 87 b2 00 00 00    	ja     14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   1437f:	4d 63 c0             	movslq %r8d,%r8
   14382:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   14389:	00 
   1438a:	49 01 e9             	add    %rbp,%r9
   1438d:	48 8d 57 04          	lea    0x4(%rdi),%rdx
   14391:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   14395:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   14399:	48 39 c2             	cmp    %rax,%rdx
   1439c:	74 75                	je     14413 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   1439e:	44 0f be 02          	movsbl (%rdx),%r8d
   143a2:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   143a6:	41 83 f9 09          	cmp    $0x9,%r9d
   143aa:	0f 87 81 00 00 00    	ja     14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   143b0:	4d 63 c0             	movslq %r8d,%r8
   143b3:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   143ba:	00 
   143bb:	49 01 e9             	add    %rbp,%r9
   143be:	48 8d 57 05          	lea    0x5(%rdi),%rdx
   143c2:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   143c6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   143ca:	48 39 c2             	cmp    %rax,%rdx
   143cd:	74 44                	je     14413 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   143cf:	4c 8d 04 0e          	lea    (%rsi,%rcx,1),%r8
   143d3:	49 29 f8             	sub    %rdi,%r8
   143d6:	49 01 f8             	add    %rdi,%r8
   143d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   143e0:	44 0f be 0a          	movsbl (%rdx),%r9d
   143e4:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   143e8:	41 83 fa 09          	cmp    $0x9,%r10d
   143ec:	77 43                	ja     14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   143ee:	4d 63 c9             	movslq %r9d,%r9
   143f1:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   143f8:	00 
   143f9:	49 01 ea             	add    %rbp,%r10
   143fc:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   14400:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   14404:	48 ff c2             	inc    %rdx
   14407:	48 39 c2             	cmp    %rax,%rdx
   1440a:	75 d4                	jne    143e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1c0>
   1440c:	4c 89 c2             	mov    %r8,%rdx
   1440f:	eb 20                	jmp    14431 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   14411:	31 ed                	xor    %ebp,%ebp
   14413:	49 89 c0             	mov    %rax,%r8
   14416:	49 29 f8             	sub    %rdi,%r8
   14419:	48 89 c2             	mov    %rax,%rdx
   1441c:	49 89 c3             	mov    %rax,%r11
   1441f:	45 31 ff             	xor    %r15d,%r15d
   14422:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   14427:	e9 b1 01 00 00       	jmp    145dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3bd>
   1442c:	31 ed                	xor    %ebp,%ebp
   1442e:	48 89 fa             	mov    %rdi,%rdx
   14431:	49 89 d0             	mov    %rdx,%r8
   14434:	49 29 f8             	sub    %rdi,%r8
   14437:	48 39 c2             	cmp    %rax,%rdx
   1443a:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   1443f:	0f 84 8d 01 00 00    	je     145d2 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b2>
   14445:	80 3a 2e             	cmpb   $0x2e,(%rdx)
   14448:	0f 85 89 01 00 00    	jne    145d7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b7>
   1444e:	41 89 dd             	mov    %ebx,%r13d
   14451:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
   14455:	49 89 c0             	mov    %rax,%r8
   14458:	4d 29 d8             	sub    %r11,%r8
   1445b:	49 83 f8 08          	cmp    $0x8,%r8
   1445f:	4d 89 d9             	mov    %r11,%r9
   14462:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   14467:	0f 8c 94 00 00 00    	jl     14501 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e1>
   1446d:	0f 1f 00             	nopl   (%rax)
   14470:	4d 8b 0b             	mov    (%r11),%r9
   14473:	49 ba 46 46 46 46 46 	movabs $0x4646464646464646,%r10
   1447a:	46 46 46 
   1447d:	4d 01 ca             	add    %r9,%r10
   14480:	48 bb d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rbx
   14487:	cf cf cf 
   1448a:	49 01 d9             	add    %rbx,%r9
   1448d:	4d 09 ca             	or     %r9,%r10
   14490:	48 bb 80 80 80 80 80 	movabs $0x8080808080808080,%rbx
   14497:	80 80 80 
   1449a:	49 85 da             	test   %rbx,%r10
   1449d:	75 62                	jne    14501 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e1>
   1449f:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
   144a6:	4b 8d 1c 89          	lea    (%r9,%r9,4),%rbx
   144aa:	49 c1 e9 08          	shr    $0x8,%r9
   144ae:	49 8d 2c 59          	lea    (%r9,%rbx,2),%rbp
   144b2:	49 89 e9             	mov    %rbp,%r9
   144b5:	48 bb ff 00 00 00 ff 	movabs $0xff000000ff,%rbx
   144bc:	00 00 00 
   144bf:	49 21 d9             	and    %rbx,%r9
   144c2:	49 bf 64 00 00 00 40 	movabs $0xf424000000064,%r15
   144c9:	42 0f 00 
   144cc:	4d 0f af cf          	imul   %r15,%r9
   144d0:	48 c1 ed 10          	shr    $0x10,%rbp
   144d4:	48 21 dd             	and    %rbx,%rbp
   144d7:	48 bb 01 00 00 00 10 	movabs $0x271000000001,%rbx
   144de:	27 00 00 
   144e1:	48 0f af eb          	imul   %rbx,%rbp
   144e5:	4c 01 cd             	add    %r9,%rbp
   144e8:	48 c1 ed 20          	shr    $0x20,%rbp
   144ec:	4c 01 d5             	add    %r10,%rbp
   144ef:	49 83 c3 08          	add    $0x8,%r11
   144f3:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
   144f7:	49 83 f8 07          	cmp    $0x7,%r8
   144fb:	0f 8f 6f ff ff ff    	jg     14470 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x250>
   14501:	49 83 f8 04          	cmp    $0x4,%r8
   14505:	7c 21                	jl     14528 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x308>
   14507:	45 8b 03             	mov    (%r11),%r8d
   1450a:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
   14511:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
   14518:	45 09 c1             	or     %r8d,%r9d
   1451b:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
   14522:	0f 84 8e 07 00 00    	je     14cb6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa96>
   14528:	44 89 eb             	mov    %r13d,%ebx
   1452b:	49 39 c3             	cmp    %rax,%r11
   1452e:	0f 84 b9 07 00 00    	je     14ced <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   14534:	45 0f be 0b          	movsbl (%r11),%r9d
   14538:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
   1453c:	41 83 f8 09          	cmp    $0x9,%r8d
   14540:	0f 87 aa 07 00 00    	ja     14cf0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   14546:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   1454d:	00 
   1454e:	49 01 ea             	add    %rbp,%r10
   14551:	4d 8d 43 01          	lea    0x1(%r11),%r8
   14555:	41 80 c1 d0          	add    $0xd0,%r9b
   14559:	45 0f b6 c9          	movzbl %r9b,%r9d
   1455d:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   14561:	49 39 c0             	cmp    %rax,%r8
   14564:	0f 84 83 07 00 00    	je     14ced <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   1456a:	45 0f be 08          	movsbl (%r8),%r9d
   1456e:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   14572:	41 83 fa 09          	cmp    $0x9,%r10d
   14576:	0f 87 0d 09 00 00    	ja     14e89 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc69>
   1457c:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   14583:	00 
   14584:	49 01 ea             	add    %rbp,%r10
   14587:	4d 8d 43 02          	lea    0x2(%r11),%r8
   1458b:	41 80 c1 d0          	add    $0xd0,%r9b
   1458f:	45 0f b6 c9          	movzbl %r9b,%r9d
   14593:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   14597:	49 39 c0             	cmp    %rax,%r8
   1459a:	0f 84 4d 07 00 00    	je     14ced <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   145a0:	45 0f be 08          	movsbl (%r8),%r9d
   145a4:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   145a8:	41 83 fa 09          	cmp    $0x9,%r10d
   145ac:	0f 87 d7 08 00 00    	ja     14e89 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc69>
   145b2:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
   145b9:	00 
   145ba:	49 01 e8             	add    %rbp,%r8
   145bd:	49 83 c3 03          	add    $0x3,%r11
   145c1:	41 80 c1 d0          	add    $0xd0,%r9b
   145c5:	45 0f b6 c9          	movzbl %r9b,%r9d
   145c9:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
   145cd:	e9 1e 07 00 00       	jmp    14cf0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   145d2:	49 89 c3             	mov    %rax,%r11
   145d5:	eb 03                	jmp    145da <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3ba>
   145d7:	49 89 d3             	mov    %rdx,%r11
   145da:	45 31 ff             	xor    %r15d,%r15d
   145dd:	45 31 c9             	xor    %r9d,%r9d
   145e0:	45 31 d2             	xor    %r10d,%r10d
   145e3:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   145e8:	45 31 d2             	xor    %r10d,%r10d
   145eb:	4d 85 c0             	test   %r8,%r8
   145ee:	0f 84 21 07 00 00    	je     14d15 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xaf5>
   145f4:	4c 89 bc 24 88 00 00 	mov    %r15,0x88(%rsp)
   145fb:	00 
   145fc:	41 89 dd             	mov    %ebx,%r13d
   145ff:	49 39 c3             	cmp    %rax,%r11
   14602:	0f 84 91 00 00 00    	je     14699 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x479>
   14608:	41 0f b6 1b          	movzbl (%r11),%ebx
   1460c:	83 cb 20             	or     $0x20,%ebx
   1460f:	83 fb 65             	cmp    $0x65,%ebx
   14612:	0f 85 84 00 00 00    	jne    1469c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x47c>
   14618:	49 8d 5b 01          	lea    0x1(%r11),%rbx
   1461c:	48 39 c3             	cmp    %rax,%rbx
   1461f:	74 7b                	je     1469c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x47c>
   14621:	45 0f b6 6b 01       	movzbl 0x1(%r11),%r13d
   14626:	4d 8d 7b 02          	lea    0x2(%r11),%r15
   1462a:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
   1462f:	41 83 c5 d5          	add    $0xffffffd5,%r13d
   14633:	41 f6 c5 fd          	test   $0xfd,%r13b
   14637:	49 0f 44 df          	cmove  %r15,%rbx
   1463b:	48 39 c3             	cmp    %rax,%rbx
   1463e:	0f 84 03 01 00 00    	je     14747 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x527>
   14644:	44 0f be 3b          	movsbl (%rbx),%r15d
   14648:	41 83 c7 d0          	add    $0xffffffd0,%r15d
   1464c:	41 83 ff 09          	cmp    $0x9,%r15d
   14650:	0f 87 f1 00 00 00    	ja     14747 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x527>
   14656:	48 01 ce             	add    %rcx,%rsi
   14659:	31 c9                	xor    %ecx,%ecx
   1465b:	eb 0f                	jmp    1466c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   1465d:	0f 1f 00             	nopl   (%rax)
   14660:	48 ff c3             	inc    %rbx
   14663:	48 39 c3             	cmp    %rax,%rbx
   14666:	0f 84 49 07 00 00    	je     14db5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb95>
   1466c:	44 0f be 1b          	movsbl (%rbx),%r11d
   14670:	45 8d 7b d0          	lea    -0x30(%r11),%r15d
   14674:	41 83 ff 09          	cmp    $0x9,%r15d
   14678:	0f 87 3a 07 00 00    	ja     14db8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb98>
   1467e:	48 81 f9 ff ff ff 0f 	cmp    $0xfffffff,%rcx
   14685:	7f d9                	jg     14660 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x440>
   14687:	41 80 c3 d0          	add    $0xd0,%r11b
   1468b:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   1468f:	45 0f b6 db          	movzbl %r11b,%r11d
   14693:	49 8d 0c 4b          	lea    (%r11,%rcx,2),%rcx
   14697:	eb c7                	jmp    14660 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x440>
   14699:	49 89 c3             	mov    %rax,%r11
   1469c:	31 f6                	xor    %esi,%esi
   1469e:	b3 01                	mov    $0x1,%bl
   146a0:	31 c9                	xor    %ecx,%ecx
   146a2:	49 83 f8 14          	cmp    $0x14,%r8
   146a6:	0f 8c 08 01 00 00    	jl     147b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   146ac:	48 39 c7             	cmp    %rax,%rdi
   146af:	74 46                	je     146f7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4d7>
   146b1:	48 89 f9             	mov    %rdi,%rcx
   146b4:	eb 20                	jmp    146d6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4b6>
   146b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   146bd:	00 00 00 
   146c0:	45 31 ff             	xor    %r15d,%r15d
   146c3:	41 80 fd 30          	cmp    $0x30,%r13b
   146c7:	41 0f 94 c7          	sete   %r15b
   146cb:	4d 29 f8             	sub    %r15,%r8
   146ce:	48 ff c1             	inc    %rcx
   146d1:	48 39 c1             	cmp    %rax,%rcx
   146d4:	74 10                	je     146e6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4c6>
   146d6:	44 0f b6 29          	movzbl (%rcx),%r13d
   146da:	41 83 fd 30          	cmp    $0x30,%r13d
   146de:	74 e0                	je     146c0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a0>
   146e0:	41 83 fd 2e          	cmp    $0x2e,%r13d
   146e4:	74 da                	je     146c0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a0>
   146e6:	31 c9                	xor    %ecx,%ecx
   146e8:	49 83 f8 14          	cmp    $0x14,%r8
   146ec:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   146f1:	0f 8c bd 00 00 00    	jl     147b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   146f7:	48 39 d7             	cmp    %rdx,%rdi
   146fa:	74 62                	je     1475e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53e>
   146fc:	48 89 f8             	mov    %rdi,%rax
   146ff:	31 ed                	xor    %ebp,%ebp
   14701:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   14708:	b6 e0 0d 
   1470b:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
   14710:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
   14717:	00 
   14718:	48 01 e9             	add    %rbp,%rcx
   1471b:	4c 0f be 00          	movsbq (%rax),%r8
   1471f:	49 8d 2c 48          	lea    (%r8,%rcx,2),%rbp
   14723:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   14727:	48 ff c0             	inc    %rax
   1472a:	4c 39 cd             	cmp    %r9,%rbp
   1472d:	73 05                	jae    14734 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x514>
   1472f:	48 39 d0             	cmp    %rdx,%rax
   14732:	75 dc                	jne    14710 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4f0>
   14734:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
   14738:	48 39 cd             	cmp    %rcx,%rbp
   1473b:	77 6a                	ja     147a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x587>
   1473d:	48 89 d8             	mov    %rbx,%rax
   14740:	4c 39 d3             	cmp    %r10,%rbx
   14743:	75 3b                	jne    14780 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x560>
   14745:	eb 5d                	jmp    147a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   14747:	31 f6                	xor    %esi,%esi
   14749:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   1474e:	b3 01                	mov    $0x1,%bl
   14750:	31 c9                	xor    %ecx,%ecx
   14752:	49 83 f8 14          	cmp    $0x14,%r8
   14756:	0f 8d 50 ff ff ff    	jge    146ac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x48c>
   1475c:	eb 56                	jmp    147b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   1475e:	31 ed                	xor    %ebp,%ebp
   14760:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   14767:	b6 e0 0d 
   1476a:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
   1476f:	48 89 d8             	mov    %rbx,%rax
   14772:	4c 39 d3             	cmp    %r10,%rbx
   14775:	74 2d                	je     147a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   14777:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1477e:	00 00 
   14780:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
   14787:	00 
   14788:	48 01 e9             	add    %rbp,%rcx
   1478b:	48 0f be 10          	movsbq (%rax),%rdx
   1478f:	48 8d 2c 4a          	lea    (%rdx,%rcx,2),%rbp
   14793:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   14797:	48 ff c0             	inc    %rax
   1479a:	4c 39 cd             	cmp    %r9,%rbp
   1479d:	73 05                	jae    147a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   1479f:	4c 39 d0             	cmp    %r10,%rax
   147a2:	75 dc                	jne    14780 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x560>
   147a4:	48 89 da             	mov    %rbx,%rdx
   147a7:	48 29 c2             	sub    %rax,%rdx
   147aa:	48 01 f2             	add    %rsi,%rdx
   147ad:	b1 01                	mov    $0x1,%cl
   147af:	31 db                	xor    %ebx,%ebx
   147b1:	49 89 d1             	mov    %rdx,%r9
   147b4:	84 db                	test   %bl,%bl
   147b6:	74 44                	je     147fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>
   147b8:	4d 85 c9             	test   %r9,%r9
   147bb:	75 3f                	jne    147fc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>
   147bd:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   147c4:	ff 1f 00 
   147c7:	48 ff c0             	inc    %rax
   147ca:	48 39 c5             	cmp    %rax,%rbp
   147cd:	0f 87 a3 00 00 00    	ja     14876 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   147d3:	48 85 ed             	test   %rbp,%rbp
   147d6:	0f 84 2c 02 00 00    	je     14a08 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7e8>
   147dc:	41 80 fc 2d          	cmp    $0x2d,%r12b
   147e0:	0f 94 c0             	sete   %al
   147e3:	62 f1 df 08 7b d5    	vcvtusi2sd %rbp,%xmm4,%xmm2
   147e9:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   147ed:	c5 fb 92 c8          	kmovd  %eax,%k1
   147f1:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   147f7:	e9 21 02 00 00       	jmp    14a1d <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7fd>
   147fc:	49 8d 41 16          	lea    0x16(%r9),%rax
   14800:	48 83 f8 2d          	cmp    $0x2d,%rax
   14804:	0f 92 c0             	setb   %al
   14807:	20 c3                	and    %al,%bl
   14809:	80 fb 01             	cmp    $0x1,%bl
   1480c:	75 33                	jne    14841 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x621>
   1480e:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   14815:	ff 1f 00 
   14818:	48 ff c0             	inc    %rax
   1481b:	48 39 c5             	cmp    %rax,%rbp
   1481e:	77 56                	ja     14876 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   14820:	62 f1 df 08 7b cd    	vcvtusi2sd %rbp,%xmm4,%xmm1
   14826:	4d 85 c9             	test   %r9,%r9
   14829:	0f 88 51 04 00 00    	js     14c80 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa60>
   1482f:	48 8d 05 2a 10 04 00 	lea    0x4102a(%rip),%rax        # 55860 <FFC_DOUBLE_POWERS_OF_TEN>
   14836:	c4 a1 73 59 14 c8    	vmulsd (%rax,%r9,8),%xmm1,%xmm2
   1483c:	e9 51 04 00 00       	jmp    14c92 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa72>
   14841:	31 c0                	xor    %eax,%eax
   14843:	48 85 ed             	test   %rbp,%rbp
   14846:	44 89 eb             	mov    %r13d,%ebx
   14849:	0f 84 d9 03 00 00    	je     14c28 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa08>
   1484f:	be 00 00 00 00       	mov    $0x0,%esi
   14854:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   1485b:	0f 8c 65 01 00 00    	jl     149c6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a6>
   14861:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   14868:	7e 0c                	jle    14876 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   1486a:	be ff 07 00 00       	mov    $0x7ff,%esi
   1486f:	31 c0                	xor    %eax,%eax
   14871:	e9 4d 01 00 00       	jmp    149c3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   14876:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
   1487b:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
   14880:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
   14887:	00 
   14888:	48 98                	cltq
   1488a:	48 8d 1d bf 10 04 00 	lea    0x410bf(%rip),%rbx        # 55950 <FFC_POWERS_OF_FIVE>
   14891:	c4 62 fb f6 04 c3    	mulx   (%rbx,%rax,8),%rax,%r8
   14897:	45 89 c2             	mov    %r8d,%r10d
   1489a:	41 f7 d2             	not    %r10d
   1489d:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   148a4:	75 1b                	jne    148c1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6a1>
   148a6:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   148aa:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   148b1:	4d 63 d2             	movslq %r10d,%r10
   148b4:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   148ba:	48 01 d0             	add    %rdx,%rax
   148bd:	49 83 d0 00          	adc    $0x0,%r8
   148c1:	4d 89 c2             	mov    %r8,%r10
   148c4:	49 c1 ea 3f          	shr    $0x3f,%r10
   148c8:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   148cf:	c1 fa 10             	sar    $0x10,%edx
   148d2:	29 f2                	sub    %esi,%edx
   148d4:	42 8d 34 12          	lea    (%rdx,%r10,1),%esi
   148d8:	83 c6 3f             	add    $0x3f,%esi
   148db:	49 83 c2 09          	add    $0x9,%r10
   148df:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
   148e4:	81 fe 01 fc ff ff    	cmp    $0xfffffc01,%esi
   148ea:	7f 15                	jg     14901 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6e1>
   148ec:	81 fe c3 fb ff ff    	cmp    $0xfffffbc3,%esi
   148f2:	0f 83 9e 00 00 00    	jae    14996 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x776>
   148f8:	31 c0                	xor    %eax,%eax
   148fa:	31 f6                	xor    %esi,%esi
   148fc:	e9 c2 00 00 00       	jmp    149c3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   14901:	89 d3                	mov    %edx,%ebx
   14903:	83 e3 03             	and    $0x3,%ebx
   14906:	48 83 f3 01          	xor    $0x1,%rbx
   1490a:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
   1490f:	4d 31 c2             	xor    %r8,%r10
   14912:	49 89 d0             	mov    %rdx,%r8
   14915:	49 bf fc ff ff ff ff 	movabs $0xfffffffffffffc,%r15
   1491c:	ff ff 00 
   1491f:	4d 21 f8             	and    %r15,%r8
   14922:	49 09 da             	or     %rbx,%r10
   14925:	4c 0f 45 c2          	cmovne %rdx,%r8
   14929:	4d 8d 51 04          	lea    0x4(%r9),%r10
   1492d:	48 83 f8 02          	cmp    $0x2,%rax
   14931:	4c 0f 43 c2          	cmovae %rdx,%r8
   14935:	49 83 fa 1c          	cmp    $0x1c,%r10
   14939:	4c 0f 43 c2          	cmovae %rdx,%r8
   1493d:	44 89 c2             	mov    %r8d,%edx
   14940:	83 e2 01             	and    $0x1,%edx
   14943:	4c 01 c2             	add    %r8,%rdx
   14946:	48 89 d0             	mov    %rdx,%rax
   14949:	48 d1 e8             	shr    $1,%rax
   1494c:	49 b8 ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r8
   14953:	ff ef 7f 
   14956:	4c 21 c0             	and    %r8,%rax
   14959:	49 b8 00 00 00 00 00 	movabs $0x40000000000000,%r8
   14960:	00 40 00 
   14963:	4c 39 c2             	cmp    %r8,%rdx
   14966:	83 de 00             	sbb    $0x0,%esi
   14969:	81 c6 00 04 00 00    	add    $0x400,%esi
   1496f:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   14975:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   1497b:	49 0f 43 c2          	cmovae %r10,%rax
   1497f:	4c 39 c2             	cmp    %r8,%rdx
   14982:	49 0f 43 c2          	cmovae %r10,%rax
   14986:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   1498c:	ba ff 07 00 00       	mov    $0x7ff,%edx
   14991:	0f 43 f2             	cmovae %edx,%esi
   14994:	eb 2d                	jmp    149c3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   14996:	b8 02 fc ff ff       	mov    $0xfffffc02,%eax
   1499b:	29 f0                	sub    %esi,%eax
   1499d:	c4 62 fb f7 c2       	shrx   %rax,%rdx,%r8
   149a2:	48 0f a3 c2          	bt     %rax,%rdx
   149a6:	49 83 d0 00          	adc    $0x0,%r8
   149aa:	4c 89 c0             	mov    %r8,%rax
   149ad:	48 d1 e8             	shr    $1,%rax
   149b0:	31 f6                	xor    %esi,%esi
   149b2:	48 ba ff ff ff ff ff 	movabs $0x1fffffffffffff,%rdx
   149b9:	ff 1f 00 
   149bc:	49 39 d0             	cmp    %rdx,%r8
   149bf:	40 0f 97 c6          	seta   %sil
   149c3:	44 89 eb             	mov    %r13d,%ebx
   149c6:	84 c9                	test   %cl,%cl
   149c8:	0f 84 64 02 00 00    	je     14c32 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa12>
   149ce:	45 31 c0             	xor    %r8d,%r8d
   149d1:	49 89 ea             	mov    %rbp,%r10
   149d4:	49 ff c2             	inc    %r10
   149d7:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   149dc:	74 4e                	je     14a2c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x80c>
   149de:	ba 00 00 00 00       	mov    $0x0,%edx
   149e3:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   149ea:	7c 42                	jl     14a2e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x80e>
   149ec:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   149f3:	0f 8e 9d 01 00 00    	jle    14b96 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x976>
   149f9:	ba ff 07 00 00       	mov    $0x7ff,%edx
   149fe:	45 31 c0             	xor    %r8d,%r8d
   14a01:	4c 39 c0             	cmp    %r8,%rax
   14a04:	74 2d                	je     14a33 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x813>
   14a06:	eb 33                	jmp    14a3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   14a08:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14a0c:	0f 94 c0             	sete   %al
   14a0f:	c5 fb 92 c8          	kmovd  %eax,%k1
   14a13:	62 f1 ff 89 10 15 a3 	vmovsd 0x439a3(%rip),%xmm2{%k1}{z}        # 583c0 <fast_float::powers_of_ten_uint64+0xb0>
   14a1a:	39 04 00 
   14a1d:	31 d2                	xor    %edx,%edx
   14a1f:	44 89 eb             	mov    %r13d,%ebx
   14a22:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   14a27:	e9 74 03 00 00       	jmp    14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14a2c:	31 d2                	xor    %edx,%edx
   14a2e:	4c 39 c0             	cmp    %r8,%rax
   14a31:	75 08                	jne    14a3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   14a33:	39 d6                	cmp    %edx,%esi
   14a35:	0f 84 fc 01 00 00    	je     14c37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   14a3b:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
   14a40:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
   14a45:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
   14a4c:	00 
   14a4d:	48 98                	cltq
   14a4f:	48 8d 35 fa 0e 04 00 	lea    0x40efa(%rip),%rsi        # 55950 <FFC_POWERS_OF_FIVE>
   14a56:	c4 e2 cb f6 04 c6    	mulx   (%rsi,%rax,8),%rsi,%rax
   14a5c:	41 89 c2             	mov    %eax,%r10d
   14a5f:	41 f7 d2             	not    %r10d
   14a62:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   14a69:	75 28                	jne    14a93 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x873>
   14a6b:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   14a6f:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   14a76:	4d 63 d2             	movslq %r10d,%r10
   14a79:	41 89 df             	mov    %ebx,%r15d
   14a7c:	48 8d 1d cd 0e 04 00 	lea    0x40ecd(%rip),%rbx        # 55950 <FFC_POWERS_OF_FIVE>
   14a83:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   14a89:	44 89 fb             	mov    %r15d,%ebx
   14a8c:	48 01 f2             	add    %rsi,%rdx
   14a8f:	48 83 d0 00          	adc    $0x0,%rax
   14a93:	48 89 c2             	mov    %rax,%rdx
   14a96:	48 c1 ea 3f          	shr    $0x3f,%rdx
   14a9a:	83 f2 01             	xor    $0x1,%edx
   14a9d:	c4 e2 e9 f7 c0       	shlx   %rdx,%rax,%rax
   14aa2:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
   14aa9:	c1 fe 10             	sar    $0x10,%esi
   14aac:	44 01 c2             	add    %r8d,%edx
   14aaf:	29 d6                	sub    %edx,%esi
   14ab1:	8d 96 72 04 00 00    	lea    0x472(%rsi),%edx
   14ab7:	81 c6 34 84 ff ff    	add    $0xffff8434,%esi
   14abd:	81 fa 3d 80 00 00    	cmp    $0x803d,%edx
   14ac3:	0f 8f 6e 01 00 00    	jg     14c37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   14ac9:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   14ad0:	00 
   14ad1:	48 89 ac 24 98 00 00 	mov    %rbp,0x98(%rsp)
   14ad8:	00 
   14ad9:	4c 89 9c 24 a0 00 00 	mov    %r11,0xa0(%rsp)
   14ae0:	00 
   14ae1:	0f b6 54 24 57       	movzbl 0x57(%rsp),%edx
   14ae6:	88 94 24 a8 00 00 00 	mov    %dl,0xa8(%rsp)
   14aed:	c6 84 24 a9 00 00 00 	movb   $0x1,0xa9(%rsp)
   14af4:	01 
   14af5:	88 8c 24 aa 00 00 00 	mov    %cl,0xaa(%rsp)
   14afc:	48 8d 8c 24 ab 00 00 	lea    0xab(%rsp),%rcx
   14b03:	00 
   14b04:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
   14b08:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
   14b0e:	48 89 bc 24 b0 00 00 	mov    %rdi,0xb0(%rsp)
   14b15:	00 
   14b16:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   14b1b:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
   14b22:	00 
   14b23:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   14b28:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   14b2f:	00 
   14b30:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   14b37:	00 
   14b38:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   14b3f:	00 
   14b40:	48 c7 84 24 d0 00 00 	movq   $0x0,0xd0(%rsp)
   14b47:	00 00 00 00 00 
   14b4c:	62 f1 fd 48 10 8c 24 	vmovupd 0x90(%rsp),%zmm1
   14b53:	90 00 00 00 
   14b57:	62 f1 fd 48 11 0c 24 	vmovupd %zmm1,(%rsp)
   14b5e:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
   14b65:	00 00 
   14b67:	48 89 c7             	mov    %rax,%rdi
   14b6a:	ba 01 00 00 00       	mov    $0x1,%edx
   14b6f:	c5 fb 11 44 24 60    	vmovsd %xmm0,0x60(%rsp)
   14b75:	c5 f9 29 5c 24 70    	vmovapd %xmm3,0x70(%rsp)
   14b7b:	c5 f8 77             	vzeroupper
   14b7e:	e8 1d 48 00 00       	call   193a0 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   14b83:	c5 f9 28 5c 24 70    	vmovapd 0x70(%rsp),%xmm3
   14b89:	c5 fb 10 44 24 60    	vmovsd 0x60(%rsp),%xmm0
   14b8f:	89 d6                	mov    %edx,%esi
   14b91:	e9 a1 00 00 00       	jmp    14c37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   14b96:	f3 49 0f bd da       	lzcnt  %r10,%rbx
   14b9b:	c4 c2 e1 f7 d2       	shlx   %rbx,%r10,%rdx
   14ba0:	46 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%r8d
   14ba7:	00 
   14ba8:	4d 63 c0             	movslq %r8d,%r8
   14bab:	4c 8d 2d 9e 0d 04 00 	lea    0x40d9e(%rip),%r13        # 55950 <FFC_POWERS_OF_FIVE>
   14bb2:	c4 02 bb f6 54 c5 00 	mulx   0x0(%r13,%r8,8),%r8,%r10
   14bb9:	45 89 d7             	mov    %r10d,%r15d
   14bbc:	41 f7 d7             	not    %r15d
   14bbf:	41 f7 c7 ff 01 00 00 	test   $0x1ff,%r15d
   14bc6:	75 1c                	jne    14be4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9c4>
   14bc8:	47 8d 3c 09          	lea    (%r9,%r9,1),%r15d
   14bcc:	41 81 c7 ad 02 00 00 	add    $0x2ad,%r15d
   14bd3:	4d 63 ff             	movslq %r15d,%r15
   14bd6:	c4 82 eb f6 54 fd 00 	mulx   0x0(%r13,%r15,8),%rdx,%rdx
   14bdd:	49 01 d0             	add    %rdx,%r8
   14be0:	49 83 d2 00          	adc    $0x0,%r10
   14be4:	4d 89 d5             	mov    %r10,%r13
   14be7:	49 c1 ed 3f          	shr    $0x3f,%r13
   14beb:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   14bf2:	c1 fa 10             	sar    $0x10,%edx
   14bf5:	29 da                	sub    %ebx,%edx
   14bf7:	44 01 ea             	add    %r13d,%edx
   14bfa:	83 c2 3f             	add    $0x3f,%edx
   14bfd:	49 83 c5 09          	add    $0x9,%r13
   14c01:	c4 c2 93 f7 da       	shrx   %r13,%r10,%rbx
   14c06:	81 fa 01 fc ff ff    	cmp    $0xfffffc01,%edx
   14c0c:	0f 8f d7 01 00 00    	jg     14de9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbc9>
   14c12:	81 fa c3 fb ff ff    	cmp    $0xfffffbc3,%edx
   14c18:	0f 83 73 02 00 00    	jae    14e91 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc71>
   14c1e:	45 31 c0             	xor    %r8d,%r8d
   14c21:	31 d2                	xor    %edx,%edx
   14c23:	e9 97 02 00 00       	jmp    14ebf <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc9f>
   14c28:	31 f6                	xor    %esi,%esi
   14c2a:	84 c9                	test   %cl,%cl
   14c2c:	0f 85 9c fd ff ff    	jne    149ce <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7ae>
   14c32:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   14c37:	31 c9                	xor    %ecx,%ecx
   14c39:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14c3d:	0f 94 c1             	sete   %cl
   14c40:	48 89 f2             	mov    %rsi,%rdx
   14c43:	48 c1 e2 34          	shl    $0x34,%rdx
   14c47:	48 c1 e1 3f          	shl    $0x3f,%rcx
   14c4b:	48 09 c2             	or     %rax,%rdx
   14c4e:	48 09 ca             	or     %rcx,%rdx
   14c51:	c4 e1 f9 6e d2       	vmovq  %rdx,%xmm2
   14c56:	48 85 ed             	test   %rbp,%rbp
   14c59:	0f 95 c1             	setne  %cl
   14c5c:	48 85 c0             	test   %rax,%rax
   14c5f:	0f 94 c0             	sete   %al
   14c62:	85 f6                	test   %esi,%esi
   14c64:	0f 94 c2             	sete   %dl
   14c67:	20 c2                	and    %al,%dl
   14c69:	20 ca                	and    %cl,%dl
   14c6b:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   14c71:	0f 94 c0             	sete   %al
   14c74:	08 d0                	or     %dl,%al
   14c76:	0f b6 d0             	movzbl %al,%edx
   14c79:	01 d2                	add    %edx,%edx
   14c7b:	e9 20 01 00 00       	jmp    14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14c80:	49 c1 e1 03          	shl    $0x3,%r9
   14c84:	48 8d 05 d5 0b 04 00 	lea    0x40bd5(%rip),%rax        # 55860 <FFC_DOUBLE_POWERS_OF_TEN>
   14c8b:	4c 29 c8             	sub    %r9,%rax
   14c8e:	c5 f3 5e 10          	vdivsd (%rax),%xmm1,%xmm2
   14c92:	44 89 eb             	mov    %r13d,%ebx
   14c95:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14c99:	0f 94 c0             	sete   %al
   14c9c:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   14ca0:	c5 fb 92 c8          	kmovd  %eax,%k1
   14ca4:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   14caa:	31 d2                	xor    %edx,%edx
   14cac:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   14cb1:	e9 ea 00 00 00       	jmp    14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14cb6:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
   14cbd:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
   14cc1:	41 c1 e8 08          	shr    $0x8,%r8d
   14cc5:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
   14cc9:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
   14cd0:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
   14cd7:	c1 ed 10             	shr    $0x10,%ebp
   14cda:	4c 01 cd             	add    %r9,%rbp
   14cdd:	49 83 c3 04          	add    $0x4,%r11
   14ce1:	44 89 eb             	mov    %r13d,%ebx
   14ce4:	49 39 c3             	cmp    %rax,%r11
   14ce7:	0f 85 47 f8 ff ff    	jne    14534 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x314>
   14ced:	49 89 c3             	mov    %rax,%r11
   14cf0:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   14cf5:	4d 89 c1             	mov    %r8,%r9
   14cf8:	4d 29 d9             	sub    %r11,%r9
   14cfb:	4d 89 df             	mov    %r11,%r15
   14cfe:	4d 29 c7             	sub    %r8,%r15
   14d01:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   14d06:	4d 29 c8             	sub    %r9,%r8
   14d09:	4d 89 da             	mov    %r11,%r10
   14d0c:	4d 85 c0             	test   %r8,%r8
   14d0f:	0f 85 df f8 ff ff    	jne    145f4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>
   14d15:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14d19:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   14d1e:	75 03                	jne    14d23 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb03>
   14d20:	48 ff c6             	inc    %rsi
   14d23:	48 29 f0             	sub    %rsi,%rax
   14d26:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   14d2a:	ba 01 00 00 00       	mov    $0x1,%edx
   14d2f:	48 83 f8 03          	cmp    $0x3,%rax
   14d33:	7c 6b                	jl     14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14d35:	0f b7 0e             	movzwl (%rsi),%ecx
   14d38:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   14d3c:	c1 e0 10             	shl    $0x10,%eax
   14d3f:	48 09 c8             	or     %rcx,%rax
   14d42:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
   14d49:	20 20 20 
   14d4c:	48 09 c8             	or     %rcx,%rax
   14d4f:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
   14d56:	20 20 20 
   14d59:	48 39 c8             	cmp    %rcx,%rax
   14d5c:	74 21                	je     14d7f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb5f>
   14d5e:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
   14d65:	20 20 20 
   14d68:	48 39 c8             	cmp    %rcx,%rax
   14d6b:	75 33                	jne    14da0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   14d6d:	31 c0                	xor    %eax,%eax
   14d6f:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14d73:	0f 94 c0             	sete   %al
   14d76:	48 8d 0d f3 c2 03 00 	lea    0x3c2f3(%rip),%rcx        # 51070 <_IO_stdin_used+0x70>
   14d7d:	eb 10                	jmp    14d8f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb6f>
   14d7f:	31 c0                	xor    %eax,%eax
   14d81:	41 80 fc 2d          	cmp    $0x2d,%r12b
   14d85:	0f 94 c0             	sete   %al
   14d88:	48 8d 0d d1 c2 03 00 	lea    0x3c2d1(%rip),%rcx        # 51060 <_IO_stdin_used+0x60>
   14d8f:	c5 fb 10 14 c1       	vmovsd (%rcx,%rax,8),%xmm2
   14d94:	31 d2                	xor    %edx,%edx
   14d96:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14d9d:	00 00 00 
   14da0:	85 d2                	test   %edx,%edx
   14da2:	0f 84 b8 f4 ff ff    	je     14260 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   14da8:	84 db                	test   %bl,%bl
   14daa:	0f 85 b0 f4 ff ff    	jne    14260 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   14db0:	e9 37 01 00 00       	jmp    14eec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xccc>
   14db5:	48 89 f3             	mov    %rsi,%rbx
   14db8:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   14dbd:	4c 8b 5c 24 68       	mov    0x68(%rsp),%r11
   14dc2:	48 89 ce             	mov    %rcx,%rsi
   14dc5:	48 f7 de             	neg    %rsi
   14dc8:	41 80 fb 2d          	cmp    $0x2d,%r11b
   14dcc:	48 0f 45 f1          	cmovne %rcx,%rsi
   14dd0:	49 01 f1             	add    %rsi,%r9
   14dd3:	49 89 db             	mov    %rbx,%r11
   14dd6:	b3 01                	mov    $0x1,%bl
   14dd8:	31 c9                	xor    %ecx,%ecx
   14dda:	49 83 f8 14          	cmp    $0x14,%r8
   14dde:	0f 8c d0 f9 ff ff    	jl     147b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   14de4:	e9 c3 f8 ff ff       	jmp    146ac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x48c>
   14de9:	41 89 df             	mov    %ebx,%r15d
   14dec:	41 83 e7 03          	and    $0x3,%r15d
   14df0:	49 83 f7 01          	xor    $0x1,%r15
   14df4:	c4 62 91 f7 eb       	shlx   %r13,%rbx,%r13
   14df9:	4d 31 d5             	xor    %r10,%r13
   14dfc:	49 89 da             	mov    %rbx,%r10
   14dff:	4c 89 44 24 68       	mov    %r8,0x68(%rsp)
   14e04:	49 b8 fc ff ff ff ff 	movabs $0xfffffffffffffc,%r8
   14e0b:	ff ff 00 
   14e0e:	4d 21 c2             	and    %r8,%r10
   14e11:	4d 09 fd             	or     %r15,%r13
   14e14:	4c 0f 45 d3          	cmovne %rbx,%r10
   14e18:	4d 8d 79 04          	lea    0x4(%r9),%r15
   14e1c:	48 83 7c 24 68 02    	cmpq   $0x2,0x68(%rsp)
   14e22:	4c 0f 43 d3          	cmovae %rbx,%r10
   14e26:	49 83 ff 1c          	cmp    $0x1c,%r15
   14e2a:	4c 0f 43 d3          	cmovae %rbx,%r10
   14e2e:	44 89 d3             	mov    %r10d,%ebx
   14e31:	83 e3 01             	and    $0x1,%ebx
   14e34:	4c 01 d3             	add    %r10,%rbx
   14e37:	49 89 d8             	mov    %rbx,%r8
   14e3a:	49 d1 e8             	shr    $1,%r8
   14e3d:	49 ba ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r10
   14e44:	ff ef 7f 
   14e47:	4d 21 d0             	and    %r10,%r8
   14e4a:	49 ba 00 00 00 00 00 	movabs $0x40000000000000,%r10
   14e51:	00 40 00 
   14e54:	4c 39 d3             	cmp    %r10,%rbx
   14e57:	83 da 00             	sbb    $0x0,%edx
   14e5a:	81 c2 00 04 00 00    	add    $0x400,%edx
   14e60:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   14e66:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   14e6c:	4d 0f 43 c7          	cmovae %r15,%r8
   14e70:	4c 39 d3             	cmp    %r10,%rbx
   14e73:	4d 0f 43 c7          	cmovae %r15,%r8
   14e77:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   14e7d:	41 ba ff 07 00 00    	mov    $0x7ff,%r10d
   14e83:	41 0f 43 d2          	cmovae %r10d,%edx
   14e87:	eb 36                	jmp    14ebf <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc9f>
   14e89:	4d 89 c3             	mov    %r8,%r11
   14e8c:	e9 5f fe ff ff       	jmp    14cf0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   14e91:	41 b8 02 fc ff ff    	mov    $0xfffffc02,%r8d
   14e97:	41 29 d0             	sub    %edx,%r8d
   14e9a:	c4 62 bb f7 d3       	shrx   %r8,%rbx,%r10
   14e9f:	4c 0f a3 c3          	bt     %r8,%rbx
   14ea3:	49 83 d2 00          	adc    $0x0,%r10
   14ea7:	4d 89 d0             	mov    %r10,%r8
   14eaa:	49 d1 e8             	shr    $1,%r8
   14ead:	31 d2                	xor    %edx,%edx
   14eaf:	48 bb ff ff ff ff ff 	movabs $0x1fffffffffffff,%rbx
   14eb6:	ff 1f 00 
   14eb9:	49 39 da             	cmp    %rbx,%r10
   14ebc:	0f 97 c2             	seta   %dl
   14ebf:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
   14ec3:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   14ec8:	4c 39 c0             	cmp    %r8,%rax
   14ecb:	0f 84 62 fb ff ff    	je     14a33 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x813>
   14ed1:	e9 65 fb ff ff       	jmp    14a3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   14ed6:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   14eda:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   14ee1:	5b                   	pop    %rbx
   14ee2:	41 5c                	pop    %r12
   14ee4:	41 5d                	pop    %r13
   14ee6:	41 5e                	pop    %r14
   14ee8:	41 5f                	pop    %r15
   14eea:	5d                   	pop    %rbp
   14eeb:	c3                   	ret
   14eec:	bf 10 00 00 00       	mov    $0x10,%edi
   14ef1:	e8 8a 12 ff ff       	call   6180 <__cxa_allocate_exception@plt>
   14ef6:	48 89 c3             	mov    %rax,%rbx
   14ef9:	48 8d 35 ca 3a 04 00 	lea    0x43aca(%rip),%rsi        # 589ca <fast_float::powers_of_ten_uint64+0x6ba>
   14f00:	48 89 c7             	mov    %rax,%rdi
   14f03:	e8 18 12 ff ff       	call   6120 <std::runtime_error::runtime_error(char const*)@plt>
   14f08:	48 8b 35 c1 90 05 00 	mov    0x590c1(%rip),%rsi        # 6dfd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
   14f0f:	48 8b 15 4a 90 05 00 	mov    0x5904a(%rip),%rdx        # 6df60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
   14f16:	48 89 df             	mov    %rbx,%rdi
   14f19:	e8 22 16 ff ff       	call   6540 <__cxa_throw@plt>
   14f1e:	49 89 c6             	mov    %rax,%r14
   14f21:	48 89 df             	mov    %rbx,%rdi
   14f24:	e8 47 13 ff ff       	call   6270 <__cxa_free_exception@plt>
   14f29:	4c 89 f7             	mov    %r14,%rdi
   14f2c:	e8 1f 16 ff ff       	call   6550 <_Unwind_Resume@plt>
   14f31:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   14f38:	0f 1f 84 00 00 00 00 
   14f3f:	00 

