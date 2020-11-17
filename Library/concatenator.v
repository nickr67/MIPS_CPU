// Concatenator. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module concatenator (input_A, input_B, output_concat);

// i/o
input wire [27:0] input_A;
input wire [31:0] input_B;

output wire [31:0] output_concat;

// logic
assign output_concat[27:0] = input_A[27:0];

assign output_concat[28] = input_B[28];
assign output_concat[29] = input_B[29];
assign output_concat[30] = input_B[30];
assign output_concat[31] = input_B[31];

endmodule // concatenator
