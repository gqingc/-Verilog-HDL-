module DFF(input in, clock, load, output out);
  // your code here
  wire in1,inNot,clockNot,Q,Q_,Q_dot;
  Mux g1(out,in,load,in1);
  Not g3(in1,inNot);
  Not g4(clock,clockNot);
  SRFF g2(in1,clockNot,inNot,Q, Q_);
  SRFF g5(Q,clock,Q_,out, Q_dot);

endmodule

