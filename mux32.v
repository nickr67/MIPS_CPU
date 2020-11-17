// Mux 32. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module mux32 (input_sel_zero,
              input_sel_one,
              selector,
              output_selection
              );

// i/o
input selector;

input wire [31:0] input_sel_zero;
input wire [31:0] input_sel_one;

output reg [31:0] output_selection;

// logic
always @ ( * ) begin
    if (selector) begin
        output_selection <= input_sel_one;
    end // if selector
    else begin
        output_selection <= input_sel_zero;
    end // else selector
end
endmodule // mux32
