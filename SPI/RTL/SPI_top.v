`timescale 1ns / 1ps


`include "SPI_master"
`incude "SPI_slave"

module spi_top(input clk,reset,cs1,cs2,cs3,input [15:0]master_data,slave_data1,slave_data2,slave_data3,output [15:0]Master_r,Slave1_r,Slave2_r,Slave3_r);
wire MOSI1,MOSI2,MOSI3,MISO1,MISO2,MISO3,CS1,CS2,CS3;
spi_master dut1(.clk(clk),.rst(reset),.MISO_in1(MISO1),.MISO_in2(MISO2),.MISO_in3(MISO3),.cs1(cs1),.cs2(cs2),.cs3(cs3),.data_in(master_data),.cs1_out(CS1),.cs2_out(CS2),.cs3_out(CS3),.MOSI1_out(MOSI1),.MOSI2_out(MOSI2),.MOSI3_out(MOSI3),.master_r(Master_r));
spi_slave dut2(.clk(clk),.rst(reset),.cs(CS1),.MOSI_in(MOSI1),.data_in(slave_data1),.MISO_out(MISO1),.slave_r(Slave1_r));
spi_slave dut3(.clk(clk),.rst(reset),.cs(CS2),.MOSI_in(MOSI2),.data_in(slave_data2),.MISO_out(MISO2),.slave_r(Slave2_r));
spi_slave dut4(.clk(clk),.rst(reset),.cs(CS3),.MOSI_in(MOSI3),.data_in(slave_data3),.MISO_out(MISO3),.slave_r(Slave3_r));

endmodule
