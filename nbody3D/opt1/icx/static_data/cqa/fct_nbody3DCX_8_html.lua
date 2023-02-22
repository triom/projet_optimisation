_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VZEROUPPER: 1 occurrences</li></ul>",
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
          txt = "<table><tr><td>nb instructions</td><td>29</td></tr><tr><td>nb uops</td><td>32</td></tr><tr><td>loop length</td><td>160</td></tr><tr><td>used x86 registers</td><td>7</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>4</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>3</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>8.00 cycles</td></tr><tr><td>front end</td><td>8.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>3.25</td><td>3.25</td><td>2.50</td><td>2.17</td><td>3.00</td><td>3.25</td><td>3.25</td><td>2.33</td></tr><tr><td>cycles</td><td>3.25</td><td>3.25</td><td>2.50</td><td>2.17</td><td>3.00</td><td>3.25</td><td>3.25</td><td>2.33</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>8.00</td></tr><tr><td>Dispatch</td><td>3.25</td></tr><tr><td>Overall L1</td><td>8.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>30%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>11%</td></tr></table>FP\n<table><tr><td>all</td><td>50%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>0%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>35%</td></tr><tr><td>load</td><td>66%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>9%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>43%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>25%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>26%</td></tr></table>FP\n<table><tr><td>all</td><td>31%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>12%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>40%</td></tr><tr><td>load</td><td>70%</td></tr><tr><td>store</td><td>66%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>25%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>23%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 8.00 cycles. At this rate:\n<ul><li>13% of peak load performance is reached (8.50 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>25% of peak store performance is reached (8.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 3.25 cycles (2.46x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>SUB $0x3c8,%RSP</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>TEST %RSI,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JE 40226f <move_particles+0xe9f></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr><tr><td>LEA -0x1(%RSI),%R9</td><td>1</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VBROADCASTSS %XMM0,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VMOVUPS %XMM1,(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>MOV %R9,%R8</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>SHR $0x2,%R8</td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>INC %R8</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VMOVQ %R8,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VPBROADCASTQ %XMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VMOVDQU %YMM1,0x160(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>4</td><td>1</td></tr><tr><td>MOV %R8,%RDX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>AND $-0x8,%RDX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>XOR %R10D,%R10D</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VMOVDQU 0xcc43(%RIP),%YMM5</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVDQU 0xcc5b(%RIP),%YMM9</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VBROADCASTSS 0xcbda(%RIP),%YMM13</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS %XMM0,-0x70(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>JMP 40147f <move_particles+0xaf></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1-2</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>XOR %EAX,%EAX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPL (%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>ADD $0x3c8,%RSP</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VZEROUPPER</td><td>4</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr><tr><td>RET</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td><td>0</td><td>1</td></tr><tr><td>NOPW (%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr></table>",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try to reorganize arrays of structures to structures of arrays</li><li>Consider to permute loops (see vectorization gain report)</li></ul>",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.00 cycles (2.00x speedup).",
        },
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Make array accesses unit-stride:\n<ul><li>If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) =&gt; for(i) a.x[i] = b.x[i]; (fast, stride 1)</li></ul></li></ul>",
          details = "35% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>66% of SSE/AVX loads are used in vector version.</li><li>0% of SSE/AVX addition or subtraction instructions are used in vector version.</li><li>9% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.</li></ul>Since your execution units are vector units, only a fully vectorized function can use their full power.\n",
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
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VZEROUPPER: 1 occurrences</li></ul>",
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
          txt = "<table><tr><td>nb instructions</td><td>29</td></tr><tr><td>nb uops</td><td>32</td></tr><tr><td>loop length</td><td>160</td></tr><tr><td>used x86 registers</td><td>7</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>4</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>3</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>8.00 cycles</td></tr><tr><td>front end</td><td>8.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>3.25</td><td>3.25</td><td>2.50</td><td>2.17</td><td>3.00</td><td>3.25</td><td>3.25</td><td>2.33</td></tr><tr><td>cycles</td><td>3.25</td><td>3.25</td><td>2.50</td><td>2.17</td><td>3.00</td><td>3.25</td><td>3.25</td><td>2.33</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>8.00</td></tr><tr><td>Dispatch</td><td>3.25</td></tr><tr><td>Overall L1</td><td>8.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>30%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>11%</td></tr></table>FP\n<table><tr><td>all</td><td>50%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>0%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>35%</td></tr><tr><td>load</td><td>66%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>9%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>43%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>25%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>26%</td></tr></table>FP\n<table><tr><td>all</td><td>31%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>12%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>40%</td></tr><tr><td>load</td><td>70%</td></tr><tr><td>store</td><td>66%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>25%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>23%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 8.00 cycles. At this rate:\n<ul><li>13% of peak load performance is reached (8.50 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>25% of peak store performance is reached (8.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 8.00 to 3.25 cycles (2.46x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 4013d0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>SUB $0x3c8,%RSP</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>TEST %RSI,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JE 40226f <move_particles+0xe9f></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr><tr><td>LEA -0x1(%RSI),%R9</td><td>1</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>VBROADCASTSS %XMM0,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VMOVUPS %XMM1,(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>MOV %R9,%R8</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>SHR $0x2,%R8</td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>1</td><td>0.50</td></tr><tr><td>INC %R8</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VMOVQ %R8,%XMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td></tr><tr><td>VPBROADCASTQ %XMM1,%YMM1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>VMOVDQU %YMM1,0x160(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>4</td><td>1</td></tr><tr><td>MOV %R8,%RDX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>AND $-0x8,%RDX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>XOR %R10D,%R10D</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>VMOVDQU 0xcc43(%RIP),%YMM5</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVDQU 0xcc5b(%RIP),%YMM9</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VBROADCASTSS 0xcbda(%RIP),%YMM13</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>0.50</td></tr><tr><td>VMOVUPS %XMM0,-0x70(%RSP)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>JMP 40147f <move_particles+0xaf></td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1-2</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPW %CS:(%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>XOR %EAX,%EAX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>NOPL (%RAX)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>ADD $0x3c8,%RSP</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VZEROUPPER</td><td>4</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr><tr><td>RET</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0.33</td><td>0</td><td>1</td></tr><tr><td>NOPW (%RAX,%RAX,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr></table>",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try to reorganize arrays of structures to structures of arrays</li><li>Consider to permute loops (see vectorization gain report)</li></ul>",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 8.00 to 4.00 cycles (2.00x speedup).",
        },
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Make array accesses unit-stride:\n<ul><li>If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) =&gt; for(i) a.x[i] = b.x[i]; (fast, stride 1)</li></ul></li></ul>",
          details = "35% of SSE/AVX instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>66% of SSE/AVX loads are used in vector version.</li><li>0% of SSE/AVX addition or subtraction instructions are used in vector version.</li><li>9% of SSE/AVX instructions that are not load, store, addition, subtraction nor multiply instructions are used in vector version.</li></ul>Since your execution units are vector units, only a fully vectorized function can use their full power.\n",
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
