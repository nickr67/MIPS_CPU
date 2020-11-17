// ALU. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module alu (operand_A, operand_B, alu_funct, output_result, zero_flag);

// i/o
input wire [ 3:0] alu_funct;
input wire [31:0] operand_A;
input wire [31:0] operand_B;

output wire zero_flag;
output reg [31:0] output_result;

// logic
assign zero_flag = output_result ? 1'b0 : 1'b1;

always @ ( * ) begin
    case(alu_funct)
        4'b0010 : output_result <= operand_A + operand_B;
        4'b0110 : output_result <= operand_A + (~operand_B + 1);

        default : output_result <= 32'hzzzz_zzzz;
    endcase
end
endmodule // alu
