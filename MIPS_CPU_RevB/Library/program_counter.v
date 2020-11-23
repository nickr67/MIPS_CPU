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
                        field_addr16,
                        field_addr26,
                        address_out,
                        jump_en,
                        branch_en,
                        zero_flag);

// i/o
input clk, reset;
input jump_en, branch_en, zero_flag;

output reg  [31:0] address_out;

// local
wire  [ 3:0] local_wire_4w;
wire  [25:0] jump_addr;
wire  [31:0] branch_addr;
wire  [31:0] count_plus_four;

reg   [31:0] local_reg;

// assign wires
assign count_plus_four      = local_reg + 4;
assign local_wire_4w[3:0]   = count_plus_four[31:28];

// combinational logic
always @ ( * ) begin

    if (!reset)
        local_reg <= 0;

    else begin
        if (jump_en)
            local_reg <= {jump_addr, local_wire_4w};

        else if (branch_en & zero_flag)
            local_reg <= count_plus_four + branch_addr;

        else
            local_reg <= local_reg + 4;
    end // else !reset
end // always @ *

// sequential logic
always @ (posedge clk) begin

    if (!reset) address_out <= 0;
    else        address_out <= local_reg;

end // always @ posedge clk

// instances
address_extender address_extenderInstance(
    .field_addr16(field_addr16),
    .field_addr26(field_addr26),
    .branch_addr(branch_addr),
    .jump_addr(jump_addr)
    );

endmodule // program_counter
