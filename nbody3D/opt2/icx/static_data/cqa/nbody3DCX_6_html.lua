_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VCVTPD2PS: 2 occurrences</li><li>VCVTPS2PD: 2 occurrences</li><li>VGATHERQPS: 6 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = "<ul><li>Irregular (variable stride) or indirect: 4 occurrence(s)</li></ul>Non-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 32 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "<ul><li>VEXTRACTF128: 1 occurrences</li><li>VINSERTF128: 4 occurrences</li></ul>",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = "<ul><li>VGATHERQPS: 6 occurrences</li></ul>",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n<ul><li>88: addition or subtraction (64 inside FMA instructions)</li><li>72: multiply (64 inside FMA instructions)</li><li>8: fast reciprocal</li><li>8: square root</li></ul>The binary loop is loading 200 bytes (50 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.88 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>60</td></tr><tr><td>nb uops</td><td>81</td></tr><tr><td>loop length</td><td>322</td></tr><tr><td>used x86 registers</td><td>4</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>9</td></tr><tr><td>used ymm registers</td><td>15</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>1</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.50</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>20.25 cycles</td></tr><tr><td>front end</td><td>20.25 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>21.33</td><td>21.33</td><td>14.50</td><td>14.50</td><td>0.00</td><td>21.33</td><td>2.00</td><td>0.00</td></tr><tr><td>cycles</td><td>21.33</td><td>21.33</td><td>14.50</td><td>14.50</td><td>0.00</td><td>21.33</td><td>2.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>18.00-24.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>4.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>20.25</td></tr><tr><td>Dispatch</td><td>21.33</td></tr><tr><td>DIV/SQRT</td><td>18.00-24.00</td></tr><tr><td>Data deps.</td><td>4.00</td></tr><tr><td>Overall L1</td><td>21.33-24.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>88%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>80%</td></tr></table>FP\n<table><tr><td>all</td><td>95%</td></tr><tr><td>load</td><td>77%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>91%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>81%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>88%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>73%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>55%</td></tr></table>FP\n<table><tr><td>all</td><td>71%</td></tr><tr><td>load</td><td>47%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>53%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>72%</td></tr><tr><td>load</td><td>56%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>53%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n<ul><li>13% of peak load performance is reached (8.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402ef0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVQ %RDI,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VPBROADCASTQ %XMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VPSRLQ $0x20,%YMM1,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPMULUDQ %YMM13,%YMM11,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VPMULUDQ %YMM1,%YMM13,%YMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VPSLLQ $0x20,%YMM11,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ %YMM1,%YMM11,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VPADDQ 0xc146(%RIP),%YMM1,%YMM11</td><td>1</td><td>0.33</td><td>0.33</td><td>0.50</td><td>0.50</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VXORPS %XMM0,%XMM0,%XMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM4,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ 0xc156(%RIP),%YMM1,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0.50</td><td>0.50</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VXORPS %XMM14,%XMM14,%XMM14</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VGATHERQPS %XMM4,(%RBX,%YMM1,1),%XMM0</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPCMPEQD %XMM4,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM4,(%RBX,%YMM11,1),%XMM14</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPADDQ %YMM11,%YMM9,%YMM4</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VXORPS %XMM5,%XMM5,%XMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM6,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ %YMM1,%YMM9,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VXORPS %XMM11,%XMM11,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VGATHERQPS %XMM6,0x4(,%YMM1,1),%XMM5</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPCMPEQD %XMM6,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM6,0x4(,%YMM4,1),%XMM11</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VXORPS %XMM6,%XMM6,%XMM6</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM12,%XMM12,%XMM12</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM12,0x8(,%YMM1,1),%XMM6</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VXORPS %XMM1,%XMM1,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM7,%XMM7,%XMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM7,0x8(,%YMM4,1),%XMM1</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VINSERTF128 $0x1,%XMM0,%YMM14,%YMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS %YMM15,%YMM0,%YMM0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VINSERTF128 $0x1,%XMM5,%YMM11,%YMM4</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS 0xb0(%RSP),%YMM4,%YMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VINSERTF128 $0x1,%XMM6,%YMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS %YMM10,%YMM1,%YMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMOVAPS %YMM0,%YMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VBROADCASTSS 0xc048(%RIP),%YMM6</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VFMADD213PS %YMM6,%YMM0,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM4,%YMM4,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM1,%YMM1,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VEXTRACTF128 $0x1,%YMM5,%XMM6</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VCVTPS2PD %XMM5,%YMM5</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VCVTPS2PD %XMM6,%YMM6</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VSQRTPD %YMM5,%YMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>9-12</td></tr><tr><td>VMULPD %YMM5,%YMM7,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSQRTPD %YMM6,%YMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>9-12</td></tr><tr><td>VCVTPD2PS %YMM5,%XMM5</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VMULPD %YMM6,%YMM7,%YMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTPD2PS %YMM6,%XMM6</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VINSERTF128 $0x1,%XMM6,%YMM5,%YMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VRCPPS %YMM5,%YMM6</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>1</td></tr><tr><td>VBROADCASTSS 0xc004(%RIP),%YMM7</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VFMSUB213PS %YMM7,%YMM6,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFNMADD132PS %YMM6,%YMM6,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM0,%YMM5,%YMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM4,%YMM5,%YMM3</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM5,%YMM1,%YMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>ADD $0x8,%RDI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %R13,%RDI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JBE 402ef0 <move_particles.extracted+0x220></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "22% of peak computational performance is used (7.33 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "92% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>81% of SSE/AVX loads are used in vector version.</li><li>88% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.</li></ul>",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\nOnly 72% of vector register length is used (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul>",
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
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VCVTPD2PS: 2 occurrences</li><li>VCVTPS2PD: 2 occurrences</li><li>VGATHERQPS: 6 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Try to remove indirect accesses. If applicable, precompute elements out of the innermost loop.",
          details = "<ul><li>Irregular (variable stride) or indirect: 4 occurrence(s)</li></ul>Non-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Use vector aligned instructions:\n<ol><li>align your arrays on 32 bytes boundaries</li><li>inform your compiler that your arrays are vector aligned: read your compiler manual.</li></ol></li></ul>",
          details = "<ul><li>VEXTRACTF128: 1 occurrences</li><li>VINSERTF128: 4 occurrences</li></ul>",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Try to simplify your code and/or replace indirect accesses with unit-stride ones.",
          details = "<ul><li>VGATHERQPS: 6 occurrences</li></ul>",
          title = "Gather/scatter instructions",
          txt = "Detected gather/scatter instructions (typically caused by indirect accesses).",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "12 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n<ul><li>88: addition or subtraction (64 inside FMA instructions)</li><li>72: multiply (64 inside FMA instructions)</li><li>8: fast reciprocal</li><li>8: square root</li></ul>The binary loop is loading 200 bytes (50 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.88 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>60</td></tr><tr><td>nb uops</td><td>81</td></tr><tr><td>loop length</td><td>322</td></tr><tr><td>used x86 registers</td><td>4</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>9</td></tr><tr><td>used ymm registers</td><td>15</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>1</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.50</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>20.25 cycles</td></tr><tr><td>front end</td><td>20.25 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>21.33</td><td>21.33</td><td>14.50</td><td>14.50</td><td>0.00</td><td>21.33</td><td>2.00</td><td>0.00</td></tr><tr><td>cycles</td><td>21.33</td><td>21.33</td><td>14.50</td><td>14.50</td><td>0.00</td><td>21.33</td><td>2.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>18.00-24.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>4.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>20.25</td></tr><tr><td>Dispatch</td><td>21.33</td></tr><tr><td>DIV/SQRT</td><td>18.00-24.00</td></tr><tr><td>Data deps.</td><td>4.00</td></tr><tr><td>Overall L1</td><td>21.33-24.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>88%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>80%</td></tr></table>FP\n<table><tr><td>all</td><td>95%</td></tr><tr><td>load</td><td>77%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>91%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>92%</td></tr><tr><td>load</td><td>81%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>88%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>73%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>55%</td></tr></table>FP\n<table><tr><td>all</td><td>71%</td></tr><tr><td>load</td><td>47%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>53%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>72%</td></tr><tr><td>load</td><td>56%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>100%</td></tr><tr><td>add-sub</td><td>100%</td></tr><tr><td>fma</td><td>100%</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>53%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n<ul><li>13% of peak load performance is reached (8.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 402ef0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVQ %RDI,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VPBROADCASTQ %XMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VPSRLQ $0x20,%YMM1,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPMULUDQ %YMM13,%YMM11,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VPMULUDQ %YMM1,%YMM13,%YMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VPSLLQ $0x20,%YMM11,%YMM11</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ %YMM1,%YMM11,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VPADDQ 0xc146(%RIP),%YMM1,%YMM11</td><td>1</td><td>0.33</td><td>0.33</td><td>0.50</td><td>0.50</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VXORPS %XMM0,%XMM0,%XMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM4,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ 0xc156(%RIP),%YMM1,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0.50</td><td>0.50</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VXORPS %XMM14,%XMM14,%XMM14</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VGATHERQPS %XMM4,(%RBX,%YMM1,1),%XMM0</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPCMPEQD %XMM4,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM4,(%RBX,%YMM11,1),%XMM14</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPADDQ %YMM11,%YMM9,%YMM4</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VXORPS %XMM5,%XMM5,%XMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM6,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VPADDQ %YMM1,%YMM9,%YMM1</td><td>1</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>VXORPS %XMM11,%XMM11,%XMM11</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VGATHERQPS %XMM6,0x4(,%YMM1,1),%XMM5</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VPCMPEQD %XMM6,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM6,0x4(,%YMM4,1),%XMM11</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VXORPS %XMM6,%XMM6,%XMM6</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM12,%XMM12,%XMM12</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM12,0x8(,%YMM1,1),%XMM6</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VXORPS %XMM1,%XMM1,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VPCMPEQD %XMM7,%XMM7,%XMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VGATHERQPS %XMM7,0x8(,%YMM4,1),%XMM1</td><td>4</td><td>1</td><td>1</td><td>2</td><td>2</td><td>0</td><td>1</td><td>0</td><td>0</td><td>20</td><td>4</td></tr><tr><td>VINSERTF128 $0x1,%XMM0,%YMM14,%YMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS %YMM15,%YMM0,%YMM0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VINSERTF128 $0x1,%XMM5,%YMM11,%YMM4</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS 0xb0(%RSP),%YMM4,%YMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VINSERTF128 $0x1,%XMM6,%YMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VSUBPS %YMM10,%YMM1,%YMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMOVAPS %YMM0,%YMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VBROADCASTSS 0xc048(%RIP),%YMM6</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VFMADD213PS %YMM6,%YMM0,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM4,%YMM4,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM1,%YMM1,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VEXTRACTF128 $0x1,%YMM5,%XMM6</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VCVTPS2PD %XMM5,%YMM5</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VCVTPS2PD %XMM6,%YMM6</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VSQRTPD %YMM5,%YMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>9-12</td></tr><tr><td>VMULPD %YMM5,%YMM7,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSQRTPD %YMM6,%YMM7</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>9-12</td></tr><tr><td>VCVTPD2PS %YMM5,%XMM5</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VMULPD %YMM6,%YMM7,%YMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTPD2PS %YMM6,%XMM6</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>7</td><td>1</td></tr><tr><td>VINSERTF128 $0x1,%XMM6,%YMM5,%YMM5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VRCPPS %YMM5,%YMM6</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>1</td></tr><tr><td>VBROADCASTSS 0xc004(%RIP),%YMM7</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VFMSUB213PS %YMM7,%YMM6,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFNMADD132PS %YMM6,%YMM6,%YMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM0,%YMM5,%YMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM4,%YMM5,%YMM3</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VFMADD231PS %YMM5,%YMM1,%YMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>ADD $0x8,%RDI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %R13,%RDI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JBE 402ef0 <move_particles.extracted+0x220></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "22% of peak computational performance is used (7.33 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "92% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>81% of SSE/AVX loads are used in vector version.</li><li>88% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.</li></ul>",
          title = "Vectorization",
          txt = "Your loop is highly vectorized.\nOnly 72% of vector register length is used (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul>",
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
      "",
    },
    nb_paths = 1,
  },
}
