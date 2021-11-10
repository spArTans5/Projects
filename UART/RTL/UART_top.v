`include "UART_transmitter"
`include "UART_reciever"

module top_UART(input clk,rst,en,input [7:0]data_i,output [7:0]data_o);
wire transmit_reciever;

UART_trans u1(.clk(clk),.rst(rst),.en(en),.transmit(transmit_reciever),.data_in(data_i));
UART_reciever u2(.clk(clk),.rst(rst),.data_r(transmit_reciever),.data_out(data_o));
endmodule
