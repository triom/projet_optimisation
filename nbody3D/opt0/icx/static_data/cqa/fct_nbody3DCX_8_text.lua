_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VZEROUPPER: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 10 FP arithmetical operations:\n - 5: addition or subtraction (all inside FMA instructions)\n - 5: multiply (all inside FMA instructions)\nThe binary function is loading 32 bytes (8 single precision FP elements).\nThe binary function is storing 44 bytes (11 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.13 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 42\nnb uops            : 45\nloop length        : 188\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 11.50 cycles\nfront end            : 11.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.00 | 5.00 | 4.50 | 4.17 | 5.00 | 5.00 | 5.00 | 4.33\ncycles | 5.00 | 5.00 | 4.50 | 4.17 | 5.00 | 5.00 | 5.00 | 4.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.50\nDispatch  : 5.00\nOverall L1: 11.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 16%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 16%\nFP\nall     : 33%\nload    : 0%\nstore   : 75%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 50%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 27%\nload    : 0%\nstore   : 75%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 50%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 14%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 29%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 29%\nFP\nall     : 25%\nload    : 16%\nstore   : 34%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 31%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 26%\nload    : 16%\nstore   : 34%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 31%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 26%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 11.50 cycles. At this rate:\n - 4% of peak load performance is reached (2.78 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (3.83 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 11.50 to 5.00 cycles (2.30x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\nInstruction                              | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBX                                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nTEST %RSI,%RSI                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 401795 <move_particles+0x3c5>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x1(%RSI),%R9                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVBROADCASTSS %XMM0,%XMM8                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nMOV %RSI,%R10                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x8,%R10                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nLEA -0x1(%R10),%RDX                      | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nLEA 0x8(%RDI),%R8                        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVSS 0xcc10(%RIP),%XMM9                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0xcc0c(%RIP),%XMM15               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVUPS %XMM0,-0x40(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVUPS %XMM8,-0x50(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nJMP 40144e <move_particles+0x7e>         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %R9,%R9                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 40179a <move_particles+0x3ca>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV %RSI,%RCX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x2,%RCX                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RDI,%RDX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST $0x1,%SIL                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 401795 <move_particles+0x3c5>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA (%RAX,%RAX,2),%RAX                   | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSD (%RDI,%RAX,8),%XMM2               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSD 0xc(%RDI,%RAX,8),%XMM1            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVFMADD213PS %XMM2,%XMM1,%XMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVLPS %XMM8,(%RDI,%RAX,8)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVSS 0x14(%RDI,%RAX,8),%XMM1           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVFMADD213SS 0x8(%RDI,%RAX,8),%XMM1,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM0,0x8(%RDI,%RAX,8)            | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPOP %RBX                                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nVZEROUPPER                               | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nRET                                      | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST $0x1,%SIL                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 401769 <move_particles+0x399>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nJMP 401795 <move_particles+0x3c5>        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.87 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 11.50 to 5.25 cycles (2.19x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "27% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 75% of SSE/AVX stores are used in vector version.\n - 50% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 14% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is poorly vectorized.\nOnly 26% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your function, you can lower the cost of an iteration from 11.50 to 2.05 cycles (5.60x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 5 FMA (fused multiply-add) operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VZEROUPPER: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 10 FP arithmetical operations:\n - 5: addition or subtraction (all inside FMA instructions)\n - 5: multiply (all inside FMA instructions)\nThe binary function is loading 32 bytes (8 single precision FP elements).\nThe binary function is storing 44 bytes (11 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.13 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 42\nnb uops            : 45\nloop length        : 188\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 2\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 11.50 cycles\nfront end            : 11.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.00 | 5.00 | 4.50 | 4.17 | 5.00 | 5.00 | 5.00 | 4.33\ncycles | 5.00 | 5.00 | 4.50 | 4.17 | 5.00 | 5.00 | 5.00 | 4.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 11.50\nDispatch  : 5.00\nOverall L1: 11.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 16%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 16%\nFP\nall     : 33%\nload    : 0%\nstore   : 75%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 50%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 27%\nload    : 0%\nstore   : 75%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 50%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 14%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 29%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 29%\nFP\nall     : 25%\nload    : 16%\nstore   : 34%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 31%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 26%\nload    : 16%\nstore   : 34%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : 31%\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 26%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 11.50 cycles. At this rate:\n - 4% of peak load performance is reached (2.78 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (3.83 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 11.50 to 5.00 cycles (2.30x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\nInstruction                              | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBX                                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nTEST %RSI,%RSI                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 401795 <move_particles+0x3c5>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x1(%RSI),%R9                       | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVBROADCASTSS %XMM0,%XMM8                 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nMOV %RSI,%R10                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x8,%R10                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nLEA -0x1(%R10),%RDX                      | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nLEA 0x8(%RDI),%R8                        | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVSS 0xcc10(%RIP),%XMM9                | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSS 0xcc0c(%RIP),%XMM15               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVUPS %XMM0,-0x40(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVUPS %XMM8,-0x50(%RSP)                | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nJMP 40144e <move_particles+0x7e>         | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST %R9,%R9                             | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 40179a <move_particles+0x3ca>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nMOV %RSI,%RCX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x2,%RCX                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nMOV %RDI,%RDX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                              | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST $0x1,%SIL                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 401795 <move_particles+0x3c5>         | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA (%RAX,%RAX,2),%RAX                   | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVMOVSD (%RDI,%RAX,8),%XMM2               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVMOVSD 0xc(%RDI,%RAX,8),%XMM1            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVFMADD213PS %XMM2,%XMM1,%XMM8            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVLPS %XMM8,(%RDI,%RAX,8)              | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nVMOVSS 0x14(%RDI,%RAX,8),%XMM1           | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4-5     | 0.50\nVFMADD213SS 0x8(%RDI,%RAX,8),%XMM1,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 4       | 0.50\nVMOVSS %XMM0,0x8(%RDI,%RAX,8)            | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nPOP %RBX                                 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 2       | 0.50\nVZEROUPPER                               | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nRET                                      | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nXOR %EAX,%EAX                            | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nTEST $0x1,%SIL                           | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 401769 <move_particles+0x399>        | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nJMP 401795 <move_particles+0x3c5>        | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)                   | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.87 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 11.50 to 5.25 cycles (2.19x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "27% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 0% of SSE/AVX loads are used in vector version.\n - 75% of SSE/AVX stores are used in vector version.\n - 50% of SSE/AVX fused multiply-add instructions are used in vector version.\n - 14% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is poorly vectorized.\nOnly 26% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your function, you can lower the cost of an iteration from 11.50 to 2.05 cycles (5.60x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          title = "FMA",
          txt = "Detected 5 FMA (fused multiply-add) operations.",
        },
      },
    },
  common = {
    header = {
      "The function is defined in /mnt/d/isty/IATIC5/new/projet_optimisation/nbody3D/nbody.c:52-57,65-93.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
