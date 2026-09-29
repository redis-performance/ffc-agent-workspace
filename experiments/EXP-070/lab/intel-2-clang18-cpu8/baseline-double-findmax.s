00000000000127f0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   127f0:	55                   	push   %rbp
   127f1:	41 57                	push   %r15
   127f3:	41 56                	push   %r14
   127f5:	41 55                	push   %r13
   127f7:	41 54                	push   %r12
   127f9:	53                   	push   %rbx
   127fa:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   12801:	4c 8b 37             	mov    (%rdi),%r14
   12804:	4c 8b 7f 08          	mov    0x8(%rdi),%r15
   12808:	4d 39 fe             	cmp    %r15,%r14
   1280b:	0f 84 4d 0c 00 00    	je     1345e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc6e>
   12811:	89 f3                	mov    %esi,%ebx
   12813:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   12817:	c5 fb 12 1d f1 ea 03 	vmovddup 0x3eaf1(%rip),%xmm3        # 51310 <_IO_stdin_used+0x310>
   1281e:	00 
   1281f:	89 74 24 48          	mov    %esi,0x48(%rsp)
   12823:	4c 89 7c 24 50       	mov    %r15,0x50(%rsp)
   12828:	eb 17                	jmp    12841 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x51>
   1282a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   12830:	c5 fb 5f c2          	vmaxsd %xmm2,%xmm0,%xmm0
   12834:	49 83 c6 20          	add    $0x20,%r14
   12838:	4d 39 fe             	cmp    %r15,%r14
   1283b:	0f 84 21 0c 00 00    	je     13462 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc72>
   12841:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   12845:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   12849:	ba 01 00 00 00       	mov    $0x1,%edx
   1284e:	48 85 c9             	test   %rcx,%rcx
   12851:	0f 84 c9 0a 00 00    	je     13320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   12857:	49 8b 36             	mov    (%r14),%rsi
   1285a:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
   1285e:	44 0f b6 26          	movzbl (%rsi),%r12d
   12862:	48 89 f7             	mov    %rsi,%rdi
   12865:	45 89 e0             	mov    %r12d,%r8d
   12868:	41 80 fc 2d          	cmp    $0x2d,%r12b
   1286c:	41 0f 94 c3          	sete   %r11b
   12870:	75 2e                	jne    128a0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb0>
   12872:	48 83 f9 01          	cmp    $0x1,%rcx
   12876:	0f 84 26 0a 00 00    	je     132a2 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab2>
   1287c:	44 0f be 46 01       	movsbl 0x1(%rsi),%r8d
   12881:	41 83 f8 2e          	cmp    $0x2e,%r8d
   12885:	74 0d                	je     12894 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   12887:	41 8d 50 d0          	lea    -0x30(%r8),%edx
   1288b:	83 fa 09             	cmp    $0x9,%edx
   1288e:	0f 87 0e 0a 00 00    	ja     132a2 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab2>
   12894:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
   12898:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1289f:	00 
   128a0:	48 39 c7             	cmp    %rax,%rdi
   128a3:	44 88 5c 24 4f       	mov    %r11b,0x4f(%rsp)
   128a8:	0f 84 0a 01 00 00    	je     129b8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1c8>
   128ae:	41 0f be d0          	movsbl %r8b,%edx
   128b2:	83 c2 d0             	add    $0xffffffd0,%edx
   128b5:	83 fa 09             	cmp    $0x9,%edx
   128b8:	0f 87 1a 01 00 00    	ja     129d8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1e8>
   128be:	48 8d 57 01          	lea    0x1(%rdi),%rdx
   128c2:	49 0f be e8          	movsbq %r8b,%rbp
   128c6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   128ca:	48 39 c2             	cmp    %rax,%rdx
   128cd:	0f 84 e7 00 00 00    	je     129ba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   128d3:	44 0f be 02          	movsbl (%rdx),%r8d
   128d7:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   128db:	41 83 f9 09          	cmp    $0x9,%r9d
   128df:	0f 87 f8 00 00 00    	ja     129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   128e5:	4d 63 c0             	movslq %r8d,%r8
   128e8:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   128ed:	48 8d 57 02          	lea    0x2(%rdi),%rdx
   128f1:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   128f6:	48 39 c2             	cmp    %rax,%rdx
   128f9:	0f 84 bb 00 00 00    	je     129ba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   128ff:	44 0f be 02          	movsbl (%rdx),%r8d
   12903:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12907:	41 83 f9 09          	cmp    $0x9,%r9d
   1290b:	0f 87 cc 00 00 00    	ja     129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   12911:	4d 63 c0             	movslq %r8d,%r8
   12914:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   12919:	48 8d 57 03          	lea    0x3(%rdi),%rdx
   1291d:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   12922:	48 39 c2             	cmp    %rax,%rdx
   12925:	0f 84 8f 00 00 00    	je     129ba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   1292b:	44 0f be 02          	movsbl (%rdx),%r8d
   1292f:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12933:	41 83 f9 09          	cmp    $0x9,%r9d
   12937:	0f 87 a0 00 00 00    	ja     129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   1293d:	4d 63 c0             	movslq %r8d,%r8
   12940:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   12945:	48 8d 57 04          	lea    0x4(%rdi),%rdx
   12949:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   1294e:	48 39 c2             	cmp    %rax,%rdx
   12951:	74 67                	je     129ba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   12953:	44 0f be 02          	movsbl (%rdx),%r8d
   12957:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   1295b:	41 83 f9 09          	cmp    $0x9,%r9d
   1295f:	77 7c                	ja     129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   12961:	4d 63 c0             	movslq %r8d,%r8
   12964:	4c 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%r9
   12969:	48 8d 57 05          	lea    0x5(%rdi),%rdx
   1296d:	4b 8d 6c 48 d0       	lea    -0x30(%r8,%r9,2),%rbp
   12972:	48 39 c2             	cmp    %rax,%rdx
   12975:	74 43                	je     129ba <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ca>
   12977:	4c 8d 04 0e          	lea    (%rsi,%rcx,1),%r8
   1297b:	49 29 f8             	sub    %rdi,%r8
   1297e:	49 01 f8             	add    %rdi,%r8
   12981:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   12988:	0f 1f 84 00 00 00 00 
   1298f:	00 
   12990:	44 0f be 0a          	movsbl (%rdx),%r9d
   12994:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12998:	41 83 fa 09          	cmp    $0x9,%r10d
   1299c:	77 3f                	ja     129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   1299e:	4d 63 c9             	movslq %r9d,%r9
   129a1:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   129a6:	4b 8d 6c 51 d0       	lea    -0x30(%r9,%r10,2),%rbp
   129ab:	48 ff c2             	inc    %rdx
   129ae:	48 39 c2             	cmp    %rax,%rdx
   129b1:	75 dd                	jne    12990 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1a0>
   129b3:	4c 89 c2             	mov    %r8,%rdx
   129b6:	eb 25                	jmp    129dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1ed>
   129b8:	31 ed                	xor    %ebp,%ebp
   129ba:	49 89 c0             	mov    %rax,%r8
   129bd:	49 29 f8             	sub    %rdi,%r8
   129c0:	48 89 c2             	mov    %rax,%rdx
   129c3:	49 89 c3             	mov    %rax,%r11
   129c6:	45 31 c9             	xor    %r9d,%r9d
   129c9:	4c 89 4c 24 60       	mov    %r9,0x60(%rsp)
   129ce:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   129d3:	e9 a9 01 00 00       	jmp    12b81 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x391>
   129d8:	31 ed                	xor    %ebp,%ebp
   129da:	48 89 fa             	mov    %rdi,%rdx
   129dd:	49 89 d0             	mov    %rdx,%r8
   129e0:	49 29 f8             	sub    %rdi,%r8
   129e3:	48 39 c2             	cmp    %rax,%rdx
   129e6:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   129eb:	0f 84 80 01 00 00    	je     12b71 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x381>
   129f1:	80 3a 2e             	cmpb   $0x2e,(%rdx)
   129f4:	0f 85 7c 01 00 00    	jne    12b76 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x386>
   129fa:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
   129fe:	49 89 c0             	mov    %rax,%r8
   12a01:	4d 29 d8             	sub    %r11,%r8
   12a04:	49 83 f8 08          	cmp    $0x8,%r8
   12a08:	4d 89 d9             	mov    %r11,%r9
   12a0b:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   12a10:	0f 8c 9b 00 00 00    	jl     12ab1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2c1>
   12a16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   12a1d:	00 00 00 
   12a20:	4d 8b 0b             	mov    (%r11),%r9
   12a23:	49 ba 46 46 46 46 46 	movabs $0x4646464646464646,%r10
   12a2a:	46 46 46 
   12a2d:	4d 01 ca             	add    %r9,%r10
   12a30:	48 bb d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rbx
   12a37:	cf cf cf 
   12a3a:	49 01 d9             	add    %rbx,%r9
   12a3d:	4d 09 ca             	or     %r9,%r10
   12a40:	48 bb 80 80 80 80 80 	movabs $0x8080808080808080,%rbx
   12a47:	80 80 80 
   12a4a:	49 85 da             	test   %rbx,%r10
   12a4d:	75 62                	jne    12ab1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2c1>
   12a4f:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
   12a56:	4b 8d 1c 89          	lea    (%r9,%r9,4),%rbx
   12a5a:	49 c1 e9 08          	shr    $0x8,%r9
   12a5e:	49 8d 2c 59          	lea    (%r9,%rbx,2),%rbp
   12a62:	49 89 e9             	mov    %rbp,%r9
   12a65:	48 bb ff 00 00 00 ff 	movabs $0xff000000ff,%rbx
   12a6c:	00 00 00 
   12a6f:	49 21 d9             	and    %rbx,%r9
   12a72:	49 bd 64 00 00 00 40 	movabs $0xf424000000064,%r13
   12a79:	42 0f 00 
   12a7c:	4d 0f af cd          	imul   %r13,%r9
   12a80:	48 c1 ed 10          	shr    $0x10,%rbp
   12a84:	48 21 dd             	and    %rbx,%rbp
   12a87:	48 bb 01 00 00 00 10 	movabs $0x271000000001,%rbx
   12a8e:	27 00 00 
   12a91:	48 0f af eb          	imul   %rbx,%rbp
   12a95:	4c 01 cd             	add    %r9,%rbp
   12a98:	48 c1 ed 20          	shr    $0x20,%rbp
   12a9c:	4c 01 d5             	add    %r10,%rbp
   12a9f:	49 83 c3 08          	add    $0x8,%r11
   12aa3:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
   12aa7:	49 83 f8 07          	cmp    $0x7,%r8
   12aab:	0f 8f 6f ff ff ff    	jg     12a20 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x230>
   12ab1:	49 83 f8 04          	cmp    $0x4,%r8
   12ab5:	7c 21                	jl     12ad8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e8>
   12ab7:	45 8b 03             	mov    (%r11),%r8d
   12aba:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
   12ac1:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
   12ac8:	45 09 c1             	or     %r8d,%r9d
   12acb:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
   12ad2:	0f 84 5f 07 00 00    	je     13237 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa47>
   12ad8:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   12adc:	49 39 c3             	cmp    %rax,%r11
   12adf:	0f 84 8a 07 00 00    	je     1326f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   12ae5:	45 0f be 0b          	movsbl (%r11),%r9d
   12ae9:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
   12aed:	41 83 f8 09          	cmp    $0x9,%r8d
   12af1:	0f 87 7b 07 00 00    	ja     13272 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   12af7:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   12afc:	4d 8d 43 01          	lea    0x1(%r11),%r8
   12b00:	41 80 c1 d0          	add    $0xd0,%r9b
   12b04:	45 0f b6 c9          	movzbl %r9b,%r9d
   12b08:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   12b0c:	49 39 c0             	cmp    %rax,%r8
   12b0f:	0f 84 5a 07 00 00    	je     1326f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   12b15:	45 0f be 08          	movsbl (%r8),%r9d
   12b19:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12b1d:	41 83 fa 09          	cmp    $0x9,%r10d
   12b21:	0f 87 ea 08 00 00    	ja     13411 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc21>
   12b27:	4c 8d 54 ad 00       	lea    0x0(%rbp,%rbp,4),%r10
   12b2c:	4d 8d 43 02          	lea    0x2(%r11),%r8
   12b30:	41 80 c1 d0          	add    $0xd0,%r9b
   12b34:	45 0f b6 c9          	movzbl %r9b,%r9d
   12b38:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   12b3c:	49 39 c0             	cmp    %rax,%r8
   12b3f:	0f 84 2a 07 00 00    	je     1326f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa7f>
   12b45:	45 0f be 08          	movsbl (%r8),%r9d
   12b49:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12b4d:	41 83 fa 09          	cmp    $0x9,%r10d
   12b51:	0f 87 ba 08 00 00    	ja     13411 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc21>
   12b57:	4c 8d 44 ad 00       	lea    0x0(%rbp,%rbp,4),%r8
   12b5c:	49 83 c3 03          	add    $0x3,%r11
   12b60:	41 80 c1 d0          	add    $0xd0,%r9b
   12b64:	45 0f b6 c9          	movzbl %r9b,%r9d
   12b68:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
   12b6c:	e9 01 07 00 00       	jmp    13272 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   12b71:	49 89 c3             	mov    %rax,%r11
   12b74:	eb 03                	jmp    12b79 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x389>
   12b76:	49 89 d3             	mov    %rdx,%r11
   12b79:	45 31 c9             	xor    %r9d,%r9d
   12b7c:	4c 89 4c 24 60       	mov    %r9,0x60(%rsp)
   12b81:	45 31 c9             	xor    %r9d,%r9d
   12b84:	45 31 d2             	xor    %r10d,%r10d
   12b87:	4c 89 54 24 58       	mov    %r10,0x58(%rsp)
   12b8c:	45 31 d2             	xor    %r10d,%r10d
   12b8f:	4d 85 c0             	test   %r8,%r8
   12b92:	0f 84 04 07 00 00    	je     1329c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xaac>
   12b98:	49 39 c3             	cmp    %rax,%r11
   12b9b:	0f 84 98 00 00 00    	je     12c39 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x449>
   12ba1:	41 0f b6 1b          	movzbl (%r11),%ebx
   12ba5:	83 cb 20             	or     $0x20,%ebx
   12ba8:	83 fb 65             	cmp    $0x65,%ebx
   12bab:	0f 85 8b 00 00 00    	jne    12c3c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   12bb1:	49 8d 5b 01          	lea    0x1(%r11),%rbx
   12bb5:	48 39 c3             	cmp    %rax,%rbx
   12bb8:	0f 84 7e 00 00 00    	je     12c3c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   12bbe:	45 0f b6 6b 01       	movzbl 0x1(%r11),%r13d
   12bc3:	4d 8d 7b 02          	lea    0x2(%r11),%r15
   12bc7:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
   12bcc:	41 83 c5 d5          	add    $0xffffffd5,%r13d
   12bd0:	41 f6 c5 fd          	test   $0xfd,%r13b
   12bd4:	49 0f 44 df          	cmove  %r15,%rbx
   12bd8:	48 39 c3             	cmp    %rax,%rbx
   12bdb:	0f 84 fd 00 00 00    	je     12cde <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4ee>
   12be1:	44 0f be 3b          	movsbl (%rbx),%r15d
   12be5:	41 83 c7 d0          	add    $0xffffffd0,%r15d
   12be9:	41 83 ff 09          	cmp    $0x9,%r15d
   12bed:	0f 87 eb 00 00 00    	ja     12cde <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4ee>
   12bf3:	48 01 ce             	add    %rcx,%rsi
   12bf6:	31 c9                	xor    %ecx,%ecx
   12bf8:	eb 12                	jmp    12c0c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x41c>
   12bfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   12c00:	48 ff c3             	inc    %rbx
   12c03:	48 39 c3             	cmp    %rax,%rbx
   12c06:	0f 84 29 07 00 00    	je     13335 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb45>
   12c0c:	44 0f be 1b          	movsbl (%rbx),%r11d
   12c10:	45 8d 7b d0          	lea    -0x30(%r11),%r15d
   12c14:	41 83 ff 09          	cmp    $0x9,%r15d
   12c18:	0f 87 1a 07 00 00    	ja     13338 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb48>
   12c1e:	48 81 f9 ff ff ff 0f 	cmp    $0xfffffff,%rcx
   12c25:	7f d9                	jg     12c00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x410>
   12c27:	41 80 c3 d0          	add    $0xd0,%r11b
   12c2b:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   12c2f:	45 0f b6 db          	movzbl %r11b,%r11d
   12c33:	49 8d 0c 4b          	lea    (%r11,%rcx,2),%rcx
   12c37:	eb c7                	jmp    12c00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x410>
   12c39:	49 89 c3             	mov    %rax,%r11
   12c3c:	31 f6                	xor    %esi,%esi
   12c3e:	b3 01                	mov    $0x1,%bl
   12c40:	31 c9                	xor    %ecx,%ecx
   12c42:	49 83 f8 14          	cmp    $0x14,%r8
   12c46:	0f 8c ef 00 00 00    	jl     12d3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   12c4c:	48 39 c7             	cmp    %rax,%rdi
   12c4f:	74 46                	je     12c97 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a7>
   12c51:	48 89 f9             	mov    %rdi,%rcx
   12c54:	eb 20                	jmp    12c76 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x486>
   12c56:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   12c5d:	00 00 00 
   12c60:	45 31 ff             	xor    %r15d,%r15d
   12c63:	41 80 fd 30          	cmp    $0x30,%r13b
   12c67:	41 0f 94 c7          	sete   %r15b
   12c6b:	4d 29 f8             	sub    %r15,%r8
   12c6e:	48 ff c1             	inc    %rcx
   12c71:	48 39 c1             	cmp    %rax,%rcx
   12c74:	74 10                	je     12c86 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x496>
   12c76:	44 0f b6 29          	movzbl (%rcx),%r13d
   12c7a:	41 83 fd 30          	cmp    $0x30,%r13d
   12c7e:	74 e0                	je     12c60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x470>
   12c80:	41 83 fd 2e          	cmp    $0x2e,%r13d
   12c84:	74 da                	je     12c60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x470>
   12c86:	31 c9                	xor    %ecx,%ecx
   12c88:	49 83 f8 14          	cmp    $0x14,%r8
   12c8c:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   12c91:	0f 8c a4 00 00 00    	jl     12d3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   12c97:	48 39 d7             	cmp    %rdx,%rdi
   12c9a:	74 59                	je     12cf5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x505>
   12c9c:	48 89 f8             	mov    %rdi,%rax
   12c9f:	31 ed                	xor    %ebp,%ebp
   12ca1:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   12ca8:	b6 e0 0d 
   12cab:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   12cb0:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
   12cb5:	4c 0f be 00          	movsbq (%rax),%r8
   12cb9:	49 8d 6c 48 d0       	lea    -0x30(%r8,%rcx,2),%rbp
   12cbe:	48 ff c0             	inc    %rax
   12cc1:	4c 39 cd             	cmp    %r9,%rbp
   12cc4:	73 05                	jae    12ccb <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4db>
   12cc6:	48 39 d0             	cmp    %rdx,%rax
   12cc9:	75 e5                	jne    12cb0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4c0>
   12ccb:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
   12ccf:	48 39 cd             	cmp    %rcx,%rbp
   12cd2:	77 5a                	ja     12d2e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53e>
   12cd4:	48 89 d8             	mov    %rbx,%rax
   12cd7:	4c 39 d3             	cmp    %r10,%rbx
   12cda:	75 34                	jne    12d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x520>
   12cdc:	eb 4d                	jmp    12d2b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   12cde:	31 f6                	xor    %esi,%esi
   12ce0:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   12ce5:	b3 01                	mov    $0x1,%bl
   12ce7:	31 c9                	xor    %ecx,%ecx
   12ce9:	49 83 f8 14          	cmp    $0x14,%r8
   12ced:	0f 8d 59 ff ff ff    	jge    12c4c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x45c>
   12cf3:	eb 46                	jmp    12d3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   12cf5:	31 ed                	xor    %ebp,%ebp
   12cf7:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   12cfe:	b6 e0 0d 
   12d01:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
   12d06:	48 89 d8             	mov    %rbx,%rax
   12d09:	4c 39 d3             	cmp    %r10,%rbx
   12d0c:	74 1d                	je     12d2b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   12d0e:	66 90                	xchg   %ax,%ax
   12d10:	48 8d 4c ad 00       	lea    0x0(%rbp,%rbp,4),%rcx
   12d15:	48 0f be 10          	movsbq (%rax),%rdx
   12d19:	48 8d 6c 4a d0       	lea    -0x30(%rdx,%rcx,2),%rbp
   12d1e:	48 ff c0             	inc    %rax
   12d21:	4c 39 cd             	cmp    %r9,%rbp
   12d24:	73 05                	jae    12d2b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53b>
   12d26:	4c 39 d0             	cmp    %r10,%rax
   12d29:	75 e5                	jne    12d10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x520>
   12d2b:	48 89 da             	mov    %rbx,%rdx
   12d2e:	48 29 c2             	sub    %rax,%rdx
   12d31:	48 01 f2             	add    %rsi,%rdx
   12d34:	b1 01                	mov    $0x1,%cl
   12d36:	31 db                	xor    %ebx,%ebx
   12d38:	49 89 d1             	mov    %rdx,%r9
   12d3b:	84 db                	test   %bl,%bl
   12d3d:	74 44                	je     12d83 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x593>
   12d3f:	4d 85 c9             	test   %r9,%r9
   12d42:	75 3f                	jne    12d83 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x593>
   12d44:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   12d4b:	ff 1f 00 
   12d4e:	48 ff c0             	inc    %rax
   12d51:	48 39 c5             	cmp    %rax,%rbp
   12d54:	0f 87 a4 00 00 00    	ja     12dfe <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   12d5a:	48 85 ed             	test   %rbp,%rbp
   12d5d:	0f 84 2e 02 00 00    	je     12f91 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a1>
   12d63:	41 80 fc 2d          	cmp    $0x2d,%r12b
   12d67:	0f 94 c0             	sete   %al
   12d6a:	62 f1 df 08 7b d5    	vcvtusi2sd %rbp,%xmm4,%xmm2
   12d70:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   12d74:	c5 fb 92 c8          	kmovd  %eax,%k1
   12d78:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   12d7e:	e9 23 02 00 00       	jmp    12fa6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7b6>
   12d83:	49 8d 41 16          	lea    0x16(%r9),%rax
   12d87:	48 83 f8 2d          	cmp    $0x2d,%rax
   12d8b:	0f 92 c0             	setb   %al
   12d8e:	20 c3                	and    %al,%bl
   12d90:	80 fb 01             	cmp    $0x1,%bl
   12d93:	75 33                	jne    12dc8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5d8>
   12d95:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   12d9c:	ff 1f 00 
   12d9f:	48 ff c0             	inc    %rax
   12da2:	48 39 c5             	cmp    %rax,%rbp
   12da5:	77 57                	ja     12dfe <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   12da7:	62 f1 df 08 7b cd    	vcvtusi2sd %rbp,%xmm4,%xmm1
   12dad:	4d 85 c9             	test   %r9,%r9
   12db0:	0f 88 51 04 00 00    	js     13207 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   12db6:	48 8d 05 33 28 04 00 	lea    0x42833(%rip),%rax        # 555f0 <FFC_DOUBLE_POWERS_OF_TEN>
   12dbd:	c4 a1 73 59 14 c8    	vmulsd (%rax,%r9,8),%xmm1,%xmm2
   12dc3:	e9 51 04 00 00       	jmp    13219 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa29>
   12dc8:	31 c0                	xor    %eax,%eax
   12dca:	48 85 ed             	test   %rbp,%rbp
   12dcd:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   12dd1:	0f 84 dd 03 00 00    	je     131b4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9c4>
   12dd7:	be 00 00 00 00       	mov    $0x0,%esi
   12ddc:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   12de3:	0f 8c 6b 01 00 00    	jl     12f54 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x764>
   12de9:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   12df0:	7e 0c                	jle    12dfe <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x60e>
   12df2:	be ff 07 00 00       	mov    $0x7ff,%esi
   12df7:	31 c0                	xor    %eax,%eax
   12df9:	e9 52 01 00 00       	jmp    12f50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x760>
   12dfe:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
   12e03:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
   12e08:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
   12e0f:	00 
   12e10:	48 98                	cltq
   12e12:	48 8d 1d c7 28 04 00 	lea    0x428c7(%rip),%rbx        # 556e0 <FFC_POWERS_OF_FIVE>
   12e19:	c4 62 fb f6 04 c3    	mulx   (%rbx,%rax,8),%rax,%r8
   12e1f:	45 89 c2             	mov    %r8d,%r10d
   12e22:	41 f7 d2             	not    %r10d
   12e25:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   12e2c:	75 1b                	jne    12e49 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x659>
   12e2e:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   12e32:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   12e39:	4d 63 d2             	movslq %r10d,%r10
   12e3c:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   12e42:	48 01 d0             	add    %rdx,%rax
   12e45:	49 83 d0 00          	adc    $0x0,%r8
   12e49:	4d 89 c2             	mov    %r8,%r10
   12e4c:	49 c1 ea 3f          	shr    $0x3f,%r10
   12e50:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   12e57:	c1 fa 10             	sar    $0x10,%edx
   12e5a:	29 f2                	sub    %esi,%edx
   12e5c:	42 8d 74 12 3f       	lea    0x3f(%rdx,%r10,1),%esi
   12e61:	49 83 c2 09          	add    $0x9,%r10
   12e65:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
   12e6a:	81 fe 01 fc ff ff    	cmp    $0xfffffc01,%esi
   12e70:	7f 15                	jg     12e87 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x697>
   12e72:	81 fe c3 fb ff ff    	cmp    $0xfffffbc3,%esi
   12e78:	0f 83 a0 00 00 00    	jae    12f1e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x72e>
   12e7e:	31 c0                	xor    %eax,%eax
   12e80:	31 f6                	xor    %esi,%esi
   12e82:	e9 c4 00 00 00       	jmp    12f4b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x75b>
   12e87:	49 8d 59 04          	lea    0x4(%r9),%rbx
   12e8b:	41 89 d7             	mov    %edx,%r15d
   12e8e:	41 83 e7 03          	and    $0x3,%r15d
   12e92:	49 83 f7 01          	xor    $0x1,%r15
   12e96:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
   12e9b:	4d 31 c2             	xor    %r8,%r10
   12e9e:	49 89 d0             	mov    %rdx,%r8
   12ea1:	49 bd fc ff ff ff ff 	movabs $0xfffffffffffffc,%r13
   12ea8:	ff ff 00 
   12eab:	4d 21 e8             	and    %r13,%r8
   12eae:	4d 09 fa             	or     %r15,%r10
   12eb1:	4c 0f 45 c2          	cmovne %rdx,%r8
   12eb5:	48 83 f8 02          	cmp    $0x2,%rax
   12eb9:	4c 0f 43 c2          	cmovae %rdx,%r8
   12ebd:	48 83 fb 1c          	cmp    $0x1c,%rbx
   12ec1:	4c 0f 43 c2          	cmovae %rdx,%r8
   12ec5:	44 89 c2             	mov    %r8d,%edx
   12ec8:	83 e2 01             	and    $0x1,%edx
   12ecb:	4c 01 c2             	add    %r8,%rdx
   12ece:	48 89 d0             	mov    %rdx,%rax
   12ed1:	48 d1 e8             	shr    $1,%rax
   12ed4:	49 b8 ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r8
   12edb:	ff ef 7f 
   12ede:	4c 21 c0             	and    %r8,%rax
   12ee1:	49 b8 00 00 00 00 00 	movabs $0x40000000000000,%r8
   12ee8:	00 40 00 
   12eeb:	4c 39 c2             	cmp    %r8,%rdx
   12eee:	83 de 00             	sbb    $0x0,%esi
   12ef1:	81 c6 00 04 00 00    	add    $0x400,%esi
   12ef7:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   12efd:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   12f03:	49 0f 43 c2          	cmovae %r10,%rax
   12f07:	4c 39 c2             	cmp    %r8,%rdx
   12f0a:	49 0f 43 c2          	cmovae %r10,%rax
   12f0e:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   12f14:	ba ff 07 00 00       	mov    $0x7ff,%edx
   12f19:	0f 43 f2             	cmovae %edx,%esi
   12f1c:	eb 2d                	jmp    12f4b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x75b>
   12f1e:	b8 02 fc ff ff       	mov    $0xfffffc02,%eax
   12f23:	29 f0                	sub    %esi,%eax
   12f25:	c4 62 fb f7 c2       	shrx   %rax,%rdx,%r8
   12f2a:	48 0f a3 c2          	bt     %rax,%rdx
   12f2e:	49 83 d0 00          	adc    $0x0,%r8
   12f32:	4c 89 c0             	mov    %r8,%rax
   12f35:	48 d1 e8             	shr    $1,%rax
   12f38:	31 f6                	xor    %esi,%esi
   12f3a:	48 ba ff ff ff ff ff 	movabs $0x1fffffffffffff,%rdx
   12f41:	ff 1f 00 
   12f44:	49 39 d0             	cmp    %rdx,%r8
   12f47:	40 0f 97 c6          	seta   %sil
   12f4b:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   12f50:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   12f54:	84 c9                	test   %cl,%cl
   12f56:	0f 84 62 02 00 00    	je     131be <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   12f5c:	45 31 c0             	xor    %r8d,%r8d
   12f5f:	49 89 ea             	mov    %rbp,%r10
   12f62:	49 ff c2             	inc    %r10
   12f65:	74 4a                	je     12fb1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c1>
   12f67:	ba 00 00 00 00       	mov    $0x0,%edx
   12f6c:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   12f73:	7c 3e                	jl     12fb3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c3>
   12f75:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   12f7c:	0f 8e a1 01 00 00    	jle    13123 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x933>
   12f82:	ba ff 07 00 00       	mov    $0x7ff,%edx
   12f87:	45 31 c0             	xor    %r8d,%r8d
   12f8a:	4c 39 c0             	cmp    %r8,%rax
   12f8d:	74 29                	je     12fb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c8>
   12f8f:	eb 2f                	jmp    12fc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   12f91:	41 80 fc 2d          	cmp    $0x2d,%r12b
   12f95:	0f 94 c0             	sete   %al
   12f98:	c5 fb 92 c8          	kmovd  %eax,%k1
   12f9c:	62 f1 ff 89 10 15 6a 	vmovsd 0x3e36a(%rip),%xmm2{%k1}{z}        # 51310 <_IO_stdin_used+0x310>
   12fa3:	e3 03 00 
   12fa6:	31 d2                	xor    %edx,%edx
   12fa8:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   12fac:	e9 6f 03 00 00       	jmp    13320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   12fb1:	31 d2                	xor    %edx,%edx
   12fb3:	4c 39 c0             	cmp    %r8,%rax
   12fb6:	75 08                	jne    12fc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   12fb8:	39 d6                	cmp    %edx,%esi
   12fba:	0f 84 fe 01 00 00    	je     131be <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   12fc0:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
   12fc5:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
   12fca:	43 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%eax
   12fd1:	00 
   12fd2:	48 98                	cltq
   12fd4:	48 8d 35 05 27 04 00 	lea    0x42705(%rip),%rsi        # 556e0 <FFC_POWERS_OF_FIVE>
   12fdb:	c4 e2 cb f6 04 c6    	mulx   (%rsi,%rax,8),%rsi,%rax
   12fe1:	41 89 c2             	mov    %eax,%r10d
   12fe4:	41 f7 d2             	not    %r10d
   12fe7:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   12fee:	75 28                	jne    13018 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x828>
   12ff0:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   12ff4:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   12ffb:	4d 63 d2             	movslq %r10d,%r10
   12ffe:	41 89 dd             	mov    %ebx,%r13d
   13001:	48 8d 1d d8 26 04 00 	lea    0x426d8(%rip),%rbx        # 556e0 <FFC_POWERS_OF_FIVE>
   13008:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   1300e:	44 89 eb             	mov    %r13d,%ebx
   13011:	48 01 f2             	add    %rsi,%rdx
   13014:	48 83 d0 00          	adc    $0x0,%rax
   13018:	48 89 c2             	mov    %rax,%rdx
   1301b:	48 c1 ea 3f          	shr    $0x3f,%rdx
   1301f:	83 f2 01             	xor    $0x1,%edx
   13022:	c4 e2 e9 f7 c0       	shlx   %rdx,%rax,%rax
   13027:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
   1302e:	c1 fe 10             	sar    $0x10,%esi
   13031:	44 01 c2             	add    %r8d,%edx
   13034:	29 d6                	sub    %edx,%esi
   13036:	8d 96 72 04 00 00    	lea    0x472(%rsi),%edx
   1303c:	81 c6 34 84 ff ff    	add    $0xffff8434,%esi
   13042:	81 fa 3d 80 00 00    	cmp    $0x803d,%edx
   13048:	0f 8f 70 01 00 00    	jg     131be <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   1304e:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   13055:	00 
   13056:	48 89 ac 24 98 00 00 	mov    %rbp,0x98(%rsp)
   1305d:	00 
   1305e:	4c 89 9c 24 a0 00 00 	mov    %r11,0xa0(%rsp)
   13065:	00 
   13066:	0f b6 54 24 4f       	movzbl 0x4f(%rsp),%edx
   1306b:	88 94 24 a8 00 00 00 	mov    %dl,0xa8(%rsp)
   13072:	c6 84 24 a9 00 00 00 	movb   $0x1,0xa9(%rsp)
   13079:	01 
   1307a:	88 8c 24 aa 00 00 00 	mov    %cl,0xaa(%rsp)
   13081:	48 8d 8c 24 ab 00 00 	lea    0xab(%rsp),%rcx
   13088:	00 
   13089:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
   1308d:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
   13093:	48 89 bc 24 b0 00 00 	mov    %rdi,0xb0(%rsp)
   1309a:	00 
   1309b:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   130a0:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
   130a7:	00 
   130a8:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   130ad:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   130b4:	00 
   130b5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   130ba:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   130c1:	00 
   130c2:	48 c7 84 24 d0 00 00 	movq   $0x0,0xd0(%rsp)
   130c9:	00 00 00 00 00 
   130ce:	c5 fd 10 94 24 90 00 	vmovupd 0x90(%rsp),%ymm2
   130d5:	00 00 
   130d7:	c5 fd 10 8c 24 b0 00 	vmovupd 0xb0(%rsp),%ymm1
   130de:	00 00 
   130e0:	c5 fd 11 4c 24 20    	vmovupd %ymm1,0x20(%rsp)
   130e6:	c5 fd 11 14 24       	vmovupd %ymm2,(%rsp)
   130eb:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
   130f2:	00 00 
   130f4:	48 89 c7             	mov    %rax,%rdi
   130f7:	ba 01 00 00 00       	mov    $0x1,%edx
   130fc:	c5 fb 11 44 24 58    	vmovsd %xmm0,0x58(%rsp)
   13102:	c5 f9 29 5c 24 70    	vmovapd %xmm3,0x70(%rsp)
   13108:	c5 f8 77             	vzeroupper
   1310b:	e8 90 48 00 00       	call   179a0 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   13110:	c5 f9 28 5c 24 70    	vmovapd 0x70(%rsp),%xmm3
   13116:	c5 fb 10 44 24 58    	vmovsd 0x58(%rsp),%xmm0
   1311c:	89 d6                	mov    %edx,%esi
   1311e:	e9 9b 00 00 00       	jmp    131be <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9ce>
   13123:	f3 49 0f bd da       	lzcnt  %r10,%rbx
   13128:	c4 c2 e1 f7 d2       	shlx   %rbx,%r10,%rdx
   1312d:	47 8d 84 09 ac 02 00 	lea    0x2ac(%r9,%r9,1),%r8d
   13134:	00 
   13135:	4d 63 c0             	movslq %r8d,%r8
   13138:	4c 8d 2d a1 25 04 00 	lea    0x425a1(%rip),%r13        # 556e0 <FFC_POWERS_OF_FIVE>
   1313f:	c4 02 bb f6 54 c5 00 	mulx   0x0(%r13,%r8,8),%r8,%r10
   13146:	45 89 d7             	mov    %r10d,%r15d
   13149:	41 f7 d7             	not    %r15d
   1314c:	41 f7 c7 ff 01 00 00 	test   $0x1ff,%r15d
   13153:	75 1c                	jne    13171 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x981>
   13155:	47 8d 3c 09          	lea    (%r9,%r9,1),%r15d
   13159:	41 81 c7 ad 02 00 00 	add    $0x2ad,%r15d
   13160:	4d 63 ff             	movslq %r15d,%r15
   13163:	c4 82 eb f6 54 fd 00 	mulx   0x0(%r13,%r15,8),%rdx,%rdx
   1316a:	49 01 d0             	add    %rdx,%r8
   1316d:	49 83 d2 00          	adc    $0x0,%r10
   13171:	4d 89 d5             	mov    %r10,%r13
   13174:	49 c1 ed 3f          	shr    $0x3f,%r13
   13178:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   1317f:	c1 fa 10             	sar    $0x10,%edx
   13182:	29 da                	sub    %ebx,%edx
   13184:	42 8d 54 2a 3f       	lea    0x3f(%rdx,%r13,1),%edx
   13189:	49 83 c5 09          	add    $0x9,%r13
   1318d:	c4 42 93 f7 fa       	shrx   %r13,%r10,%r15
   13192:	81 fa 01 fc ff ff    	cmp    $0xfffffc01,%edx
   13198:	0f 8f c7 01 00 00    	jg     13365 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb75>
   1319e:	81 fa c3 fb ff ff    	cmp    $0xfffffbc3,%edx
   131a4:	0f 83 6f 02 00 00    	jae    13419 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc29>
   131aa:	45 31 c0             	xor    %r8d,%r8d
   131ad:	31 d2                	xor    %edx,%edx
   131af:	e9 93 02 00 00       	jmp    13447 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc57>
   131b4:	31 f6                	xor    %esi,%esi
   131b6:	84 c9                	test   %cl,%cl
   131b8:	0f 85 9e fd ff ff    	jne    12f5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x76c>
   131be:	31 c9                	xor    %ecx,%ecx
   131c0:	41 80 fc 2d          	cmp    $0x2d,%r12b
   131c4:	0f 94 c1             	sete   %cl
   131c7:	48 89 f2             	mov    %rsi,%rdx
   131ca:	48 c1 e2 34          	shl    $0x34,%rdx
   131ce:	48 c1 e1 3f          	shl    $0x3f,%rcx
   131d2:	48 09 c2             	or     %rax,%rdx
   131d5:	48 09 ca             	or     %rcx,%rdx
   131d8:	48 85 ed             	test   %rbp,%rbp
   131db:	0f 95 c1             	setne  %cl
   131de:	48 85 c0             	test   %rax,%rax
   131e1:	0f 94 c0             	sete   %al
   131e4:	c4 e1 f9 6e d2       	vmovq  %rdx,%xmm2
   131e9:	85 f6                	test   %esi,%esi
   131eb:	0f 94 c2             	sete   %dl
   131ee:	20 c2                	and    %al,%dl
   131f0:	20 ca                	and    %cl,%dl
   131f2:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   131f8:	0f 94 c0             	sete   %al
   131fb:	08 d0                	or     %dl,%al
   131fd:	0f b6 d0             	movzbl %al,%edx
   13200:	01 d2                	add    %edx,%edx
   13202:	e9 19 01 00 00       	jmp    13320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   13207:	49 c1 e1 03          	shl    $0x3,%r9
   1320b:	48 8d 05 de 23 04 00 	lea    0x423de(%rip),%rax        # 555f0 <FFC_DOUBLE_POWERS_OF_TEN>
   13212:	4c 29 c8             	sub    %r9,%rax
   13215:	c5 f3 5e 10          	vdivsd (%rax),%xmm1,%xmm2
   13219:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   1321d:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13221:	0f 94 c0             	sete   %al
   13224:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   13228:	c5 fb 92 c8          	kmovd  %eax,%k1
   1322c:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   13232:	e9 df 00 00 00       	jmp    13316 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb26>
   13237:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
   1323e:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
   13242:	41 c1 e8 08          	shr    $0x8,%r8d
   13246:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
   1324a:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
   13251:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
   13258:	c1 ed 10             	shr    $0x10,%ebp
   1325b:	4c 01 cd             	add    %r9,%rbp
   1325e:	49 83 c3 04          	add    $0x4,%r11
   13262:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   13266:	49 39 c3             	cmp    %rax,%r11
   13269:	0f 85 76 f8 ff ff    	jne    12ae5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2f5>
   1326f:	49 89 c3             	mov    %rax,%r11
   13272:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   13277:	4d 89 c1             	mov    %r8,%r9
   1327a:	4d 29 d9             	sub    %r11,%r9
   1327d:	4d 89 da             	mov    %r11,%r10
   13280:	4d 29 c2             	sub    %r8,%r10
   13283:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   13288:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1328d:	4d 29 c8             	sub    %r9,%r8
   13290:	4d 89 da             	mov    %r11,%r10
   13293:	4d 85 c0             	test   %r8,%r8
   13296:	0f 85 fc f8 ff ff    	jne    12b98 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3a8>
   1329c:	41 80 fc 2d          	cmp    $0x2d,%r12b
   132a0:	75 03                	jne    132a5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xab5>
   132a2:	48 ff c6             	inc    %rsi
   132a5:	48 29 f0             	sub    %rsi,%rax
   132a8:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   132ac:	ba 01 00 00 00       	mov    $0x1,%edx
   132b1:	48 83 f8 03          	cmp    $0x3,%rax
   132b5:	7c 69                	jl     13320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   132b7:	0f b7 0e             	movzwl (%rsi),%ecx
   132ba:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   132be:	c1 e0 10             	shl    $0x10,%eax
   132c1:	48 09 c8             	or     %rcx,%rax
   132c4:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
   132cb:	20 20 20 
   132ce:	48 09 c8             	or     %rcx,%rax
   132d1:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
   132d8:	20 20 20 
   132db:	48 39 c8             	cmp    %rcx,%rax
   132de:	74 21                	je     13301 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb11>
   132e0:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
   132e7:	20 20 20 
   132ea:	48 39 c8             	cmp    %rcx,%rax
   132ed:	75 31                	jne    13320 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb30>
   132ef:	31 c0                	xor    %eax,%eax
   132f1:	41 80 fc 2d          	cmp    $0x2d,%r12b
   132f5:	0f 94 c0             	sete   %al
   132f8:	48 8d 0d 81 dd 03 00 	lea    0x3dd81(%rip),%rcx        # 51080 <_IO_stdin_used+0x80>
   132ff:	eb 10                	jmp    13311 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb21>
   13301:	31 c0                	xor    %eax,%eax
   13303:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13307:	0f 94 c0             	sete   %al
   1330a:	48 8d 0d 5f dd 03 00 	lea    0x3dd5f(%rip),%rcx        # 51070 <_IO_stdin_used+0x70>
   13311:	c5 fb 10 14 c1       	vmovsd (%rcx,%rax,8),%xmm2
   13316:	31 d2                	xor    %edx,%edx
   13318:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   1331f:	00 
   13320:	85 d2                	test   %edx,%edx
   13322:	0f 84 08 f5 ff ff    	je     12830 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   13328:	84 db                	test   %bl,%bl
   1332a:	0f 85 00 f5 ff ff    	jne    12830 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   13330:	e9 3f 01 00 00       	jmp    13474 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc84>
   13335:	48 89 f3             	mov    %rsi,%rbx
   13338:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   1333d:	48 89 ce             	mov    %rcx,%rsi
   13340:	48 f7 de             	neg    %rsi
   13343:	80 7c 24 68 2d       	cmpb   $0x2d,0x68(%rsp)
   13348:	48 0f 45 f1          	cmovne %rcx,%rsi
   1334c:	49 01 f1             	add    %rsi,%r9
   1334f:	49 89 db             	mov    %rbx,%r11
   13352:	b3 01                	mov    $0x1,%bl
   13354:	31 c9                	xor    %ecx,%ecx
   13356:	49 83 f8 14          	cmp    $0x14,%r8
   1335a:	0f 8c db f9 ff ff    	jl     12d3b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x54b>
   13360:	e9 e7 f8 ff ff       	jmp    12c4c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x45c>
   13365:	49 8d 59 04          	lea    0x4(%r9),%rbx
   13369:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
   1336e:	44 89 fb             	mov    %r15d,%ebx
   13371:	83 e3 03             	and    $0x3,%ebx
   13374:	48 83 f3 01          	xor    $0x1,%rbx
   13378:	c4 42 91 f7 ef       	shlx   %r13,%r15,%r13
   1337d:	4d 31 d5             	xor    %r10,%r13
   13380:	4d 89 fa             	mov    %r15,%r10
   13383:	4c 89 84 24 88 00 00 	mov    %r8,0x88(%rsp)
   1338a:	00 
   1338b:	49 b8 fc ff ff ff ff 	movabs $0xfffffffffffffc,%r8
   13392:	ff ff 00 
   13395:	4d 21 c2             	and    %r8,%r10
   13398:	49 09 dd             	or     %rbx,%r13
   1339b:	4d 0f 45 d7          	cmovne %r15,%r10
   1339f:	48 83 bc 24 88 00 00 	cmpq   $0x2,0x88(%rsp)
   133a6:	00 02 
   133a8:	4d 0f 43 d7          	cmovae %r15,%r10
   133ac:	48 83 7c 24 68 1c    	cmpq   $0x1c,0x68(%rsp)
   133b2:	4d 0f 43 d7          	cmovae %r15,%r10
   133b6:	44 89 d3             	mov    %r10d,%ebx
   133b9:	83 e3 01             	and    $0x1,%ebx
   133bc:	4c 01 d3             	add    %r10,%rbx
   133bf:	49 89 d8             	mov    %rbx,%r8
   133c2:	49 d1 e8             	shr    $1,%r8
   133c5:	49 ba ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r10
   133cc:	ff ef 7f 
   133cf:	4d 21 d0             	and    %r10,%r8
   133d2:	49 ba 00 00 00 00 00 	movabs $0x40000000000000,%r10
   133d9:	00 40 00 
   133dc:	4c 39 d3             	cmp    %r10,%rbx
   133df:	83 da 00             	sbb    $0x0,%edx
   133e2:	81 c2 00 04 00 00    	add    $0x400,%edx
   133e8:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   133ee:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   133f4:	4d 0f 43 c7          	cmovae %r15,%r8
   133f8:	4c 39 d3             	cmp    %r10,%rbx
   133fb:	4d 0f 43 c7          	cmovae %r15,%r8
   133ff:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   13405:	41 ba ff 07 00 00    	mov    $0x7ff,%r10d
   1340b:	41 0f 43 d2          	cmovae %r10d,%edx
   1340f:	eb 36                	jmp    13447 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc57>
   13411:	4d 89 c3             	mov    %r8,%r11
   13414:	e9 59 fe ff ff       	jmp    13272 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa82>
   13419:	41 b8 02 fc ff ff    	mov    $0xfffffc02,%r8d
   1341f:	41 29 d0             	sub    %edx,%r8d
   13422:	c4 42 bb f7 d7       	shrx   %r8,%r15,%r10
   13427:	4d 0f a3 c7          	bt     %r8,%r15
   1342b:	49 83 d2 00          	adc    $0x0,%r10
   1342f:	4d 89 d0             	mov    %r10,%r8
   13432:	49 d1 e8             	shr    $1,%r8
   13435:	31 d2                	xor    %edx,%edx
   13437:	48 bb ff ff ff ff ff 	movabs $0x1fffffffffffff,%rbx
   1343e:	ff 1f 00 
   13441:	49 39 da             	cmp    %rbx,%r10
   13444:	0f 97 c2             	seta   %dl
   13447:	8b 5c 24 48          	mov    0x48(%rsp),%ebx
   1344b:	4c 8b 7c 24 50       	mov    0x50(%rsp),%r15
   13450:	4c 39 c0             	cmp    %r8,%rax
   13453:	0f 84 5f fb ff ff    	je     12fb8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7c8>
   13459:	e9 62 fb ff ff       	jmp    12fc0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7d0>
   1345e:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   13462:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   13469:	5b                   	pop    %rbx
   1346a:	41 5c                	pop    %r12
   1346c:	41 5d                	pop    %r13
   1346e:	41 5e                	pop    %r14
   13470:	41 5f                	pop    %r15
   13472:	5d                   	pop    %rbp
   13473:	c3                   	ret
   13474:	bf 10 00 00 00       	mov    $0x10,%edi
   13479:	e8 02 2d ff ff       	call   6180 <__cxa_allocate_exception@plt>
   1347e:	48 89 c3             	mov    %rax,%rbx
   13481:	48 8d 35 22 51 04 00 	lea    0x45122(%rip),%rsi        # 585aa <fast_float::powers_of_ten_uint64+0x50a>
   13488:	48 89 c7             	mov    %rax,%rdi
   1348b:	e8 90 2c ff ff       	call   6120 <std::runtime_error::runtime_error(char const*)@plt>
   13490:	48 8b 35 39 ab 05 00 	mov    0x5ab39(%rip),%rsi        # 6dfd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
   13497:	48 8b 15 c2 aa 05 00 	mov    0x5aac2(%rip),%rdx        # 6df60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
   1349e:	48 89 df             	mov    %rbx,%rdi
   134a1:	e8 9a 30 ff ff       	call   6540 <__cxa_throw@plt>
   134a6:	49 89 c6             	mov    %rax,%r14
   134a9:	48 89 df             	mov    %rbx,%rdi
   134ac:	e8 bf 2d ff ff       	call   6270 <__cxa_free_exception@plt>
   134b1:	4c 89 f7             	mov    %r14,%rdi
   134b4:	e8 97 30 ff ff       	call   6550 <_Unwind_Resume@plt>
   134b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

