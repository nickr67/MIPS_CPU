// Basic Adder. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module adder (operand_A, operand_B, output_sum);

// i/o
input wire [31:0] operand_A;
input wire [31:0] operand_B;

output reg [31:0] output_sum;

// logic
always @ ( * ) begin
  output_sum <= operand_A + operand_B;
end

endmodule // adder
