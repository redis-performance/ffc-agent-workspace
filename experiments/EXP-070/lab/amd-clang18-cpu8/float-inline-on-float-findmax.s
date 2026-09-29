000000000000d660 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    d660:	55                   	push   %rbp
    d661:	41 57                	push   %r15
    d663:	41 56                	push   %r14
    d665:	41 55                	push   %r13
    d667:	41 54                	push   %r12
    d669:	53                   	push   %rbx
    d66a:	48 81 ec c8 00 00 00 	sub    $0xc8,%rsp
    d671:	48 8b 1f             	mov    (%rdi),%rbx
    d674:	4c 8b 67 08          	mov    0x8(%rdi),%r12
    d678:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
    d67c:	4c 39 e3             	cmp    %r12,%rbx
    d67f:	0f 84 fd 0b 00 00    	je     e282 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc22>
    d685:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
    d68a:	eb 30                	jmp    d6bc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5c>
    d68c:	0f 1f 40 00          	nopl   0x0(%rax)
    d690:	31 f6                	xor    %esi,%esi
    d692:	41 80 fd 2d          	cmp    $0x2d,%r13b
    d696:	40 0f 95 c6          	setne  %sil
    d69a:	c1 e6 1f             	shl    $0x1f,%esi
    d69d:	81 c6 00 00 80 ff    	add    $0xff800000,%esi
    d6a3:	c5 f9 6e ce          	vmovd  %esi,%xmm1
    d6a7:	c5 f2 5a c9          	vcvtss2sd %xmm1,%xmm1,%xmm1
    d6ab:	c5 fb 5f c1          	vmaxsd %xmm1,%xmm0,%xmm0
    d6af:	48 83 c3 20          	add    $0x20,%rbx
    d6b3:	4c 39 e3             	cmp    %r12,%rbx
    d6b6:	0f 84 c6 0b 00 00    	je     e282 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc22>
    d6bc:	4c 8b 73 08          	mov    0x8(%rbx),%r14
    d6c0:	4d 85 f6             	test   %r14,%r14
    d6c3:	0f 84 cb 0b 00 00    	je     e294 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc34>
    d6c9:	48 8b 33             	mov    (%rbx),%rsi
    d6cc:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
    d6d0:	44 0f b6 2e          	movzbl (%rsi),%r13d
    d6d4:	48 89 f7             	mov    %rsi,%rdi
    d6d7:	44 89 e9             	mov    %r13d,%ecx
    d6da:	41 80 fd 2d          	cmp    $0x2d,%r13b
    d6de:	41 0f 94 c2          	sete   %r10b
    d6e2:	75 2c                	jne    d710 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb0>
    d6e4:	49 83 fe 01          	cmp    $0x1,%r14
    d6e8:	0f 84 28 0a 00 00    	je     e116 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xab6>
    d6ee:	0f be 4e 01          	movsbl 0x1(%rsi),%ecx
    d6f2:	83 f9 2e             	cmp    $0x2e,%ecx
    d6f5:	74 0c                	je     d703 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa3>
    d6f7:	8d 51 d0             	lea    -0x30(%rcx),%edx
    d6fa:	83 fa 09             	cmp    $0x9,%edx
    d6fd:	0f 87 13 0a 00 00    	ja     e116 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xab6>
    d703:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
    d707:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    d70e:	00 00 
    d710:	48 39 c7             	cmp    %rax,%rdi
    d713:	44 88 54 24 57       	mov    %r10b,0x57(%rsp)
    d718:	0f 84 42 01 00 00    	je     d860 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x200>
    d71e:	0f be d1             	movsbl %cl,%edx
    d721:	83 c2 d0             	add    $0xffffffd0,%edx
    d724:	83 fa 09             	cmp    $0x9,%edx
    d727:	0f 87 52 01 00 00    	ja     d87f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x21f>
    d72d:	48 8d 57 01          	lea    0x1(%rdi),%rdx
    d731:	48 0f be e9          	movsbq %cl,%rbp
    d735:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d739:	48 39 c2             	cmp    %rax,%rdx
    d73c:	0f 84 20 01 00 00    	je     d862 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x202>
    d742:	0f be 0a             	movsbl (%rdx),%ecx
    d745:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d749:	41 83 f8 09          	cmp    $0x9,%r8d
    d74d:	0f 87 31 01 00 00    	ja     d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d753:	48 63 c9             	movslq %ecx,%rcx
    d756:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
    d75d:	00 
    d75e:	49 01 e8             	add    %rbp,%r8
    d761:	48 8d 57 02          	lea    0x2(%rdi),%rdx
    d765:	4a 8d 2c 41          	lea    (%rcx,%r8,2),%rbp
    d769:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d76d:	48 39 c2             	cmp    %rax,%rdx
    d770:	0f 84 ec 00 00 00    	je     d862 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x202>
    d776:	0f be 0a             	movsbl (%rdx),%ecx
    d779:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d77d:	41 83 f8 09          	cmp    $0x9,%r8d
    d781:	0f 87 fd 00 00 00    	ja     d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d787:	48 63 c9             	movslq %ecx,%rcx
    d78a:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
    d791:	00 
    d792:	49 01 e8             	add    %rbp,%r8
    d795:	48 8d 57 03          	lea    0x3(%rdi),%rdx
    d799:	4a 8d 2c 41          	lea    (%rcx,%r8,2),%rbp
    d79d:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d7a1:	48 39 c2             	cmp    %rax,%rdx
    d7a4:	0f 84 b8 00 00 00    	je     d862 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x202>
    d7aa:	0f be 0a             	movsbl (%rdx),%ecx
    d7ad:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d7b1:	41 83 f8 09          	cmp    $0x9,%r8d
    d7b5:	0f 87 c9 00 00 00    	ja     d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d7bb:	48 63 c9             	movslq %ecx,%rcx
    d7be:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
    d7c5:	00 
    d7c6:	49 01 e8             	add    %rbp,%r8
    d7c9:	48 8d 57 04          	lea    0x4(%rdi),%rdx
    d7cd:	4a 8d 2c 41          	lea    (%rcx,%r8,2),%rbp
    d7d1:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d7d5:	48 39 c2             	cmp    %rax,%rdx
    d7d8:	0f 84 84 00 00 00    	je     d862 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x202>
    d7de:	0f be 0a             	movsbl (%rdx),%ecx
    d7e1:	44 8d 41 d0          	lea    -0x30(%rcx),%r8d
    d7e5:	41 83 f8 09          	cmp    $0x9,%r8d
    d7e9:	0f 87 95 00 00 00    	ja     d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d7ef:	48 63 c9             	movslq %ecx,%rcx
    d7f2:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
    d7f9:	00 
    d7fa:	49 01 e8             	add    %rbp,%r8
    d7fd:	48 8d 57 05          	lea    0x5(%rdi),%rdx
    d801:	4a 8d 2c 41          	lea    (%rcx,%r8,2),%rbp
    d805:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d809:	48 39 c2             	cmp    %rax,%rdx
    d80c:	74 54                	je     d862 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x202>
    d80e:	4a 8d 0c 36          	lea    (%rsi,%r14,1),%rcx
    d812:	48 29 f9             	sub    %rdi,%rcx
    d815:	48 01 f9             	add    %rdi,%rcx
    d818:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    d81f:	00 
    d820:	44 0f be 02          	movsbl (%rdx),%r8d
    d824:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
    d828:	41 83 f9 09          	cmp    $0x9,%r9d
    d82c:	77 56                	ja     d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d82e:	4d 63 c0             	movslq %r8d,%r8
    d831:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
    d838:	00 
    d839:	49 01 e9             	add    %rbp,%r9
    d83c:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
    d840:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    d844:	48 ff c2             	inc    %rdx
    d847:	48 39 c2             	cmp    %rax,%rdx
    d84a:	75 d4                	jne    d820 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x1c0>
    d84c:	48 89 ca             	mov    %rcx,%rdx
    d84f:	eb 33                	jmp    d884 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x224>
    d851:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    d858:	0f 1f 84 00 00 00 00 
    d85f:	00 
    d860:	31 ed                	xor    %ebp,%ebp
    d862:	49 89 c0             	mov    %rax,%r8
    d865:	49 29 f8             	sub    %rdi,%r8
    d868:	48 89 c2             	mov    %rax,%rdx
    d86b:	49 89 c3             	mov    %rax,%r11
    d86e:	31 c9                	xor    %ecx,%ecx
    d870:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    d875:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
    d87a:	e9 b4 01 00 00       	jmp    da33 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3d3>
    d87f:	31 ed                	xor    %ebp,%ebp
    d881:	48 89 fa             	mov    %rdi,%rdx
    d884:	48 89 d1             	mov    %rdx,%rcx
    d887:	48 29 f9             	sub    %rdi,%rcx
    d88a:	48 39 c2             	cmp    %rax,%rdx
    d88d:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
    d892:	0f 84 88 01 00 00    	je     da20 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3c0>
    d898:	80 3a 2e             	cmpb   $0x2e,(%rdx)
    d89b:	0f 85 84 01 00 00    	jne    da25 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3c5>
    d8a1:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
    d8a5:	49 89 c0             	mov    %rax,%r8
    d8a8:	4d 29 d8             	sub    %r11,%r8
    d8ab:	49 83 f8 08          	cmp    $0x8,%r8
    d8af:	4c 89 d9             	mov    %r11,%rcx
    d8b2:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
    d8b7:	0f 8c 95 00 00 00    	jl     d952 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2f2>
    d8bd:	0f 1f 00             	nopl   (%rax)
    d8c0:	4d 8b 0b             	mov    (%r11),%r9
    d8c3:	48 b9 46 46 46 46 46 	movabs $0x4646464646464646,%rcx
    d8ca:	46 46 46 
    d8cd:	4d 8d 14 09          	lea    (%r9,%rcx,1),%r10
    d8d1:	48 b9 d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rcx
    d8d8:	cf cf cf 
    d8db:	49 01 c9             	add    %rcx,%r9
    d8de:	4d 09 ca             	or     %r9,%r10
    d8e1:	48 b9 80 80 80 80 80 	movabs $0x8080808080808080,%rcx
    d8e8:	80 80 80 
    d8eb:	49 85 ca             	test   %rcx,%r10
    d8ee:	75 62                	jne    d952 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x2f2>
    d8f0:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
    d8f7:	4f 8d 3c 89          	lea    (%r9,%r9,4),%r15
    d8fb:	49 c1 e9 08          	shr    $0x8,%r9
    d8ff:	4b 8d 2c 79          	lea    (%r9,%r15,2),%rbp
    d903:	49 89 e9             	mov    %rbp,%r9
    d906:	48 b9 ff 00 00 00 ff 	movabs $0xff000000ff,%rcx
    d90d:	00 00 00 
    d910:	49 21 c9             	and    %rcx,%r9
    d913:	49 bf 64 00 00 00 40 	movabs $0xf424000000064,%r15
    d91a:	42 0f 00 
    d91d:	4d 0f af cf          	imul   %r15,%r9
    d921:	48 c1 ed 10          	shr    $0x10,%rbp
    d925:	48 21 cd             	and    %rcx,%rbp
    d928:	48 b9 01 00 00 00 10 	movabs $0x271000000001,%rcx
    d92f:	27 00 00 
    d932:	48 0f af e9          	imul   %rcx,%rbp
    d936:	4c 01 cd             	add    %r9,%rbp
    d939:	48 c1 ed 20          	shr    $0x20,%rbp
    d93d:	4c 01 d5             	add    %r10,%rbp
    d940:	49 83 c3 08          	add    $0x8,%r11
    d944:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
    d948:	49 83 f8 07          	cmp    $0x7,%r8
    d94c:	0f 8f 6e ff ff ff    	jg     d8c0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x260>
    d952:	49 83 f8 04          	cmp    $0x4,%r8
    d956:	7c 21                	jl     d979 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x319>
    d958:	45 8b 03             	mov    (%r11),%r8d
    d95b:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
    d962:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
    d969:	45 09 c1             	or     %r8d,%r9d
    d96c:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
    d973:	0f 84 2e 07 00 00    	je     e0a7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa47>
    d979:	49 39 c3             	cmp    %rax,%r11
    d97c:	0f 84 59 07 00 00    	je     e0db <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7b>
    d982:	45 0f be 0b          	movsbl (%r11),%r9d
    d986:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
    d98a:	41 83 f8 09          	cmp    $0x9,%r8d
    d98e:	0f 87 4a 07 00 00    	ja     e0de <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7e>
    d994:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
    d99b:	00 
    d99c:	49 01 ea             	add    %rbp,%r10
    d99f:	4d 8d 43 01          	lea    0x1(%r11),%r8
    d9a3:	41 80 c1 d0          	add    $0xd0,%r9b
    d9a7:	45 0f b6 c9          	movzbl %r9b,%r9d
    d9ab:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
    d9af:	49 39 c0             	cmp    %rax,%r8
    d9b2:	0f 84 23 07 00 00    	je     e0db <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7b>
    d9b8:	45 0f be 08          	movsbl (%r8),%r9d
    d9bc:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
    d9c0:	41 83 fa 09          	cmp    $0x9,%r10d
    d9c4:	0f 87 77 08 00 00    	ja     e241 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe1>
    d9ca:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
    d9d1:	00 
    d9d2:	49 01 ea             	add    %rbp,%r10
    d9d5:	4d 8d 43 02          	lea    0x2(%r11),%r8
    d9d9:	41 80 c1 d0          	add    $0xd0,%r9b
    d9dd:	45 0f b6 c9          	movzbl %r9b,%r9d
    d9e1:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
    d9e5:	49 39 c0             	cmp    %rax,%r8
    d9e8:	0f 84 ed 06 00 00    	je     e0db <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7b>
    d9ee:	45 0f be 08          	movsbl (%r8),%r9d
    d9f2:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
    d9f6:	41 83 fa 09          	cmp    $0x9,%r10d
    d9fa:	0f 87 41 08 00 00    	ja     e241 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe1>
    da00:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
    da07:	00 
    da08:	49 01 e8             	add    %rbp,%r8
    da0b:	49 83 c3 03          	add    $0x3,%r11
    da0f:	41 80 c1 d0          	add    $0xd0,%r9b
    da13:	45 0f b6 c9          	movzbl %r9b,%r9d
    da17:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
    da1b:	e9 be 06 00 00       	jmp    e0de <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7e>
    da20:	49 89 c3             	mov    %rax,%r11
    da23:	eb 03                	jmp    da28 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3c8>
    da25:	49 89 d3             	mov    %rdx,%r11
    da28:	45 31 c0             	xor    %r8d,%r8d
    da2b:	4c 89 44 24 68       	mov    %r8,0x68(%rsp)
    da30:	49 89 c8             	mov    %rcx,%r8
    da33:	45 31 c9             	xor    %r9d,%r9d
    da36:	31 c9                	xor    %ecx,%ecx
    da38:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
    da3d:	45 31 d2             	xor    %r10d,%r10d
    da40:	4d 85 c0             	test   %r8,%r8
    da43:	0f 84 c7 06 00 00    	je     e110 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xab0>
    da49:	49 39 c3             	cmp    %rax,%r11
    da4c:	0f 84 87 00 00 00    	je     dad9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x479>
    da52:	45 0f b6 3b          	movzbl (%r11),%r15d
    da56:	41 83 cf 20          	or     $0x20,%r15d
    da5a:	41 83 ff 65          	cmp    $0x65,%r15d
    da5e:	75 7c                	jne    dadc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x47c>
    da60:	4d 8d 63 01          	lea    0x1(%r11),%r12
    da64:	49 39 c4             	cmp    %rax,%r12
    da67:	74 73                	je     dadc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x47c>
    da69:	45 0f b6 7b 01       	movzbl 0x1(%r11),%r15d
    da6e:	49 8d 4b 02          	lea    0x2(%r11),%rcx
    da72:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
    da77:	41 83 c7 d5          	add    $0xffffffd5,%r15d
    da7b:	41 f6 c7 fd          	test   $0xfd,%r15b
    da7f:	4c 0f 44 e1          	cmove  %rcx,%r12
    da83:	49 39 c4             	cmp    %rax,%r12
    da86:	74 54                	je     dadc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x47c>
    da88:	41 0f be 0c 24       	movsbl (%r12),%ecx
    da8d:	83 c1 d0             	add    $0xffffffd0,%ecx
    da90:	83 f9 09             	cmp    $0x9,%ecx
    da93:	77 47                	ja     dadc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x47c>
    da95:	4c 01 f6             	add    %r14,%rsi
    da98:	45 31 db             	xor    %r11d,%r11d
    da9b:	eb 0f                	jmp    daac <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x44c>
    da9d:	0f 1f 00             	nopl   (%rax)
    daa0:	49 ff c4             	inc    %r12
    daa3:	49 39 c4             	cmp    %rax,%r12
    daa6:	0f 84 d2 06 00 00    	je     e17e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb1e>
    daac:	45 0f be 34 24       	movsbl (%r12),%r14d
    dab1:	41 8d 4e d0          	lea    -0x30(%r14),%ecx
    dab5:	83 f9 09             	cmp    $0x9,%ecx
    dab8:	0f 87 c3 06 00 00    	ja     e181 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb21>
    dabe:	49 81 fb ff ff ff 0f 	cmp    $0xfffffff,%r11
    dac5:	7f d9                	jg     daa0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x440>
    dac7:	41 80 c6 d0          	add    $0xd0,%r14b
    dacb:	4b 8d 0c 9b          	lea    (%r11,%r11,4),%rcx
    dacf:	45 0f b6 de          	movzbl %r14b,%r11d
    dad3:	4d 8d 1c 4b          	lea    (%r11,%rcx,2),%r11
    dad7:	eb c7                	jmp    daa0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x440>
    dad9:	49 89 c3             	mov    %rax,%r11
    dadc:	31 f6                	xor    %esi,%esi
    dade:	41 b4 01             	mov    $0x1,%r12b
    dae1:	45 31 f6             	xor    %r14d,%r14d
    dae4:	49 83 f8 14          	cmp    $0x14,%r8
    dae8:	0f 8c f8 00 00 00    	jl     dbe6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x586>
    daee:	48 39 c7             	cmp    %rax,%rdi
    daf1:	74 3e                	je     db31 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4d1>
    daf3:	49 89 fe             	mov    %rdi,%r14
    daf6:	eb 1c                	jmp    db14 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4b4>
    daf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    daff:	00 
    db00:	31 c9                	xor    %ecx,%ecx
    db02:	41 80 ff 30          	cmp    $0x30,%r15b
    db06:	0f 94 c1             	sete   %cl
    db09:	49 29 c8             	sub    %rcx,%r8
    db0c:	49 ff c6             	inc    %r14
    db0f:	49 39 c6             	cmp    %rax,%r14
    db12:	74 10                	je     db24 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4c4>
    db14:	45 0f b6 3e          	movzbl (%r14),%r15d
    db18:	41 83 ff 30          	cmp    $0x30,%r15d
    db1c:	74 e2                	je     db00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4a0>
    db1e:	41 83 ff 2e          	cmp    $0x2e,%r15d
    db22:	74 dc                	je     db00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4a0>
    db24:	45 31 f6             	xor    %r14d,%r14d
    db27:	49 83 f8 14          	cmp    $0x14,%r8
    db2b:	0f 8c b5 00 00 00    	jl     dbe6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x586>
    db31:	48 39 d7             	cmp    %rdx,%rdi
    db34:	74 56                	je     db8c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x52c>
    db36:	48 89 f8             	mov    %rdi,%rax
    db39:	31 ed                	xor    %ebp,%ebp
    db3b:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
    db42:	b6 e0 0d 
    db45:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    db4c:	00 00 00 00 
    db50:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
    db57:	00 
    db58:	48 01 e9             	add    %rbp,%rcx
    db5b:	4c 0f be 00          	movsbq (%rax),%r8
    db5f:	49 8d 2c 48          	lea    (%r8,%rcx,2),%rbp
    db63:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    db67:	48 ff c0             	inc    %rax
    db6a:	4c 39 cd             	cmp    %r9,%rbp
    db6d:	73 05                	jae    db74 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x514>
    db6f:	48 39 d0             	cmp    %rdx,%rax
    db72:	75 dc                	jne    db50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x4f0>
    db74:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
    db78:	48 39 cd             	cmp    %rcx,%rbp
    db7b:	77 5a                	ja     dbd7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x577>
    db7d:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    db82:	4c 89 c0             	mov    %r8,%rax
    db85:	4d 39 d0             	cmp    %r10,%r8
    db88:	75 26                	jne    dbb0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x550>
    db8a:	eb 48                	jmp    dbd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x574>
    db8c:	31 ed                	xor    %ebp,%ebp
    db8e:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
    db95:	b6 e0 0d 
    db98:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    db9d:	4c 89 c0             	mov    %r8,%rax
    dba0:	4d 39 d0             	cmp    %r10,%r8
    dba3:	74 2f                	je     dbd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x574>
    dba5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    dbac:	00 00 00 00 
    dbb0:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
    dbb7:	00 
    dbb8:	48 01 e9             	add    %rbp,%rcx
    dbbb:	48 0f be 10          	movsbq (%rax),%rdx
    dbbf:	48 8d 2c 4a          	lea    (%rdx,%rcx,2),%rbp
    dbc3:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
    dbc7:	48 ff c0             	inc    %rax
    dbca:	4c 39 cd             	cmp    %r9,%rbp
    dbcd:	73 05                	jae    dbd4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x574>
    dbcf:	4c 39 d0             	cmp    %r10,%rax
    dbd2:	75 dc                	jne    dbb0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x550>
    dbd4:	4c 89 c2             	mov    %r8,%rdx
    dbd7:	48 29 c2             	sub    %rax,%rdx
    dbda:	48 01 f2             	add    %rsi,%rdx
    dbdd:	41 b6 01             	mov    $0x1,%r14b
    dbe0:	45 31 e4             	xor    %r12d,%r12d
    dbe3:	49 89 d1             	mov    %rdx,%r9
    dbe6:	45 84 e4             	test   %r12b,%r12b
    dbe9:	74 3b                	je     dc26 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5c6>
    dbeb:	4d 85 c9             	test   %r9,%r9
    dbee:	75 36                	jne    dc26 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5c6>
    dbf0:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
    dbf7:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    dbfc:	0f 87 ab 00 00 00    	ja     dcad <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x64d>
    dc02:	48 85 ed             	test   %rbp,%rbp
    dc05:	0f 84 1d 02 00 00    	je     de28 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7c8>
    dc0b:	62 f1 ee 08 7b cd    	vcvtusi2ss %rbp,%xmm2,%xmm1
    dc11:	41 80 fd 2d          	cmp    $0x2d,%r13b
    dc15:	75 53                	jne    dc6a <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x60a>
    dc17:	c5 f9 7e ce          	vmovd  %xmm1,%esi
    dc1b:	81 c6 00 00 00 80    	add    $0x80000000,%esi
    dc21:	e9 7d fa ff ff       	jmp    d6a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    dc26:	49 8d 41 0a          	lea    0xa(%r9),%rax
    dc2a:	48 83 f8 15          	cmp    $0x15,%rax
    dc2e:	0f 92 c0             	setb   %al
    dc31:	41 20 c4             	and    %al,%r12b
    dc34:	41 80 fc 01          	cmp    $0x1,%r12b
    dc38:	75 39                	jne    dc73 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x613>
    dc3a:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
    dc41:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    dc46:	77 65                	ja     dcad <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x64d>
    dc48:	62 f1 ee 08 7b cd    	vcvtusi2ss %rbp,%xmm2,%xmm1
    dc4e:	4d 85 c9             	test   %r9,%r9
    dc51:	0f 88 2f 04 00 00    	js     e086 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa26>
    dc57:	48 8d 05 b2 bf 03 00 	lea    0x3bfb2(%rip),%rax        # 49c10 <FFC_FLOAT_POWERS_OF_TEN>
    dc5e:	c4 a1 72 59 0c 88    	vmulss (%rax,%r9,4),%xmm1,%xmm1
    dc64:	41 80 fd 2d          	cmp    $0x2d,%r13b
    dc68:	74 ad                	je     dc17 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5b7>
    dc6a:	c5 f9 7e ce          	vmovd  %xmm1,%esi
    dc6e:	e9 30 fa ff ff       	jmp    d6a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    dc73:	31 c0                	xor    %eax,%eax
    dc75:	48 85 ed             	test   %rbp,%rbp
    dc78:	0f 84 ab 03 00 00    	je     e029 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9c9>
    dc7e:	be 00 00 00 00       	mov    $0x0,%esi
    dc83:	49 83 f9 c0          	cmp    $0xffffffffffffffc0,%r9
    dc87:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    dc8c:	0f 8c 5e 01 00 00    	jl     ddf0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x790>
    dc92:	49 83 f9 26          	cmp    $0x26,%r9
    dc96:	7e 15                	jle    dcad <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x64d>
    dc98:	be ff 00 00 00       	mov    $0xff,%esi
    dc9d:	31 c0                	xor    %eax,%eax
    dc9f:	45 84 f6             	test   %r14b,%r14b
    dca2:	0f 85 51 01 00 00    	jne    ddf9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x799>
    dca8:	e9 93 03 00 00       	jmp    e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    dcad:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
    dcb2:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
    dcb7:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
    dcbe:	00 
    dcbf:	48 98                	cltq
    dcc1:	4c 8d 15 78 bf 03 00 	lea    0x3bf78(%rip),%r10        # 49c40 <FFC_POWERS_OF_FIVE>
    dcc8:	c4 42 fb f6 04 c2    	mulx   (%r10,%rax,8),%rax,%r8
    dcce:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    dcd5:	00 00 00 
    dcd8:	c4 e2 b8 f2 c9       	andn   %rcx,%r8,%rcx
    dcdd:	75 1a                	jne    dcf9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x699>
    dcdf:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    dce3:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    dce9:	48 63 c9             	movslq %ecx,%rcx
    dcec:	c4 c2 f3 f6 0c ca    	mulx   (%r10,%rcx,8),%rcx,%rcx
    dcf2:	48 01 c8             	add    %rcx,%rax
    dcf5:	49 83 d0 00          	adc    $0x0,%r8
    dcf9:	4d 89 c2             	mov    %r8,%r10
    dcfc:	49 c1 ea 3f          	shr    $0x3f,%r10
    dd00:	41 69 c9 6a 52 03 00 	imul   $0x3526a,%r9d,%ecx
    dd07:	c1 f9 10             	sar    $0x10,%ecx
    dd0a:	29 f1                	sub    %esi,%ecx
    dd0c:	42 8d 34 11          	lea    (%rcx,%r10,1),%esi
    dd10:	83 c6 3f             	add    $0x3f,%esi
    dd13:	49 83 ca 26          	or     $0x26,%r10
    dd17:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
    dd1c:	83 fe 81             	cmp    $0xffffff81,%esi
    dd1f:	7f 1e                	jg     dd3f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x6df>
    dd21:	81 fe 43 ff ff ff    	cmp    $0xffffff43,%esi
    dd27:	0f 83 96 00 00 00    	jae    ddc3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x763>
    dd2d:	31 c0                	xor    %eax,%eax
    dd2f:	31 f6                	xor    %esi,%esi
    dd31:	45 84 f6             	test   %r14b,%r14b
    dd34:	0f 85 bf 00 00 00    	jne    ddf9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x799>
    dd3a:	e9 01 03 00 00       	jmp    e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    dd3f:	89 d1                	mov    %edx,%ecx
    dd41:	83 e1 03             	and    $0x3,%ecx
    dd44:	48 83 f1 01          	xor    $0x1,%rcx
    dd48:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
    dd4d:	4d 31 c2             	xor    %r8,%r10
    dd50:	41 89 d0             	mov    %edx,%r8d
    dd53:	41 83 e0 fc          	and    $0xfffffffc,%r8d
    dd57:	49 09 ca             	or     %rcx,%r10
    dd5a:	4c 0f 45 c2          	cmovne %rdx,%r8
    dd5e:	49 8d 49 11          	lea    0x11(%r9),%rcx
    dd62:	48 83 f8 02          	cmp    $0x2,%rax
    dd66:	4c 0f 43 c2          	cmovae %rdx,%r8
    dd6a:	48 83 f9 1c          	cmp    $0x1c,%rcx
    dd6e:	4c 0f 43 c2          	cmovae %rdx,%r8
    dd72:	44 89 c1             	mov    %r8d,%ecx
    dd75:	83 e1 01             	and    $0x1,%ecx
    dd78:	4c 01 c1             	add    %r8,%rcx
    dd7b:	89 c8                	mov    %ecx,%eax
    dd7d:	d1 e8                	shr    $1,%eax
    dd7f:	25 ff ff 7f 03       	and    $0x37fffff,%eax
    dd84:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    dd8b:	83 de 00             	sbb    $0x0,%esi
    dd8e:	83 ee 80             	sub    $0xffffff80,%esi
    dd91:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    dd97:	ba 00 00 00 00       	mov    $0x0,%edx
    dd9c:	48 0f 43 c2          	cmovae %rdx,%rax
    dda0:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    dda7:	48 0f 43 c2          	cmovae %rdx,%rax
    ddab:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    ddb1:	b9 ff 00 00 00       	mov    $0xff,%ecx
    ddb6:	0f 43 f1             	cmovae %ecx,%esi
    ddb9:	45 84 f6             	test   %r14b,%r14b
    ddbc:	75 3b                	jne    ddf9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x799>
    ddbe:	e9 7d 02 00 00       	jmp    e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    ddc3:	b8 82 ff ff ff       	mov    $0xffffff82,%eax
    ddc8:	29 f0                	sub    %esi,%eax
    ddca:	c4 e2 fb f7 ca       	shrx   %rax,%rdx,%rcx
    ddcf:	48 0f a3 c2          	bt     %rax,%rdx
    ddd3:	48 83 d1 00          	adc    $0x0,%rcx
    ddd7:	89 c8                	mov    %ecx,%eax
    ddd9:	d1 e8                	shr    $1,%eax
    dddb:	31 f6                	xor    %esi,%esi
    dddd:	48 81 f9 00 00 00 01 	cmp    $0x1000000,%rcx
    dde4:	40 0f 93 c6          	setae  %sil
    dde8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    ddef:	00 
    ddf0:	45 84 f6             	test   %r14b,%r14b
    ddf3:	0f 84 47 02 00 00    	je     e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    ddf9:	45 31 c0             	xor    %r8d,%r8d
    ddfc:	49 89 ea             	mov    %rbp,%r10
    ddff:	49 ff c2             	inc    %r10
    de02:	74 36                	je     de3a <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7da>
    de04:	ba 00 00 00 00       	mov    $0x0,%edx
    de09:	49 83 f9 c0          	cmp    $0xffffffffffffffc0,%r9
    de0d:	7c 2d                	jl     de3c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7dc>
    de0f:	49 83 f9 26          	cmp    $0x26,%r9
    de13:	0f 8e 72 01 00 00    	jle    df8b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x92b>
    de19:	ba ff 00 00 00       	mov    $0xff,%edx
    de1e:	45 31 c0             	xor    %r8d,%r8d
    de21:	4c 39 c0             	cmp    %r8,%rax
    de24:	74 1b                	je     de41 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e1>
    de26:	eb 21                	jmp    de49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e9>
    de28:	31 f6                	xor    %esi,%esi
    de2a:	41 80 fd 2d          	cmp    $0x2d,%r13b
    de2e:	40 0f 94 c6          	sete   %sil
    de32:	c1 e6 1f             	shl    $0x1f,%esi
    de35:	e9 69 f8 ff ff       	jmp    d6a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    de3a:	31 d2                	xor    %edx,%edx
    de3c:	4c 39 c0             	cmp    %r8,%rax
    de3f:	75 08                	jne    de49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e9>
    de41:	39 d6                	cmp    %edx,%esi
    de43:	0f 84 f7 01 00 00    	je     e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    de49:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
    de4e:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
    de53:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
    de5a:	00 
    de5b:	48 98                	cltq
    de5d:	48 8d 0d dc bd 03 00 	lea    0x3bddc(%rip),%rcx        # 49c40 <FFC_POWERS_OF_FIVE>
    de64:	c4 e2 cb f6 04 c1    	mulx   (%rcx,%rax,8),%rsi,%rax
    de6a:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    de71:	00 00 00 
    de74:	c4 e2 f8 f2 c9       	andn   %rcx,%rax,%rcx
    de79:	75 21                	jne    de9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x83c>
    de7b:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    de7f:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    de85:	48 63 c9             	movslq %ecx,%rcx
    de88:	4c 8d 15 b1 bd 03 00 	lea    0x3bdb1(%rip),%r10        # 49c40 <FFC_POWERS_OF_FIVE>
    de8f:	c4 c2 f3 f6 0c ca    	mulx   (%r10,%rcx,8),%rcx,%rcx
    de95:	48 01 f1             	add    %rsi,%rcx
    de98:	48 83 d0 00          	adc    $0x0,%rax
    de9c:	48 89 c1             	mov    %rax,%rcx
    de9f:	48 c1 e9 3f          	shr    $0x3f,%rcx
    dea3:	83 f1 01             	xor    $0x1,%ecx
    dea6:	c4 e2 f1 f7 c0       	shlx   %rcx,%rax,%rax
    deab:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
    deb2:	c1 fe 10             	sar    $0x10,%esi
    deb5:	44 01 c1             	add    %r8d,%ecx
    deb8:	29 ce                	sub    %ecx,%esi
    deba:	8d 8e d5 00 00 00    	lea    0xd5(%rsi),%ecx
    dec0:	81 c6 97 80 ff ff    	add    $0xffff8097,%esi
    dec6:	81 f9 3d 80 00 00    	cmp    $0x803d,%ecx
    decc:	0f 8f 6e 01 00 00    	jg     e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    ded2:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
    ded9:	00 
    deda:	48 89 ac 24 88 00 00 	mov    %rbp,0x88(%rsp)
    dee1:	00 
    dee2:	4c 89 9c 24 90 00 00 	mov    %r11,0x90(%rsp)
    dee9:	00 
    deea:	0f b6 4c 24 57       	movzbl 0x57(%rsp),%ecx
    deef:	88 8c 24 98 00 00 00 	mov    %cl,0x98(%rsp)
    def6:	c6 84 24 99 00 00 00 	movb   $0x1,0x99(%rsp)
    defd:	01 
    defe:	44 88 b4 24 9a 00 00 	mov    %r14b,0x9a(%rsp)
    df05:	00 
    df06:	48 8d 8c 24 9b 00 00 	lea    0x9b(%rsp),%rcx
    df0d:	00 
    df0e:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
    df12:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    df18:	48 89 bc 24 a0 00 00 	mov    %rdi,0xa0(%rsp)
    df1f:	00 
    df20:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    df25:	48 89 8c 24 a8 00 00 	mov    %rcx,0xa8(%rsp)
    df2c:	00 
    df2d:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    df32:	48 89 8c 24 b0 00 00 	mov    %rcx,0xb0(%rsp)
    df39:	00 
    df3a:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    df3f:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
    df46:	00 
    df47:	48 c7 84 24 c0 00 00 	movq   $0x0,0xc0(%rsp)
    df4e:	00 00 00 00 00 
    df53:	62 f1 7c 48 10 4c 24 	vmovups 0x80(%rsp),%zmm1
    df5a:	02 
    df5b:	62 f1 7c 48 11 0c 24 	vmovups %zmm1,(%rsp)
    df62:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
    df69:	00 00 
    df6b:	48 89 c7             	mov    %rax,%rdi
    df6e:	31 d2                	xor    %edx,%edx
    df70:	c5 fb 11 44 24 58    	vmovsd %xmm0,0x58(%rsp)
    df76:	c5 f8 77             	vzeroupper
    df79:	e8 12 3a 00 00       	call   11990 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
    df7e:	c5 fb 10 44 24 58    	vmovsd 0x58(%rsp),%xmm0
    df84:	89 d6                	mov    %edx,%esi
    df86:	e9 b5 00 00 00       	jmp    e040 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x9e0>
    df8b:	f3 4d 0f bd fa       	lzcnt  %r10,%r15
    df90:	c4 c2 81 f7 d2       	shlx   %r15,%r10,%rdx
    df95:	42 8d 0c 4d ac 02 00 	lea    0x2ac(,%r9,2),%ecx
    df9c:	00 
    df9d:	48 63 c9             	movslq %ecx,%rcx
    dfa0:	4c 8d 25 99 bc 03 00 	lea    0x3bc99(%rip),%r12        # 49c40 <FFC_POWERS_OF_FIVE>
    dfa7:	c4 42 bb f6 14 cc    	mulx   (%r12,%rcx,8),%r8,%r10
    dfad:	48 b9 ff ff ff ff 3f 	movabs $0x3fffffffff,%rcx
    dfb4:	00 00 00 
    dfb7:	c4 e2 a8 f2 c9       	andn   %rcx,%r10,%rcx
    dfbc:	75 1a                	jne    dfd8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x978>
    dfbe:	43 8d 0c 09          	lea    (%r9,%r9,1),%ecx
    dfc2:	81 c1 ad 02 00 00    	add    $0x2ad,%ecx
    dfc8:	48 63 c9             	movslq %ecx,%rcx
    dfcb:	c4 c2 f3 f6 0c cc    	mulx   (%r12,%rcx,8),%rcx,%rcx
    dfd1:	49 01 c8             	add    %rcx,%r8
    dfd4:	49 83 d2 00          	adc    $0x0,%r10
    dfd8:	4d 89 d4             	mov    %r10,%r12
    dfdb:	49 c1 ec 3f          	shr    $0x3f,%r12
    dfdf:	41 69 c9 6a 52 03 00 	imul   $0x3526a,%r9d,%ecx
    dfe6:	c1 f9 10             	sar    $0x10,%ecx
    dfe9:	44 29 f9             	sub    %r15d,%ecx
    dfec:	42 8d 14 21          	lea    (%rcx,%r12,1),%edx
    dff0:	83 c2 3f             	add    $0x3f,%edx
    dff3:	49 83 cc 26          	or     $0x26,%r12
    dff7:	c4 42 9b f7 fa       	shrx   %r12,%r10,%r15
    dffc:	83 fa 81             	cmp    $0xffffff81,%edx
    dfff:	0f 8f a9 01 00 00    	jg     e1ae <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xb4e>
    e005:	81 fa 43 ff ff ff    	cmp    $0xffffff43,%edx
    e00b:	0f 83 38 02 00 00    	jae    e249 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xbe9>
    e011:	45 31 c0             	xor    %r8d,%r8d
    e014:	31 d2                	xor    %edx,%edx
    e016:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e01b:	4c 39 c0             	cmp    %r8,%rax
    e01e:	0f 84 1d fe ff ff    	je     de41 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e1>
    e024:	e9 20 fe ff ff       	jmp    de49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e9>
    e029:	31 f6                	xor    %esi,%esi
    e02b:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e030:	45 84 f6             	test   %r14b,%r14b
    e033:	0f 85 c0 fd ff ff    	jne    ddf9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x799>
    e039:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    e040:	31 c9                	xor    %ecx,%ecx
    e042:	41 80 fd 2d          	cmp    $0x2d,%r13b
    e046:	0f 94 c2             	sete   %dl
    e049:	48 85 ed             	test   %rbp,%rbp
    e04c:	40 0f 95 c7          	setne  %dil
    e050:	48 85 c0             	test   %rax,%rax
    e053:	41 0f 94 c0          	sete   %r8b
    e057:	85 f6                	test   %esi,%esi
    e059:	41 0f 94 c1          	sete   %r9b
    e05d:	45 20 c1             	and    %r8b,%r9b
    e060:	41 84 f9             	test   %dil,%r9b
    e063:	0f 85 2b 02 00 00    	jne    e294 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc34>
    e069:	81 fe ff 00 00 00    	cmp    $0xff,%esi
    e06f:	0f 84 1f 02 00 00    	je     e294 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc34>
    e075:	c1 e6 17             	shl    $0x17,%esi
    e078:	88 d1                	mov    %dl,%cl
    e07a:	c1 e1 1f             	shl    $0x1f,%ecx
    e07d:	09 c6                	or     %eax,%esi
    e07f:	09 ce                	or     %ecx,%esi
    e081:	e9 1d f6 ff ff       	jmp    d6a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    e086:	49 c1 e1 02          	shl    $0x2,%r9
    e08a:	48 8d 05 7f bb 03 00 	lea    0x3bb7f(%rip),%rax        # 49c10 <FFC_FLOAT_POWERS_OF_TEN>
    e091:	4c 29 c8             	sub    %r9,%rax
    e094:	c5 f2 5e 08          	vdivss (%rax),%xmm1,%xmm1
    e098:	41 80 fd 2d          	cmp    $0x2d,%r13b
    e09c:	0f 85 c8 fb ff ff    	jne    dc6a <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x60a>
    e0a2:	e9 70 fb ff ff       	jmp    dc17 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x5b7>
    e0a7:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
    e0ae:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
    e0b2:	41 c1 e8 08          	shr    $0x8,%r8d
    e0b6:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
    e0ba:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
    e0c1:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
    e0c8:	c1 ed 10             	shr    $0x10,%ebp
    e0cb:	4c 01 cd             	add    %r9,%rbp
    e0ce:	49 83 c3 04          	add    $0x4,%r11
    e0d2:	49 39 c3             	cmp    %rax,%r11
    e0d5:	0f 85 a7 f8 ff ff    	jne    d982 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x322>
    e0db:	49 89 c3             	mov    %rax,%r11
    e0de:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    e0e3:	49 89 c9             	mov    %rcx,%r9
    e0e6:	4d 29 d9             	sub    %r11,%r9
    e0e9:	4d 89 d8             	mov    %r11,%r8
    e0ec:	49 29 c8             	sub    %rcx,%r8
    e0ef:	4c 89 44 24 68       	mov    %r8,0x68(%rsp)
    e0f4:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
    e0f9:	4d 29 c8             	sub    %r9,%r8
    e0fc:	4d 89 da             	mov    %r11,%r10
    e0ff:	4d 85 c0             	test   %r8,%r8
    e102:	0f 85 41 f9 ff ff    	jne    da49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x3e9>
    e108:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    e10f:	00 
    e110:	41 80 fd 2d          	cmp    $0x2d,%r13b
    e114:	75 03                	jne    e119 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xab9>
    e116:	48 ff c6             	inc    %rsi
    e119:	48 29 f0             	sub    %rsi,%rax
    e11c:	48 83 f8 03          	cmp    $0x3,%rax
    e120:	0f 8c 6e 01 00 00    	jl     e294 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc34>
    e126:	0f b7 0e             	movzwl (%rsi),%ecx
    e129:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
    e12d:	c1 e0 10             	shl    $0x10,%eax
    e130:	48 09 c8             	or     %rcx,%rax
    e133:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
    e13a:	20 20 20 
    e13d:	48 09 c8             	or     %rcx,%rax
    e140:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
    e147:	20 20 20 
    e14a:	48 39 c8             	cmp    %rcx,%rax
    e14d:	0f 84 3d f5 ff ff    	je     d690 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x30>
    e153:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
    e15a:	20 20 20 
    e15d:	48 39 c8             	cmp    %rcx,%rax
    e160:	0f 85 2e 01 00 00    	jne    e294 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xc34>
    e166:	31 f6                	xor    %esi,%esi
    e168:	41 80 fd 2d          	cmp    $0x2d,%r13b
    e16c:	40 0f 95 c6          	setne  %sil
    e170:	c1 e6 1f             	shl    $0x1f,%esi
    e173:	81 c6 00 00 c0 ff    	add    $0xffc00000,%esi
    e179:	e9 25 f5 ff ff       	jmp    d6a3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x43>
    e17e:	49 89 f4             	mov    %rsi,%r12
    e181:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    e186:	4c 89 de             	mov    %r11,%rsi
    e189:	48 f7 de             	neg    %rsi
    e18c:	80 f9 2d             	cmp    $0x2d,%cl
    e18f:	49 0f 45 f3          	cmovne %r11,%rsi
    e193:	49 01 f1             	add    %rsi,%r9
    e196:	4d 89 e3             	mov    %r12,%r11
    e199:	41 b4 01             	mov    $0x1,%r12b
    e19c:	45 31 f6             	xor    %r14d,%r14d
    e19f:	49 83 f8 14          	cmp    $0x14,%r8
    e1a3:	0f 8c 3d fa ff ff    	jl     dbe6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x586>
    e1a9:	e9 40 f9 ff ff       	jmp    daee <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x48e>
    e1ae:	44 89 f9             	mov    %r15d,%ecx
    e1b1:	83 e1 03             	and    $0x3,%ecx
    e1b4:	48 83 f1 01          	xor    $0x1,%rcx
    e1b8:	c4 42 99 f7 e7       	shlx   %r12,%r15,%r12
    e1bd:	4d 31 d4             	xor    %r10,%r12
    e1c0:	45 89 fa             	mov    %r15d,%r10d
    e1c3:	41 83 e2 fc          	and    $0xfffffffc,%r10d
    e1c7:	49 09 cc             	or     %rcx,%r12
    e1ca:	4d 0f 45 d7          	cmovne %r15,%r10
    e1ce:	49 8d 49 11          	lea    0x11(%r9),%rcx
    e1d2:	49 83 f8 02          	cmp    $0x2,%r8
    e1d6:	4d 0f 43 d7          	cmovae %r15,%r10
    e1da:	48 83 f9 1c          	cmp    $0x1c,%rcx
    e1de:	4d 0f 43 d7          	cmovae %r15,%r10
    e1e2:	44 89 d1             	mov    %r10d,%ecx
    e1e5:	83 e1 01             	and    $0x1,%ecx
    e1e8:	4c 01 d1             	add    %r10,%rcx
    e1eb:	41 89 c8             	mov    %ecx,%r8d
    e1ee:	41 d1 e8             	shr    $1,%r8d
    e1f1:	41 81 e0 ff ff 7f 03 	and    $0x37fffff,%r8d
    e1f8:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    e1ff:	83 da 00             	sbb    $0x0,%edx
    e202:	83 ea 80             	sub    $0xffffff80,%edx
    e205:	81 fa ff 00 00 00    	cmp    $0xff,%edx
    e20b:	41 ba 00 00 00 00    	mov    $0x0,%r10d
    e211:	4d 0f 43 c2          	cmovae %r10,%r8
    e215:	48 81 f9 00 00 00 02 	cmp    $0x2000000,%rcx
    e21c:	4d 0f 43 c2          	cmovae %r10,%r8
    e220:	81 fa ff 00 00 00    	cmp    $0xff,%edx
    e226:	b9 ff 00 00 00       	mov    $0xff,%ecx
    e22b:	0f 43 d1             	cmovae %ecx,%edx
    e22e:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e233:	4c 39 c0             	cmp    %r8,%rax
    e236:	0f 84 05 fc ff ff    	je     de41 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e1>
    e23c:	e9 08 fc ff ff       	jmp    de49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e9>
    e241:	4d 89 c3             	mov    %r8,%r11
    e244:	e9 95 fe ff ff       	jmp    e0de <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0xa7e>
    e249:	b9 82 ff ff ff       	mov    $0xffffff82,%ecx
    e24e:	29 d1                	sub    %edx,%ecx
    e250:	c4 42 f3 f7 d7       	shrx   %rcx,%r15,%r10
    e255:	49 0f a3 cf          	bt     %rcx,%r15
    e259:	49 83 d2 00          	adc    $0x0,%r10
    e25d:	45 89 d0             	mov    %r10d,%r8d
    e260:	41 d1 e8             	shr    $1,%r8d
    e263:	31 d2                	xor    %edx,%edx
    e265:	49 81 fa 00 00 00 01 	cmp    $0x1000000,%r10
    e26c:	0f 93 c2             	setae  %dl
    e26f:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
    e274:	4c 39 c0             	cmp    %r8,%rax
    e277:	0f 84 c4 fb ff ff    	je     de41 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e1>
    e27d:	e9 c7 fb ff ff       	jmp    de49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e9>
    e282:	48 81 c4 c8 00 00 00 	add    $0xc8,%rsp
    e289:	5b                   	pop    %rbx
    e28a:	41 5c                	pop    %r12
    e28c:	41 5d                	pop    %r13
    e28e:	41 5e                	pop    %r14
    e290:	41 5f                	pop    %r15
    e292:	5d                   	pop    %rbp
    e293:	c3                   	ret
    e294:	bf 10 00 00 00       	mov    $0x10,%edi
    e299:	e8 d2 7e ff ff       	call   6170 <__cxa_allocate_exception@plt>
    e29e:	48 89 c3             	mov    %rax,%rbx
    e2a1:	48 8d 35 8b e8 03 00 	lea    0x3e88b(%rip),%rsi        # 4cb33 <fast_float::powers_of_ten_uint64+0x643>
    e2a8:	48 89 c7             	mov    %rax,%rdi
    e2ab:	e8 60 7e ff ff       	call   6110 <std::runtime_error::runtime_error(char const*)@plt>
    e2b0:	48 8b 35 19 3d 05 00 	mov    0x53d19(%rip),%rsi        # 61fd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
    e2b7:	48 8b 15 a2 3c 05 00 	mov    0x53ca2(%rip),%rdx        # 61f60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
    e2be:	48 89 df             	mov    %rbx,%rdi
    e2c1:	e8 2a 82 ff ff       	call   64f0 <__cxa_throw@plt>
    e2c6:	49 89 c6             	mov    %rax,%r14
    e2c9:	48 89 df             	mov    %rbx,%rdi
    e2cc:	e8 8f 7f ff ff       	call   6260 <__cxa_free_exception@plt>
    e2d1:	4c 89 f7             	mov    %r14,%rdi
    e2d4:	e8 27 82 ff ff       	call   6500 <_Unwind_Resume@plt>
    e2d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

