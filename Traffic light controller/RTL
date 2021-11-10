
`timescale 1ms/1us

module TLC_1#(parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,red=3'b100,yellow=3'b010,green=3'b001)
(input rst,clk ,output reg [2:0]yNS,yEW);
reg [2:0]PS;
reg [4:0]count;
always@(posedge clk)
begin
	if(rst)
	begin
		count<=4'b0000;
		PS<=s0;
	end
	else 
		begin
		case(PS)
			s0:begin count<=5'b00000;
				if(count<5'b01111)
				begin
					count<=count+1'b1;
					yNS<=green;
					yEW<=red;
					PS<=s0;
				end
				else if(count>=5'b01111)
				begin
				
						PS<=s1;
				end
			    end
			s1:begin
					count<=5'b00000;
				if(count<4'b0011)
				begin
					count<=count+1'b1;
					PS<=s1;
					yNS<=yellow;
					yEW<=red;
				end
				else if(count==4'b0011)
				begin
					count<=4'b0000;
					PS<=s2;
				end
			   end	
			s2:begin
					count<=5'b00000;
				if(count<4'b0011)
				begin
					count<=count+1'b1;
					PS<=s2;
					yNS<=red;
					yEW<=red;
				end
				else if(count==4'b0011)
				begin
					count<=4'b0000;
					PS<=s3;
				end
			   end		
		
			s3:begin count<=5'b00000;
				if(count<5'b01111)
				begin
					count<=count+1'b1;
					yNS<=red;
					yEW<=green;
					PS<=s3;
				end
				else if(count>=5'b01111)
				begin
				
						PS<=s4;
				end
			    end		
			s4:begin
					count<=5'b00000;
				if(count<4'b0011)
				begin
					count<=count+1'b1;
					PS<=s4;
					yNS<=red;
					yEW<=yellow;
				end
				else if(count==4'b0011)
				begin
					count<=4'b0000;
					PS<=s5;
				end
			   end
			s5:begin
					count<=5'b00000;
				if(count<4'b0011)
				begin
					count<=count+1'b1;
					PS<=s5;
					yNS<=red;
					yEW<=red;
				end
				else if(count==4'b0011)
				begin
					count<=4'b0000;
					PS<=s0;
				end
			   end
	endcase
	end
end	
endmodule
