module mod10(qo,clk);
    output [3:0]qo;
    input clk;
    inv u1(qc,q3);
    inv u2(qb,q1);
    inv u3(qa,q0);
    and u4(j3,q1,q0,q2);
    assign k3=q0;
    and u5(k2,q1,q0);
    assign j2=k2;
    and u6(j1,qc,q0);
    assign k1=q0;
    assign j0=1'b1;
    assign k0=1'b1;
    jk1 u11(qo[0],j0,k0,clk);
    jk1 u12(qo[1],j1,k1,clk);
    jk1 u13(qo[2],j2,k2,clk);
    jk1 u14(qo[3],j3,k3,clk);
    assign {q3,q2,q1,q0}=qo;
endmodule

module jk1(q,j,k,clock);
input j,k,clock;
output reg q;
initial
begin
q=1;
end
always@(posedge clock)
begin
case({j,k})
2'b00 :q=q;
2'b01 :q=0;
2'b10 :q=1;
2'b11 :q=~q;
default :q=0;
endcase
end
endmodule


module inv(o,a);
    output o;
    input a;
    assign o=!a;
endmodule