// Instruction Memory. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

// program to be exectued
// addi $t0, $t0,   2       0x21080002
// addi $t0, $t0,   2       0x21080002
// add  $t0, $t0, $t2       0x010a4020
// addi $t1, $t1,   1       0x21290001
// sw   $t0, 0($t1)         0xad280000
// lw   $t2, 0($t1)         0x8d2a0000
// loop:
// sub  $t0, $t0, $t1       0x01094022
// beq  $t0, $t1, end       0x11090001
// j    loop                0x08000006
// end:

// nine instructions
//
module instruction_memory (clk,
                           reset,
                           program_cnt_addr,
                           field_opcode,
                           field_rs,
                           field_rt,
                           field_rd,
                           field_funct,
                           field_addr16,
                           field_addr26
                           );

// i/o
input clk, reset;
input wire [31:0] program_cnt_addr;

output wire [ 5:0] field_opcode;
output wire [ 4:0] field_rs;
output wire [ 4:0] field_rt;
output wire [ 4:0] field_rd;
output wire [ 5:0] field_funct;
output wire [15:0] field_addr16;
output wire [25:0] field_addr26;

// local
reg [31:0] local_instruction_reg;

// 9 instructions
reg [31:0] instructions [0:9];

initial begin
  instructions[0] = 32'h21080002;
  instructions[1] = 32'h21080002;
  instructions[2] = 32'h010a4020;
  instructions[3] = 32'h21290001;
  instructions[4] = 32'had280000;
  instructions[5] = 32'h8d2a0000;
  instructions[6] = 32'h01094022;
  instructions[7] = 32'h11090001;
  instructions[8] = 32'h08000006;
  instructions[9] = 32'hffffffff;
end

// logic
assign field_opcode = local_instruction_reg[31:26];
assign field_rd     = local_instruction_reg[25:21];
assign field_rt     = local_instruction_reg[20:16];
assign field_rs     = local_instruction_reg[15:11];
assign field_funct  = local_instruction_reg[15:11];
assign field_addr16 = local_instruction_reg[15: 0];
assign field_addr26 = local_instruction_reg[25: 0];

always @ (posedge clk) begin

    if (!reset) begin
        //might want to revise this
        local_instruction_reg <= 0;
    end // if !reset
    else begin
        case (program_cnt_addr)
            32'h0000_0000: local_instruction_reg <= instructions[0];
            32'h0000_0004: local_instruction_reg <= instructions[1];
            32'h0000_0008: local_instruction_reg <= instructions[2];
            32'h0000_00c0: local_instruction_reg <= instructions[3];
            32'h0000_0010: local_instruction_reg <= instructions[4];
            32'h0000_0014: local_instruction_reg <= instructions[5];
            32'h0000_0018: local_instruction_reg <= instructions[6];
            32'h0000_001c: local_instruction_reg <= instructions[7];
            32'h0000_0020: local_instruction_reg <= instructions[8];
            32'h0000_0024: local_instruction_reg <= instructions[9];

            // might want to revise this as well
            default: local_instruction_reg <= 0;
        endcase // program_cnt_addr
    end // else !reset
end // always clk

endmodule // instruction_memory
