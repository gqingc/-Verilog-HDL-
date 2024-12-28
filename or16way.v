/**
 * 16-way Or: 
 * out = (in[0] or in[1] or ... or in[15])
 */

module Or16Way(input[15:0] in,output out);
    // your code here
wire out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14;
     Or g1(in[0],in[1],out1);
    Or g2(out1,in[2],out2);
    Or g3(out2,in[3],out3);
    Or g4(out3,in[4],out4);
    Or g5(out4,in[5],out5);
    Or g6(out5,in[6],out6);
    Or g7(out6,in[7],out7);
    Or g8(out7,in[8],out8);
    Or g9(out8,in[9],out9);
    Or g10(out9,in[10],out10);
    Or g11(out10,in[11],out11);
    Or g12(out11,in[12],out12);
    Or g13(out12,in[13],out13);
    Or g14(out13,in[14],out14);
    Or g15(out14,in[15],out);

endmodule


