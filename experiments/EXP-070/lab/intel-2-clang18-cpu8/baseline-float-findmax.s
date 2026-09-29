000000000000bcd0 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    bcd0:	41 57                	push   %r15
    bcd2:	41 56                	push   %r14
    bcd4:	53                   	push   %rbx
    bcd5:	48 83 ec 10          	sub    $0x10,%rsp
    bcd9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    bce0:	00 
    bce1:	4c 8b 37             	mov    (%rdi),%r14
    bce4:	4c 8b 7f 08          	mov    0x8(%rdi),%r15
    bce8:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    bcec:	4d 39 fe             	cmp    %r15,%r14
    bcef:	74 53                	je     bd44 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x74>
    bcf1:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
    bcf6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    bcfd:	00 00 00 
    bd00:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    bd06:	49 8b 3e             	mov    (%r14),%rdi
    bd09:	49 8b 76 08          	mov    0x8(%r14),%rsi
    bd0d:	48 01 fe             	add    %rdi,%rsi
    bd10:	b9 05 00 00 00       	mov    $0x5,%ecx
    bd15:	48 89 da             	mov    %rbx,%rdx
    bd18:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
    bd1e:	e8 8d d1 ff ff       	call   8eb0 <ffc_from_chars_float_options>
    bd23:	85 d2                	test   %edx,%edx
    bd25:	75 27                	jne    bd4e <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e>
    bd27:	c5 fa 10 44 24 04    	vmovss 0x4(%rsp),%xmm0
    bd2d:	c5 fa 5a c0          	vcvtss2sd %xmm0,%xmm0,%xmm0
    bd31:	c5 fb 10 4c 24 08    	vmovsd 0x8(%rsp),%xmm1
    bd37:	c5 f3 5f c0          	vmaxsd %xmm0,%xmm1,%xmm0
    bd3b:	49 83 c6 20          	add    $0x20,%r14
    bd3f:	4d 39 fe             	cmp    %r15,%r14
    bd42:	75 bc                	jne    bd00 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x30>
    bd44:	48 83 c4 10          	add    $0x10,%rsp
    bd48:	5b                   	pop    %rbx
    bd49:	41 5e                	pop    %r14
    bd4b:	41 5f                	pop    %r15
    bd4d:	c3                   	ret
    bd4e:	bf 10 00 00 00       	mov    $0x10,%edi
    bd53:	e8 18 a4 ff ff       	call   6170 <__cxa_allocate_exception@plt>
    bd58:	48 89 c3             	mov    %rax,%rbx
    bd5b:	48 8d 35 21 0a 04 00 	lea    0x40a21(%rip),%rsi        # 4c783 <fast_float::powers_of_ten_uint64+0x4f3>
    bd62:	48 89 c7             	mov    %rax,%rdi
    bd65:	e8 a6 a3 ff ff       	call   6110 <std::runtime_error::runtime_error(char const*)@plt>
    bd6a:	48 8b 35 5f 52 05 00 	mov    0x5525f(%rip),%rsi        # 60fd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
    bd71:	48 8b 15 e8 51 05 00 	mov    0x551e8(%rip),%rdx        # 60f60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
    bd78:	48 89 df             	mov    %rbx,%rdi
    bd7b:	e8 70 a7 ff ff       	call   64f0 <__cxa_throw@plt>
    bd80:	49 89 c6             	mov    %rax,%r14
    bd83:	48 89 df             	mov    %rbx,%rdi
    bd86:	e8 d5 a4 ff ff       	call   6260 <__cxa_free_exception@plt>
    bd8b:	4c 89 f7             	mov    %r14,%rdi
    bd8e:	e8 6d a7 ff ff       	call   6500 <_Unwind_Resume@plt>
    bd93:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    bd9a:	84 00 00 00 00 00 

