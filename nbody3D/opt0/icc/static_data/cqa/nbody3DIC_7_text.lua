_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCMPPS: 2 occurrences\n - VMASKMOVPS: 8 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "38 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 416 FP arithmetical operations:\n - 176: addition or subtraction (128 inside FMA instructions)\n - 208: multiply (128 inside FMA instructions)\n - 16: fast reciprocal\n - 16: fast square root reciprocal\nThe binary loop is loading 628 bytes (157 single precision FP elements).\nThe binary loop is storing 32 bytes (8 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.63 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 72\nnb uops            : 81\nloop length        : 439\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 9\nused ymm registers : 16\nused zmm registers : 0\nnb stack references: 7\nADD-SUB / MUL ratio: 0.60\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 20.25 cycles\nfront end            : 20.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4   | P5    | P6   | P7\n-------------------------------------------------------------------\nuops   | 20.83 | 20.50 | 12.50 | 12.50 | 1.00 | 20.67 | 2.00 | 1.00\ncycles | 20.83 | 20.50 | 12.50 | 12.50 | 1.00 | 20.67 | 2.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 20.25\nDispatch  : 20.83\nData deps.: 4.00\nOverall L1: 20.83\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 98%\nload    : 96%\nstore   : 100%\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 94%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 89%\nload    : 78%\nstore   : 100%\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 84%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 20.83 cycles. At this rate:\n - 47% of peak load performance is reached (30.14 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.54 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402691\n\nInstruction                               | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------\nVMOVUPS 0xda57(%RIP),%XMM9                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nLEA (%R8,%R8,2),%R10                      | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVUPS %YMM14,0x120(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x8,%R8                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMASKMOVPS (%RBX,%R10,8),%XMM9,%XMM1      | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x18(%RBX,%R10,8),%XMM9,%XMM2  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x30(%RBX,%R10,8),%XMM9,%XMM12 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x48(%RBX,%R10,8),%XMM9,%XMM5  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x60(%RBX,%R10,8),%XMM9,%XMM14 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x78(%RBX,%R10,8),%XMM9,%XMM3  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x90(%RBX,%R10,8),%XMM9,%XMM6  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0xa8(%RBX,%R10,8),%XMM9,%XMM4  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVINSERTF128 $0x1,%XMM14,%YMM1,%YMM13      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM3,%YMM2,%YMM15       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM6,%YMM12,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM4,%YMM5,%YMM9        | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVSHUFPS $0x14,%YMM15,%YMM13,%YMM14        | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x41,%YMM1,%YMM9,%YMM2           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $-0x7e,%YMM15,%YMM13,%YMM15       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x28,%YMM1,%YMM9,%YMM13          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x6c,%YMM2,%YMM14,%YMM9          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x39,%YMM2,%YMM14,%YMM1          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVUPS 0xd8f9(%RIP),%YMM14               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVSUBPS 0x60(%RSP),%YMM9,%YMM12            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0x80(%RSP),%YMM1,%YMM6             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVAPS %YMM14,%YMM4                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVFMADD231PS %YMM12,%YMM12,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM6,%YMM6,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $0x6c,%YMM13,%YMM15,%YMM3         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSUBPS 0x100(%RSP),%YMM3,%YMM5            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xa0(%RSP),%YMM9,%YMM13            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xc0(%RSP),%YMM1,%YMM9             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xe0(%RSP),%YMM3,%YMM1             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM5,%YMM5,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM13,%YMM13,%YMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRSQRTPS %YMM4,%YMM3                      | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFMADD231PS %YMM9,%YMM9,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS 0xd936(%RIP),%YMM4,%YMM15          | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 1       | 0.50\nVCMPPS $0xd,0xd90d(%RIP),%YMM15,%YMM2     | 2     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM1,%YMM1,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS %YMM3,%YMM2,%YMM2                  | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0    | 1       | 0.33\nVMULPS %YMM2,%YMM4,%YMM15                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVUPS 0xd8b8(%RIP),%YMM3                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVFMSUB213PS %YMM3,%YMM15,%YMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM2,%YMM15,%YMM15                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS 0xd8c7(%RIP),%YMM15,%YMM2          | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM4,%YMM2,%YMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVBROADCASTSS 0xd972(%RIP),%YMM2           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVRCPPS %YMM4,%YMM15                       | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFNMADD213PS %YMM2,%YMM15,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM15,%YMM4,%YMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM12,%YMM4,%YMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM5,%YMM4,%YMM11            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM6,%YMM4,%YMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRSQRTPS %YMM14,%YMM12                    | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVANDPS 0xd8d0(%RIP),%YMM14,%YMM5          | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 1       | 0.50\nVCMPPS $0xd,0xd8a7(%RIP),%YMM5,%YMM6      | 2     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS %YMM12,%YMM6,%YMM5                 | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0    | 1       | 0.33\nVMULPS %YMM5,%YMM14,%YMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMSUB213PS %YMM3,%YMM4,%YMM5             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM5,%YMM4,%YMM3                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS 0xd86d(%RIP),%YMM3,%YMM6           | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM14,%YMM6,%YMM14                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRCPPS %YMM14,%YMM12                      | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFNMADD213PS %YMM2,%YMM12,%YMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM12,%YMM14,%YMM2                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVUPS 0x120(%RSP),%YMM14                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVFMADD231PS %YMM13,%YMM2,%YMM10           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM9,%YMM2,%YMM8             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM1,%YMM2,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nCMP %R13,%R8                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402691 <main+0x3e1>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
      },
      header = {
        "62% of peak computational performance is used (19.97 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "98% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 96% of SSE/AVX loads are used in vector version.\n - 94% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\n89% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 20.83 to 19.50 cycles (1.07x speedup).",
        },
        {
          workaround = " - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 128 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCMPPS: 2 occurrences\n - VMASKMOVPS: 8 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant non-unit stride: 1 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 4 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "38 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 416 FP arithmetical operations:\n - 176: addition or subtraction (128 inside FMA instructions)\n - 208: multiply (128 inside FMA instructions)\n - 16: fast reciprocal\n - 16: fast square root reciprocal\nThe binary loop is loading 628 bytes (157 single precision FP elements).\nThe binary loop is storing 32 bytes (8 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.63 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 72\nnb uops            : 81\nloop length        : 439\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 9\nused ymm registers : 16\nused zmm registers : 0\nnb stack references: 7\nADD-SUB / MUL ratio: 0.60\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 20.25 cycles\nfront end            : 20.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4   | P5    | P6   | P7\n-------------------------------------------------------------------\nuops   | 20.83 | 20.50 | 12.50 | 12.50 | 1.00 | 20.67 | 2.00 | 1.00\ncycles | 20.83 | 20.50 | 12.50 | 12.50 | 1.00 | 20.67 | 2.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 20.25\nDispatch  : 20.83\nData deps.: 4.00\nOverall L1: 20.83\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 98%\nload    : 96%\nstore   : 100%\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 94%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 89%\nload    : 78%\nstore   : 100%\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 84%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 20.83 cycles. At this rate:\n - 47% of peak load performance is reached (30.14 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.54 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402691\n\nInstruction                               | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------\nVMOVUPS 0xda57(%RIP),%XMM9                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nLEA (%R8,%R8,2),%R10                      | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVUPS %YMM14,0x120(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x8,%R8                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMASKMOVPS (%RBX,%R10,8),%XMM9,%XMM1      | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x18(%RBX,%R10,8),%XMM9,%XMM2  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x30(%RBX,%R10,8),%XMM9,%XMM12 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x48(%RBX,%R10,8),%XMM9,%XMM5  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x60(%RBX,%R10,8),%XMM9,%XMM14 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x78(%RBX,%R10,8),%XMM9,%XMM3  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0x90(%RBX,%R10,8),%XMM9,%XMM6  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVMASKMOVPS 0xa8(%RBX,%R10,8),%XMM9,%XMM4  | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 3       | 0.50\nVINSERTF128 $0x1,%XMM14,%YMM1,%YMM13      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM3,%YMM2,%YMM15       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM6,%YMM12,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVINSERTF128 $0x1,%XMM4,%YMM5,%YMM9        | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVSHUFPS $0x14,%YMM15,%YMM13,%YMM14        | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x41,%YMM1,%YMM9,%YMM2           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $-0x7e,%YMM15,%YMM13,%YMM15       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x28,%YMM1,%YMM9,%YMM13          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x6c,%YMM2,%YMM14,%YMM9          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSHUFPS $0x39,%YMM2,%YMM14,%YMM1          | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVUPS 0xd8f9(%RIP),%YMM14               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVSUBPS 0x60(%RSP),%YMM9,%YMM12            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0x80(%RSP),%YMM1,%YMM6             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVAPS %YMM14,%YMM4                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVFMADD231PS %YMM12,%YMM12,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM6,%YMM6,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $0x6c,%YMM13,%YMM15,%YMM3         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVSUBPS 0x100(%RSP),%YMM3,%YMM5            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xa0(%RSP),%YMM9,%YMM13            | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xc0(%RSP),%YMM1,%YMM9             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVSUBPS 0xe0(%RSP),%YMM3,%YMM1             | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM5,%YMM5,%YMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM13,%YMM13,%YMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRSQRTPS %YMM4,%YMM3                      | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFMADD231PS %YMM9,%YMM9,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS 0xd936(%RIP),%YMM4,%YMM15          | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 1       | 0.50\nVCMPPS $0xd,0xd90d(%RIP),%YMM15,%YMM2     | 2     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM1,%YMM1,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS %YMM3,%YMM2,%YMM2                  | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0    | 1       | 0.33\nVMULPS %YMM2,%YMM4,%YMM15                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVUPS 0xd8b8(%RIP),%YMM3                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVFMSUB213PS %YMM3,%YMM15,%YMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM2,%YMM15,%YMM15                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS 0xd8c7(%RIP),%YMM15,%YMM2          | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM4,%YMM2,%YMM4                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVBROADCASTSS 0xd972(%RIP),%YMM2           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVRCPPS %YMM4,%YMM15                       | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFNMADD213PS %YMM2,%YMM15,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM15,%YMM4,%YMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM12,%YMM4,%YMM7            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM5,%YMM4,%YMM11            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM6,%YMM4,%YMM0             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRSQRTPS %YMM14,%YMM12                    | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVANDPS 0xd8d0(%RIP),%YMM14,%YMM5          | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0    | 1       | 0.50\nVCMPPS $0xd,0xd8a7(%RIP),%YMM5,%YMM6      | 2     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVANDPS %YMM12,%YMM6,%YMM5                 | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0    | 1       | 0.33\nVMULPS %YMM5,%YMM14,%YMM4                 | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMSUB213PS %YMM3,%YMM4,%YMM5             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM5,%YMM4,%YMM3                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS 0xd86d(%RIP),%YMM3,%YMM6           | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM14,%YMM6,%YMM14                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVRCPPS %YMM14,%YMM12                      | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 1\nVFNMADD213PS %YMM2,%YMM12,%YMM14          | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMULPS %YMM12,%YMM14,%YMM2                | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVUPS 0x120(%RSP),%YMM14                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5-6     | 0.50\nVFMADD231PS %YMM13,%YMM2,%YMM10           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM9,%YMM2,%YMM8             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVFMADD231PS %YMM1,%YMM2,%YMM14            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nCMP %R13,%R8                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402691 <main+0x3e1>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
      },
      header = {
        "62% of peak computational performance is used (19.97 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "98% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 96% of SSE/AVX loads are used in vector version.\n - 94% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\n89% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 20.83 to 19.50 cycles (1.07x speedup).",
        },
        {
          workaround = " - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 128 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
