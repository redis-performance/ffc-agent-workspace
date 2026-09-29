0000000000012a10 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)>:
   12a10:	55                   	push   %rbp
   12a11:	41 57                	push   %r15
   12a13:	41 56                	push   %r14
   12a15:	41 55                	push   %r13
   12a17:	41 54                	push   %r12
   12a19:	53                   	push   %rbx
   12a1a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   12a21:	4c 8b 37             	mov    (%rdi),%r14
   12a24:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
   12a28:	4d 39 ee             	cmp    %r13,%r14
   12a2b:	0f 84 95 0c 00 00    	je     136c6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xcb6>
   12a31:	89 f3                	mov    %esi,%ebx
   12a33:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   12a37:	c5 fb 12 1d 81 49 04 	vmovddup 0x44981(%rip),%xmm3        # 573c0 <fast_float::powers_of_ten_uint64+0xb0>
   12a3e:	00 
   12a3f:	89 74 24 50          	mov    %esi,0x50(%rsp)
   12a43:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
   12a48:	eb 17                	jmp    12a61 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x51>
   12a4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   12a50:	c5 fb 5f c2          	vmaxsd %xmm2,%xmm0,%xmm0
   12a54:	49 83 c6 20          	add    $0x20,%r14
   12a58:	4d 39 ee             	cmp    %r13,%r14
   12a5b:	0f 84 69 0c 00 00    	je     136ca <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xcba>
   12a61:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   12a65:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   12a69:	ba 01 00 00 00       	mov    $0x1,%edx
   12a6e:	48 85 c9             	test   %rcx,%rcx
   12a71:	0f 84 19 0b 00 00    	je     13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   12a77:	49 8b 36             	mov    (%r14),%rsi
   12a7a:	48 8d 04 0e          	lea    (%rsi,%rcx,1),%rax
   12a7e:	44 0f b6 26          	movzbl (%rsi),%r12d
   12a82:	48 89 f7             	mov    %rsi,%rdi
   12a85:	45 89 e0             	mov    %r12d,%r8d
   12a88:	41 80 fc 2d          	cmp    $0x2d,%r12b
   12a8c:	41 0f 94 c3          	sete   %r11b
   12a90:	75 2e                	jne    12ac0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb0>
   12a92:	48 83 f9 01          	cmp    $0x1,%rcx
   12a96:	0f 84 74 0a 00 00    	je     13510 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb00>
   12a9c:	44 0f be 46 01       	movsbl 0x1(%rsi),%r8d
   12aa1:	41 83 f8 2e          	cmp    $0x2e,%r8d
   12aa5:	74 0d                	je     12ab4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa4>
   12aa7:	41 8d 50 d0          	lea    -0x30(%r8),%edx
   12aab:	83 fa 09             	cmp    $0x9,%edx
   12aae:	0f 87 5c 0a 00 00    	ja     13510 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb00>
   12ab4:	48 8d 7e 01          	lea    0x1(%rsi),%rdi
   12ab8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   12abf:	00 
   12ac0:	48 39 c7             	cmp    %rax,%rdi
   12ac3:	44 88 5c 24 57       	mov    %r11b,0x57(%rsp)
   12ac8:	0f 84 33 01 00 00    	je     12c01 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f1>
   12ace:	41 0f be d0          	movsbl %r8b,%edx
   12ad2:	83 c2 d0             	add    $0xffffffd0,%edx
   12ad5:	83 fa 09             	cmp    $0x9,%edx
   12ad8:	0f 87 3e 01 00 00    	ja     12c1c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x20c>
   12ade:	48 8d 57 01          	lea    0x1(%rdi),%rdx
   12ae2:	49 0f be e8          	movsbq %r8b,%rbp
   12ae6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12aea:	48 39 c2             	cmp    %rax,%rdx
   12aed:	0f 84 10 01 00 00    	je     12c03 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   12af3:	44 0f be 02          	movsbl (%rdx),%r8d
   12af7:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12afb:	41 83 f9 09          	cmp    $0x9,%r9d
   12aff:	0f 87 1c 01 00 00    	ja     12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12b05:	4d 63 c0             	movslq %r8d,%r8
   12b08:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   12b0f:	00 
   12b10:	49 01 e9             	add    %rbp,%r9
   12b13:	48 8d 57 02          	lea    0x2(%rdi),%rdx
   12b17:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   12b1b:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12b1f:	48 39 c2             	cmp    %rax,%rdx
   12b22:	0f 84 db 00 00 00    	je     12c03 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   12b28:	44 0f be 02          	movsbl (%rdx),%r8d
   12b2c:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12b30:	41 83 f9 09          	cmp    $0x9,%r9d
   12b34:	0f 87 e7 00 00 00    	ja     12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12b3a:	4d 63 c0             	movslq %r8d,%r8
   12b3d:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   12b44:	00 
   12b45:	49 01 e9             	add    %rbp,%r9
   12b48:	48 8d 57 03          	lea    0x3(%rdi),%rdx
   12b4c:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   12b50:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12b54:	48 39 c2             	cmp    %rax,%rdx
   12b57:	0f 84 a6 00 00 00    	je     12c03 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   12b5d:	44 0f be 02          	movsbl (%rdx),%r8d
   12b61:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12b65:	41 83 f9 09          	cmp    $0x9,%r9d
   12b69:	0f 87 b2 00 00 00    	ja     12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12b6f:	4d 63 c0             	movslq %r8d,%r8
   12b72:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   12b79:	00 
   12b7a:	49 01 e9             	add    %rbp,%r9
   12b7d:	48 8d 57 04          	lea    0x4(%rdi),%rdx
   12b81:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   12b85:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12b89:	48 39 c2             	cmp    %rax,%rdx
   12b8c:	74 75                	je     12c03 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   12b8e:	44 0f be 02          	movsbl (%rdx),%r8d
   12b92:	45 8d 48 d0          	lea    -0x30(%r8),%r9d
   12b96:	41 83 f9 09          	cmp    $0x9,%r9d
   12b9a:	0f 87 81 00 00 00    	ja     12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12ba0:	4d 63 c0             	movslq %r8d,%r8
   12ba3:	4c 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%r9
   12baa:	00 
   12bab:	49 01 e9             	add    %rbp,%r9
   12bae:	48 8d 57 05          	lea    0x5(%rdi),%rdx
   12bb2:	4b 8d 2c 48          	lea    (%r8,%r9,2),%rbp
   12bb6:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12bba:	48 39 c2             	cmp    %rax,%rdx
   12bbd:	74 44                	je     12c03 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1f3>
   12bbf:	4c 8d 04 0e          	lea    (%rsi,%rcx,1),%r8
   12bc3:	49 29 f8             	sub    %rdi,%r8
   12bc6:	49 01 f8             	add    %rdi,%r8
   12bc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   12bd0:	44 0f be 0a          	movsbl (%rdx),%r9d
   12bd4:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12bd8:	41 83 fa 09          	cmp    $0x9,%r10d
   12bdc:	77 43                	ja     12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12bde:	4d 63 c9             	movslq %r9d,%r9
   12be1:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   12be8:	00 
   12be9:	49 01 ea             	add    %rbp,%r10
   12bec:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   12bf0:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12bf4:	48 ff c2             	inc    %rdx
   12bf7:	48 39 c2             	cmp    %rax,%rdx
   12bfa:	75 d4                	jne    12bd0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x1c0>
   12bfc:	4c 89 c2             	mov    %r8,%rdx
   12bff:	eb 20                	jmp    12c21 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x211>
   12c01:	31 ed                	xor    %ebp,%ebp
   12c03:	49 89 c0             	mov    %rax,%r8
   12c06:	49 29 f8             	sub    %rdi,%r8
   12c09:	48 89 c2             	mov    %rax,%rdx
   12c0c:	49 89 c3             	mov    %rax,%r11
   12c0f:	45 31 ff             	xor    %r15d,%r15d
   12c12:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   12c17:	e9 b1 01 00 00       	jmp    12dcd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3bd>
   12c1c:	31 ed                	xor    %ebp,%ebp
   12c1e:	48 89 fa             	mov    %rdi,%rdx
   12c21:	49 89 d0             	mov    %rdx,%r8
   12c24:	49 29 f8             	sub    %rdi,%r8
   12c27:	48 39 c2             	cmp    %rax,%rdx
   12c2a:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
   12c2f:	0f 84 8d 01 00 00    	je     12dc2 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b2>
   12c35:	80 3a 2e             	cmpb   $0x2e,(%rdx)
   12c38:	0f 85 89 01 00 00    	jne    12dc7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3b7>
   12c3e:	41 89 dd             	mov    %ebx,%r13d
   12c41:	4c 8d 5a 01          	lea    0x1(%rdx),%r11
   12c45:	49 89 c0             	mov    %rax,%r8
   12c48:	4d 29 d8             	sub    %r11,%r8
   12c4b:	49 83 f8 08          	cmp    $0x8,%r8
   12c4f:	4d 89 d9             	mov    %r11,%r9
   12c52:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   12c57:	0f 8c 94 00 00 00    	jl     12cf1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e1>
   12c5d:	0f 1f 00             	nopl   (%rax)
   12c60:	4d 8b 0b             	mov    (%r11),%r9
   12c63:	49 ba 46 46 46 46 46 	movabs $0x4646464646464646,%r10
   12c6a:	46 46 46 
   12c6d:	4d 01 ca             	add    %r9,%r10
   12c70:	48 bb d0 cf cf cf cf 	movabs $0xcfcfcfcfcfcfcfd0,%rbx
   12c77:	cf cf cf 
   12c7a:	49 01 d9             	add    %rbx,%r9
   12c7d:	4d 09 ca             	or     %r9,%r10
   12c80:	48 bb 80 80 80 80 80 	movabs $0x8080808080808080,%rbx
   12c87:	80 80 80 
   12c8a:	49 85 da             	test   %rbx,%r10
   12c8d:	75 62                	jne    12cf1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x2e1>
   12c8f:	4c 69 d5 00 e1 f5 05 	imul   $0x5f5e100,%rbp,%r10
   12c96:	4b 8d 1c 89          	lea    (%r9,%r9,4),%rbx
   12c9a:	49 c1 e9 08          	shr    $0x8,%r9
   12c9e:	49 8d 2c 59          	lea    (%r9,%rbx,2),%rbp
   12ca2:	49 89 e9             	mov    %rbp,%r9
   12ca5:	48 bb ff 00 00 00 ff 	movabs $0xff000000ff,%rbx
   12cac:	00 00 00 
   12caf:	49 21 d9             	and    %rbx,%r9
   12cb2:	49 bf 64 00 00 00 40 	movabs $0xf424000000064,%r15
   12cb9:	42 0f 00 
   12cbc:	4d 0f af cf          	imul   %r15,%r9
   12cc0:	48 c1 ed 10          	shr    $0x10,%rbp
   12cc4:	48 21 dd             	and    %rbx,%rbp
   12cc7:	48 bb 01 00 00 00 10 	movabs $0x271000000001,%rbx
   12cce:	27 00 00 
   12cd1:	48 0f af eb          	imul   %rbx,%rbp
   12cd5:	4c 01 cd             	add    %r9,%rbp
   12cd8:	48 c1 ed 20          	shr    $0x20,%rbp
   12cdc:	4c 01 d5             	add    %r10,%rbp
   12cdf:	49 83 c3 08          	add    $0x8,%r11
   12ce3:	49 83 c0 f8          	add    $0xfffffffffffffff8,%r8
   12ce7:	49 83 f8 07          	cmp    $0x7,%r8
   12ceb:	0f 8f 6f ff ff ff    	jg     12c60 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x250>
   12cf1:	49 83 f8 04          	cmp    $0x4,%r8
   12cf5:	7c 21                	jl     12d18 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x308>
   12cf7:	45 8b 03             	mov    (%r11),%r8d
   12cfa:	45 8d 88 46 46 46 46 	lea    0x46464646(%r8),%r9d
   12d01:	41 81 c0 d0 cf cf cf 	add    $0xcfcfcfd0,%r8d
   12d08:	45 09 c1             	or     %r8d,%r9d
   12d0b:	41 f7 c1 80 80 80 80 	test   $0x80808080,%r9d
   12d12:	0f 84 8e 07 00 00    	je     134a6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa96>
   12d18:	44 89 eb             	mov    %r13d,%ebx
   12d1b:	49 39 c3             	cmp    %rax,%r11
   12d1e:	0f 84 b9 07 00 00    	je     134dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   12d24:	45 0f be 0b          	movsbl (%r11),%r9d
   12d28:	45 8d 41 d0          	lea    -0x30(%r9),%r8d
   12d2c:	41 83 f8 09          	cmp    $0x9,%r8d
   12d30:	0f 87 aa 07 00 00    	ja     134e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   12d36:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   12d3d:	00 
   12d3e:	49 01 ea             	add    %rbp,%r10
   12d41:	4d 8d 43 01          	lea    0x1(%r11),%r8
   12d45:	41 80 c1 d0          	add    $0xd0,%r9b
   12d49:	45 0f b6 c9          	movzbl %r9b,%r9d
   12d4d:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   12d51:	49 39 c0             	cmp    %rax,%r8
   12d54:	0f 84 83 07 00 00    	je     134dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   12d5a:	45 0f be 08          	movsbl (%r8),%r9d
   12d5e:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12d62:	41 83 fa 09          	cmp    $0x9,%r10d
   12d66:	0f 87 0d 09 00 00    	ja     13679 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc69>
   12d6c:	4c 8d 14 ad 00 00 00 	lea    0x0(,%rbp,4),%r10
   12d73:	00 
   12d74:	49 01 ea             	add    %rbp,%r10
   12d77:	4d 8d 43 02          	lea    0x2(%r11),%r8
   12d7b:	41 80 c1 d0          	add    $0xd0,%r9b
   12d7f:	45 0f b6 c9          	movzbl %r9b,%r9d
   12d83:	4b 8d 2c 51          	lea    (%r9,%r10,2),%rbp
   12d87:	49 39 c0             	cmp    %rax,%r8
   12d8a:	0f 84 4d 07 00 00    	je     134dd <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xacd>
   12d90:	45 0f be 08          	movsbl (%r8),%r9d
   12d94:	45 8d 51 d0          	lea    -0x30(%r9),%r10d
   12d98:	41 83 fa 09          	cmp    $0x9,%r10d
   12d9c:	0f 87 d7 08 00 00    	ja     13679 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc69>
   12da2:	4c 8d 04 ad 00 00 00 	lea    0x0(,%rbp,4),%r8
   12da9:	00 
   12daa:	49 01 e8             	add    %rbp,%r8
   12dad:	49 83 c3 03          	add    $0x3,%r11
   12db1:	41 80 c1 d0          	add    $0xd0,%r9b
   12db5:	45 0f b6 c9          	movzbl %r9b,%r9d
   12db9:	4b 8d 2c 41          	lea    (%r9,%r8,2),%rbp
   12dbd:	e9 1e 07 00 00       	jmp    134e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   12dc2:	49 89 c3             	mov    %rax,%r11
   12dc5:	eb 03                	jmp    12dca <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3ba>
   12dc7:	49 89 d3             	mov    %rdx,%r11
   12dca:	45 31 ff             	xor    %r15d,%r15d
   12dcd:	45 31 c9             	xor    %r9d,%r9d
   12dd0:	45 31 d2             	xor    %r10d,%r10d
   12dd3:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   12dd8:	45 31 d2             	xor    %r10d,%r10d
   12ddb:	4d 85 c0             	test   %r8,%r8
   12dde:	0f 84 21 07 00 00    	je     13505 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xaf5>
   12de4:	4c 89 bc 24 88 00 00 	mov    %r15,0x88(%rsp)
   12deb:	00 
   12dec:	41 89 dd             	mov    %ebx,%r13d
   12def:	49 39 c3             	cmp    %rax,%r11
   12df2:	0f 84 91 00 00 00    	je     12e89 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x479>
   12df8:	41 0f b6 1b          	movzbl (%r11),%ebx
   12dfc:	83 cb 20             	or     $0x20,%ebx
   12dff:	83 fb 65             	cmp    $0x65,%ebx
   12e02:	0f 85 84 00 00 00    	jne    12e8c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x47c>
   12e08:	49 8d 5b 01          	lea    0x1(%r11),%rbx
   12e0c:	48 39 c3             	cmp    %rax,%rbx
   12e0f:	74 7b                	je     12e8c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x47c>
   12e11:	45 0f b6 6b 01       	movzbl 0x1(%r11),%r13d
   12e16:	4d 8d 7b 02          	lea    0x2(%r11),%r15
   12e1a:	4c 89 6c 24 68       	mov    %r13,0x68(%rsp)
   12e1f:	41 83 c5 d5          	add    $0xffffffd5,%r13d
   12e23:	41 f6 c5 fd          	test   $0xfd,%r13b
   12e27:	49 0f 44 df          	cmove  %r15,%rbx
   12e2b:	48 39 c3             	cmp    %rax,%rbx
   12e2e:	0f 84 03 01 00 00    	je     12f37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x527>
   12e34:	44 0f be 3b          	movsbl (%rbx),%r15d
   12e38:	41 83 c7 d0          	add    $0xffffffd0,%r15d
   12e3c:	41 83 ff 09          	cmp    $0x9,%r15d
   12e40:	0f 87 f1 00 00 00    	ja     12f37 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x527>
   12e46:	48 01 ce             	add    %rcx,%rsi
   12e49:	31 c9                	xor    %ecx,%ecx
   12e4b:	eb 0f                	jmp    12e5c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x44c>
   12e4d:	0f 1f 00             	nopl   (%rax)
   12e50:	48 ff c3             	inc    %rbx
   12e53:	48 39 c3             	cmp    %rax,%rbx
   12e56:	0f 84 49 07 00 00    	je     135a5 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb95>
   12e5c:	44 0f be 1b          	movsbl (%rbx),%r11d
   12e60:	45 8d 7b d0          	lea    -0x30(%r11),%r15d
   12e64:	41 83 ff 09          	cmp    $0x9,%r15d
   12e68:	0f 87 3a 07 00 00    	ja     135a8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb98>
   12e6e:	48 81 f9 ff ff ff 0f 	cmp    $0xfffffff,%rcx
   12e75:	7f d9                	jg     12e50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x440>
   12e77:	41 80 c3 d0          	add    $0xd0,%r11b
   12e7b:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   12e7f:	45 0f b6 db          	movzbl %r11b,%r11d
   12e83:	49 8d 0c 4b          	lea    (%r11,%rcx,2),%rcx
   12e87:	eb c7                	jmp    12e50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x440>
   12e89:	49 89 c3             	mov    %rax,%r11
   12e8c:	31 f6                	xor    %esi,%esi
   12e8e:	b3 01                	mov    $0x1,%bl
   12e90:	31 c9                	xor    %ecx,%ecx
   12e92:	49 83 f8 14          	cmp    $0x14,%r8
   12e96:	0f 8c 08 01 00 00    	jl     12fa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   12e9c:	48 39 c7             	cmp    %rax,%rdi
   12e9f:	74 46                	je     12ee7 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4d7>
   12ea1:	48 89 f9             	mov    %rdi,%rcx
   12ea4:	eb 20                	jmp    12ec6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4b6>
   12ea6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   12ead:	00 00 00 
   12eb0:	45 31 ff             	xor    %r15d,%r15d
   12eb3:	41 80 fd 30          	cmp    $0x30,%r13b
   12eb7:	41 0f 94 c7          	sete   %r15b
   12ebb:	4d 29 f8             	sub    %r15,%r8
   12ebe:	48 ff c1             	inc    %rcx
   12ec1:	48 39 c1             	cmp    %rax,%rcx
   12ec4:	74 10                	je     12ed6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4c6>
   12ec6:	44 0f b6 29          	movzbl (%rcx),%r13d
   12eca:	41 83 fd 30          	cmp    $0x30,%r13d
   12ece:	74 e0                	je     12eb0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a0>
   12ed0:	41 83 fd 2e          	cmp    $0x2e,%r13d
   12ed4:	74 da                	je     12eb0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4a0>
   12ed6:	31 c9                	xor    %ecx,%ecx
   12ed8:	49 83 f8 14          	cmp    $0x14,%r8
   12edc:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   12ee1:	0f 8c bd 00 00 00    	jl     12fa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   12ee7:	48 39 d7             	cmp    %rdx,%rdi
   12eea:	74 62                	je     12f4e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x53e>
   12eec:	48 89 f8             	mov    %rdi,%rax
   12eef:	31 ed                	xor    %ebp,%ebp
   12ef1:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   12ef8:	b6 e0 0d 
   12efb:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
   12f00:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
   12f07:	00 
   12f08:	48 01 e9             	add    %rbp,%rcx
   12f0b:	4c 0f be 00          	movsbq (%rax),%r8
   12f0f:	49 8d 2c 48          	lea    (%r8,%rcx,2),%rbp
   12f13:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12f17:	48 ff c0             	inc    %rax
   12f1a:	4c 39 cd             	cmp    %r9,%rbp
   12f1d:	73 05                	jae    12f24 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x514>
   12f1f:	48 39 d0             	cmp    %rdx,%rax
   12f22:	75 dc                	jne    12f00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x4f0>
   12f24:	49 8d 49 ff          	lea    -0x1(%r9),%rcx
   12f28:	48 39 cd             	cmp    %rcx,%rbp
   12f2b:	77 6a                	ja     12f97 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x587>
   12f2d:	48 89 d8             	mov    %rbx,%rax
   12f30:	4c 39 d3             	cmp    %r10,%rbx
   12f33:	75 3b                	jne    12f70 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x560>
   12f35:	eb 5d                	jmp    12f94 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   12f37:	31 f6                	xor    %esi,%esi
   12f39:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   12f3e:	b3 01                	mov    $0x1,%bl
   12f40:	31 c9                	xor    %ecx,%ecx
   12f42:	49 83 f8 14          	cmp    $0x14,%r8
   12f46:	0f 8d 50 ff ff ff    	jge    12e9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x48c>
   12f4c:	eb 56                	jmp    12fa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   12f4e:	31 ed                	xor    %ebp,%ebp
   12f50:	49 b9 00 00 64 a7 b3 	movabs $0xde0b6b3a7640000,%r9
   12f57:	b6 e0 0d 
   12f5a:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
   12f5f:	48 89 d8             	mov    %rbx,%rax
   12f62:	4c 39 d3             	cmp    %r10,%rbx
   12f65:	74 2d                	je     12f94 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   12f67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   12f6e:	00 00 
   12f70:	48 8d 0c ad 00 00 00 	lea    0x0(,%rbp,4),%rcx
   12f77:	00 
   12f78:	48 01 e9             	add    %rbp,%rcx
   12f7b:	48 0f be 10          	movsbq (%rax),%rdx
   12f7f:	48 8d 2c 4a          	lea    (%rdx,%rcx,2),%rbp
   12f83:	48 83 c5 d0          	add    $0xffffffffffffffd0,%rbp
   12f87:	48 ff c0             	inc    %rax
   12f8a:	4c 39 cd             	cmp    %r9,%rbp
   12f8d:	73 05                	jae    12f94 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x584>
   12f8f:	4c 39 d0             	cmp    %r10,%rax
   12f92:	75 dc                	jne    12f70 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x560>
   12f94:	48 89 da             	mov    %rbx,%rdx
   12f97:	48 29 c2             	sub    %rax,%rdx
   12f9a:	48 01 f2             	add    %rsi,%rdx
   12f9d:	b1 01                	mov    $0x1,%cl
   12f9f:	31 db                	xor    %ebx,%ebx
   12fa1:	49 89 d1             	mov    %rdx,%r9
   12fa4:	84 db                	test   %bl,%bl
   12fa6:	74 44                	je     12fec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>
   12fa8:	4d 85 c9             	test   %r9,%r9
   12fab:	75 3f                	jne    12fec <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x5dc>
   12fad:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   12fb4:	ff 1f 00 
   12fb7:	48 ff c0             	inc    %rax
   12fba:	48 39 c5             	cmp    %rax,%rbp
   12fbd:	0f 87 a3 00 00 00    	ja     13066 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   12fc3:	48 85 ed             	test   %rbp,%rbp
   12fc6:	0f 84 2c 02 00 00    	je     131f8 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7e8>
   12fcc:	41 80 fc 2d          	cmp    $0x2d,%r12b
   12fd0:	0f 94 c0             	sete   %al
   12fd3:	62 f1 df 08 7b d5    	vcvtusi2sd %rbp,%xmm4,%xmm2
   12fd9:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   12fdd:	c5 fb 92 c8          	kmovd  %eax,%k1
   12fe1:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   12fe7:	e9 21 02 00 00       	jmp    1320d <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7fd>
   12fec:	49 8d 41 16          	lea    0x16(%r9),%rax
   12ff0:	48 83 f8 2d          	cmp    $0x2d,%rax
   12ff4:	0f 92 c0             	setb   %al
   12ff7:	20 c3                	and    %al,%bl
   12ff9:	80 fb 01             	cmp    $0x1,%bl
   12ffc:	75 33                	jne    13031 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x621>
   12ffe:	48 b8 ff ff ff ff ff 	movabs $0x1fffffffffffff,%rax
   13005:	ff 1f 00 
   13008:	48 ff c0             	inc    %rax
   1300b:	48 39 c5             	cmp    %rax,%rbp
   1300e:	77 56                	ja     13066 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   13010:	62 f1 df 08 7b cd    	vcvtusi2sd %rbp,%xmm4,%xmm1
   13016:	4d 85 c9             	test   %r9,%r9
   13019:	0f 88 51 04 00 00    	js     13470 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa60>
   1301f:	48 8d 05 3a 18 04 00 	lea    0x4183a(%rip),%rax        # 54860 <FFC_DOUBLE_POWERS_OF_TEN>
   13026:	c4 a1 73 59 14 c8    	vmulsd (%rax,%r9,8),%xmm1,%xmm2
   1302c:	e9 51 04 00 00       	jmp    13482 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa72>
   13031:	31 c0                	xor    %eax,%eax
   13033:	48 85 ed             	test   %rbp,%rbp
   13036:	44 89 eb             	mov    %r13d,%ebx
   13039:	0f 84 d9 03 00 00    	je     13418 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa08>
   1303f:	be 00 00 00 00       	mov    $0x0,%esi
   13044:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   1304b:	0f 8c 65 01 00 00    	jl     131b6 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a6>
   13051:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   13058:	7e 0c                	jle    13066 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x656>
   1305a:	be ff 07 00 00       	mov    $0x7ff,%esi
   1305f:	31 c0                	xor    %eax,%eax
   13061:	e9 4d 01 00 00       	jmp    131b3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   13066:	f3 48 0f bd f5       	lzcnt  %rbp,%rsi
   1306b:	c4 e2 c9 f7 d5       	shlx   %rsi,%rbp,%rdx
   13070:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
   13077:	00 
   13078:	48 98                	cltq
   1307a:	48 8d 1d cf 18 04 00 	lea    0x418cf(%rip),%rbx        # 54950 <FFC_POWERS_OF_FIVE>
   13081:	c4 62 fb f6 04 c3    	mulx   (%rbx,%rax,8),%rax,%r8
   13087:	45 89 c2             	mov    %r8d,%r10d
   1308a:	41 f7 d2             	not    %r10d
   1308d:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   13094:	75 1b                	jne    130b1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6a1>
   13096:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   1309a:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   130a1:	4d 63 d2             	movslq %r10d,%r10
   130a4:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   130aa:	48 01 d0             	add    %rdx,%rax
   130ad:	49 83 d0 00          	adc    $0x0,%r8
   130b1:	4d 89 c2             	mov    %r8,%r10
   130b4:	49 c1 ea 3f          	shr    $0x3f,%r10
   130b8:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   130bf:	c1 fa 10             	sar    $0x10,%edx
   130c2:	29 f2                	sub    %esi,%edx
   130c4:	42 8d 34 12          	lea    (%rdx,%r10,1),%esi
   130c8:	83 c6 3f             	add    $0x3f,%esi
   130cb:	49 83 c2 09          	add    $0x9,%r10
   130cf:	c4 c2 ab f7 d0       	shrx   %r10,%r8,%rdx
   130d4:	81 fe 01 fc ff ff    	cmp    $0xfffffc01,%esi
   130da:	7f 15                	jg     130f1 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x6e1>
   130dc:	81 fe c3 fb ff ff    	cmp    $0xfffffbc3,%esi
   130e2:	0f 83 9e 00 00 00    	jae    13186 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x776>
   130e8:	31 c0                	xor    %eax,%eax
   130ea:	31 f6                	xor    %esi,%esi
   130ec:	e9 c2 00 00 00       	jmp    131b3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   130f1:	89 d3                	mov    %edx,%ebx
   130f3:	83 e3 03             	and    $0x3,%ebx
   130f6:	48 83 f3 01          	xor    $0x1,%rbx
   130fa:	c4 62 a9 f7 d2       	shlx   %r10,%rdx,%r10
   130ff:	4d 31 c2             	xor    %r8,%r10
   13102:	49 89 d0             	mov    %rdx,%r8
   13105:	49 bf fc ff ff ff ff 	movabs $0xfffffffffffffc,%r15
   1310c:	ff ff 00 
   1310f:	4d 21 f8             	and    %r15,%r8
   13112:	49 09 da             	or     %rbx,%r10
   13115:	4c 0f 45 c2          	cmovne %rdx,%r8
   13119:	4d 8d 51 04          	lea    0x4(%r9),%r10
   1311d:	48 83 f8 02          	cmp    $0x2,%rax
   13121:	4c 0f 43 c2          	cmovae %rdx,%r8
   13125:	49 83 fa 1c          	cmp    $0x1c,%r10
   13129:	4c 0f 43 c2          	cmovae %rdx,%r8
   1312d:	44 89 c2             	mov    %r8d,%edx
   13130:	83 e2 01             	and    $0x1,%edx
   13133:	4c 01 c2             	add    %r8,%rdx
   13136:	48 89 d0             	mov    %rdx,%rax
   13139:	48 d1 e8             	shr    $1,%rax
   1313c:	49 b8 ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r8
   13143:	ff ef 7f 
   13146:	4c 21 c0             	and    %r8,%rax
   13149:	49 b8 00 00 00 00 00 	movabs $0x40000000000000,%r8
   13150:	00 40 00 
   13153:	4c 39 c2             	cmp    %r8,%rdx
   13156:	83 de 00             	sbb    $0x0,%esi
   13159:	81 c6 00 04 00 00    	add    $0x400,%esi
   1315f:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   13165:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   1316b:	49 0f 43 c2          	cmovae %r10,%rax
   1316f:	4c 39 c2             	cmp    %r8,%rdx
   13172:	49 0f 43 c2          	cmovae %r10,%rax
   13176:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   1317c:	ba ff 07 00 00       	mov    $0x7ff,%edx
   13181:	0f 43 f2             	cmovae %edx,%esi
   13184:	eb 2d                	jmp    131b3 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7a3>
   13186:	b8 02 fc ff ff       	mov    $0xfffffc02,%eax
   1318b:	29 f0                	sub    %esi,%eax
   1318d:	c4 62 fb f7 c2       	shrx   %rax,%rdx,%r8
   13192:	48 0f a3 c2          	bt     %rax,%rdx
   13196:	49 83 d0 00          	adc    $0x0,%r8
   1319a:	4c 89 c0             	mov    %r8,%rax
   1319d:	48 d1 e8             	shr    $1,%rax
   131a0:	31 f6                	xor    %esi,%esi
   131a2:	48 ba ff ff ff ff ff 	movabs $0x1fffffffffffff,%rdx
   131a9:	ff 1f 00 
   131ac:	49 39 d0             	cmp    %rdx,%r8
   131af:	40 0f 97 c6          	seta   %sil
   131b3:	44 89 eb             	mov    %r13d,%ebx
   131b6:	84 c9                	test   %cl,%cl
   131b8:	0f 84 64 02 00 00    	je     13422 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa12>
   131be:	45 31 c0             	xor    %r8d,%r8d
   131c1:	49 89 ea             	mov    %rbp,%r10
   131c4:	49 ff c2             	inc    %r10
   131c7:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   131cc:	74 4e                	je     1321c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x80c>
   131ce:	ba 00 00 00 00       	mov    $0x0,%edx
   131d3:	49 81 f9 aa fe ff ff 	cmp    $0xfffffffffffffeaa,%r9
   131da:	7c 42                	jl     1321e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x80e>
   131dc:	49 81 f9 34 01 00 00 	cmp    $0x134,%r9
   131e3:	0f 8e 9d 01 00 00    	jle    13386 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x976>
   131e9:	ba ff 07 00 00       	mov    $0x7ff,%edx
   131ee:	45 31 c0             	xor    %r8d,%r8d
   131f1:	4c 39 c0             	cmp    %r8,%rax
   131f4:	74 2d                	je     13223 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x813>
   131f6:	eb 33                	jmp    1322b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   131f8:	41 80 fc 2d          	cmp    $0x2d,%r12b
   131fc:	0f 94 c0             	sete   %al
   131ff:	c5 fb 92 c8          	kmovd  %eax,%k1
   13203:	62 f1 ff 89 10 15 b3 	vmovsd 0x441b3(%rip),%xmm2{%k1}{z}        # 573c0 <fast_float::powers_of_ten_uint64+0xb0>
   1320a:	41 04 00 
   1320d:	31 d2                	xor    %edx,%edx
   1320f:	44 89 eb             	mov    %r13d,%ebx
   13212:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   13217:	e9 74 03 00 00       	jmp    13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   1321c:	31 d2                	xor    %edx,%edx
   1321e:	4c 39 c0             	cmp    %r8,%rax
   13221:	75 08                	jne    1322b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   13223:	39 d6                	cmp    %edx,%esi
   13225:	0f 84 fc 01 00 00    	je     13427 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   1322b:	f3 4c 0f bd c5       	lzcnt  %rbp,%r8
   13230:	c4 e2 b9 f7 d5       	shlx   %r8,%rbp,%rdx
   13235:	42 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%eax
   1323c:	00 
   1323d:	48 98                	cltq
   1323f:	48 8d 35 0a 17 04 00 	lea    0x4170a(%rip),%rsi        # 54950 <FFC_POWERS_OF_FIVE>
   13246:	c4 e2 cb f6 04 c6    	mulx   (%rsi,%rax,8),%rsi,%rax
   1324c:	41 89 c2             	mov    %eax,%r10d
   1324f:	41 f7 d2             	not    %r10d
   13252:	41 f7 c2 ff 01 00 00 	test   $0x1ff,%r10d
   13259:	75 28                	jne    13283 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x873>
   1325b:	47 8d 14 09          	lea    (%r9,%r9,1),%r10d
   1325f:	41 81 c2 ad 02 00 00 	add    $0x2ad,%r10d
   13266:	4d 63 d2             	movslq %r10d,%r10
   13269:	41 89 df             	mov    %ebx,%r15d
   1326c:	48 8d 1d dd 16 04 00 	lea    0x416dd(%rip),%rbx        # 54950 <FFC_POWERS_OF_FIVE>
   13273:	c4 a2 eb f6 14 d3    	mulx   (%rbx,%r10,8),%rdx,%rdx
   13279:	44 89 fb             	mov    %r15d,%ebx
   1327c:	48 01 f2             	add    %rsi,%rdx
   1327f:	48 83 d0 00          	adc    $0x0,%rax
   13283:	48 89 c2             	mov    %rax,%rdx
   13286:	48 c1 ea 3f          	shr    $0x3f,%rdx
   1328a:	83 f2 01             	xor    $0x1,%edx
   1328d:	c4 e2 e9 f7 c0       	shlx   %rdx,%rax,%rax
   13292:	41 69 f1 6a 52 03 00 	imul   $0x3526a,%r9d,%esi
   13299:	c1 fe 10             	sar    $0x10,%esi
   1329c:	44 01 c2             	add    %r8d,%edx
   1329f:	29 d6                	sub    %edx,%esi
   132a1:	8d 96 72 04 00 00    	lea    0x472(%rsi),%edx
   132a7:	81 c6 34 84 ff ff    	add    $0xffff8434,%esi
   132ad:	81 fa 3d 80 00 00    	cmp    $0x803d,%edx
   132b3:	0f 8f 6e 01 00 00    	jg     13427 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   132b9:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   132c0:	00 
   132c1:	48 89 ac 24 98 00 00 	mov    %rbp,0x98(%rsp)
   132c8:	00 
   132c9:	4c 89 9c 24 a0 00 00 	mov    %r11,0xa0(%rsp)
   132d0:	00 
   132d1:	0f b6 54 24 57       	movzbl 0x57(%rsp),%edx
   132d6:	88 94 24 a8 00 00 00 	mov    %dl,0xa8(%rsp)
   132dd:	c6 84 24 a9 00 00 00 	movb   $0x1,0xa9(%rsp)
   132e4:	01 
   132e5:	88 8c 24 aa 00 00 00 	mov    %cl,0xaa(%rsp)
   132ec:	48 8d 8c 24 ab 00 00 	lea    0xab(%rsp),%rcx
   132f3:	00 
   132f4:	c6 41 04 00          	movb   $0x0,0x4(%rcx)
   132f8:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
   132fe:	48 89 bc 24 b0 00 00 	mov    %rdi,0xb0(%rsp)
   13305:	00 
   13306:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   1330b:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
   13312:	00 
   13313:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   13318:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   1331f:	00 
   13320:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
   13327:	00 
   13328:	48 89 8c 24 c8 00 00 	mov    %rcx,0xc8(%rsp)
   1332f:	00 
   13330:	48 c7 84 24 d0 00 00 	movq   $0x0,0xd0(%rsp)
   13337:	00 00 00 00 00 
   1333c:	62 f1 fd 48 10 8c 24 	vmovupd 0x90(%rsp),%zmm1
   13343:	90 00 00 00 
   13347:	62 f1 fd 48 11 0c 24 	vmovupd %zmm1,(%rsp)
   1334e:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
   13355:	00 00 
   13357:	48 89 c7             	mov    %rax,%rdi
   1335a:	ba 01 00 00 00       	mov    $0x1,%edx
   1335f:	c5 fb 11 44 24 60    	vmovsd %xmm0,0x60(%rsp)
   13365:	c5 f9 29 5c 24 70    	vmovapd %xmm3,0x70(%rsp)
   1336b:	c5 f8 77             	vzeroupper
   1336e:	e8 1d 48 00 00       	call   17b90 <ffc_digit_comp(ffc_parsed, ffc_adjusted_mantissa, unsigned char)>
   13373:	c5 f9 28 5c 24 70    	vmovapd 0x70(%rsp),%xmm3
   13379:	c5 fb 10 44 24 60    	vmovsd 0x60(%rsp),%xmm0
   1337f:	89 d6                	mov    %edx,%esi
   13381:	e9 a1 00 00 00       	jmp    13427 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xa17>
   13386:	f3 49 0f bd da       	lzcnt  %r10,%rbx
   1338b:	c4 c2 e1 f7 d2       	shlx   %rbx,%r10,%rdx
   13390:	46 8d 04 4d ac 02 00 	lea    0x2ac(,%r9,2),%r8d
   13397:	00 
   13398:	4d 63 c0             	movslq %r8d,%r8
   1339b:	4c 8d 2d ae 15 04 00 	lea    0x415ae(%rip),%r13        # 54950 <FFC_POWERS_OF_FIVE>
   133a2:	c4 02 bb f6 54 c5 00 	mulx   0x0(%r13,%r8,8),%r8,%r10
   133a9:	45 89 d7             	mov    %r10d,%r15d
   133ac:	41 f7 d7             	not    %r15d
   133af:	41 f7 c7 ff 01 00 00 	test   $0x1ff,%r15d
   133b6:	75 1c                	jne    133d4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x9c4>
   133b8:	47 8d 3c 09          	lea    (%r9,%r9,1),%r15d
   133bc:	41 81 c7 ad 02 00 00 	add    $0x2ad,%r15d
   133c3:	4d 63 ff             	movslq %r15d,%r15
   133c6:	c4 82 eb f6 54 fd 00 	mulx   0x0(%r13,%r15,8),%rdx,%rdx
   133cd:	49 01 d0             	add    %rdx,%r8
   133d0:	49 83 d2 00          	adc    $0x0,%r10
   133d4:	4d 89 d5             	mov    %r10,%r13
   133d7:	49 c1 ed 3f          	shr    $0x3f,%r13
   133db:	41 69 d1 6a 52 03 00 	imul   $0x3526a,%r9d,%edx
   133e2:	c1 fa 10             	sar    $0x10,%edx
   133e5:	29 da                	sub    %ebx,%edx
   133e7:	44 01 ea             	add    %r13d,%edx
   133ea:	83 c2 3f             	add    $0x3f,%edx
   133ed:	49 83 c5 09          	add    $0x9,%r13
   133f1:	c4 c2 93 f7 da       	shrx   %r13,%r10,%rbx
   133f6:	81 fa 01 fc ff ff    	cmp    $0xfffffc01,%edx
   133fc:	0f 8f d7 01 00 00    	jg     135d9 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xbc9>
   13402:	81 fa c3 fb ff ff    	cmp    $0xfffffbc3,%edx
   13408:	0f 83 73 02 00 00    	jae    13681 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc71>
   1340e:	45 31 c0             	xor    %r8d,%r8d
   13411:	31 d2                	xor    %edx,%edx
   13413:	e9 97 02 00 00       	jmp    136af <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc9f>
   13418:	31 f6                	xor    %esi,%esi
   1341a:	84 c9                	test   %cl,%cl
   1341c:	0f 85 9c fd ff ff    	jne    131be <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x7ae>
   13422:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   13427:	31 c9                	xor    %ecx,%ecx
   13429:	41 80 fc 2d          	cmp    $0x2d,%r12b
   1342d:	0f 94 c1             	sete   %cl
   13430:	48 89 f2             	mov    %rsi,%rdx
   13433:	48 c1 e2 34          	shl    $0x34,%rdx
   13437:	48 c1 e1 3f          	shl    $0x3f,%rcx
   1343b:	48 09 c2             	or     %rax,%rdx
   1343e:	48 09 ca             	or     %rcx,%rdx
   13441:	c4 e1 f9 6e d2       	vmovq  %rdx,%xmm2
   13446:	48 85 ed             	test   %rbp,%rbp
   13449:	0f 95 c1             	setne  %cl
   1344c:	48 85 c0             	test   %rax,%rax
   1344f:	0f 94 c0             	sete   %al
   13452:	85 f6                	test   %esi,%esi
   13454:	0f 94 c2             	sete   %dl
   13457:	20 c2                	and    %al,%dl
   13459:	20 ca                	and    %cl,%dl
   1345b:	81 fe ff 07 00 00    	cmp    $0x7ff,%esi
   13461:	0f 94 c0             	sete   %al
   13464:	08 d0                	or     %dl,%al
   13466:	0f b6 d0             	movzbl %al,%edx
   13469:	01 d2                	add    %edx,%edx
   1346b:	e9 20 01 00 00       	jmp    13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   13470:	49 c1 e1 03          	shl    $0x3,%r9
   13474:	48 8d 05 e5 13 04 00 	lea    0x413e5(%rip),%rax        # 54860 <FFC_DOUBLE_POWERS_OF_TEN>
   1347b:	4c 29 c8             	sub    %r9,%rax
   1347e:	c5 f3 5e 10          	vdivsd (%rax),%xmm1,%xmm2
   13482:	44 89 eb             	mov    %r13d,%ebx
   13485:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13489:	0f 94 c0             	sete   %al
   1348c:	c5 e9 57 cb          	vxorpd %xmm3,%xmm2,%xmm1
   13490:	c5 fb 92 c8          	kmovd  %eax,%k1
   13494:	62 f1 ef 09 10 d1    	vmovsd %xmm1,%xmm2,%xmm2{%k1}
   1349a:	31 d2                	xor    %edx,%edx
   1349c:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   134a1:	e9 ea 00 00 00       	jmp    13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   134a6:	4c 69 cd 10 27 00 00 	imul   $0x2710,%rbp,%r9
   134ad:	47 8d 14 80          	lea    (%r8,%r8,4),%r10d
   134b1:	41 c1 e8 08          	shr    $0x8,%r8d
   134b5:	47 8d 04 50          	lea    (%r8,%r10,2),%r8d
   134b9:	41 81 e0 ff 00 ff 00 	and    $0xff00ff,%r8d
   134c0:	41 69 e8 01 00 64 00 	imul   $0x640001,%r8d,%ebp
   134c7:	c1 ed 10             	shr    $0x10,%ebp
   134ca:	4c 01 cd             	add    %r9,%rbp
   134cd:	49 83 c3 04          	add    $0x4,%r11
   134d1:	44 89 eb             	mov    %r13d,%ebx
   134d4:	49 39 c3             	cmp    %rax,%r11
   134d7:	0f 85 47 f8 ff ff    	jne    12d24 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x314>
   134dd:	49 89 c3             	mov    %rax,%r11
   134e0:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   134e5:	4d 89 c1             	mov    %r8,%r9
   134e8:	4d 29 d9             	sub    %r11,%r9
   134eb:	4d 89 df             	mov    %r11,%r15
   134ee:	4d 29 c7             	sub    %r8,%r15
   134f1:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   134f6:	4d 29 c8             	sub    %r9,%r8
   134f9:	4d 89 da             	mov    %r11,%r10
   134fc:	4d 85 c0             	test   %r8,%r8
   134ff:	0f 85 df f8 ff ff    	jne    12de4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x3d4>
   13505:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13509:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   1350e:	75 03                	jne    13513 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb03>
   13510:	48 ff c6             	inc    %rsi
   13513:	48 29 f0             	sub    %rsi,%rax
   13516:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
   1351a:	ba 01 00 00 00       	mov    $0x1,%edx
   1351f:	48 83 f8 03          	cmp    $0x3,%rax
   13523:	7c 6b                	jl     13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   13525:	0f b7 0e             	movzwl (%rsi),%ecx
   13528:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
   1352c:	c1 e0 10             	shl    $0x10,%eax
   1352f:	48 09 c8             	or     %rcx,%rax
   13532:	48 b9 20 20 20 20 20 	movabs $0x2020202020202020,%rcx
   13539:	20 20 20 
   1353c:	48 09 c8             	or     %rcx,%rax
   1353f:	48 b9 69 6e 66 20 20 	movabs $0x2020202020666e69,%rcx
   13546:	20 20 20 
   13549:	48 39 c8             	cmp    %rcx,%rax
   1354c:	74 21                	je     1356f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb5f>
   1354e:	48 b9 6e 61 6e 20 20 	movabs $0x20202020206e616e,%rcx
   13555:	20 20 20 
   13558:	48 39 c8             	cmp    %rcx,%rax
   1355b:	75 33                	jne    13590 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb80>
   1355d:	31 c0                	xor    %eax,%eax
   1355f:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13563:	0f 94 c0             	sete   %al
   13566:	48 8d 0d 03 cb 03 00 	lea    0x3cb03(%rip),%rcx        # 50070 <_IO_stdin_used+0x70>
   1356d:	eb 10                	jmp    1357f <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xb6f>
   1356f:	31 c0                	xor    %eax,%eax
   13571:	41 80 fc 2d          	cmp    $0x2d,%r12b
   13575:	0f 94 c0             	sete   %al
   13578:	48 8d 0d e1 ca 03 00 	lea    0x3cae1(%rip),%rcx        # 50060 <_IO_stdin_used+0x60>
   1357f:	c5 fb 10 14 c1       	vmovsd (%rcx,%rax,8),%xmm2
   13584:	31 d2                	xor    %edx,%edx
   13586:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1358d:	00 00 00 
   13590:	85 d2                	test   %edx,%edx
   13592:	0f 84 b8 f4 ff ff    	je     12a50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   13598:	84 db                	test   %bl,%bl
   1359a:	0f 85 b0 f4 ff ff    	jne    12a50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x40>
   135a0:	e9 37 01 00 00       	jmp    136dc <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xccc>
   135a5:	48 89 f3             	mov    %rsi,%rbx
   135a8:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   135ad:	4c 8b 5c 24 68       	mov    0x68(%rsp),%r11
   135b2:	48 89 ce             	mov    %rcx,%rsi
   135b5:	48 f7 de             	neg    %rsi
   135b8:	41 80 fb 2d          	cmp    $0x2d,%r11b
   135bc:	48 0f 45 f1          	cmovne %rcx,%rsi
   135c0:	49 01 f1             	add    %rsi,%r9
   135c3:	49 89 db             	mov    %rbx,%r11
   135c6:	b3 01                	mov    $0x1,%bl
   135c8:	31 c9                	xor    %ecx,%ecx
   135ca:	49 83 f8 14          	cmp    $0x14,%r8
   135ce:	0f 8c d0 f9 ff ff    	jl     12fa4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x594>
   135d4:	e9 c3 f8 ff ff       	jmp    12e9c <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x48c>
   135d9:	41 89 df             	mov    %ebx,%r15d
   135dc:	41 83 e7 03          	and    $0x3,%r15d
   135e0:	49 83 f7 01          	xor    $0x1,%r15
   135e4:	c4 62 91 f7 eb       	shlx   %r13,%rbx,%r13
   135e9:	4d 31 d5             	xor    %r10,%r13
   135ec:	49 89 da             	mov    %rbx,%r10
   135ef:	4c 89 44 24 68       	mov    %r8,0x68(%rsp)
   135f4:	49 b8 fc ff ff ff ff 	movabs $0xfffffffffffffc,%r8
   135fb:	ff ff 00 
   135fe:	4d 21 c2             	and    %r8,%r10
   13601:	4d 09 fd             	or     %r15,%r13
   13604:	4c 0f 45 d3          	cmovne %rbx,%r10
   13608:	4d 8d 79 04          	lea    0x4(%r9),%r15
   1360c:	48 83 7c 24 68 02    	cmpq   $0x2,0x68(%rsp)
   13612:	4c 0f 43 d3          	cmovae %rbx,%r10
   13616:	49 83 ff 1c          	cmp    $0x1c,%r15
   1361a:	4c 0f 43 d3          	cmovae %rbx,%r10
   1361e:	44 89 d3             	mov    %r10d,%ebx
   13621:	83 e3 01             	and    $0x1,%ebx
   13624:	4c 01 d3             	add    %r10,%rbx
   13627:	49 89 d8             	mov    %rbx,%r8
   1362a:	49 d1 e8             	shr    $1,%r8
   1362d:	49 ba ff ff ff ff ff 	movabs $0x7fefffffffffffff,%r10
   13634:	ff ef 7f 
   13637:	4d 21 d0             	and    %r10,%r8
   1363a:	49 ba 00 00 00 00 00 	movabs $0x40000000000000,%r10
   13641:	00 40 00 
   13644:	4c 39 d3             	cmp    %r10,%rbx
   13647:	83 da 00             	sbb    $0x0,%edx
   1364a:	81 c2 00 04 00 00    	add    $0x400,%edx
   13650:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   13656:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1365c:	4d 0f 43 c7          	cmovae %r15,%r8
   13660:	4c 39 d3             	cmp    %r10,%rbx
   13663:	4d 0f 43 c7          	cmovae %r15,%r8
   13667:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
   1366d:	41 ba ff 07 00 00    	mov    $0x7ff,%r10d
   13673:	41 0f 43 d2          	cmovae %r10d,%edx
   13677:	eb 36                	jmp    136af <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xc9f>
   13679:	4d 89 c3             	mov    %r8,%r11
   1367c:	e9 5f fe ff ff       	jmp    134e0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0xad0>
   13681:	41 b8 02 fc ff ff    	mov    $0xfffffc02,%r8d
   13687:	41 29 d0             	sub    %edx,%r8d
   1368a:	c4 62 bb f7 d3       	shrx   %r8,%rbx,%r10
   1368f:	4c 0f a3 c3          	bt     %r8,%rbx
   13693:	49 83 d2 00          	adc    $0x0,%r10
   13697:	4d 89 d0             	mov    %r10,%r8
   1369a:	49 d1 e8             	shr    $1,%r8
   1369d:	31 d2                	xor    %edx,%edx
   1369f:	48 bb ff ff ff ff ff 	movabs $0x1fffffffffffff,%rbx
   136a6:	ff 1f 00 
   136a9:	49 39 da             	cmp    %rbx,%r10
   136ac:	0f 97 c2             	seta   %dl
   136af:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
   136b3:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
   136b8:	4c 39 c0             	cmp    %r8,%rax
   136bb:	0f 84 62 fb ff ff    	je     13223 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x813>
   136c1:	e9 65 fb ff ff       	jmp    1322b <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&, bool)+0x81b>
   136c6:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
   136ca:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   136d1:	5b                   	pop    %rbx
   136d2:	41 5c                	pop    %r12
   136d4:	41 5d                	pop    %r13
   136d6:	41 5e                	pop    %r14
   136d8:	41 5f                	pop    %r15
   136da:	5d                   	pop    %rbp
   136db:	c3                   	ret
   136dc:	bf 10 00 00 00       	mov    $0x10,%edi
   136e1:	e8 9a 2a ff ff       	call   6180 <__cxa_allocate_exception@plt>
   136e6:	48 89 c3             	mov    %rax,%rbx
   136e9:	48 8d 35 da 42 04 00 	lea    0x442da(%rip),%rsi        # 579ca <fast_float::powers_of_ten_uint64+0x6ba>
   136f0:	48 89 c7             	mov    %rax,%rdi
   136f3:	e8 28 2a ff ff       	call   6120 <std::runtime_error::runtime_error(char const*)@plt>
   136f8:	48 8b 35 d1 98 05 00 	mov    0x598d1(%rip),%rsi        # 6cfd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
   136ff:	48 8b 15 5a 98 05 00 	mov    0x5985a(%rip),%rdx        # 6cf60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
   13706:	48 89 df             	mov    %rbx,%rdi
   13709:	e8 32 2e ff ff       	call   6540 <__cxa_throw@plt>
   1370e:	49 89 c6             	mov    %rax,%r14
   13711:	48 89 df             	mov    %rbx,%rdi
   13714:	e8 57 2b ff ff       	call   6270 <__cxa_free_exception@plt>
   13719:	4c 89 f7             	mov    %r14,%rdi
   1371c:	e8 2f 2e ff ff       	call   6550 <_Unwind_Resume@plt>
   13721:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   13728:	0f 1f 84 00 00 00 00 
   1372f:	00 

