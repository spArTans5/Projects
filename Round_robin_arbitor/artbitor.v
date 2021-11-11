module arbiter#(parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11)
(input clk,rst,input [3:0]req,output [3:0]grant);
reg[3:0]token;
reg [3:0]out0,out1,out2,out3;
always@(posedge clk)
begin
	if(rst)
	begin
		token<=4'b0001;
	end
	else if(rst==0)
		token<={token[2:0],token[3]};
end	
always@(token)
begin
			if(token[0]==1)
			begin
				if(req[0]==1)
					begin
						out0[0]<=1; out1<=4'b0000;
						out0[1]<=0; out2<=4'b0000;
						out0[2]<=0; out3<=4'b0000;
						out0[3]<=0;	
					end		
				else if(req[1]==1)
					begin
						out0[0]<=0; out1<=4'b0000;
						out0[1]<=1; out2<=4'b0000;
						out0[2]<=0; out3<=4'b0000;
						out0[3]<=0; 	
					end	
				else if(req[2]==1)
					begin
						out0[0]<=0; out1<=4'b0000;
						out0[1]<=0; out2<=4'b0000;
						out0[2]<=1; out3<=4'b0000;
						out0[3]<=0;	
					end
				else if(req[3]==1)
					begin
						out0[0]<=0; out1<=4'b0000;
						out0[1]<=0; out2<=4'b0000;
						out0[2]<=0; out3<=4'b0000;
						out0[3]<=1;	
					end	
				else if(req[0]==0&&req[1]==0&&req[2]==0&&req[3]==0)		
				begin
					out0<=4'b0000;
					out1<=4'b0000;
					out2<=4'b0000;
					out3<=4'b0000;
				end			
			end
			else if(token[1]==1)
			begin
				if(req[1]==1)
					begin
						out1[0]<=0; out0<=4'b0000;
						out1[1]<=1; out2<=4'b0000;
						out1[2]<=0; out3<=4'b0000;
						out1[3]<=0;	
					end		
				else if(req[2]==1)
					begin
						out1[0]<=0; out0<=4'b0000;
						out1[1]<=0; out2<=4'b0000;
						out1[2]<=1; out3<=4'b0000;
						out1[3]<=0;	
					end	
				else if(req[3]==1)
					begin
						out1[0]<=0; out0<=4'b0000;
						out1[1]<=0; out2<=4'b0000;
						out1[2]<=0; out3<=4'b0000;
						out1[3]<=1;	
					end
				else if(req[0]==1)
					begin
						out1[0]<=1; out0<=4'b0000;
						out1[1]<=0; out2<=4'b0000;
						out1[2]<=0; out3<=4'b0000;
						out1[3]<=0;	
					end					
				else if(req[0]==0&&req[1]==0&&req[2]==0&&req[3]==0)		
				begin
					out0<=4'b0000;
					out1<=4'b0000;
					out2<=4'b0000;
					out3<=4'b0000;
				end	
			end
		
			
			else if(token[2]==1)
			begin
				if(req[2]==1)
					begin
						out2[0]<=0; out0<=4'b0000;
						out2[1]<=0; out1<=4'b0000;
						out2[2]<=1; out3<=4'b0000;
						out2[3]<=0;	
					end		
				else if(req[3]==1)
					begin
						out2[0]<=0; out0<=4'b0000;
						out2[1]<=0; out1<=4'b0000;
						out2[2]<=0; out3<=4'b0000;
						out2[3]<=1;	
					end	
				else if(req[0]==1)
					begin
						out2[0]<=1; out0<=4'b0000;
						out2[1]<=0; out1<=4'b0000;
						out2[2]<=0; out3<=4'b0000;
						out2[3]<=0; 
					end
				else if(req[1]==1)
					begin
						out2[0]<=0; out0<=4'b0000;
						out2[1]<=1; out1<=4'b0000;
						out2[2]<=0; out3<=4'b0000;
						out2[3]<=0;	
					end	
				else if(req[0]==0&&req[1]==0&&req[2]==0&&req[3]==0)		
				begin
					out0<=4'b0000;
					out1<=4'b0000;
					out2<=4'b0000;
					out3<=4'b0000;
				end	
			end
			else if(token[3]==1)
			begin
				if(req[3]==1)
					begin
						out3[0]<=0; out0<=4'b0000;
						out3[1]<=0; out1<=4'b0000;
						out3[2]<=0; out2<=4'b0000;
						out3[3]<=1;	
					end		
				else if(req[0]==1)
					begin
						out3[0]<=1; out0<=4'b0000;
						out3[1]<=0; out1<=4'b0000;
						out3[2]<=0; out2<=4'b0000;
						out3[3]<=0;	
					end	
				else if(req[1]==1)
					begin
						out3[0]<=0; out0<=4'b0000;
						out3[1]<=1; out1<=4'b0000;
						out3[2]<=0; out2<=4'b0000;
						out3[3]<=0;	
					end
				else if(req[2]==1)
					begin
						out3[0]<=0; out0<=4'b0000;
						out3[1]<=0; out1<=4'b0000;
						out3[2]<=1; out2<=4'b0000;
						out3[3]<=0;	
					end	
				else if(req[0]==0&&req[1]==0&&req[2]==0&&req[3]==0)		
				begin
					out0<=4'b0000;
					out1<=4'b0000;
					out2<=4'b0000;
					out3<=4'b0000;
				end	
			end
				
end
or o1(grant[0],out0[0],out1[0],out2[0],out3[0]);
or o2(grant[1],out0[1],out1[1],out2[1],out3[1]);
or o3(grant[2],out0[2],out1[2],out2[2],out3[2]);
or o4(grant[3],out0[3],out1[3],out2[3],out3[3]);
endmodule
