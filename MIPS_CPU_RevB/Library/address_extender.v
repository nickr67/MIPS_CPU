// MIPS Program Counter
// Nicolas Rodriguez
// Nov. 22, 2020

module address_extender (   field_addr16,
                            field_addr26,
                            branch_addr,
                            jump_addr);

// i/o
input  wire [15:0] field_addr16;
input  wire [25:0] field_addr26;

output reg  [31:0] branch_addr;
output reg  [27:0] jump_addr;

// local
wire [ 1:0] shift_left_two   =  2'b00;
wire [15:0] sign_extend_zero = 16'h0000;
wire [15:0] sign_extend_one  = 16'hffff;

// combinational logic
always @ ( * ) begin

    jump_addr <= {shift_left_two, jump_addr};

    if (field_addr16[15])
        branch_addr <= {field_addr16, sign_extend_one};
    else
        branch_addr <= {field_addr16, sign_extend_zero};

end // always @ *

endmodule // address_extender
