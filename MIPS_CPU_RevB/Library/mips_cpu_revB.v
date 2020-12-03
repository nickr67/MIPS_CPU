// MIPS Top Module
// Nicolas Rodriguez
// Nov. 23, 2020

module mips_cpu_revB (clk, reset);

// i/o
input clk, reset;

// local
wire        control_wire_01w_1;
wire        control_wire_01w_2;
wire        control_wire_01w_3;
wire        control_wire_01w_4;
wire        control_wire_01w_5;
wire [ 1:0] control_wire_02w_6;
wire        control_wire_01w_7;
wire        control_wire_01w_8;
wire        control_wire_01w_9;

wire        local_wire_01w_1;

wire [ 4:0] local_wire_05w_1;
wire [ 4:0] local_wire_05w_2;
wire [ 4:0] local_wire_05w_3;

wire [ 5:0] local_wire_06w_1;
wire [ 5:0] local_wire_06w_2;

wire [15:0] local_wire_16w_1;
wire [25:0] local_wire_26w_1;
wire [27:0] local_wire_28w_1;

wire [31:0] local_wire_32w_1;
wire [31:0] local_wire_32w_2;
wire [31:0] local_wire_32w_3;
wire [31:0] local_wire_32w_4;
wire [31:0] local_wire_32w_5;
wire [31:0] local_wire_32w_6;

// assign wires
// combinational logic
// sequential logic

// instances
program_counter program_counterInstance(
    .clk(clk),
    .reset(reset),
    .branch_addr(local_wire_32w_2),         // input
    .jump_addr(local_wire_28w_1),           // input
    .address_out(local_wire_32w_1),         // output
    .jump_en(control_wire_01w_8),           // input
    .branch_en(control_wire_01w_9),         // input
    .zero_flag(local_wire_01w_1)            // input
    );

instruction_memory instruction_memoryInstance(
    .clk(clk),
    .reset(reset),
    .program_cnt_addr(local_wire_32w_1),    // input
    .field_opcode(local_wire_06w_1),        // output
    .field_rs(local_wire_05w_1),            // output
    .field_rt(local_wire_05w_2),            // output
    .field_rd(local_wire_05w_3),            // output
    .field_funct(local_wire_06w_2),         // output
    .field_addr16(local_wire_16w_1),        // output
    .field_addr26(local_wire_26w_1)         // output
    );

field_extender field_extenderInstance(
    .field_addr16(local_wire_16w_1),        // input
    .field_addr26(local_wire_26w_1),        // input
    .branch_addr(local_wire_32w_2),         // output
    .jump_addr(local_wire_28w_1)            // output
    );

register_file register_fileInstance(
    .clk(clk),
    .reset(reset),
    .reg_dest_sel(control_wire_01w_2),      // input
    .field_reg_src1(local_wire_05w_1),      // input
    .field_reg_src2(local_wire_05w_2),      // input
    .field_reg_dest(local_wire_05w_3),      // input
    .reg_input_data(local_wire_32w_6),      // input
    .reg_out_bus1(local_wire_32w_3),        // output
    .reg_out_bus2(local_wire_32w_4),        // output
    .reg_write_enable(control_wire_01w_1)   // input
    );

alu aluInstance(
    .operand_A(local_wire_32w_3),           // input
    .reg_file_bus2(local_wire_32w_4),       // input
    .sign_ext_imm(local_wire_32w_2),        // input
    .alu_funct(control_wire_02w_6),         // input
    .alu_in_sel(control_wire_01w_7),        // input
    .output_result(local_wire_32w_5),       // output
    .zero_flag(local_wire_01w_1)            // output
    );

data_memory data_memoryInstance(
    .clk(clk),
    .reset(reset),
    .write_enable(control_wire_01w_3),      // input
    .read_enable(control_wire_01w_5),       // input
    .mem_to_reg(control_wire_01w_4),        // input
    .input_addr(local_wire_32w_5),          // input
    .input_data(local_wire_32w_4),          // input
    .output_data(local_wire_32w_6)          // output
    );

control_logic control_logicInstance(
    .opcode(local_wire_06w_1),              // input
    .reg_wr_en(control_wire_01w_1),         // output
    .reg_dest(control_wire_01w_2),          // output
    .mem_wr_en(control_wire_01w_3),         // output
    .mem_to_reg(control_wire_01w_4),        // output
    .mem_read_en(control_wire_01w_5),       // output
    .alu_opcode(control_wire_02w_6),        // output
    .alu_in_sel(control_wire_01w_7),        // output
    .jump_en(control_wire_01w_8),           // output
    .branch_en(control_wire_01w_9)          // output
    );

endmodule // mips_cpu_revB
