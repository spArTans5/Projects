
module spi_master#(parameter IDLE=3'b000,READY=3'B001,DATA_T1=3'b010,DATA_T2=3'b011,DATA_T3=3'b100,STOP=3'b101)
(input clk,rst,MISO_in1,MISO_in2,MISO_in3,cs1,cs2,cs3,input [15:0]data_in,output reg cs1_out,cs2_out,cs3_out,MOSI1_out,MOSI2_out,MOSI3_out,output reg [15:0]master_r);
reg [4:0]count;
reg [3:0]state;
always@(posedge clk)
begin
	if(rst)
	begin
		MOSI1_out<=1'b0;
		MOSI2_out<=1'b0;
		MOSI3_out<=1'b0;
		state<=IDLE;
		count<=5'b00000;
	end
	else if(rst==0)
	begin
		case(state)
			
			IDLE:begin
				if(cs1==1)
				begin
					cs1_out<=1'b1;
					cs2_out<=1'b0;
					cs3_out<=1'b0;
					state<=READY;
				end
				else if(cs2==1)
				begin	
					cs1_out<=1'b0;
					cs2_out<=1'b1;
					cs3_out<=1'b0;
					state<=READY;
				end
				else if(cs3==1)
				begin
					cs1_out<=1'b0;
					cs2_out<=1'b0;
					cs3_out<=1'b1;
					state<=READY;
				end
				else 
					state<=IDLE;
			end
			READY:begin
				if(cs1==1)
				begin
					
					state<=DATA_T1;
				end
				else if(cs2==1)
				begin	
					
					state<=DATA_T2;
				end
				else if(cs3==1)
				begin
					
					state<=DATA_T3;
				end
				else 
					state<=IDLE;
			end
			DATA_T1:begin
				if(count<5'b10001)
				begin
					MOSI1_out<=data_in[count];
					master_r[count-1'b1]<=MISO_in1;
					count<=count+1'b1;
					MOSI2_out<=1'b0;
					MOSI3_out<=1'b0;
					state<=DATA_T1;
				end
				else if(count==5'b10001)
				begin
					MOSI1_out<=1'b0;
					count<=5'b00000;
					state<=STOP;
				end
				end
			DATA_T2:begin
				if(count<5'b10001)
				begin
					MOSI2_out<=data_in[count];
					master_r[count]<=MISO_in2;
					count<=count+1'b1;
					MOSI1_out<=1'b0;
					MOSI3_out<=1'b0;
					state<=DATA_T2;
				end
				else if(count==5'b10000)
				begin
					MOSI2_out<=1'b0;
					count<=5'b00000;
					state<=STOP;
				end
				end
			DATA_T3:begin
				if(count<5'b10001)
				begin
					MOSI3_out<=data_in[count];
					master_r[count-1'b1]<=MISO_in3;
					count<=count+1'b1;
					MOSI1_out<=1'b0;
					MOSI2_out<=1'b0;
					state<=DATA_T3;
				end
				else if(count==5'b10001)
				begin
					MOSI3_out<=1'b0;
					count<=5'b00000;
					state<=STOP;
				end
				end	
			STOP:begin
				state<=IDLE;		
				master_r<=16'h0000;
		   	  end
			endcase
	end
end
