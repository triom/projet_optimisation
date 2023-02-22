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
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 68 bytes.\nThe binary function is storing 64 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 29\nnb uops            : 32\nloop length        : 160\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 4\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 3.25 | 3.25 | 2.50 | 2.17 | 3.00 | 3.25 | 3.25 | 2.33\ncycles | 3.25 | 3.25 | 2.50 | 2.17 | 3.00 | 3.25 | 3.25 | 2.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 3.25\nOverall L1: 8.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 30%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 11%\nFP\nall     : 50%\nload    : 0%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 35%\nload    : 66%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 9%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 43%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 26%\nFP\nall     : 31%\nload    : 12%\nstore   : 50%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 40%\nload    : 70%\nstore   : 66%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 23%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 8.00 cycles. At this rate:\n - 13% of peak load performance is reached (8.50 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 25% of peak store performance is reached (8.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 3.25 cycles (2.46x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\nInstruction                      | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------\nSUB $0x3c8,%RSP                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nTEST %RSI,%RSI                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 40226f <move_particles+0xe9f> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x1(%RSI),%R9               | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVBROADCASTSS %XMM0,%XMM1         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVUPS %XMM1,(%RSP)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %R9,%R8                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSHR $0x2,%R8                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nINC %R8                          | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVQ %R8,%XMM1                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVPBROADCASTQ %XMM1,%YMM1         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVMOVDQU %YMM1,0x160(%RSP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 4       | 1\nMOV %R8,%RDX                     | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x8,%RDX                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %R10D,%R10D                  | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQU 0xcc43(%RIP),%YMM5       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVMOVDQU 0xcc5b(%RIP),%YMM9       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVBROADCASTSS 0xcbda(%RIP),%YMM13 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVMOVUPS %XMM0,-0x70(%RSP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nJMP 40147f <move_particles+0xaf> | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %EAX,%EAX                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nADD $0x3c8,%RSP                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVZEROUPPER                       | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nRET                              | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nNOPW (%RAX,%RAX,1)               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "35% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 66% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 9% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is poorly vectorized.\nOnly 40% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your function, you can lower the cost of an iteration from 8.00 to 6.07 cycles (1.32x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
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
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 68 bytes.\nThe binary function is storing 64 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 29\nnb uops            : 32\nloop length        : 160\nused x86 registers : 7\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 4\nused zmm registers : 0\nnb stack references: 3\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 8.00 cycles\nfront end            : 8.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 3.25 | 3.25 | 2.50 | 2.17 | 3.00 | 3.25 | 3.25 | 2.33\ncycles | 3.25 | 3.25 | 2.50 | 2.17 | 3.00 | 3.25 | 3.25 | 2.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.00\nDispatch  : 3.25\nOverall L1: 8.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 30%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 0%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 11%\nFP\nall     : 50%\nload    : 0%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 35%\nload    : 66%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 9%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 43%\nload   : 100%\nstore  : 100%\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: 25%\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 26%\nFP\nall     : 31%\nload    : 12%\nstore   : 50%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 40%\nload    : 70%\nstore   : 66%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 23%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 8.00 cycles. At this rate:\n - 13% of peak load performance is reached (8.50 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 25% of peak store performance is reached (8.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 3.25 cycles (2.46x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\nInstruction                      | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------\nSUB $0x3c8,%RSP                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nTEST %RSI,%RSI                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJE 40226f <move_particles+0xe9f> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\nLEA -0x1(%RSI),%R9               | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0    | 1       | 0.50\nVBROADCASTSS %XMM0,%XMM1         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVMOVUPS %XMM1,(%RSP)             | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %R9,%R8                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nSHR $0x2,%R8                     | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 1       | 0.50\nINC %R8                          | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVMOVQ %R8,%XMM1                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 1       | 1\nVPBROADCASTQ %XMM1,%YMM1         | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0    | 3       | 1\nVMOVDQU %YMM1,0x160(%RSP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 4       | 1\nMOV %R8,%RDX                     | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nAND $-0x8,%RDX                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nXOR %R10D,%R10D                  | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nVMOVDQU 0xcc43(%RIP),%YMM5       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVMOVDQU 0xcc5b(%RIP),%YMM9       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVBROADCASTSS 0xcbda(%RIP),%YMM13 | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 5       | 0.50\nVMOVUPS %XMM0,-0x70(%RSP)        | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nJMP 40147f <move_particles+0xaf> | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 1    | 0    | 0       | 1-2\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)           | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nXOR %EAX,%EAX                    | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nNOPL (%RAX)                      | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\nADD $0x3c8,%RSP                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nVZEROUPPER                       | 4     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 1\nRET                              | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0    | 1    | 0.33 | 0       | 1\nNOPW (%RAX,%RAX,1)               | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0    | 0       | 0.25\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "35% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n - 66% of SSE/AVX loads are used in vector version.\n - 0% of SSE/AVX addition or subtraction instructions are used in vector version.\n - 9% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.\nSince your execution units are vector units, only a fully vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is poorly vectorized.\nOnly 40% of vector register length is used (average across all SSE/AVX instructions).\nBy fully vectorizing your function, you can lower the cost of an iteration from 8.00 to 6.07 cycles (1.32x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in /mnt/d/isty/IATIC5/new/projet_optimisation/nbody3D/nbody.c:52-57,65-134.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
