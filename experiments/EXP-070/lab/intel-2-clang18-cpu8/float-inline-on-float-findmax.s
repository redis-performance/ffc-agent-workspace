000000000000d4c0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    d4c0:	55                   	push   %rbp
    d4c1:	41 57                	push   %r15
    d4c3:	41 56                	push   %r14
    d4c5:	41 55                	push   %r13
    d4c7:	41 54                	push   %r12
    d4c9:	53                   	push   %rbx
    d4ca:	48 81 ec c8 00 00 00 	sub    $0xc8,%rsp
    d4d1:	48 8b 1f             	mov    (%rdi),%rbx
    d4d4:	4c 8b 67 08          	mov    0x8(%rdi),%r12
    d4d8:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    d4dc:	4c 39 e3             	cmp    %r12,%rbx
    d4df:	0f 84 b0 0b 00 00    	je     e095 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbd5>
    d4e5:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
    d4ea:	eb 30                	jmp    d51c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5c>
    d4ec:	0f 1f 40 00          	nopl   0x0(%rax)
    d4f0:	31 f6                	xor    %esi,%esi
    d4f2:	41 80 fd 2d          	cmp    $0x2d,%r13b
    d4f6:	40 0f 95 c6          	setne  %sil
    d4fa:	c1 e6 1f             	shl    $0x1f,%esi
    d4fd:	81 c6 00 00 80 ff    	add    $0xff800000,%esi
    d503:	c5 f9 6e ce          	vmovd  %esi,%xmm1
    d507:	c5 f2 5a c9          	vcvtss2sd %xmm1,%xmm1,%xmm1
    d50b:	c5 fb 5f c1          	vmaxsd %xmm1,%xmm0,%xmm0
    d50f:	48 83 c3 20          	add    $0x20,%rbx
    d513:	4c 39 e3             	cmp    %r12,%rbx
    d516:	0f 84 79 0b 00 00    	je     e095 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbd5>
    d51c:	4c 8b 73 08          	mov    0x8(%rbx),%r14
    d520:	4d 85 f6             	test   %r14,%r14
    d523:	0f 84 7e 0b 00 00    	je     e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe7>
    d529:	48 8b 33             	mov    (%rbx),%rsi
    d52c:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
    d530:	44 0f b6 2e          	movzbl (%rsi),%r13d
    d534:	48 89 f7             	mov    %rsi,%rdi
    d537:	44 89 e9             	mov    %r13d,%ecx
    d53a:	41 80 fd 2d          	cmp    $0x2d,%r13b
    d53e:	41 0f 94 c2          	sete   %r10b
    d542:	75 2c                	jne    d570 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb0>
    d544:	49 83 fe 01          	cmp    $0x1,%r14
    d548:	0f 84 88 09 00 00    	je     ded6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa16>
    d54e:	0f be 4e 01          	movsbl 0x1(%rsi),%ecx
    d552:	83 f9 2e             	cmp    $0x2e,%ecx
    d555:	74 0c                	je     d563 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa3>
    d557:	8d 51 d0             	lea    -0x30(%rcx),%edx
    d55a:	83 fa 09             	cmp    $0x9,%edx
    d55d:	0f 87 73 09 00 00    	ja     ded6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa16>
    d563:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
    d567:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    d56e:	00 00 
    d570:	48 39 c7             	cmp    %rax,%rdi
    d573:	44 88 54 24 57       	mov    %r10b,0x57(%rsp)
    d578:	0f 84 02 01 00 00    	je     d680 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c0>
    d57e:	0f be d1             	movsbl %cl,%edx
    d581:	83 c2 d0             	add    $0xffffffd0,%edx
    d584:	83 fa 09             	cmp    $0x9,%edx
    d587:	0f 87 12 01 00 00    	ja     d69f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1df>
    d58d:	48 8d 57 01          	lea    0x1(%rdi),%rdx
    d591:	48 0f be e9          	movsbq %cl,%rbp
    d595:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d599:	48 39 c2             	cmp    %rax,%rdx
    d59c:	0f 84 e0 00 00 00    	je     d682 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c2>
    d5a2:	0f be 0a             	movsbl (%rdx),%ecx
    d5a5:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d5a9:	41 83 f8 09          	cmp    $0x9,%r8d
    d5ad:	0f 87 f1 00 00 00    	ja     d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d5b3:	48 63 c9             	movslq %ecx,%rcx
    d5b6:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
    d5bb:	48 8d 57 02          	lea    0x2(%rdi),%rdx
    d5bf:	4a 8d 6c 41 d0       	lea    -0x30(%rcx,%r8,2),%rbp
    d5c4:	48 39 c2             	cmp    %rax,%rdx
    d5c7:	0f 84 b5 00 00 00    	je     d682 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c2>
    d5cd:	0f be 0a             	movsbl (%rdx),%ecx
    d5d0:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d5d4:	41 83 f8 09          	cmp    $0x9,%r8d
    d5d8:	0f 87 c6 00 00 00    	ja     d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d5de:	48 63 c9             	movslq %ecx,%rcx
    d5e1:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
    d5e6:	48 8d 57 03          	lea    0x3(%rdi),%rdx
    d5ea:	4a 8d 6c 41 d0       	lea    -0x30(%rcx,%r8,2),%rbp
    d5ef:	48 39 c2             	cmp    %rax,%rdx
    d5f2:	0f 84 8a 00 00 00    	je     d682 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c2>
    d5f8:	0f be 0a             	movsbl (%rdx),%ecx
    d5fb:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d5ff:	41 83 f8 09          	cmp    $0x9,%r8d
    d603:	0f 87 9b 00 00 00    	ja     d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d609:	48 63 c9             	movslq %ecx,%rcx
    d60c:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
    d611:	48 8d 57 04          	lea    0x4(%rdi),%rdx
    d615:	4a 8d 6c 41 d0       	lea    -0x30(%rcx,%r8,2),%rbp
    d61a:	48 39 c2             	cmp    %rax,%rdx
    d61d:	74 63                	je     d682 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c2>
    d61f:	0f be 0a             	movsbl (%rdx),%ecx
    d622:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d626:	41 83 f8 09          	cmp    $0x9,%r8d
    d62a:	77 78                	ja     d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d62c:	48 63 c9             	movslq %ecx,%rcx
    d62f:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
    d634:	48 8d 57 05          	lea    0x5(%rdi),%rdx
    d638:	4a 8d 6c 41 d0       	lea    -0x30(%rcx,%r8,2),%rbp
    d63d:	48 39 c2             	cmp    %rax,%rdx
    d640:	74 40                	je     d682 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c2>
    d642:	4a 8d 0c 36          	lea    (%rsi,%r14,1),%rcx
    d646:	48 29 f9             	sub    %rdi,%rcx
    d649:	48 01 f9             	add    %rdi,%rcx
    d64c:	0f 1f 40 00          	nopl   0x0(%rax)
    d650:	44 0f be 02          	movsbl (%rdx),%r8d
    d654:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
    d658:	41 83 f9 09          	cmp    $0x9,%r9d
    d65c:	77 46                	ja     d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d65e:	4d 63 c0             	movslq %r8d,%r8
    d661:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
    d666:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
    d66b:	48 ff c2             	inc    %rdx
    d66e:	48 39 c2             	cmp    %rax,%rdx
    d671:	75 dd                	jne    d650 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x190>
    d673:	48 89 ca             	mov    %rcx,%rdx
    d676:	eb 2c                	jmp    d6a4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1e4>
    d678:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    d67f:	00 
    d680:	31 ed                	xor    %ebp,%ebp
    d682:	49 89 c0             	mov    %rax,%r8
    d685:	49 29 f8             	sub    %rdi,%r8
    d688:	48 89 c2             	mov    %rax,%rdx
    d68b:	49 89 c3             	mov    %rax,%r11
    d68e:	31 c9                	xor    %ecx,%ecx
    d690:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
    d695:	4c 89 44 24 78       	mov    %r8,0x78(%rsp)
    d69a:	e9 a2 01 00 00       	jmp    d841 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x381>
    d69f:	31 ed                	xor    %ebp,%ebp
    d6a1:	48 89 fa             	mov    %rdi,%rdx
    d6a4:	48 89 d1             	mov    %rdx,%rcx
    d6a7:	48 29 f9             	sub    %rdi,%rcx
    d6aa:	48 39 c2             	cmp    %rax,%rdx
    d6ad:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
    d6b2:	0f 84 76 01 00 00    	je     d82e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x36e>
    d6b8:	80 3a 2e             	cmpb   $0x2e,(%rdx)
    d6bb:	0f 85 72 01 00 00    	jne    d833 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x373>
    d6c1:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
    d6c5:	49 89 c0             	mov    %rax,%r8
    d6c8:	4d 29 d8             	sub    %r11,%r8
    d6cb:	49 83 f8 08          	cmp    $0x8,%r8
    d6cf:	4c 89 d9             	mov    %r11,%rcx
    d6d2:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
    d6d7:	0f 8c 95 00 00 00    	jl     d772 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2b2>
    d6dd:	0f 1f 00             	nopl   (%rax)
    d6e0:	4d 8b 0b             	mov    (%r11),%r9
    d6e3:	48 b9 46 46 46 46 46 	movabs $0x4646464646464646,%rcx
    d6ea:	46 46 46 
    d6ed:	4d 8d 14 09          	lea    (%r9,%rcx,1),%r10
    d6f1:	48 b9 d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rcx
    d6f8:	cf cf cf 
    d6fb:	49 01 c9             	add    %rcx,%r9
    d6fe:	4d 09 ca             	or     %r9,%r10
    d701:	48 b9 80 80 80 80 80 	movabs $0x8080808080808080,%rcx
    d708:	80 80 80 
    d70b:	49 85 ca             	test   %rcx,%r10
    d70e:	75 62                	jne    d772 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2b2>
    d710:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
    d717:	4f 8d 3c 89          	lea    (%r9,%r9,4),%r15
    d71b:	49 c1 e9 08          	shr    $0x8,%r9
    d71f:	4b 8d 2c 79          	lea    (%r9,%r15,2),%rbp
    d723:	49 89 e9             	mov    %rbp,%r9
    d726:	48 b9 ff 00 00 00 ff 	movabs $0xff000000ff,%rcx
    d72d:	00 00 00 
    d730:	49 21 c9             	and    %rcx,%r9
    d733:	49 bf 64 00 00 00 40 	movabs $0xf424000000064,%r15
    d73a:	42 0f 00 
    d73d:	4d 0f af cf          	imul   %r15,%r9
    d741:	48 c1 ed 10          	shr    $0x10,%rbp
    d745:	48 21 cd             	and    %rcx,%rbp
    d748:	48 b9 01 00 00 00 10 	movabs $0x271000000001,%rcx
    d74f:	27 00 00 
    d752:	48 0f af e9          	imul   %rcx,%rbp
    d756:	4c 01 cd             	add    %r9,%rbp
    d759:	48 c1 ed 20          	shr    $0x20,%rbp
    d75d:	4c 01 d5             	add    %r10,%rbp
    d760:	49 83 c3 08          	add    $0x8,%r11
    d764:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
    d768:	49 83 f8 07          	cmp    $0x7,%r8
    d76c:	0f 8f 6e ff ff ff    	jg     d6e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x220>
    d772:	49 83 f8 04          	cmp    $0x4,%r8
    d776:	7c 21                	jl     d799 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2d9>
    d778:	45 8b 03             	mov    (%r11),%r8d
    d77b:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
    d782:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
    d789:	45 09 c1             	or     %r8d,%r9d
    d78c:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
    d793:	0f 84 ce 06 00 00    	je     de67 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9a7>
    d799:	49 39 c3             	cmp    %rax,%r11
    d79c:	0f 84 f9 06 00 00    	je     de9b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9db>
    d7a2:	45 0f be 0b          	movsbl (%r11),%r9d
    d7a6:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
    d7aa:	41 83 f8 09          	cmp    $0x9,%r8d
    d7ae:	0f 87 ea 06 00 00    	ja     de9e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9de>
    d7b4:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
    d7b9:	4d 8d 43 01          	lea    0x1(%r11),%r8
    d7bd:	41 80 c1 d0          	add    $0xd0,%r9b
    d7c1:	45 0f b6 c9          	movzbl %r9b,%r9d
    d7c5:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
    d7c9:	49 39 c0             	cmp    %rax,%r8
    d7cc:	0f 84 c9 06 00 00    	je     de9b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9db>
    d7d2:	45 0f be 08          	movsbl (%r8),%r9d
    d7d6:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
    d7da:	41 83 fa 09          	cmp    $0x9,%r10d
    d7de:	0f 87 70 08 00 00    	ja     e054 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb94>
    d7e4:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
    d7e9:	4d 8d 43 02          	lea    0x2(%r11),%r8
    d7ed:	41 80 c1 d0          	add    $0xd0,%r9b
    d7f1:	45 0f b6 c9          	movzbl %r9b,%r9d
    d7f5:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
    d7f9:	49 39 c0             	cmp    %rax,%r8
    d7fc:	0f 84 99 06 00 00    	je     de9b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9db>
    d802:	45 0f be 08          	movsbl (%r8),%r9d
    d806:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
    d80a:	41 83 fa 09          	cmp    $0x9,%r10d
    d80e:	0f 87 40 08 00 00    	ja     e054 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb94>
    d814:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
    d819:	49 83 c3 03          	add    $0x3,%r11
    d81d:	41 80 c1 d0          	add    $0xd0,%r9b
    d821:	45 0f b6 c9          	movzbl %r9b,%r9d
    d825:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
    d829:	e9 70 06 00 00       	jmp    de9e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9de>
    d82e:	49 89 c3             	mov    %rax,%r11
    d831:	eb 03                	jmp    d836 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x376>
    d833:	49 89 d3             	mov    %rdx,%r11
    d836:	45 31 c0             	xor    %r8d,%r8d
    d839:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
    d83e:	49 89 c8             	mov    %rcx,%r8
    d841:	45 31 c9             	xor    %r9d,%r9d
    d844:	31 c9                	xor    %ecx,%ecx
    d846:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    d84b:	45 31 d2             	xor    %r10d,%r10d
    d84e:	4d 85 c0             	test   %r8,%r8
    d851:	0f 84 79 06 00 00    	je     ded0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa10>
    d857:	49 39 c3             	cmp    %rax,%r11
    d85a:	0f 84 89 00 00 00    	je     d8e9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x429>
    d860:	45 0f b6 3b          	movzbl (%r11),%r15d
    d864:	41 83 cf 20          	or     $0x20,%r15d
    d868:	41 83 ff 65          	cmp    $0x65,%r15d
    d86c:	0f 85 7a 00 00 00    	jne    d8ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x42c>
    d872:	4d 8d 63 01          	lea    0x1(%r11),%r12
    d876:	49 39 c4             	cmp    %rax,%r12
    d879:	74 71                	je     d8ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x42c>
    d87b:	45 0f b6 7b 01       	movzbl 0x1(%r11),%r15d
    d880:	49 8d 4b 02          	lea    0x2(%r11),%rcx
    d884:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
    d889:	41 83 c7 d5          	add    $0xffffffd5,%r15d
    d88d:	41 f6 c7 fd          	test   $0xfd,%r15b
    d891:	4c 0f 44 e1          	cmove  %rcx,%r12
    d895:	49 39 c4             	cmp    %rax,%r12
    d898:	74 52                	je     d8ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x42c>
    d89a:	41 0f be 0c 24       	movsbl (%r12),%ecx
    d89f:	83 c1 d0             	add    $0xffffffd0,%ecx
    d8a2:	83 f9 09             	cmp    $0x9,%ecx
    d8a5:	77 45                	ja     d8ec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x42c>
    d8a7:	4c 01 f6             	add    %r14,%rsi
    d8aa:	45 31 db             	xor    %r11d,%r11d
    d8ad:	eb 0d                	jmp    d8bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3fc>
    d8af:	90                   	nop
    d8b0:	49 ff c4             	inc    %r12
    d8b3:	49 39 c4             	cmp    %rax,%r12
    d8b6:	0f 84 82 06 00 00    	je     df3e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7e>
    d8bc:	45 0f be 34 24       	movsbl (%r12),%r14d
    d8c1:	41 8d 4e d0          	lea    -0x30(%r14),%ecx
    d8c5:	83 f9 09             	cmp    $0x9,%ecx
    d8c8:	0f 87 73 06 00 00    	ja     df41 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa81>
    d8ce:	49 81 fb ff ff ff 0f 	cmp    $0xfffffff,%r11
    d8d5:	7f d9                	jg     d8b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3f0>
    d8d7:	41 80 c6 d0          	add    $0xd0,%r14b
    d8db:	4b 8d 0c 9b          	lea    (%r11,%r11,4),%rcx
    d8df:	45 0f b6 de          	movzbl %r14b,%r11d
    d8e3:	4d 8d 1c 4b          	lea    (%r11,%rcx,2),%r11
    d8e7:	eb c7                	jmp    d8b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3f0>
    d8e9:	49 89 c3             	mov    %rax,%r11
    d8ec:	31 f6                	xor    %esi,%esi
    d8ee:	41 b4 01             	mov    $0x1,%r12b
    d8f1:	45 31 f6             	xor    %r14d,%r14d
    d8f4:	49 83 f8 14          	cmp    $0x14,%r8
    d8f8:	0f 8c df 00 00 00    	jl     d9dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x51d>
    d8fe:	48 39 c7             	cmp    %rax,%rdi
    d901:	74 3e                	je     d941 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x481>
    d903:	49 89 fe             	mov    %rdi,%r14
    d906:	eb 1c                	jmp    d924 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x464>
    d908:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    d90f:	00 
    d910:	31 c9                	xor    %ecx,%ecx
    d912:	41 80 ff 30          	cmp    $0x30,%r15b
    d916:	0f 94 c1             	sete   %cl
    d919:	49 29 c8             	sub    %rcx,%r8
    d91c:	49 ff c6             	inc    %r14
    d91f:	49 39 c6             	cmp    %rax,%r14
    d922:	74 10                	je     d934 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x474>
    d924:	45 0f b6 3e          	movzbl (%r14),%r15d
    d928:	41 83 ff 30          	cmp    $0x30,%r15d
    d92c:	74 e2                	je     d910 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x450>
    d92e:	41 83 ff 2e          	cmp    $0x2e,%r15d
    d932:	74 dc                	je     d910 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x450>
    d934:	45 31 f6             	xor    %r14d,%r14d
    d937:	49 83 f8 14          	cmp    $0x14,%r8
    d93b:	0f 8c 9c 00 00 00    	jl     d9dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x51d>
    d941:	48 39 d7             	cmp    %rdx,%rdi
    d944:	74 4d                	je     d993 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4d3>
    d946:	48 89 f8             	mov    %rdi,%rax
    d949:	31 ed                	xor    %ebp,%ebp
    d94b:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
    d952:	b6 e0 0d 
    d955:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    d95c:	00 00 00 00 
    d960:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
    d965:	4c 0f be 00          	movsbq (%rax),%r8
    d969:	49 8d 6c 48 d0       	lea    -0x30(%r8,%rcx,2),%rbp
    d96e:	48 ff c0             	inc    %rax
    d971:	4c 39 cd             	cmp    %r9,%rbp
    d974:	73 05                	jae    d97b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4bb>
    d976:	48 39 d0             	cmp    %rdx,%rax
    d979:	75 e5                	jne    d960 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4a0>
    d97b:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    d97f:	48 39 cd             	cmp    %rcx,%rbp
    d982:	77 4a                	ja     d9ce <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x50e>
    d984:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    d989:	4c 89 c0             	mov    %r8,%rax
    d98c:	4d 39 d0             	cmp    %r10,%r8
    d98f:	75 1f                	jne    d9b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4f0>
    d991:	eb 38                	jmp    d9cb <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x50b>
    d993:	31 ed                	xor    %ebp,%ebp
    d995:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
    d99c:	b6 e0 0d 
    d99f:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    d9a4:	4c 89 c0             	mov    %r8,%rax
    d9a7:	4d 39 d0             	cmp    %r10,%r8
    d9aa:	74 1f                	je     d9cb <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x50b>
    d9ac:	0f 1f 40 00          	nopl   0x0(%rax)
    d9b0:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
    d9b5:	48 0f be 10          	movsbq (%rax),%rdx
    d9b9:	48 8d 6c 4a d0       	lea    -0x30(%rdx,%rcx,2),%rbp
    d9be:	48 ff c0             	inc    %rax
    d9c1:	4c 39 cd             	cmp    %r9,%rbp
    d9c4:	73 05                	jae    d9cb <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x50b>
    d9c6:	4c 39 d0             	cmp    %r10,%rax
    d9c9:	75 e5                	jne    d9b0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4f0>
    d9cb:	4c 89 c2             	mov    %r8,%rdx
    d9ce:	48 29 c2             	sub    %rax,%rdx
    d9d1:	48 01 f2             	add    %rsi,%rdx
    d9d4:	41 b6 01             	mov    $0x1,%r14b
    d9d7:	45 31 e4             	xor    %r12d,%r12d
    d9da:	49 89 d1             	mov    %rdx,%r9
    d9dd:	45 84 e4             	test   %r12b,%r12b
    d9e0:	74 3b                	je     da1d <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x55d>
    d9e2:	4d 85 c9             	test   %r9,%r9
    d9e5:	75 36                	jne    da1d <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x55d>
    d9e7:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
    d9ee:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    d9f3:	0f 87 ab 00 00 00    	ja     daa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5e4>
    d9f9:	48 85 ed             	test   %rbp,%rbp
    d9fc:	0f 84 16 02 00 00    	je     dc18 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x758>
    da02:	62 f1 e6 08 7b cd    	vcvtusi2ss %rbp,%xmm3,%xmm1
    da08:	41 80 fd 2d          	cmp    $0x2d,%r13b
    da0c:	75 53                	jne    da61 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5a1>
    da0e:	c5 f9 7e ce          	vmovd  %xmm1,%esi
    da12:	81 c6 00 00 00 80    	add    $0x80000000,%esi
    da18:	e9 e6 fa ff ff       	jmp    d503 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    da1d:	49 8d 41 0a          	lea    0xa(%r9),%rax
    da21:	48 83 f8 15          	cmp    $0x15,%rax
    da25:	0f 92 c0             	setb   %al
    da28:	41 20 c4             	and    %al,%r12b
    da2b:	41 80 fc 01          	cmp    $0x1,%r12b
    da2f:	75 39                	jne    da6a <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5aa>
    da31:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
    da38:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    da3d:	77 65                	ja     daa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5e4>
    da3f:	62 f1 e6 08 7b cd    	vcvtusi2ss %rbp,%xmm3,%xmm1
    da45:	4d 85 c9             	test   %r9,%r9
    da48:	0f 88 f8 03 00 00    	js     de46 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x986>
    da4e:	48 8d 05 5b df 03 00 	lea    0x3df5b(%rip),%rax        # 4b9b0 <FFC_FLOAT_POWERS_OF_TEN>
    da55:	c4 a1 72 59 0c 88    	vmulss (%rax,%r9,4),%xmm1,%xmm1
    da5b:	41 80 fd 2d          	cmp    $0x2d,%r13b
    da5f:	74 ad                	je     da0e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x54e>
    da61:	c5 f9 7e ce          	vmovd  %xmm1,%esi
    da65:	e9 99 fa ff ff       	jmp    d503 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    da6a:	31 c0                	xor    %eax,%eax
    da6c:	48 85 ed             	test   %rbp,%rbp
    da6f:	0f 84 6c 03 00 00    	je     dde1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x921>
    da75:	be 00 00 00 00       	mov    $0x0,%esi
    da7a:	49 83 f9 c0          	cmp    $0xffffffffffffffc0,%r9
    da7e:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    da83:	0f 8c 57 01 00 00    	jl     dbe0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x720>
    da89:	49 83 f9 26          	cmp    $0x26,%r9
    da8d:	7e 15                	jle    daa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5e4>
    da8f:	be ff 00 00 00       	mov    $0xff,%esi
    da94:	31 c0                	xor    %eax,%eax
    da96:	45 84 f6             	test   %r14b,%r14b
    da99:	0f 85 4a 01 00 00    	jne    dbe9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x729>
    da9f:	e9 5c 03 00 00       	jmp    de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    daa4:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
    daa9:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
    daae:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
    dab5:	00 
    dab6:	48 98                	cltq
    dab8:	4c 8d 15 21 df 03 00 	lea    0x3df21(%rip),%r10        # 4b9e0 <FFC_POWERS_OF_FIVE>
    dabf:	c4 42 fb f6 04 c2    	mulx   (%r10,%rax,8),%rax,%r8
    dac5:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    dacc:	00 00 00 
    dacf:	c4 e2 b8 f2 c9       	andn   %rcx,%r8,%rcx
    dad4:	75 1a                	jne    daf0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x630>
    dad6:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    dada:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    dae0:	48 63 c9             	movslq %ecx,%rcx
    dae3:	c4 c2 f3 f6 0c ca    	mulx   (%r10,%rcx,8),%rcx,%rcx
    dae9:	48 01 c8             	add    %rcx,%rax
    daec:	49 83 d0 00          	adc    $0x0,%r8
    daf0:	4d 89 c2             	mov    %r8,%r10
    daf3:	49 c1 ea 3f          	shr    $0x3f,%r10
    daf7:	41 69 c9 6a 52 03 00 	imul   $0x3526a,%r9d,%ecx
    dafe:	c1 f9 10             	sar    $0x10,%ecx
    db01:	29 f1                	sub    %esi,%ecx
    db03:	42 8d 74 11 3f       	lea    0x3f(%rcx,%r10,1),%esi
    db08:	49 83 ca 26          	or     $0x26,%r10
    db0c:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
    db11:	83 fe 81             	cmp    $0xffffff81,%esi
    db14:	7f 1e                	jg     db34 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x674>
    db16:	81 fe 43 ff ff ff    	cmp    $0xffffff43,%esi
    db1c:	0f 83 98 00 00 00    	jae    dbba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6fa>
    db22:	31 c0                	xor    %eax,%eax
    db24:	31 f6                	xor    %esi,%esi
    db26:	45 84 f6             	test   %r14b,%r14b
    db29:	0f 85 ba 00 00 00    	jne    dbe9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x729>
    db2f:	e9 cc 02 00 00       	jmp    de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    db34:	49 8d 49 11          	lea    0x11(%r9),%rcx
    db38:	41 89 d7             	mov    %edx,%r15d
    db3b:	41 83 e7 03          	and    $0x3,%r15d
    db3f:	49 83 f7 01          	xor    $0x1,%r15
    db43:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
    db48:	4d 31 c2             	xor    %r8,%r10
    db4b:	41 89 d0             	mov    %edx,%r8d
    db4e:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    db52:	4d 09 fa             	or     %r15,%r10
    db55:	4c 0f 45 c2          	cmovne %rdx,%r8
    db59:	48 83 f8 02          	cmp    $0x2,%rax
    db5d:	4c 0f 43 c2          	cmovae %rdx,%r8
    db61:	48 83 f9 1c          	cmp    $0x1c,%rcx
    db65:	4c 0f 43 c2          	cmovae %rdx,%r8
    db69:	44 89 c1             	mov    %r8d,%ecx
    db6c:	83 e1 01             	and    $0x1,%ecx
    db6f:	4c 01 c1             	add    %r8,%rcx
    db72:	89 c8                	mov    %ecx,%eax
    db74:	d1 e8                	shr    $1,%eax
    db76:	25 ff ff 7f 03       	and    $0x37fffff,%eax
    db7b:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    db82:	83 de 00             	sbb    $0x0,%esi
    db85:	83 ee 80             	sub    $0xffffff80,%esi
    db88:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    db8e:	ba 00 00 00 00       	mov    $0x0,%edx
    db93:	48 0f 43 c2          	cmovae %rdx,%rax
    db97:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    db9e:	48 0f 43 c2          	cmovae %rdx,%rax
    dba2:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    dba8:	b9 ff 00 00 00       	mov    $0xff,%ecx
    dbad:	0f 43 f1             	cmovae %ecx,%esi
    dbb0:	45 84 f6             	test   %r14b,%r14b
    dbb3:	75 34                	jne    dbe9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x729>
    dbb5:	e9 46 02 00 00       	jmp    de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    dbba:	b8 82 ff ff ff       	mov    $0xffffff82,%eax
    dbbf:	29 f0                	sub    %esi,%eax
    dbc1:	c4 e2 fb f7 ca       	shrx   %rax,%rdx,%rcx
    dbc6:	48 0f a3 c2          	bt     %rax,%rdx
    dbca:	48 83 d1 00          	adc    $0x0,%rcx
    dbce:	89 c8                	mov    %ecx,%eax
    dbd0:	d1 e8                	shr    $1,%eax
    dbd2:	31 f6                	xor    %esi,%esi
    dbd4:	48 81 f9 00 00 00 01 	cmp    $0x1000000,%rcx
    dbdb:	40 0f 93 c6          	setae  %sil
    dbdf:	90                   	nop
    dbe0:	45 84 f6             	test   %r14b,%r14b
    dbe3:	0f 84 17 02 00 00    	je     de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    dbe9:	45 31 c0             	xor    %r8d,%r8d
    dbec:	49 89 ea             	mov    %rbp,%r10
    dbef:	49 ff c2             	inc    %r10
    dbf2:	74 36                	je     dc2a <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x76a>
    dbf4:	ba 00 00 00 00       	mov    $0x0,%edx
    dbf9:	49 83 f9 c0          	cmp    $0xffffffffffffffc0,%r9
    dbfd:	7c 2d                	jl     dc2c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x76c>
    dbff:	49 83 f9 26          	cmp    $0x26,%r9
    dc03:	0f 8e 7d 01 00 00    	jle    dd86 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x8c6>
    dc09:	ba ff 00 00 00       	mov    $0xff,%edx
    dc0e:	45 31 c0             	xor    %r8d,%r8d
    dc11:	4c 39 c0             	cmp    %r8,%rax
    dc14:	74 1b                	je     dc31 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x771>
    dc16:	eb 21                	jmp    dc39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x779>
    dc18:	31 f6                	xor    %esi,%esi
    dc1a:	41 80 fd 2d          	cmp    $0x2d,%r13b
    dc1e:	40 0f 94 c6          	sete   %sil
    dc22:	c1 e6 1f             	shl    $0x1f,%esi
    dc25:	e9 d9 f8 ff ff       	jmp    d503 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    dc2a:	31 d2                	xor    %edx,%edx
    dc2c:	4c 39 c0             	cmp    %r8,%rax
    dc2f:	75 08                	jne    dc39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x779>
    dc31:	39 d6                	cmp    %edx,%esi
    dc33:	0f 84 c7 01 00 00    	je     de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    dc39:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
    dc3e:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
    dc43:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
    dc4a:	00 
    dc4b:	48 98                	cltq
    dc4d:	48 8d 0d 8c dd 03 00 	lea    0x3dd8c(%rip),%rcx        # 4b9e0 <FFC_POWERS_OF_FIVE>
    dc54:	c4 e2 cb f6 04 c1    	mulx   (%rcx,%rax,8),%rsi,%rax
    dc5a:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    dc61:	00 00 00 
    dc64:	c4 e2 f8 f2 c9       	andn   %rcx,%rax,%rcx
    dc69:	75 21                	jne    dc8c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7cc>
    dc6b:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    dc6f:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    dc75:	48 63 c9             	movslq %ecx,%rcx
    dc78:	4c 8d 15 61 dd 03 00 	lea    0x3dd61(%rip),%r10        # 4b9e0 <FFC_POWERS_OF_FIVE>
    dc7f:	c4 c2 f3 f6 0c ca    	mulx   (%r10,%rcx,8),%rcx,%rcx
    dc85:	48 01 f1             	add    %rsi,%rcx
    dc88:	48 83 d0 00          	adc    $0x0,%rax
    dc8c:	48 89 c1             	mov    %rax,%rcx
    dc8f:	48 c1 e9 3f          	shr    $0x3f,%rcx
    dc93:	83 f1 01             	xor    $0x1,%ecx
    dc96:	c4 e2 f1 f7 c0       	shlx   %rcx,%rax,%rax
    dc9b:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
    dca2:	c1 fe 10             	sar    $0x10,%esi
    dca5:	44 01 c1             	add    %r8d,%ecx
    dca8:	29 ce                	sub    %ecx,%esi
    dcaa:	8d 8e d5 00 00 00    	lea    0xd5(%rsi),%ecx
    dcb0:	81 c6 97 80 ff ff    	add    $0xffff8097,%esi
    dcb6:	81 f9 3d 80 00 00    	cmp    $0x803d,%ecx
    dcbc:	0f 8f 3e 01 00 00    	jg     de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    dcc2:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
    dcc9:	00 
    dcca:	48 89 ac 24 88 00 00 	mov    %rbp,0x88(%rsp)
    dcd1:	00 
    dcd2:	4c 89 9c 24 90 00 00 	mov    %r11,0x90(%rsp)
    dcd9:	00 
    dcda:	0f b6 4c 24 57       	movzbl 0x57(%rsp),%ecx
    dcdf:	88 8c 24 98 00 00 00 	mov    %cl,0x98(%rsp)
    dce6:	c6 84 24 99 00 00 00 	movb   $0x1,0x99(%rsp)
    dced:	01 
    dcee:	44 88 b4 24 9a 00 00 	mov    %r14b,0x9a(%rsp)
    dcf5:	00 
    dcf6:	48 8d 8c 24 9b 00 00 	lea    0x9b(%rsp),%rcx
    dcfd:	00 
    dcfe:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
    dd02:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    dd08:	48 89 bc 24 a0 00 00 	mov    %rdi,0xa0(%rsp)
    dd0f:	00 
    dd10:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    dd15:	48 89 8c 24 a8 00 00 	mov    %rcx,0xa8(%rsp)
    dd1c:	00 
    dd1d:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    dd22:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
    dd29:	00 
    dd2a:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    dd2f:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
    dd36:	00 
    dd37:	48 c7 84 24 c0 00 00 	movq   $0x0,0xc0(%rsp)
    dd3e:	00 00 00 00 00 
    dd43:	c5 fc 10 94 24 80 00 	vmovups 0x80(%rsp),%ymm2
    dd4a:	00 00 
    dd4c:	c5 fb 11 44 24 58    	vmovsd %xmm0,0x58(%rsp)
    dd52:	c5 fc 10 8c 24 a0 00 	vmovups 0xa0(%rsp),%ymm1
    dd59:	00 00 
    dd5b:	c5 fc 11 4c 24 20    	vmovups %ymm1,0x20(%rsp)
    dd61:	c5 fc 11 14 24       	vmovups %ymm2,(%rsp)
    dd66:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
    dd6d:	00 00 
    dd6f:	48 89 c7             	mov    %rax,%rdi
    dd72:	31 d2                	xor    %edx,%edx
    dd74:	c5 f8 77             	vzeroupper
    dd77:	e8 b4 3a 00 00       	call   11830 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
    dd7c:	c5 fb 10 44 24 58    	vmovsd 0x58(%rsp),%xmm0
    dd82:	89 d6                	mov    %edx,%esi
    dd84:	eb 7a                	jmp    de00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x940>
    dd86:	f3 4d 0f bd fa       	lzcnt  %r10,%r15
    dd8b:	c4 c2 81 f7 d2       	shlx   %r15,%r10,%rdx
    dd90:	43 8d 8c 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%ecx
    dd97:	00 
    dd98:	48 63 c9             	movslq %ecx,%rcx
    dd9b:	4c 8d 05 3e dc 03 00 	lea    0x3dc3e(%rip),%r8        # 4b9e0 <FFC_POWERS_OF_FIVE>
    dda2:	c4 42 9b f6 14 c8    	mulx   (%r8,%rcx,8),%r12,%r10
    dda8:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    ddaf:	00 00 00 
    ddb2:	c4 e2 a8 f2 c9       	andn   %rcx,%r10,%rcx
    ddb7:	0f 85 b1 01 00 00    	jne    df6e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xaae>
    ddbd:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    ddc1:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    ddc7:	48 63 c9             	movslq %ecx,%rcx
    ddca:	c4 c2 f3 f6 0c c8    	mulx   (%r8,%rcx,8),%rcx,%rcx
    ddd0:	49 01 cc             	add    %rcx,%r12
    ddd3:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
    ddd8:	49 83 d2 00          	adc    $0x0,%r10
    dddc:	e9 92 01 00 00       	jmp    df73 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xab3>
    dde1:	31 f6                	xor    %esi,%esi
    dde3:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    dde8:	45 84 f6             	test   %r14b,%r14b
    ddeb:	0f 85 f8 fd ff ff    	jne    dbe9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x729>
    ddf1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    ddf8:	0f 1f 84 00 00 00 00 
    ddff:	00 
    de00:	31 c9                	xor    %ecx,%ecx
    de02:	41 80 fd 2d          	cmp    $0x2d,%r13b
    de06:	0f 94 c2             	sete   %dl
    de09:	48 85 ed             	test   %rbp,%rbp
    de0c:	40 0f 95 c7          	setne  %dil
    de10:	48 85 c0             	test   %rax,%rax
    de13:	41 0f 94 c0          	sete   %r8b
    de17:	85 f6                	test   %esi,%esi
    de19:	41 0f 94 c1          	sete   %r9b
    de1d:	45 20 c1             	and    %r8b,%r9b
    de20:	41 84 f9             	test   %dil,%r9b
    de23:	0f 85 7e 02 00 00    	jne    e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe7>
    de29:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    de2f:	0f 84 72 02 00 00    	je     e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe7>
    de35:	c1 e6 17             	shl    $0x17,%esi
    de38:	88 d1                	mov    %dl,%cl
    de3a:	c1 e1 1f             	shl    $0x1f,%ecx
    de3d:	09 c6                	or     %eax,%esi
    de3f:	09 ce                	or     %ecx,%esi
    de41:	e9 bd f6 ff ff       	jmp    d503 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    de46:	49 c1 e1 02          	shl    $0x2,%r9
    de4a:	48 8d 05 5f db 03 00 	lea    0x3db5f(%rip),%rax        # 4b9b0 <FFC_FLOAT_POWERS_OF_TEN>
    de51:	4c 29 c8             	sub    %r9,%rax
    de54:	c5 f2 5e 08          	vdivss (%rax),%xmm1,%xmm1
    de58:	41 80 fd 2d          	cmp    $0x2d,%r13b
    de5c:	0f 85 ff fb ff ff    	jne    da61 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5a1>
    de62:	e9 a7 fb ff ff       	jmp    da0e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x54e>
    de67:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
    de6e:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
    de72:	41 c1 e8 08          	shr    $0x8,%r8d
    de76:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
    de7a:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
    de81:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
    de88:	c1 ed 10             	shr    $0x10,%ebp
    de8b:	4c 01 cd             	add    %r9,%rbp
    de8e:	49 83 c3 04          	add    $0x4,%r11
    de92:	49 39 c3             	cmp    %rax,%r11
    de95:	0f 85 07 f9 ff ff    	jne    d7a2 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2e2>
    de9b:	49 89 c3             	mov    %rax,%r11
    de9e:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    dea3:	49 89 c9             	mov    %rcx,%r9
    dea6:	4d 29 d9             	sub    %r11,%r9
    dea9:	4d 89 d8             	mov    %r11,%r8
    deac:	49 29 c8             	sub    %rcx,%r8
    deaf:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
    deb4:	4c 8b 44 24 78       	mov    0x78(%rsp),%r8
    deb9:	4d 29 c8             	sub    %r9,%r8
    debc:	4d 89 da             	mov    %r11,%r10
    debf:	4d 85 c0             	test   %r8,%r8
    dec2:	0f 85 8f f9 ff ff    	jne    d857 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x397>
    dec8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    decf:	00 
    ded0:	41 80 fd 2d          	cmp    $0x2d,%r13b
    ded4:	75 03                	jne    ded9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa19>
    ded6:	48 ff c6             	inc    %rsi
    ded9:	48 29 f0             	sub    %rsi,%rax
    dedc:	48 83 f8 03          	cmp    $0x3,%rax
    dee0:	0f 8c c1 01 00 00    	jl     e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe7>
    dee6:	0f b7 0e             	movzwl (%rsi),%ecx
    dee9:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
    deed:	c1 e0 10             	shl    $0x10,%eax
    def0:	48 09 c8             	or     %rcx,%rax
    def3:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
    defa:	20 20 20 
    defd:	48 09 c8             	or     %rcx,%rax
    df00:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
    df07:	20 20 20 
    df0a:	48 39 c8             	cmp    %rcx,%rax
    df0d:	0f 84 dd f5 ff ff    	je     d4f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x30>
    df13:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
    df1a:	20 20 20 
    df1d:	48 39 c8             	cmp    %rcx,%rax
    df20:	0f 85 81 01 00 00    	jne    e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe7>
    df26:	31 f6                	xor    %esi,%esi
    df28:	41 80 fd 2d          	cmp    $0x2d,%r13b
    df2c:	40 0f 95 c6          	setne  %sil
    df30:	c1 e6 1f             	shl    $0x1f,%esi
    df33:	81 c6 00 00 c0 ff    	add    $0xffc00000,%esi
    df39:	e9 c5 f5 ff ff       	jmp    d503 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    df3e:	49 89 f4             	mov    %rsi,%r12
    df41:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    df46:	4c 89 de             	mov    %r11,%rsi
    df49:	48 f7 de             	neg    %rsi
    df4c:	80 f9 2d             	cmp    $0x2d,%cl
    df4f:	49 0f 45 f3          	cmovne %r11,%rsi
    df53:	49 01 f1             	add    %rsi,%r9
    df56:	4d 89 e3             	mov    %r12,%r11
    df59:	41 b4 01             	mov    $0x1,%r12b
    df5c:	45 31 f6             	xor    %r14d,%r14d
    df5f:	49 83 f8 14          	cmp    $0x14,%r8
    df63:	0f 8c 74 fa ff ff    	jl     d9dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x51d>
    df69:	e9 90 f9 ff ff       	jmp    d8fe <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43e>
    df6e:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
    df73:	4d 89 d4             	mov    %r10,%r12
    df76:	49 c1 ec 3f          	shr    $0x3f,%r12
    df7a:	41 69 c9 6a 52 03 00 	imul   $0x3526a,%r9d,%ecx
    df81:	c1 f9 10             	sar    $0x10,%ecx
    df84:	44 29 f9             	sub    %r15d,%ecx
    df87:	42 8d 54 21 3f       	lea    0x3f(%rcx,%r12,1),%edx
    df8c:	49 83 cc 26          	or     $0x26,%r12
    df90:	c4 42 9b f7 c2       	shrx   %r12,%r10,%r8
    df95:	83 fa 81             	cmp    $0xffffff81,%edx
    df98:	7f 24                	jg     dfbe <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xafe>
    df9a:	81 fa 43 ff ff ff    	cmp    $0xffffff43,%edx
    dfa0:	0f 83 b6 00 00 00    	jae    e05c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb9c>
    dfa6:	45 31 c0             	xor    %r8d,%r8d
    dfa9:	31 d2                	xor    %edx,%edx
    dfab:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    dfb0:	4c 39 c0             	cmp    %r8,%rax
    dfb3:	0f 84 78 fc ff ff    	je     dc31 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x771>
    dfb9:	e9 7b fc ff ff       	jmp    dc39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x779>
    dfbe:	49 8d 49 11          	lea    0x11(%r9),%rcx
    dfc2:	45 89 c7             	mov    %r8d,%r15d
    dfc5:	41 83 e7 03          	and    $0x3,%r15d
    dfc9:	49 83 f7 01          	xor    $0x1,%r15
    dfcd:	c4 42 99 f7 e0       	shlx   %r12,%r8,%r12
    dfd2:	4d 31 d4             	xor    %r10,%r12
    dfd5:	45 89 c2             	mov    %r8d,%r10d
    dfd8:	41 83 e2 fc          	and    $0xfffffffc,%r10d
    dfdc:	4d 09 fc             	or     %r15,%r12
    dfdf:	4d 0f 45 d0          	cmovne %r8,%r10
    dfe3:	48 83 7c 24 68 02    	cmpq   $0x2,0x68(%rsp)
    dfe9:	4d 0f 43 d0          	cmovae %r8,%r10
    dfed:	48 83 f9 1c          	cmp    $0x1c,%rcx
    dff1:	4d 0f 43 d0          	cmovae %r8,%r10
    dff5:	44 89 d1             	mov    %r10d,%ecx
    dff8:	83 e1 01             	and    $0x1,%ecx
    dffb:	4c 01 d1             	add    %r10,%rcx
    dffe:	41 89 c8             	mov    %ecx,%r8d
    e001:	41 d1 e8             	shr    $1,%r8d
    e004:	41 81 e0 ff ff 7f 03 	and    $0x37fffff,%r8d
    e00b:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    e012:	83 da 00             	sbb    $0x0,%edx
    e015:	83 ea 80             	sub    $0xffffff80,%edx
    e018:	81 fa ff 00 00 00    	cmp    $0xff,%edx
    e01e:	41 ba 00 00 00 00    	mov    $0x0,%r10d
    e024:	4d 0f 43 c2          	cmovae %r10,%r8
    e028:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    e02f:	4d 0f 43 c2          	cmovae %r10,%r8
    e033:	81 fa ff 00 00 00    	cmp    $0xff,%edx
    e039:	b9 ff 00 00 00       	mov    $0xff,%ecx
    e03e:	0f 43 d1             	cmovae %ecx,%edx
    e041:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e046:	4c 39 c0             	cmp    %r8,%rax
    e049:	0f 84 e2 fb ff ff    	je     dc31 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x771>
    e04f:	e9 e5 fb ff ff       	jmp    dc39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x779>
    e054:	4d 89 c3             	mov    %r8,%r11
    e057:	e9 42 fe ff ff       	jmp    de9e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9de>
    e05c:	b9 82 ff ff ff       	mov    $0xffffff82,%ecx
    e061:	29 d1                	sub    %edx,%ecx
    e063:	c4 42 f3 f7 d0       	shrx   %rcx,%r8,%r10
    e068:	49 0f a3 c8          	bt     %rcx,%r8
    e06c:	49 83 d2 00          	adc    $0x0,%r10
    e070:	45 89 d0             	mov    %r10d,%r8d
    e073:	41 d1 e8             	shr    $1,%r8d
    e076:	31 d2                	xor    %edx,%edx
    e078:	49 81 fa 00 00 00 01 	cmp    $0x1000000,%r10
    e07f:	0f 93 c2             	setae  %dl
    e082:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e087:	4c 39 c0             	cmp    %r8,%rax
    e08a:	0f 84 a1 fb ff ff    	je     dc31 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x771>
    e090:	e9 a4 fb ff ff       	jmp    dc39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x779>
    e095:	48 81 c4 c8 00 00 00 	add    $0xc8,%rsp
    e09c:	5b                   	pop    %rbx
    e09d:	41 5c                	pop    %r12
    e09f:	41 5d                	pop    %r13
    e0a1:	41 5e                	pop    %r14
    e0a3:	41 5f                	pop    %r15
    e0a5:	5d                   	pop    %rbp
    e0a6:	c3                   	ret
    e0a7:	bf 10 00 00 00       	mov    $0x10,%edi
    e0ac:	e8 bf 80 ff ff       	call   6170 <__cxa_allocate_exception@plt>
    e0b1:	48 89 c3             	mov    %rax,%rbx
    e0b4:	48 8d 35 c8 06 04 00 	lea    0x406c8(%rip),%rsi        # 4e783 <fast_float::powers_of_ten_uint64+0x4f3>
    e0bb:	48 89 c7             	mov    %rax,%rdi
    e0be:	e8 4d 80 ff ff       	call   6110 <std::runtime_error::runtime_error(char const*)@plt>
    e0c3:	48 8b 35 06 4f 05 00 	mov    0x54f06(%rip),%rsi        # 62fd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
    e0ca:	48 8b 15 8f 4e 05 00 	mov    0x54e8f(%rip),%rdx        # 62f60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
    e0d1:	48 89 df             	mov    %rbx,%rdi
    e0d4:	e8 17 84 ff ff       	call   64f0 <__cxa_throw@plt>
    e0d9:	49 89 c6             	mov    %rax,%r14
    e0dc:	48 89 df             	mov    %rbx,%rdi
    e0df:	e8 7c 81 ff ff       	call   6260 <__cxa_free_exception@plt>
    e0e4:	4c 89 f7             	mov    %r14,%rdi
    e0e7:	e8 14 84 ff ff       	call   6500 <_Unwind_Resume@plt>
    e0ec:	0f 1f 40 00          	nopl   0x0(%rax)

