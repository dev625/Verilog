module cmosnandtemp1(f,a,b);
  output f;
  input a,b;
  supply1 vdd;
  supply0 gnd;
  wire k;
  pmos (f,vdd,a);
  pmos (f,vdd,b);
  nmos (f,k,a);
  nmos(k,gnd,b);
endmodule

module srff(q,qbar,s,r,clk);
  input s,r,clk;
  output q,qbar;
  cmosnandtemp1 n1(k1,s,clk);
  cmosnandtemp1 n2(k2,r,clk);
  cmosnandtemp1 n3(q,k1,qbar);
  cmosnandtemp1 n4(qbar,k2,q);
endmodule

module srfftest;
reg s;
reg r;
reg clk;
wire q,qbar;
srff uut(.q(q),.qbar(qbar),.s(s),.r(r),.clk(clk));

initial begin
s = 0; r = 1; clk = 1;
#100 s = 1; r = 0; clk = 1;
#100 s = 0; r = 1; clk = 1;
$stop;
end 
endmodule

