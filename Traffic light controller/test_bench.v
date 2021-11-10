`timescale 1ms/1us

`include "TLC.v"

module TLC_tb;
reg clk,rst;
wire [2:0]yns,yew;
TLC_1 dut(.rst(rst),.clk(clk),.yNS(yns),.yEW(yew));
initial 
begin
	   rst<=1'b1;
	#1000 rst<=1'b0;
end
initial 
begin
	clk<=1'b1;
	forever #500 clk<=~clk;
end
endmodule
