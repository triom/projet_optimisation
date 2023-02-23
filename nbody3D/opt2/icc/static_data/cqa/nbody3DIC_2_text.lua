_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 2 occurrence(s)\n - Constant non-unit stride: 4 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 33 FP arithmetical operations:\n - 30: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 88 bytes (22 single precision FP elements).\nThe binary loop is storing 20 bytes (5 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.31 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 64\nnb uops            : 63\nloop length        : 316\nused x86 registers : 12\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 7\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 16.50 cycles\nfront end            : 16.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 7.75 | 7.75 | 8.00 | 8.00 | 5.00 | 12.00 | 7.50 | 5.00\ncycles | 7.75 | 7.75 | 8.00 | 8.00 | 5.00 | 12.00 | 7.50 | 5.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 16.50\nDispatch  : 12.00\nData deps.: 1.00\nOverall L1: 16.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 46%\nload    : 7%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 76%\nINT+FP\nall     : 46%\nload    : 7%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 71%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 62%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 62%\nFP\nall     : 29%\nload    : 15%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 39%\nINT+FP\nall     : 32%\nload    : 15%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 44%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 16.50 cycles. At this rate:\n - 8% of peak load performance is reached (5.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 3% of peak store performance is reached (1.21 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 16.50 to 12.00 cycles (1.38x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402d7a\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nCMP $0x8,%R13                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPS %XMM4,%XMM4,%XMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM4,%XMM5                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM5,%XMM6                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nLEA (%RSI,%RDX,8),%RCX                     | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSS (%RCX,%RDI,1),%XMM11                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x4(%RCX,%RDI,1),%XMM12             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x8(%RCX,%RDI,1),%XMM1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nJB 40301d <main+0xc7d>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nVBROADCASTSS %XMM11,%YMM7                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nMOV %RBX,%R8                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVUPS 0xd2a8(%RIP),%XMM4                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS %XMM12,0x48(%RSP)                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVSS %XMM11,0x50(%RSP)                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVXORPS %YMM2,%YMM2,%YMM2                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %ECX,%ECX                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQA %YMM2,%YMM3                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQA %YMM3,%YMM8                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVBROADCASTSS %XMM12,%YMM6                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVBROADCASTSS %XMM1,%YMM5                   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVBROADCASTSS 0xd2c3(%RIP),%YMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVEXTRACTF128 $0x1,%YMM8,%XMM6              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVMOVSS 0x48(%RSP),%XMM12                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x50(%RSP),%XMM11                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x40(%RSP),%XMM10                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDPS %XMM6,%XMM8,%XMM5                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM5,%XMM5,%XMM0                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVSS 0xd199(%RIP),%XMM14                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDPS %XMM0,%XMM5,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM4,%XMM4,%XMM7            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVSS 0xd17c(%RIP),%XMM13                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDSS %XMM7,%XMM4,%XMM6                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM3,%XMM15             | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVADDPS %XMM15,%XMM3,%XMM5                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM5,%XMM5,%XMM0                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDPS %XMM0,%XMM5,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM3,%XMM3,%XMM4            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDSS %XMM4,%XMM3,%XMM5                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM2,%XMM0              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVADDPS %XMM0,%XMM2,%XMM2                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM2,%XMM2,%XMM3                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDPS %XMM3,%XMM2,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM4,%XMM4,%XMM7            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDSS %XMM7,%XMM4,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nLEA (%R8,%R8,2),%RCX                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nSAL $0x3,%RCX                              | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nCMP %R13,%R8                               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJAE 402fd4 <main+0xc34>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nNOPL (%RAX,%RAX,1)                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVFMADD213SS 0xc(%R11,%RSI,1),%XMM10,%XMM4  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nINC %R10                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVSS %XMM4,0xc(%R11,%RSI,1)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RCX                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nADD $0x18,%RDI                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVFMADD213SS 0x10(%RCX,%R11,1),%XMM10,%XMM5 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM5,0x10(%RCX,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nVFMADD213SS 0x14(%RSI,%R11,1),%XMM10,%XMM6 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM6,0x14(%RSI,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x18,%R11                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RAX,%R10                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402d7a <main+0x9da>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
      },
      header = {
        "6% of peak computational performance is used (2.00 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 16.50 to 13.00 cycles (1.27x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "46% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 7% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 66% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 71% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is poorly vectorized.\nOnly 32% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 16.50 to 3.75 cycles (4.40x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\n - Constant non-unit stride: 4 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 32 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n6 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 33 FP arithmetical operations:\n - 30: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 88 bytes (22 single precision FP elements).\nThe binary loop is storing 20 bytes (5 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.31 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 62\nnb uops            : 61\nloop length        : 304\nused x86 registers : 12\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 7\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 16.00 cycles\nfront end            : 16.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5    | P6   | P7\n---------------------------------------------------------------\nuops   | 7.75 | 7.75 | 8.00 | 8.00 | 5.00 | 12.00 | 7.50 | 5.00\ncycles | 7.75 | 7.75 | 8.00 | 8.00 | 5.00 | 12.00 | 7.50 | 5.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 16.00\nDispatch  : 12.00\nData deps.: 1.00\nOverall L1: 16.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 46%\nload    : 7%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 76%\nINT+FP\nall     : 46%\nload    : 7%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 71%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 62%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 62%\nFP\nall     : 29%\nload    : 15%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 39%\nINT+FP\nall     : 32%\nload    : 15%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 44%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 16.00 cycles. At this rate:\n - 8% of peak load performance is reached (5.50 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 3% of peak store performance is reached (1.25 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 16.00 to 12.00 cycles (1.33x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402d7a\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nCMP $0x8,%R13                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPS %XMM4,%XMM4,%XMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM4,%XMM5                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM5,%XMM6                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nLEA (%RSI,%RDX,8),%RCX                     | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSS (%RCX,%RDI,1),%XMM11                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x4(%RCX,%RDI,1),%XMM12             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x8(%RCX,%RDI,1),%XMM1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nJB 40301d <main+0xc7d>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nVBROADCASTSS %XMM11,%YMM7                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nMOV %RBX,%R8                               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVUPS 0xd2a8(%RIP),%XMM4                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS %XMM12,0x48(%RSP)                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVSS %XMM11,0x50(%RSP)                   | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVXORPS %YMM2,%YMM2,%YMM2                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %ECX,%ECX                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQA %YMM2,%YMM3                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQA %YMM3,%YMM8                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVBROADCASTSS %XMM12,%YMM6                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVBROADCASTSS %XMM1,%YMM5                   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVBROADCASTSS 0xd2c3(%RIP),%YMM0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVEXTRACTF128 $0x1,%YMM8,%XMM6              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVMOVSS 0x48(%RSP),%XMM12                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x50(%RSP),%XMM11                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x40(%RSP),%XMM10                   | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDPS %XMM6,%XMM8,%XMM5                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM5,%XMM5,%XMM0                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVSS 0xd199(%RIP),%XMM14                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDPS %XMM0,%XMM5,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM4,%XMM4,%XMM7            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVSS 0xd17c(%RIP),%XMM13                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVADDSS %XMM7,%XMM4,%XMM6                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM3,%XMM15             | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVADDPS %XMM15,%XMM3,%XMM5                  | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM5,%XMM5,%XMM0                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDPS %XMM0,%XMM5,%XMM3                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM3,%XMM3,%XMM4            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDSS %XMM4,%XMM3,%XMM5                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVEXTRACTF128 $0x1,%YMM2,%XMM0              | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVADDPS %XMM0,%XMM2,%XMM2                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVHLPS %XMM2,%XMM2,%XMM3                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDPS %XMM3,%XMM2,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVSHUFPS $-0xb,%XMM4,%XMM4,%XMM7            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVADDSS %XMM7,%XMM4,%XMM4                   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nLEA (%R8,%R8,2),%RCX                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nSAL $0x3,%RCX                              | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nCMP %R13,%R8                               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJAE 402fd4 <main+0xc34>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nVFMADD213SS 0xc(%R11,%RSI,1),%XMM10,%XMM4  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nINC %R10                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVSS %XMM4,0xc(%R11,%RSI,1)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RCX                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nADD $0x18,%RDI                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVFMADD213SS 0x10(%RCX,%R11,1),%XMM10,%XMM5 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM5,0x10(%RCX,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nVFMADD213SS 0x14(%RSI,%R11,1),%XMM10,%XMM6 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM6,0x14(%RSI,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x18,%R11                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RAX,%R10                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402d7a <main+0x9da>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
      },
      header = {
        "6% of peak computational performance is used (2.06 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 16.00 to 13.00 cycles (1.23x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "46% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 7% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 66% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 71% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is poorly vectorized.\nOnly 32% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 16.00 to 3.75 cycles (4.27x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 2 occurrence(s)\n - Constant non-unit stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 48 bytes (12 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.10 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 31\nnb uops            : 31\nloop length        : 147\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.50 cycles\nfront end            : 8.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 4.00 | 4.50 | 4.50 | 3.00 | 4.00 | 4.00 | 3.00\ncycles | 4.00 | 4.00 | 4.50 | 4.50 | 3.00 | 4.00 | 4.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.50\nDispatch  : 4.50\nData deps.: 1.00\nOverall L1: 8.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 25%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 21%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 60%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 25%\nFP\nall     : 21%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 50%\nINT+FP\nall     : 22%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 40%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 8.50 cycles. At this rate:\n - 8% of peak load performance is reached (5.65 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.41 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.50 to 4.50 cycles (1.89x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402d7a\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nCMP $0x8,%R13                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPS %XMM4,%XMM4,%XMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM4,%XMM5                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM5,%XMM6                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nLEA (%RSI,%RDX,8),%RCX                     | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSS (%RCX,%RDI,1),%XMM11                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x4(%RCX,%RDI,1),%XMM12             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x8(%RCX,%RDI,1),%XMM1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nJB 40301d <main+0xc7d>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA (%R8,%R8,2),%RCX                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nSAL $0x3,%RCX                              | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nCMP %R13,%R8                               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJAE 402fd4 <main+0xc34>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nNOPL (%RAX,%RAX,1)                         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                                | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVFMADD213SS 0xc(%R11,%RSI,1),%XMM10,%XMM4  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nINC %R10                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVSS %XMM4,0xc(%R11,%RSI,1)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RCX                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nADD $0x18,%RDI                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVFMADD213SS 0x10(%RCX,%R11,1),%XMM10,%XMM5 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM5,0x10(%RCX,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nVFMADD213SS 0x14(%RSI,%R11,1),%XMM10,%XMM6 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM6,0x14(%RSI,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x18,%R11                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RAX,%R10                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402d7a <main+0x9da>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nXOR %R8D,%R8D                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nJMP 402f57 <main+0xbb7>                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.71 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.50 to 4.75 cycles (1.79x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 22% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 8.50 to 1.13 cycles (7.52x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
    {
      hint = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          details = " - Constant unknown stride: 1 occurrence(s)\n - Constant non-unit stride: 3 occurrence(s)\nNon-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 6 FP arithmetical operations:\n - 3: addition or subtraction (all inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 48 bytes (12 single precision FP elements).\nThe binary loop is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.10 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 29\nnb uops            : 29\nloop length        : 135\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 7\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 4.00 | 4.00 | 4.50 | 4.50 | 3.00 | 4.00 | 4.00 | 3.00\ncycles | 4.00 | 4.00 | 4.50 | 4.50 | 3.00 | 4.00 | 4.00 | 3.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 4.50\nData deps.: 1.00\nOverall L1: 8.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 25%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 100%\nINT+FP\nall     : 21%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 60%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 25%\nFP\nall     : 21%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 50%\nINT+FP\nall     : 22%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 40%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 8.00 cycles. At this rate:\n - 9% of peak load performance is reached (6.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.50 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 4.50 cycles (1.78x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402d7a\n\nInstruction                                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nCMP $0x8,%R13                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVXORPS %XMM4,%XMM4,%XMM4                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM4,%XMM5                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVAPS %XMM5,%XMM6                        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nLEA (%RSI,%RDX,8),%RCX                     | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSS (%RCX,%RDI,1),%XMM11                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x4(%RCX,%RDI,1),%XMM12             | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0x8(%RCX,%RDI,1),%XMM1              | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nJB 40301d <main+0xc7d>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA (%R8,%R8,2),%RCX                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nSAL $0x3,%RCX                              | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nCMP %R13,%R8                               | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJAE 402fd4 <main+0xc34>                    | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nVFMADD213SS 0xc(%R11,%RSI,1),%XMM10,%XMM4  | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nINC %R10                                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVSS %XMM4,0xc(%R11,%RSI,1)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RCX                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nADD $0x18,%RDI                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVFMADD213SS 0x10(%RCX,%R11,1),%XMM10,%XMM5 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM5,0x10(%RCX,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV (%R14),%RSI                            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 3-4     | 0.50\nVFMADD213SS 0x14(%RSI,%R11,1),%XMM10,%XMM6 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM6,0x14(%RSI,%R11,1)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x18,%R11                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RAX,%R10                              | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJB 402d7a <main+0x9da>                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nXOR %R8D,%R8D                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nJMP 402f57 <main+0xbb7>                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.75 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.75 cycles (1.68x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 22% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 8.00 to 1.07 cycles (7.48x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "4 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 19.5 FP arithmetical operations:\n - 16.50: addition or subtraction (3 inside FMA instructions)\n - 3: multiply (all inside FMA instructions)\nThe binary loop is loading 68 bytes (17 single precision FP elements).\nThe binary loop is storing 16 bytes (4 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.23 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 46.50\nnb uops            : 46\nloop length        : 225.50\nused x86 registers : 11\nused mmx registers : 0\nused xmm registers : 11\nused ymm registers : 3.50\nused zmm registers : 0\nnb stack references: 1.50\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nmicro-operation queue: 12.25 cycles\nfront end            : 12.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.88 | 5.88 | 6.25 | 6.25 | 4.00 | 8.00 | 5.75 | 4.00\ncycles | 5.88 | 5.88 | 6.25 | 6.25 | 4.00 | 8.00 | 5.75 | 4.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.25\nDispatch  : 8.25\nData deps.: 1.00\nOverall L1: 12.25\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 25%\nFP\nall     : 35%\nload    : 3%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 88%\nINT+FP\nall     : 34%\nload    : 3%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 66%\nfma     : 0%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 65%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 43%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 43%\nFP\nall     : 25%\nload    : 13%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 44%\nINT+FP\nall     : 27%\nload    : 13%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 37%\nfma     : 12%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 42%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 12.25 cycles. At this rate:\n - 8% of peak load performance is reached (5.62 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.34 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
      },
      header = {
        "4% of peak computational performance is used (1.38 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "34% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 3% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX stores are used in vector version.\n - 66% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 0% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 65% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is poorly vectorized.\nOnly 27% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 12.25 to 2.43 cycles (5.05x speedup).",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 3 FMA (fused multiply-add) operations.",
        },
      },
    },
  common = {
    header = {
      "",
      "Warnings:\nNon-innermost loop: analyzing only self part (ignoring child loops).",
      "This loop has 4 execution paths.\n",
      "The presence of multiple execution paths is typically the main/first bottleneck.\nTry to simplify control inside loop: ideally, try to remove all conditional expressions, for example by (if applicable):\n - hoisting them (moving them outside the loop)\n - turning them into conditional moves, MIN or MAX\n\n",
    },
    nb_paths = 4,
  },
}
