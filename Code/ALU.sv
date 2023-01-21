module ALU_32bit( input [31:0] In1 ,In2 , input [3:0] ALU_Sel ,output [63:0] Out, output Zero);
  
  reg [63:0] ALU_Result;
  reg temp_zero;

  always @(*)
  begin
      case(ALU_Sel)
      4'b0000: // add - addi - sw - ld
       ALU_Result = In1 + In2; 
       
      4'b0001: // sub
       ALU_Result = In1 - In2;

       
      4'b0011: // and
       ALU_Result = In1 & In2;
       
      4'b0100: // or
       ALU_Result = In1 | In2;
       
      4'b0101: // xor 
       ALU_Result = In1 ^ In2;
       
      4'b0110: // slt
       ALU_Result = ( In1 < In2 ) ? 32'd1 : 32'd0;
       
      4'b0111: // be
       temp_zero = ( In1 == In2 ) ? 1'd1 : 1'd0  ;
       
      4'b1000: // bne
       temp_zero =  ( In1 == In2 ) ? 1'd0 : 1'd1;


        default: ALU_Result = 32'bx ; 
      endcase
  end

  assign Out = ALU_Result;
  //Flag
  assign Zero = temp_zero;


endmodule