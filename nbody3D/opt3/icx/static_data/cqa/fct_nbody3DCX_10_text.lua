_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 3 FP arithmetical operations:\n - 3: addition or subtraction\nThe binary function is loading 24 bytes (6 single precision FP elements).\nThe binary function is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.08 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 10\nnb uops            : 10\nloop length        : 43\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.50 cycles\nfront end            : 2.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.50 | 1.50 | 3.33 | 3.33 | 3.00 | 0.00 | 1.00 | 3.33\ncycles | 1.50 | 1.50 | 3.33 | 3.33 | 3.00 | 0.00 | 1.00 | 3.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.50\nDispatch  : 3.33\nOverall L1: 3.33\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 12%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 12%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 3.33 cycles. At this rate:\n - 11% of peak load performance is reached (7.20 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (3.60 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 403170\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nVMOVSS (%RSI),%XMM0          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS (%RDI),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,(%RDI)          | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nVMOVSS 0x4(%RSI),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS 0x4(%RDI),%XMM0,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,0x4(%RDI)       | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nVMOVSS 0x8(%RSI),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS 0x8(%RDI),%XMM0,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,0x8(%RDI)       | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nRET                          | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.90 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 3.33 to 3.00 cycles (1.11x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n8 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 3.33 to 0.42 cycles (8.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Write less array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - reading data from caches/RAM (load units are a bottleneck)\n - writing data to caches/RAM (the store unit is a bottleneck)\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.33 to 3.00 cycles (1.11x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "3 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function is composed of 3 FP arithmetical operations:\n - 3: addition or subtraction\nThe binary function is loading 24 bytes (6 single precision FP elements).\nThe binary function is storing 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.08 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 10\nnb uops            : 10\nloop length        : 43\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.50 cycles\nfront end            : 2.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 1.50 | 1.50 | 3.33 | 3.33 | 3.00 | 0.00 | 1.00 | 3.33\ncycles | 1.50 | 1.50 | 3.33 | 3.33 | 3.00 | 0.00 | 1.00 | 3.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.50\nDispatch  : 3.33\nOverall L1: 3.33\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 12%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 12%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 3.33 cycles. At this rate:\n - 11% of peak load performance is reached (7.20 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 11% of peak store performance is reached (3.60 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 403170\n\nInstruction                  | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6 | P7   | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------\nVMOVSS (%RSI),%XMM0          | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS (%RDI),%XMM0,%XMM0    | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,(%RDI)          | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nVMOVSS 0x4(%RSI),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS 0x4(%RDI),%XMM0,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,0x4(%RDI)       | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nVMOVSS 0x8(%RSI),%XMM0       | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4-5     | 0.50\nVADDSS 0x8(%RDI),%XMM0,%XMM0 | 1     | 0.50 | 0.50 | 0.50 | 0.50 | 0  | 0  | 0  | 0    | 4       | 0.50\nVMOVSS %XMM0,0x8(%RDI)       | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0  | 0  | 0.33 | 3       | 1\nRET                          | 1     | 0    | 0    | 0.33 | 0.33 | 0  | 0  | 1  | 0.33 | 0       | 1\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.90 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 3.33 to 3.00 cycles (1.11x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n8 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 3.33 to 0.42 cycles (8.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Write less array elements\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - reading data from caches/RAM (load units are a bottleneck)\n - writing data to caches/RAM (the store unit is a bottleneck)\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.33 to 3.00 cycles (1.11x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
