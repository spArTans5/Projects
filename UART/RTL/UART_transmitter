module UART_trans#(parameter IDLE=3'b000,START=3'b001,DATA=3'b010,STOP=3'b011)
(input clk,rst,en,input [7:0]data_in,output reg transmit);
reg [3:0]count;
reg [2:0]state; 

always@(posedge clk)
begin 
	if(rst)
	begin
		state<=IDLE;
		count<=4'b1000;
	end
	else if(rst==0)
	begin
		case(state)
			IDLE:begin
				if(en==1)
			     	begin 
					state<=IDLE;
					transmit<=en;
			     	end		
				else if(en==0)
					state<=START;
			     end
			START:begin
				state<=DATA;
				transmit<=en;
				end	
			DATA:begin
				if(count<=4'b1000&&count>4'b0000)	
					begin
		  				transmit<=data_in[count-1'b1];
						state<=DATA;	
						count<=count-1'b1;		
					end
				else if(count==4'b0000)
					begin						
					state<=STOP;
					end
		   	     end
			STOP:begin
				transmit<=1'b1;
				
				state<=IDLE;
				count<=4'b0111;
			    end
		endcase
	end
end
endmodule
