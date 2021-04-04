module counter_test
(
input increment,
input rst,
output reg[6:0] segment, //7 segment display
output reg[5:0] seg_sel //select which segment
);

reg[3:0] counter; //counter to keep count of how many clicks

initial
begin
seg_sel <= ~5'b1;
segment <= ~7'b0;
counter <= 4'b0;
end

//increment the counter
always@(negedge increment or negedge rst)
begin
	if(rst==1'b0)
		counter<=4'b0;
	else if(counter==4'h9)
		counter<=4'b0;
	else
		counter<= counter+1'b1;
end

//map proper output from counter to segment
always@(negedge increment or negedge rst)
begin
	if(rst==1'b0)
		segment=7'h00;
	else
	begin
		case(counter)
			4'd0: segment=7'h77;
			4'd1: segment=7'h24;
			4'd2: segment=7'h5D;
			4'd3: segment=7'h6D;
			4'd4: segment=7'h2E;
			4'd5: segment=7'h6B;
			4'd6: segment=7'h7B;
			4'd7: segment=7'h25;
			4'd8: segment=7'h7F;
			4'd9: segment=7'h6F;
			default: segment=7'h77;
			endcase
		end
		segment<=~segment;
end


endmodule
