// MIPS ALU
// Nicolas Rodriguez
// Nov 23, 2020

module alu (operand_A,
            reg_file_bus2,
            sign_ext_imm,
            alu_funct,
            alu_in_sel,
            output_result,
            zero_flag
            );

// i/o
input alu_in_sel;
input wire [ 1:0] alu_funct;
input wire [31:0] operand_A;
input wire [31:0] reg_file_bus2;
input wire [31:0] sign_ext_imm;

output wire zero_flag;
output reg [31:0] output_result;

// local
wire [31:0] operand_B;

// combinational logic
assign zero_flag = output_result ? 1'b0 : 1'b1;

always @ ( * ) begin
    case(alu_funct)
        2'b0000 : output_result = operand_A + operand_B;
        2'b0010 : output_result = operand_A + (~operand_B + 1);

        default : output_result <= 32'hzzzz_zzzz;
    endcase
end // always @ *

always @ ( * ) begin
    if (alu_in_sel)
        assign operand_B = sign_ext_imm;
    else
        assign operand_B = reg_file_bus2;
end // always @ *

endmodule // alu
