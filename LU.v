module LU #(parameter WIDTH=8)
    (
	  input [3:0] control,
	  input [WIDTH-1:0] Header,
	  input [WIDTH-1:0] Data,
	  input bit_map_in,
      output reg [WIDTH-1:0] Out,
	  output reg bit_map_out
    );

parameter Remove=4'b0000, // Lets the inputs pass to output
		  No_Change=4'b0001, // Unsets the bitmap position
		  Add_Modify=4'b0010; // Changing and adding is the same operation
	 
always@(*) begin
	case(control)
		No_Change:begin
			Out = Header;
			bit_map_out=bit_map_in;
		end
		Remove:begin
			Out = Header;
			bit_map_out = 0;
		end
		Add_Modify:begin
			Out = Data;
			bit_map_out = 1;
		end
		default:begin
		Out = {WIDTH{1'b0}};
		bit_map_out = 0;
		end
	endcase
end
	 
endmodule	 