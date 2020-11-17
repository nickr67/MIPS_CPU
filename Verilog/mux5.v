// Mux 5. MIPS CPU
// Nicolas Rodriguez
// Nov 14, 2020

module mux5 (input_sel_zero,
              input_sel_one,
              selector,
              output_selection
              );

// i/o
input selector;

input wire [4:0] input_sel_zero;
input wire [4:0] input_sel_one;

output reg [4:0] output_selection;

// logic
always @ ( * ) begin
    if (selector) begin
        output_selection <= input_sel_one;
    end // if selector
    else begin
        output_selection <= input_sel_zero;
    end // else selector
end
endmodule // mux5
