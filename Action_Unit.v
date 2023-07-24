module Action_Unit #(DATA_WIDTH=32, ADDR_WIDTH=2)(
    input clk,
    input [ADDR_WIDTH-1:0] PDR_ID,
    input [ADDR_WIDTH-1:0] W_ADDR,
    input [7:0] Write_Enables,
    input [DATA_WIDTH-1:0] In_In_Port, In_SA_underlay_IPv4,
    In_DA_underlay_IPv4, In_GTPU_TEID, In_GTPU_QFI, In_SA_overlay_IPv4,
    In_DA_overlay_IPv4, In_SP_DP_overlay, In_Protocol_overlay,
    input [DATA_WIDTH-1:0] Wrie_Data,
    input [29:0] In_Control, //Vcode (4 bits)+0-25 (26 bit bitmap)
    output [29:0] Out_Control,
    output [DATA_WIDTH-1:0] Out_In_Port, Out_SA_underlay_IPv4,
    Out_DA_underlay_IPv4, Out_GTPU_TEID, Out_GTPU_QFI, Out_SA_overlay_IPv4,
    Out_DA_overlay_IPv4, Out_SP_DP_overlay, Out_Protocol_overlay
);

// We have 8 Memories and Logic Units for each 8 field

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) In_Port_unit (
    .clk(clk),.bit_map_in(In_Control[0]),.WE(Write_Enables[0]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_In_Port),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[0]),.Header_Field_Out(Out_In_Port));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) SA_underlay_IPv4_unit (
    .clk(clk),.bit_map_in(In_Control[1]),.WE(Write_Enables[1]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_SA_underlay_IPv4),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[1]),.Header_Field_Out(Out_SA_underlay_IPv4));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) DA_underlay_IPv4_unit (
    .clk(clk),.bit_map_in(In_Control[2]),.WE(Write_Enables[2]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_DA_underlay_IPv4),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[2]),.Header_Field_Out(Out_DA_underlay_IPv4));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) GTPU_TEID_unit (
    .clk(clk),.bit_map_in(In_Control[3]),.WE(Write_Enables[3]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_GTPU_TEID),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[3]),.Header_Field_Out(Out_GTPU_TEID));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) GTPU_QFI (
    .clk(clk),.bit_map_in(In_Control[4]),.WE(Write_Enables[4]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_GTPU_QFI),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[4]),.Header_Field_Out(Out_GTPU_QFI));   

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) SA_overlay_IPv4 (
    .clk(clk),.bit_map_in(In_Control[5]),.WE(Write_Enables[5]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_SA_overlay_IPv4),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[5]),.Header_Field_Out(Out_SA_overlay_IPv4));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) DA_overlay_IPv4 (
    .clk(clk),.bit_map_in(In_Control[6]),.WE(Write_Enables[6]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_DA_overlay_IPv4),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[6]),.Header_Field_Out(Out_DA_overlay_IPv4));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) SP_DP_overlay (
    .clk(clk),.bit_map_in(In_Control[7]),.WE(Write_Enables[7]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_SP_DP_overlay),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[7]),.Header_Field_Out(Out_SP_DP_overlay));

Single_Field_Unit#(DATA_WIDTH,ADDR_WIDTH) Protocol_overlay (
    .clk(clk),.bit_map_in(In_Control[8]),.WE(Write_Enables[8]),
    .PDR_ID(PDR_ID),.Header_Field_In(In_Protocol_overlay),.WD(Wrie_Data),
    .W_ADDR(W_ADDR),.bit_map_out(Out_Control[8]),.Header_Field_Out(Out_Protocol_overlay)); 


endmodule