// Code your design here
module shiftRegister 
  (input clk,
   input rst,
   input logic d,
   input logic shift,
   output logic q);
  logic[7:0] shift_reg;
  logic[7:0] shift_reg_next; 
  always_ff @(posedge clk) begin
    if(rst)
      shift_reg <= 8'b0;
    else begin
      if(shift) begin
      	shift_reg[7] <= d;
        shift_reg[6:0] <= shift_reg_next;
      end
      else begin
        shift_reg <= shift_reg_next; 
      end 
    end 
  end 
  assign shift_reg_next = shift ? shift_reg >> 1 : 			shift_reg; 
  assign q = shift_reg[0];
  
endmodule