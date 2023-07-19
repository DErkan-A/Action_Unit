module Single_Field_Unit#(DATA_WIDTH=32, ADDR_WIDTH=2)( //Combination of a Instruction memory and Logic Unit
    input clk, bit_map_in, WE,
    input [1:0] PDR_ID,
    input [DATA_WIDTH-1:0] Header_Field_In,
    input [DATA_WIDTH+3:0] WD, // Write data for overwriting the mem
    input [ADDR_WIDTH-1:0] W_ADDR,
    output bit_map_out,
    output[DATA_WIDTH-1:0] Header_Field_Out
);

wire [DATA_WIDTH+3:0] Inst_Mem_Out;
wire [3:0] LU_control = Inst_Mem_Out[DATA_WIDTH+3:DATA_WIDTH];
wire [DATA_WIDTH-1:0] LU_DATA = Inst_Mem_Out[DATA_WIDTH-1:0];

Memory#(DATA_WIDTH + 4,ADDR_WIDTH) In_Port_mem (.clk(clk),.WE(WE),.ADDR(PDR_ID),.W_ADDR(W_ADDR),.WD(WD),.RD(Inst_Mem_Out));
LU #(DATA_WIDTH) my_LU (.control(LU_control),.Header(Header_Field_In),.Data(LU_DATA),.bit_map_in(bit_map_in),.Out(Header_Field_Out),.bit_map_out(bit_map_out));

endmodule