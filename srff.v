module SRFF (input R, clock, S, output Q, Q_dot);
  // your code here
  wire Rout,Sout;
   And g1(R,clock,Rout);
  And g2(S,clock,Sout);
  Nor g3(Rout,Q_dot,Q);
  Nor g4(Sout,Q,Q_dot);
endmodule

