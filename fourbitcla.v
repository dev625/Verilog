module fourbitcla( input Cin, [3:0]A,B, output[3:0]S,Co);
  /*Co and Cin are the output and input carry bits respectively*/
  wire [3:0]G,P,C;
  assign G = A&B;
  assign P = A^B;
  
  assign Co = G[3]|(P[3]&G[2])|(P[2]&P[3]&G[1])|(P[1]&P[2]&P[3]&G[0])|(P[0]&P[1]&P[2]&P[3]&Cin); /*this is the output carry*/
  
  /*Following are Carries used in computation of 4 bits of the sum*/
  assign C[3] = G[2]|(P[2]&G[1])|(P[1]&P[2]&G[0])|(P[0]&P[1]&P[2]&Cin);
  assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&Cin);
  assign C[1] = G[0]|(P[0]&Cin);
  assign C[0] = Cin;
  
  assign S = {Co,P^C};
endmodule
  