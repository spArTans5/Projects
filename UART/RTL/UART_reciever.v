module UART_reciever#(parameter IDLE=3'b000,START=3'b001,DATA=3'b010,STOP=3'b011)
(input clk,data_r,rst,output reg [7:0]data_out);
reg [3:0]count;
reg [2:0]state; 
reg ready;

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
				if(data_r==1)
			     	begin 
					state<=IDLE;
					
			     	end		
				else if(data_r==0)
				begin
					state<=START;
					state<=DATA;
					ready<=1'b1;
			        end
			    end
			DATA:begin
				count<=count-1;
				if(count>4'b0000&&ready==1)
				begin
		  			data_out[count-1'b1]<=data_r;	
					count<=count-1;
				end
				else if(count==4'b0000)
				begin						
				state<=STOP;
				end
		   	     end
			STOP:begin
				if(data_r==1)
				begin
					state<=IDLE;
					
				end
				else if(data_r==0)
				begin
					state<=STOP;	
					count<=4'b0000;
			    	end
			      end
		endcase
	end
end
endmodule
