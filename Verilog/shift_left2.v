// Basic Shift Left Logic. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module shift_left2 (addr_in, shifted_addr_out);

// parameters
parameter input_size = 32;
parameter output_size = 32;

// i/o
input wire [input_size - 1 : 0] addr_in;

output wire [output_size - 1 : 0] shifted_addr_out;

// logic
assign shifted_addr_out[0] = 0;
assign shifted_addr_out[1] = 0;

genvar i;
generate
    for(i = 2; i < output_size; i = i + 1)
    begin : in_to_out_shift
            assign shifted_addr_out[i] = addr_in[i - 2];
    end // for i < output_size
endgenerate // begin : in_to_out_shift

endmodule // shift_left2
