
module Xor(input a, b, output out);
  // your code here
wire out1,out2;
  Or g1(a,b,out1);
  Nand g2(a,b,out2);
  And g3(out1,out2,out);
endmodule
