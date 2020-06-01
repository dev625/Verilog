/*Implementation of 3 input NAND Gate Using CMOS Logic*/

module cmosnand(A,B,C,F);
  input A,B,C;
  output F;
  supply1 vdd;
  supply0 gnd;
  pmos(F,vdd,A);
  pmos(F,vdd,B);
  pmos(F,vdd,C);
  nmos(F,K1,A);
  nmos(K1,K2,B);
  nmos(K2,gnd,C);
endmodule

module cmosnandtest;
  reg A,B,C;
  wire F;
  cmosnand uut(.F(F),.A(A),.B(B),.C(C));
  initial begin
    A = 0;
    B = 0;
    C = 1;
    #5;
    A = 1;
    B = 1;
    C = 1;
    #5;
    A = 0;
    B = 1;
    C = 0;
    #5 $stop;
  end
endmodule
