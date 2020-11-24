// Data Memory. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module data_memory (clk,
                    reset,
                    write_enable,
                    read_enable,
                    input_addr,
                    input_data,
                    output_data
                    );

// i/o
input clk, reset, write_enable, read_enable;
input wire [31:0] input_addr;
input wire [31:0] input_data;

output reg [31:0] output_data;

// local
wire [ 7:0] local_addr;
reg  [31:0] local_memory [0:255];

// simulation testing
initial begin
    local_memory[0] = 32'h0611_0010;
    local_memory[1] = 32'h1012_0000;
    local_memory[5] = 32'h1e13_0000;
end // inital

// logic
assign local_addr[7:0] = input_addr[7:0];

integer i;
always @ (negedge clk) begin
    if (!reset) begin
        for (i = 0; i < 255; i = i + 1)
        begin : reset_memory
        local_memory[i] <= 32'h0000_0000;
        end // for i : reset_memory
    end // if !reset
    else if (write_enable) begin
        local_memory[local_addr] <= input_data;
    end // else if write_enable
    else begin
        local_memory[local_addr] <= local_memory[local_addr];
    end // else !reset write_enable
end // always @ negedge clk

always @ ( * ) begin
    if (read_enable) begin
        output_data <= local_memory[local_addr];
    end // if read_enable
    else begin
        output_data <= 32'hzzzz_zzzz;
    end // else read_enable
end // always @ *

endmodule // data_memory
