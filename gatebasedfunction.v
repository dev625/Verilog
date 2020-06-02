/*Function Y = (AB+CD)' implementation using built in logic gates*/


module gbasedf(A,B,C,D,F);
  input A,B,C,D;
  output F;
  wire W1,W2,W3;
  and u1(W1,A,B);
  and u2(W2,C,D);
  or u3(W3,W1,W2);
  not(F,W3);
endmodule

module gbasedftest;
  reg A,B,C,D;
  wire F;
  gbasedf uut(.A(A),.B(B),.C(C),.D(D),.F(F));
  initial begin
    A=1;B=1;C=1;D=1;
    #50;
    A=0;B=1;C=0;D=1;
    #50 $stop;
  end
endmodule