
module FullAdder(input a,b,c, output sum, carry);
  // your code here
 wire AB,carry1,carry2;
  HalfAdder g1(a,b,AB,carry1);
  HalfAdder g2(AB,c,sum,carry2);
  Or g3(carry1,carry2,carry);
endmodule
