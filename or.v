
module Or(input a, b, output out);
  // your code here
  wire nand_a, nand_b;

    // 第一个NAND门，模拟 NAND(A, A)
    Nand nand1(a, a, nand_a);

    // 第二个NAND门，模拟 NAND(B, B)
    Nand nand2(b, b, nand_b);

    // 最后一个NAND门，模拟 NAND(nand_a, nand_b)，得到 OR 结果
    Nand nand3(nand_a, nand_b, out);
endmodule
