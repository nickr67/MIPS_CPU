// MIPS Program Counter
// Nicolas Rodriguez
// Nov. 22, 2020

/*
This module will actually be independent of program_counter.
This will let the ALU have access to the sign extended
immediate value without having to make a new sign extender.
*/

module field_extender ( field_addr16,
                        field_addr26,
                        branch_addr,
                        jump_addr);

// i/o
input  wire [15:0] field_addr16;
input  wire [25:0] field_addr26;

output reg  [31:0] branch_addr;
output reg  [27:0] jump_addr;

// combinational logic
always @ ( * ) begin

    jump_addr = {field_addr26, 2'b00};

    if (field_addr16[15])
        branch_addr = {field_addr16, 16'hffff};
    else
        branch_addr = {field_addr16, 16'h0000};

end // always @ *

endmodule // field_extender
