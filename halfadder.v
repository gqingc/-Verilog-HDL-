
module HalfAdder(input a,b, output sum, carry);
  // your code here
  Xor g1(a,b,sum);
  And g2(a,b,carry);

endmodule

