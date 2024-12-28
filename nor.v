
module Nor(input a, b, output out);
  // your code here
       wire out1;
	Or g1(a,b,out1);
	Nand g2(out1,out1,out);
endmodule

