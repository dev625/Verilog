module piso1(sout,sin,clk);
    output sout;
    input [3:0]sin;
    input clk;
    wire [3:0]q;
    inv u1(p,sl);
    and1 u2(n,sin[1],p);
    and1 u3(r,sl,q[0]);
    or1 u4(s,n,r);
    and1 u5(t,sin[2],p);
    and1 u6(u,sl,q[1]);
    or1 u7(v,u,t);
    and1 u8(w,sin[3],p);
    and1 u9(y,sl,q[2]);
    or1 u10(z,w,y);
    dff1 u11(q[0],sin[0],clk);
    dff1 u12(q[1],s,clk);
    dff1 u13(q[2],v,clk);
    dff1 u14(q[3],z,clk);
    assign sout = q[3];
endmodule

module inv(o,a);
  output o;
  input a;
  assign o =!a;
endmodule 

module and1(a,b,c);
  input a,b;
  output c;
  assign c = a & b;
endmodule 

module or1(p,q,r);
  input p,q;
  output r;
  assign r = p | q;
endmodule 

module dff1(Q,D,clk);
input D; // Data input 
input clk; // clock input 
output reg Q; // output Q 
always @(negedge clk) 
begin
 Q <= D; 
end 
endmodule 