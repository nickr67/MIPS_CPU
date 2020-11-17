// Program Counter. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module program_counter (clk, reset, current_count, new_count);

// i/o
input clk, reset;
input wire [31:0] new_count;

output reg [31:0] current_count;


// logic

always @ (posedge clk) begin

    if (!reset) begin
        current_count <= 0;
    end // if !reset
    else begin
        current_count <= new_count;
    end // else !reset
end // always clk

endmodule // program_counter
