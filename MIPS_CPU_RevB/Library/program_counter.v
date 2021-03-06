// MIPS Program Counter
// Nicolas Rodriguez
// Nov. 22, 2020

/*
program counter updates on rising edge of the clock

memory is byte-wise addressed
a word is 4 bytes so the program counter
is always 00 on the last two bits

jump address
    bits allocated for immediate jump is 26
    shift two to the left (pad with zeroes)
    keep the last four bits of the program
    counter plus 4

branch address
    16 bits allocated in branch instruction
    sign extend for adding and subtracting
    from current program counter plus four

otherwise
    next address is program counter plus four
*/

module program_counter (clk,
                        reset,
                        branch_addr,
                        jump_addr,
                        address_out,
                        jump_en,
                        branch_en,
                        zero_flag);

// i/o
input clk, reset;
input jump_en, branch_en, zero_flag;

input  wire  [25:0] jump_addr;
input  wire  [31:0] branch_addr;
output reg   [31:0] address_out;

// local
wire  [ 3:0] local_wire_4w;
wire  [31:0] count_plus_four;

reg   [31:0] current_count;

// assign wires
assign count_plus_four      = current_count + 4;
assign local_wire_4w[3:0]   = count_plus_four[31:28];

// combinational logic
always @ ( * ) begin

    if (!reset)
        current_count = 0;

    else begin
        if (jump_en)
            current_count = {jump_addr, local_wire_4w};

        else if (branch_en & zero_flag)
            current_count = count_plus_four + branch_addr;

        else
            current_count = count_plus_four;
    end // else !reset
end // always @ *

// sequential logic
always @ (posedge clk) begin

    if (!reset) address_out <= 0;
    else        address_out <= current_count;

end // always @ posedge clk

// instances
//field_extender field_extenderInstance(
//    .field_addr16(field_addr16),
//    .field_addr26(field_addr26),
//    .branch_addr(branch_addr),
//    .jump_addr(jump_addr)
//    );

endmodule // program_counter
