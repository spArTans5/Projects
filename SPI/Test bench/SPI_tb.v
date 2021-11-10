
`timescale 1ns / 1ps

module spi_tb;
reg clk,reset,cs1,cs2,cs3;
reg [15:0]master_data,slave_data1,slave_data2,slave_data3;
wire [15:0]Master_r,Slave1_r,Slave2_r,Slave3_r;

spi_top dut(.clk(clk),.reset(reset),.cs1(cs1),.cs2(cs2),.cs3(cs3),.master_data(master_data),.slave_data1(slave_data1),.slave_data2(slave_data2),.slave_data3(slave_data3),.Master_r(Master_r),.Slave1_r(Slave1_r),.Slave2_r(Slave2_r),.Slave3_r(Slave3_r));
initial begin
	clk<=1'b1;
	forever #50 clk<=~clk;
	end
initial
begin
	cs1<=1'b1;
	cs2<=1'b0;
	cs3<=1'b0;
	reset<=1'b1;
	master_data<=$random();
	slave_data1<=$random();
	slave_data2<=$random();
	slave_data3<=$random()	;
	#100 reset<=1'b0;
	#2300 	cs1<=1'b0;
		cs2<=1'b1;
		cs3<=1'b0;
	#2300 	cs1<=1'b0;
		cs2<=1'b0;
		cs3<=1'b1;
	#7500 $stop;
end
endmodule 





