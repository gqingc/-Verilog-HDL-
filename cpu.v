
module CPU(
    input[15:0]  inM,         // M value input  (M = contents of RAM[A])
                 instruction, // Instruction for execution
    input clock, reset,       // Signals whether to re-start the current
                              // program (reset==1) or continue executing
                              // the current program (reset==0).

    output[15:0] outM,        // M value output
    output       writeM,      // Write to M? 
    output[14:0] addressM,    // Address in data memory (of M)
                 pc          // address of next instruction
    );
    wire[15:0] inAR, outAR, outALU, pcOut, outAM, outDR;
    // your code here
    wire isA,isC,isWriteDR,isWriteAR,zx,nx,zy,ny,f,no,zr,ng;
    wire isLT,isEq,isGt,notng,notzr,isOutGt,isGtJump,orjump,jump;
    // if (instruction[15]==1) set isC=1, else set isA=1
    Not g1(instruction[15],isA);
    Not g2(isA,isC);


    // instruction[5:3] is dest domin
    //instruction[5]=1 set AR=outALU,instruction[4]=1 set DR=outALU,instruction[3]=1 set M[A]=outALU
    // if (isC&instruction[4]) set isWriteDR=1,outDR=outALU
    And g3(isC,instruction[4],isWriteDR);
    Register D(outALU,clock,isWriteDR,outDR);


    // if (isA) set inAR=instruction, or set inAR=outALU
    Mux16 g4(outALU,instruction,isA,inAR);
    // if (isA|instruction[5]) set isWriteAR=1
    Or g5(isA,instruction[5],isWriteAR);


    Register A(inAR,clock,isWriteAR,outAR);
    // check use A or M from instruction[12](a bit)
    Mux16 g6(outAR,inM,instruction[12],outAM);
    

    // set alu input from instruction[6]/7/8/9/10/11,outDR,outAM
    And g7(isC,instruction[11],zx);
    And g24(isC,instruction[10],nx);
    And g25(isC,instruction[9],zy);
    And g26(isC,instruction[8],ny);
    And g27(isC,instruction[7],f);
    And g28(isC,instruction[6],no);


    ALU alu(outDR,outAM,zx,nx,zy,ny,f,no,outALU,zr,ng);
    
    
    





    // if (isC&instruction[3]) set writeM=1, then set outM=outALU
    
    
    //assign addressM = outAR[14:0];
    And16 g8(outALU,outALU,outM);
    And15 g9(outAR[14:0],outAR[14:0],addressM);
    And g10(isC,instruction[3],writeM);



    // isLT=instruction[2], if(isLT&&ng) set isLtJump=1
    And g11(isC,instruction[2],isLT);
    And g13(isLT,ng,isLtJump);
    


    // isEQ=instruction[1], if(isEQ&&zr) set isEqJump=1
    And g12(isC,instruction[1],isEq);
    And g14(isEq,zr,isEqJump);


    // if out>0,set isOutGt=1
    And g15(isC,instruction[0],isGt);
    Not g16(ng,notng);
    Not g17(zr,notzr);
    And g18(notng,notzr,isOutGt);
    And g19(isOutGt,isGt,isGtJump);

    



    // isGT=instruction[0], if(isGT&&isOutGt) set isGtJump=1
    And g23(isOutGt,isGt,isGtJump);


    // if(isLtJump|isEqJump|isGtJump) set jump=1
    Or g20(isLtJump,isEqJump,orjump);
    Or g21(orjump,isGtJump,jump);


    // set pcOut according to jump,reset,outAR. use PC module
    PC pcm(outAR,!clock,jump,1'b1,reset,pcOut);
    
    

    //assign pc = pcOut[14:0];
    And15 g22(pcOut[14:0],pcOut[14:0],pc);


endmodule