module Memory#(DATA_WIDTH=32, ADDR_WIDTH=10)(
input clk,WE,
input [ADDR_WIDTH-1:0] ADDR,
input [ADDR_WIDTH-1:0] W_ADDR,
input [DATA_WIDTH-1:0] WD,
output [DATA_WIDTH-1:0] RD 
);

reg [DATA_WIDTH-1:0] mem [(2**ADDR_WIDTH)-1:0];

assign RD = mem[ADDR];

initial begin
mem[0]<= 36'h0_0000_0000;
mem[1]<= 36'h1_0000_0000;
end

always @(posedge clk) begin
    mem[ADDR] <= WD;
end

endmodule