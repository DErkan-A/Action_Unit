module Register_en #(
     parameter WIDTH=8)
    (
	  input  clk, en,
	  input	[WIDTH-1:0] DATA,
	  output reg [WIDTH-1:0] OUT
    );
	 
always@(posedge clk) begin
	if(en == 1'b1)
		OUT<=DATA;
end
	 
endmodule	 