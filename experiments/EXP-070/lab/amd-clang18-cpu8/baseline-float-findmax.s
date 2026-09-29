000000000000be50 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)>:
    be50:	41 57                	push   %r15
    be52:	41 56                	push   %r14
    be54:	53                   	push   %rbx
    be55:	48 83 ec 10          	sub    $0x10,%rsp
    be59:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    be60:	00 
    be61:	4c 8b 37             	mov    (%rdi),%r14
    be64:	4c 8b 7f 08          	mov    0x8(%rdi),%r15
    be68:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
    be6c:	4d 39 fe             	cmp    %r15,%r14
    be6f:	74 53                	je     bec4 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x74>
    be71:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
    be76:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    be7d:	00 00 00 
    be80:	c5 fb 11 44 24 08    	vmovsd %xmm0,0x8(%rsp)
    be86:	49 8b 3e             	mov    (%r14),%rdi
    be89:	49 8b 76 08          	mov    0x8(%r14),%rsi
    be8d:	48 01 fe             	add    %rdi,%rsi
    be90:	b9 05 00 00 00       	mov    $0x5,%ecx
    be95:	48 89 da             	mov    %rbx,%rdx
    be98:	41 b8 2e 00 00 00    	mov    $0x2e,%r8d
    be9e:	e8 7d d1 ff ff       	call   9020 <ffc_from_chars_float_options>
    bea3:	85 d2                	test   %edx,%edx
    bea5:	75 27                	jne    bece <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x7e>
    bea7:	c5 fa 10 44 24 04    	vmovss 0x4(%rsp),%xmm0
    bead:	c5 fa 5a c0          	vcvtss2sd %xmm0,%xmm0,%xmm0
    beb1:	c5 fb 10 4c 24 08    	vmovsd 0x8(%rsp),%xmm1
    beb7:	c5 f3 5f c0          	vmaxsd %xmm0,%xmm1,%xmm0
    bebb:	49 83 c6 20          	add    $0x20,%r14
    bebf:	4d 39 fe             	cmp    %r15,%r14
    bec2:	75 bc                	jne    be80 <findmax_ffc(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >&)+0x30>
    bec4:	48 83 c4 10          	add    $0x10,%rsp
    bec8:	5b                   	pop    %rbx
    bec9:	41 5e                	pop    %r14
    becb:	41 5f                	pop    %r15
    becd:	c3                   	ret
    bece:	bf 10 00 00 00       	mov    $0x10,%edi
    bed3:	e8 98 a2 ff ff       	call   6170 <__cxa_allocate_exception@plt>
    bed8:	48 89 c3             	mov    %rax,%rbx
    bedb:	48 8d 35 51 ec 03 00 	lea    0x3ec51(%rip),%rsi        # 4ab33 <fast_float::powers_of_ten_uint64+0x643>
    bee2:	48 89 c7             	mov    %rax,%rdi
    bee5:	e8 26 a2 ff ff       	call   6110 <std::runtime_error::runtime_error(char const*)@plt>
    beea:	48 8b 35 df 40 05 00 	mov    0x540df(%rip),%rsi        # 5ffd0 <typeinfo for std::runtime_error@GLIBCXX_3.4>
    bef1:	48 8b 15 68 40 05 00 	mov    0x54068(%rip),%rdx        # 5ff60 <std::runtime_error::~runtime_error()@GLIBCXX_3.4>
    bef8:	48 89 df             	mov    %rbx,%rdi
    befb:	e8 f0 a5 ff ff       	call   64f0 <__cxa_throw@plt>
    bf00:	49 89 c6             	mov    %rax,%r14
    bf03:	48 89 df             	mov    %rbx,%rdi
    bf06:	e8 55 a3 ff ff       	call   6260 <__cxa_free_exception@plt>
    bf0b:	4c 89 f7             	mov    %r14,%rdi
    bf0e:	e8 ed a5 ff ff       	call   6500 <_Unwind_Resume@plt>
    bf13:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
    bf1a:	84 00 00 00 00 00 

