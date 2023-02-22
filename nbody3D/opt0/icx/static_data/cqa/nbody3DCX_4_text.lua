_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VGATHERQPS: 6 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 4 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = " - VGATHERQPS: 6 occurrences\n",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n - 88: addition or subtraction (64 inside FMA instructions)\n - 72: multiply (64 inside FMA instructions)\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 168 bytes (42 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.05 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 60\nnb uops            : 81\nloop length        : 313\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 8\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 20.25 cycles\nfront end            : 20.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4   | P5    | P6   | P7\n-------------------------------------------------------------------\nuops   | 21.33 | 21.33 | 14.00 | 14.00 | 0.00 | 21.33 | 2.00 | 0.00\ncycles | 21.33 | 21.33 | 14.00 | 14.00 | 0.00 | 21.33 | 2.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 20.25\nDispatch  : 21.33\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 21.33-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 88%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 80%\nFP\nall     : 95%\nload    : 75%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 91%\nINT+FP\nall     : 92%\nload    : 80%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 88%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 73%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 55%\nFP\nall     : 71%\nload    : 40%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 53%\nINT+FP\nall     : 72%\nload    : 52%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 53%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 10% of peak load performance is reached (7.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4014b0\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------\nVMOVQ %RCX,%XMM4                      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPBROADCASTQ %XMM4,%YMM4              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPSRLQ $0x20,%YMM4,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVPMULUDQ %YMM5,%YMM15,%YMM5           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPMULUDQ %YMM4,%YMM15,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPSLLQ $0x20,%YMM5,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVPADDQ %YMM5,%YMM4,%YMM4              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPADDQ 0xcb68(%RIP),%YMM4,%YMM5       | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 1       | 0.50\nVPCMPEQD %XMM6,%XMM6,%XMM6            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM7,%XMM7,%XMM7              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVPADDQ 0xcb78(%RIP),%YMM4,%YMM4       | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 1       | 0.50\nVPCMPEQD %XMM2,%XMM2,%XMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVGATHERQPS %XMM6,(%RDI,%YMM4,1),%XMM7 | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVXORPS %XMM6,%XMM6,%XMM6              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM2,(%RDI,%YMM5,1),%XMM6 | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPADDQ %YMM5,%YMM0,%YMM2              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPCMPEQD %XMM5,%XMM5,%XMM5            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM3,%XMM3,%XMM3              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVPADDQ %YMM4,%YMM0,%YMM4              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVGATHERQPS %XMM5,0x4(,%YMM4,1),%XMM3  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVXORPS %XMM5,%XMM5,%XMM5              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x4(,%YMM2,1),%XMM5  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM8,%XMM8,%XMM8              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x8(,%YMM4,1),%XMM8  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM4,%XMM4,%XMM4              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x8(,%YMM2,1),%XMM4  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVINSERTF128 $0x1,%XMM7,%YMM6,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM12,%YMM1,%YMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVINSERTF128 $0x1,%XMM3,%YMM5,%YMM2    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM13,%YMM2,%YMM2             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVINSERTF128 $0x1,%XMM8,%YMM4,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM14,%YMM3,%YMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVMOVAPS %YMM1,%YMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVBROADCASTSS 0xca91(%RIP),%YMM5       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD213PS %YMM5,%YMM1,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM2,%YMM2,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM3,%YMM3,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM4,%XMM5         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVCVTPS2PD %XMM4,%YMM4                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVCVTPS2PD %XMM5,%YMM5                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM4,%YMM6                   | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM4,%YMM6,%YMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSQRTPD %YMM5,%YMM6                   | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVCVTPD2PS %YMM4,%XMM4                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVMULPD %YMM5,%YMM6,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM5,%XMM5                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM5,%YMM4,%YMM4    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVRCPPS %YMM4,%YMM5                    | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 1\nVBROADCASTSS 0xca4d(%RIP),%YMM6       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMSUB213PS %YMM6,%YMM5,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFNMADD132PS %YMM5,%YMM5,%YMM4        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM1,%YMM4,%YMM9         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM2,%YMM4,%YMM11        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM4,%YMM3,%YMM10        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nADD $0x8,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RDX,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJBE 4014b0 <move_particles+0xe0>      | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "22% of peak computational performance is used (7.33 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "92% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 80% of SSE/AVX loads are used in vector version.\n - 88% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\nOnly 72% of vector register length is used (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 21.33 cycles (1.13x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 24.00 to 21.33 cycles (1.12x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 64 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VGATHERQPS: 6 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = " - Irregular (variable stride) or indirect: 4 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries: replace { void *p = malloc (size); } with { void *p; posix_memalign (&p, 32, size); }.\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = " - VGATHERQPS: 6 occurrences\n",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n - 88: addition or subtraction (64 inside FMA instructions)\n - 72: multiply (64 inside FMA instructions)\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 168 bytes (42 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.05 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 60\nnb uops            : 81\nloop length        : 313\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 8\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 20.25 cycles\nfront end            : 20.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2    | P3    | P4   | P5    | P6   | P7\n-------------------------------------------------------------------\nuops   | 21.33 | 21.33 | 14.00 | 14.00 | 0.00 | 21.33 | 2.00 | 0.00\ncycles | 21.33 | 21.33 | 14.00 | 14.00 | 0.00 | 21.33 | 2.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 20.25\nDispatch  : 21.33\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 21.33-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 88%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 80%\nFP\nall     : 95%\nload    : 75%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 91%\nINT+FP\nall     : 92%\nload    : 80%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 88%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 73%\nload   : 100%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 100%\nadd-sub: 100%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 55%\nFP\nall     : 71%\nload    : 40%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 53%\nINT+FP\nall     : 72%\nload    : 52%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 53%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 10% of peak load performance is reached (7.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4014b0\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------\nVMOVQ %RCX,%XMM4                      | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVPBROADCASTQ %XMM4,%YMM4              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVPSRLQ $0x20,%YMM4,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVPMULUDQ %YMM5,%YMM15,%YMM5           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPMULUDQ %YMM4,%YMM15,%YMM4           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 5       | 0.50\nVPSLLQ $0x20,%YMM5,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVPADDQ %YMM5,%YMM4,%YMM4              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPADDQ 0xcb68(%RIP),%YMM4,%YMM5       | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 1       | 0.50\nVPCMPEQD %XMM6,%XMM6,%XMM6            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM7,%XMM7,%XMM7              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVPADDQ 0xcb78(%RIP),%YMM4,%YMM4       | 1     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 1       | 0.50\nVPCMPEQD %XMM2,%XMM2,%XMM2            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVGATHERQPS %XMM6,(%RDI,%YMM4,1),%XMM7 | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVXORPS %XMM6,%XMM6,%XMM6              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM2,(%RDI,%YMM5,1),%XMM6 | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPADDQ %YMM5,%YMM0,%YMM2              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPCMPEQD %XMM5,%XMM5,%XMM5            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM3,%XMM3,%XMM3              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVPADDQ %YMM4,%YMM0,%YMM4              | 1     | 0.33 | 0.33 | 0    | 0    | 0  | 0.33 | 0    | 0  | 1       | 0.33\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVGATHERQPS %XMM5,0x4(,%YMM4,1),%XMM3  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVXORPS %XMM5,%XMM5,%XMM5              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x4(,%YMM2,1),%XMM5  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM8,%XMM8,%XMM8              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x8(,%YMM4,1),%XMM8  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVPCMPEQD %XMM1,%XMM1,%XMM1            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 1       | 0.50\nVXORPS %XMM4,%XMM4,%XMM4              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVGATHERQPS %XMM1,0x8(,%YMM2,1),%XMM4  | 4     | 1    | 1    | 2    | 2    | 0  | 1    | 0    | 0  | 20      | 4\nVINSERTF128 $0x1,%XMM7,%YMM6,%YMM1    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM12,%YMM1,%YMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVINSERTF128 $0x1,%XMM3,%YMM5,%YMM2    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM13,%YMM2,%YMM2             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVINSERTF128 $0x1,%XMM8,%YMM4,%YMM3    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSUBPS %YMM14,%YMM3,%YMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVMOVAPS %YMM1,%YMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVBROADCASTSS 0xca91(%RIP),%YMM5       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMADD213PS %YMM5,%YMM1,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM2,%YMM2,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM3,%YMM3,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM4,%XMM5         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVCVTPS2PD %XMM4,%YMM4                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVCVTPS2PD %XMM5,%YMM5                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM4,%YMM6                   | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM4,%YMM6,%YMM4              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSQRTPD %YMM5,%YMM6                   | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVCVTPD2PS %YMM4,%XMM4                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVMULPD %YMM5,%YMM6,%YMM5              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM5,%XMM5                 | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM5,%YMM4,%YMM4    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVRCPPS %YMM4,%YMM5                    | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 1\nVBROADCASTSS 0xca4d(%RIP),%YMM6       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 5       | 0.50\nVFMSUB213PS %YMM6,%YMM5,%YMM4         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFNMADD132PS %YMM5,%YMM5,%YMM4        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM1,%YMM4,%YMM9         | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM2,%YMM4,%YMM11        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM4,%YMM3,%YMM10        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nADD $0x8,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RDX,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nJBE 4014b0 <move_particles+0xe0>      | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "22% of peak computational performance is used (7.33 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "92% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 80% of SSE/AVX loads are used in vector version.\n - 88% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\n",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\nOnly 72% of vector register length is used (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 21.33 cycles (1.13x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 24.00 to 21.33 cycles (1.12x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 64 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /mnt/d/isty/IATIC5/new/projet_optimisation/nbody3D/nbody.c:65-77.\n",
      "It is main loop of related source loop which is unrolled by 14 (including vectorization).",
    },
    nb_paths = 1,
  },
}
