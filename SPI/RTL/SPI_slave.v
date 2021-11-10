
module spi_slave#(parameter IDLE=2'b01,DATA_TRANSFER=2'b10,STOP=2'b11)
(input clk,rst,cs,MOSI_in,input [15:0]data_in,output reg MISO_out,output reg [15:0]slave_r);
reg [2:0]state;
reg[4:0]count;
always@(posedge clk)
begin
	if(rst)
	begin
		MISO_out<=1'b0;
		state<=IDLE;
		count<=5'b00000;
	end
	else if(rst==0)
	begin
		case(state)
			IDLE:begin
				if(cs==1)
					state<=DATA_TRANSFER;
				else if(cs==0)
					state<=IDLE;	
			end
			DATA_TRANSFER:begin
				
				if(count<5'b10001)
				begin
					MISO_out<=data_in[count];
					slave_r[count-1'b1]<=MOSI_in;
					count<=count+1'b1;
					state<=DATA_TRANSFER;
				end
				else if(count==5'b10001)
				begin
					MISO_out<=1'b0;
					count<=5'b00000;
					state<=STOP;
				end
				end
			
			STOP:begin
				state<=IDLE;
				slave_r<=16'h0000;
			     end
			endcase
	end
end
endmodule
