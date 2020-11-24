// MIPS Register File
// Nicolas Rodriguez
// Nov 23, 2020

module register_file (clk,
                      reset,
                      reg_dest_sel,
                      field_reg_src1,
                      field_reg_src2,
                      field_reg_dest,
                      reg_input_data,
                      reg_out_bus1,
                      reg_out_bus2,
                      reg_write_enable
                      );

// i/o
input clk, reset, reg_write_enable, reg_dest_sel;
input wire [ 4:0] field_reg_src1;
input wire [ 4:0] field_reg_src2;
input wire [ 4:0] field_reg_dest;
input wire [31:0] reg_input_data;

output reg [31:0] reg_out_bus1;
output reg [31:0] reg_out_bus2;

// local
reg [31:0] local_register [0:31];
reg [ 4:0] dest_reg;

// combinational logic
always @ ( * ) begin
    if (reg_dest_sel)
        dest_reg = field_reg_dest;
    else
        dest_reg = field_reg_src2;
end // always @ *

// sequential logic
always @ (negedge clk) begin

    if (!reset) begin
        reg_out_bus1 <= 32'hzzzz_zzzz;
        reg_out_bus2 <= 32'hzzzz_zzzz;

        local_register[ 0] <= 32'h0000_0000;
        local_register[ 1] <= 32'h0000_0000;
        local_register[ 2] <= 32'h0000_0000;
        local_register[ 3] <= 32'h0000_0000;
        local_register[ 4] <= 32'h0000_0000;
        local_register[ 5] <= 32'h0000_0000;
        local_register[ 6] <= 32'h0000_0000;
        local_register[ 7] <= 32'h0000_0000;

        local_register[ 8] <= 32'h0000_0000;
        local_register[ 9] <= 32'h0000_0000;
        local_register[10] <= 32'h0000_0000;
        local_register[11] <= 32'h0000_0000;
        local_register[12] <= 32'h0000_0000;
        local_register[13] <= 32'h0000_0000;
        local_register[14] <= 32'h0000_0000;
        local_register[15] <= 32'h0000_0000;

        local_register[16] <= 32'h0000_0000;
        local_register[17] <= 32'h0000_0000;
        local_register[18] <= 32'h0000_0000;
        local_register[19] <= 32'h0000_0000;
        local_register[20] <= 32'h0000_0000;
        local_register[21] <= 32'h0000_0000;
        local_register[22] <= 32'h0000_0000;
        local_register[23] <= 32'h0000_0000;

        local_register[24] <= 32'h0000_0000;
        local_register[25] <= 32'h0000_0000;
        local_register[26] <= 32'h0000_0000;
        local_register[27] <= 32'h0000_0000;
        local_register[28] <= 32'h0000_0000;
        local_register[29] <= 32'h0000_0000;
        local_register[30] <= 32'h0000_0000;
        local_register[31] <= 32'h0000_0000;

    end // if !reset
    else begin
        reg_out_bus1 <= local_register[field_reg_src1];
        reg_out_bus2 <= local_register[field_reg_src2];

        if (reg_write_enable) begin
            local_register[dest_reg] <= reg_input_data;
        end // if reg_write_enable
        else begin
            local_register[dest_reg] <= local_register[dest_reg];
        end // else reg_write_enable
    end // else !reset
end // always negedge clk

endmodule // register_file
