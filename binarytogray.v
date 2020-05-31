module bin2gray
        (input [3:0] bin, //binary input
         output [3:0] G //gray code output
        );

//xor gates.
assign G[3] = bin[3];

XORF g2(G[2],bin[3],bin[2]);
XORF g1(G[1],bin[2],bin[1]);
XORF g0(G[0],bin[1],bin[0]);

endmodule

module XORF(c,a,b);
  input a,b;
  output c;
  assign c = (~a & b) | (~b & a);
endmodule
