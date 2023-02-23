_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VMASKMOVPS: 8 occurrences\n",
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
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 5 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 6 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
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
          txt = "The binary loop is composed of 168 FP arithmetical operations:\n - 80: addition or subtraction (56 inside FMA instructions)\n - 72: multiply (56 inside FMA instructions)\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 128 bytes (32 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.31 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 47\nnb uops            : 59\nloop length        : 254\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 14.75 cycles\nfront end            : 14.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5    | P6   | P7\n-----------------------------------------------------------------\nuops   | 15.00 | 15.00 | 4.00 | 4.00 | 0.00 | 17.00 | 3.00 | 0.00\ncycles | 15.00 | 15.00 | 4.00 | 4.00 | 0.00 | 17.00 | 3.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 14.75\nDispatch  : 17.00\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 18.00-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 80%\nload    : 50%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 76%\nINT+FP\nall     : 80%\nload    : 50%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 77%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 8% of peak load performance is reached (5.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402de5\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------\nLEA (%RCX,%RCX,2),%R9                 | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nADD $0x8,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RBX,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nLEA (%RSI,%R9,8),%R9                  | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nVMASKMOVPS (%R9),%XMM4,%XMM10         | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x60(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM14 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMASKMOVPS 0x30(%R9),%XMM4,%XMM10     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x18(%R9),%XMM4,%XMM15     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x78(%R9),%XMM4,%XMM12     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x90(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM12,%YMM15,%YMM13 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM12 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMASKMOVPS 0x48(%R9),%XMM4,%XMM10     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0xa8(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM11 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSHUFPS $0x14,%YMM13,%YMM14,%YMM10    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x41,%YMM12,%YMM11,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $-0x7e,%YMM13,%YMM14,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x28,%YMM12,%YMM11,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x6c,%YMM15,%YMM10,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x39,%YMM15,%YMM10,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSUBPS %YMM7,%YMM12,%YMM10            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSUBPS %YMM6,%YMM15,%YMM15            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSHUFPS $0x6c,%YMM14,%YMM13,%YMM11    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVDQA %YMM9,%YMM13                  | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVFMADD231PS %YMM10,%YMM10,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSUBPS %YMM5,%YMM11,%YMM11            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM15,%YMM15,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM11,%YMM11,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPS2PD %XMM13,%YMM14               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVEXTRACTF128 $0x1,%YMM13,%XMM12       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVCVTPS2PD %XMM12,%YMM13               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM14,%YMM12                 | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM14,%YMM12,%YMM14           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM14,%XMM12               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM13,%YMM14                 | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM13,%YMM14,%YMM13           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM13,%XMM13               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM13,%YMM12,%YMM12 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVRCPPS %YMM12,%YMM14                  | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 1\nVFNMADD213PS %YMM0,%YMM14,%YMM12      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVMULPS %YMM14,%YMM12,%YMM12           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM10,%YMM12,%YMM2       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM15,%YMM12,%YMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM11,%YMM12,%YMM8       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nJB 402de5 <main+0xa45>                | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "21% of peak computational performance is used (7.00 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 80% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 17.00 cycles (1.41x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 24.00 to 17.00 cycles (1.41x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 56 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VMASKMOVPS: 8 occurrences\n",
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
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 5 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 6 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
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
          txt = "The binary loop is composed of 168 FP arithmetical operations:\n - 80: addition or subtraction (56 inside FMA instructions)\n - 72: multiply (56 inside FMA instructions)\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 128 bytes (32 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.31 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 47\nnb uops            : 59\nloop length        : 254\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.00\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 14.75 cycles\nfront end            : 14.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5    | P6   | P7\n-----------------------------------------------------------------\nuops   | 15.00 | 15.00 | 4.00 | 4.00 | 0.00 | 17.00 | 3.00 | 0.00\ncycles | 15.00 | 15.00 | 4.00 | 4.00 | 0.00 | 17.00 | 3.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 14.75\nDispatch  : 17.00\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 18.00-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\nINT+FP\nall     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 80%\nload    : 50%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 76%\nINT+FP\nall     : 80%\nload    : 50%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : 100%\ndiv/sqrt: 100%\nother   : 77%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 8% of peak load performance is reached (5.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402de5\n\nInstruction                           | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------\nLEA (%RCX,%RCX,2),%R9                 | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nADD $0x8,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nCMP %RBX,%RCX                         | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 1       | 0.25\nLEA (%RSI,%R9,8),%R9                  | 1     | 0    | 0.50 | 0    | 0    | 0  | 0.50 | 0    | 0  | 1       | 0.50\nVMASKMOVPS (%R9),%XMM4,%XMM10         | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x60(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM14 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMASKMOVPS 0x30(%R9),%XMM4,%XMM10     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x18(%R9),%XMM4,%XMM15     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x78(%R9),%XMM4,%XMM12     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0x90(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM12,%YMM15,%YMM13 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM12 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVMASKMOVPS 0x48(%R9),%XMM4,%XMM10     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVMASKMOVPS 0xa8(%R9),%XMM4,%XMM11     | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 3       | 0.50\nVINSERTF128 $0x1,%XMM11,%YMM10,%YMM11 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVSHUFPS $0x14,%YMM13,%YMM14,%YMM10    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x41,%YMM12,%YMM11,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $-0x7e,%YMM13,%YMM14,%YMM13   | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x28,%YMM12,%YMM11,%YMM14    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x6c,%YMM15,%YMM10,%YMM12    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSHUFPS $0x39,%YMM15,%YMM10,%YMM15    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVSUBPS %YMM7,%YMM12,%YMM10            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSUBPS %YMM6,%YMM15,%YMM15            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSHUFPS $0x6c,%YMM14,%YMM13,%YMM11    | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 1       | 1\nVMOVDQA %YMM9,%YMM13                  | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0       | 0.25\nVFMADD231PS %YMM10,%YMM10,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVSUBPS %YMM5,%YMM11,%YMM11            | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM15,%YMM15,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM11,%YMM11,%YMM13      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPS2PD %XMM13,%YMM14               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVEXTRACTF128 $0x1,%YMM13,%XMM12       | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVCVTPS2PD %XMM12,%YMM13               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM14,%YMM12                 | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM14,%YMM12,%YMM14           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM14,%XMM12               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVSQRTPD %YMM13,%YMM14                 | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 13-19   | 9-12\nVMULPD %YMM13,%YMM14,%YMM13           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVCVTPD2PS %YMM13,%XMM13               | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM13,%YMM12,%YMM12 | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 3       | 1\nVRCPPS %YMM12,%YMM14                  | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 1\nVFNMADD213PS %YMM0,%YMM14,%YMM12      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVMULPS %YMM14,%YMM12,%YMM12           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM10,%YMM12,%YMM2       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM15,%YMM12,%YMM3       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nVFMADD231PS %YMM11,%YMM12,%YMM8       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 4       | 0.50\nJB 402de5 <main+0xa45>                | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "21% of peak computational performance is used (7.00 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 80% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 17.00 cycles (1.41x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 24.00 to 17.00 cycles (1.41x speedup).",
        },
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Detected 56 FMA (fused multiply-add) operations.\nPresence of both ADD/SUB and MUL operations.",
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
