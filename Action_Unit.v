module ActionUnit #(DATA_WIDTH=32)(
    input clk,
    input [2:0] PDR_ID,
    input [DATA_WIDTH-1:0] In_Port, SA_underlay_IPv4,
    DA_underlay_IPv4, GTPU_TEID, GTPU_QFI, SA_overlay_IPv4,
    DA_overlay_IPv4, SP_overlay, DP_overlay, Protocol_overlay,
    input [29:0] Control //Vcode (4 bits)+0-25 (26 bit bitmap) 
);

// We have 8 Memories and Logic Units for each 8 field

endmodule