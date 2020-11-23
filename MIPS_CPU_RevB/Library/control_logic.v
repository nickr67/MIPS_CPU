// Control Logic. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module control_logic(opcode,
                     reg_wr_en,
                     reg_dest,
                     mem_wr_en,
                     mem_to_reg,
                     mem_read_en,
                     alu_opcode,
                     alu_in_sel,
                     jump_en,
                     branch_en
                        );
// i/o
input wire [5:0] opcode;

output reg  reg_wr_en,
            reg_dest,
            mem_wr_en,
            mem_to_reg,
            mem_read_en,
            alu_in_sel,
            jump_en,
            branch_en;

output reg [1:0] alu_opcode;

// logic
always @ ( * ) begin
    case (opcode)
        6'b00_0000: begin
            reg_wr_en       <= 1'b1;
            reg_dest        <= 1'b1;
            mem_wr_en       <= 1'b0;
            mem_to_reg      <= 1'b0;
            mem_read_en     <= 1'b0;
            alu_opcode      <= 2'b10;
            alu_in_sel      <= 1'b0;
            jump_en         <= 1'b0;
            branch_en       <= 1'b0;
        end // add and sub

        6'b00_1000: begin
            reg_wr_en       <= 1'b1;
            reg_dest        <= 1'b0;
            mem_wr_en       <= 1'b0;
            mem_to_reg      <= 1'b0;
            mem_read_en     <= 1'b0;
            alu_opcode      <= 2'b00;
            alu_in_sel      <= 1'b1;
            jump_en         <= 1'b0;
            branch_en       <= 1'b0;
        end // addi

        6'b10_0011: begin
            reg_wr_en       <= 1'b1;
            reg_dest        <= 1'b0;
            mem_wr_en       <= 1'b0;
            mem_to_reg      <= 1'b1;
            mem_read_en     <= 1'b1;
            alu_opcode      <= 2'b00;
            alu_in_sel      <= 1'b1;
            jump_en         <= 1'b0;
            branch_en       <= 1'b0;
        end // lw

        6'b10_1011: begin
            reg_wr_en       <= 1'b0;
            reg_dest        <= 1'b0;
            mem_wr_en       <= 1'b1;
            mem_to_reg      <= 1'b0;
            mem_read_en     <= 1'b0;
            alu_opcode      <= 2'b00;
            alu_in_sel      <= 1'b1;
            jump_en         <= 1'b0;
            branch_en       <= 1'b0;
        end // sw

        6'b00_0100: begin
            reg_wr_en       <= 1'b0;
            reg_dest        <= 1'b0;
            mem_wr_en       <= 1'b0;
            mem_to_reg      <= 1'b0;
            mem_read_en     <= 1'b0;
            alu_opcode      <= 2'b00;
            alu_in_sel      <= 1'b1;
            jump_en         <= 1'b0;
            branch_en       <= 1'b1;
        end // beq

        6'b00_0010: begin
            reg_wr_en       <= 1'b0;
            reg_dest        <= 1'b0;
            mem_wr_en       <= 1'b0;
            mem_to_reg      <= 1'b0;
            mem_read_en     <= 1'b0;
            alu_opcode      <= 2'b00;
            alu_in_sel      <= 1'b0;
            jump_en         <= 1'b1;
            branch_en       <= 1'b0;
        end // j

        6'b11_1111: begin
            reg_wr_en       <= 1'bx;
            reg_dest        <= 1'bx;
            mem_wr_en       <= 1'bx;
            mem_to_reg      <= 1'bx;
            mem_read_en     <= 1'bx;
            alu_opcode      <= 2'bxx;
            alu_in_sel      <= 1'bx;
            jump_en         <= 1'bx;
            branch_en       <= 1'bx;
        end // halt

        default: begin
            reg_wr_en       <= 1'bx;
            reg_dest        <= 1'bx;
            mem_wr_en       <= 1'bx;
            mem_to_reg      <= 1'bx;
            mem_read_en     <= 1'bx;
            alu_opcode      <= 2'bxx;
            alu_in_sel      <= 1'bx;
            jump_en         <= 1'bx;
            branch_en       <= 1'bx;
        end // default
    endcase // opcode
end // always @ *

endmodule // control_logic
