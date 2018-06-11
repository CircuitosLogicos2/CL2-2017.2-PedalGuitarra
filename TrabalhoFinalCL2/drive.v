module drive (input sample_clock,input reset, input [15:0] input_sample2, output [15:0] output_sample2);
	wire[15:0] delay, divdelay, feedbackloop;
	
	assign feedbackloop = output_sample2;
	assign divdelay = {delay[15], delay[15], delay[15:2]};
	
	
	shiftregister2 myshift2(.clock(sample_clock), .shiftin(feedbackloop), .shiftout(delay));
	
	
	always @(posedge sample_clock)
	begin
		output_sample2 = divdelay + input_sample2;
	end
endmodule
