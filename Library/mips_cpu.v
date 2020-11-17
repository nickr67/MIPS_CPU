// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Mon Nov 16 19:34:42 2020"

module mips_cpu(
	CLOCK0_50,
	RESET_N
);


input wire	CLOCK0_50;
input wire	RESET_N;

wire	[3:0] ALU_FUNCT;
wire	ALU_IN_SEL;
wire	[1:0] ALU_OP;
wire	[31:0] ALU_RESULT;
wire	[31:0] BRANCH_ADDR;
wire	BRANCH_EN;
wire	[15:0] FIELD_ADDR16;
wire	[31:0] FIELD_ADDR16_EXT;
wire	[25:0] FIELD_ADDR26;
wire	[31:0] FIELD_ADDR_EXT;
wire	[5:0] FIELD_FUNCT;
wire	[5:0] FIELD_OPCODE;
wire	[4:0] FIELD_RD;
wire	[4:0] FIELD_RS;
wire	[4:0] FIELD_RT;
wire	[31:0] JUMP_ADDR;
wire	JUMP_EN;
wire	MEM_RD_EN;
wire	MEM_TO_REG;
wire	MEM_WR_EN;
wire	[31:0] NEW_PC_VAL;
wire	[31:0] PC_PLUS_FOUR;
wire	REG_DEST;
wire	[31:0] REG_READ_ONE;
wire	[31:0] REG_READ_TWO;
wire	REG_WR_EN;
wire	[31:0] REG_WRITE_BACK;
wire	ZERO_FLAG;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[4:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[27:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;





program_counter	b2v_inst(
	.clk(CLOCK0_50),
	.reset(RESET_N),
	.new_count(NEW_PC_VAL),
	.current_count(SYNTHESIZED_WIRE_10));


sign_extend	b2v_inst1(
	.input_16(FIELD_ADDR16),
	.output_32(SYNTHESIZED_WIRE_0));


adder	b2v_inst10(
	.operand_A(PC_PLUS_FOUR),
	.operand_B(FIELD_ADDR_EXT),
	.output_sum(BRANCH_ADDR));


shift_left2	b2v_inst11(
	.addr_in(SYNTHESIZED_WIRE_0),
	.shifted_addr_out(FIELD_ADDR16_EXT));
	defparam	b2v_inst11.input_size = 32;
	defparam	b2v_inst11.output_size = 32;


mux5	b2v_inst12(
	.selector(REG_DEST),
	.input_sel_one(FIELD_RD),
	.input_sel_zero(FIELD_RT),
	.output_selection(SYNTHESIZED_WIRE_4));


alu_control_logic	b2v_inst13(
	.input_aluop(ALU_OP),
	.input_funct(FIELD_FUNCT)
	);


control_logic	b2v_inst14(
	.opcode(FIELD_OPCODE),
	.reg_wr_en(REG_WR_EN),
	.reg_dest(REG_DEST),
	.mem_wr_en(MEM_WR_EN),
	.mem_to_reg(MEM_TO_REG),
	.mem_read_en(MEM_RD_EN),
	.alu_in_sel(ALU_IN_SEL),
	.jump_en(JUMP_EN),
	.branch_en(BRANCH_EN),
	.alu_opcode(ALU_OP));


alu	b2v_inst15(
	
	.operand_A(REG_READ_ONE),
	.operand_B(SYNTHESIZED_WIRE_1),
	.zero_flag(ZERO_FLAG),
	.output_result(ALU_RESULT));


mux32	b2v_inst16(
	.selector(ALU_IN_SEL),
	.input_sel_one(FIELD_ADDR16_EXT),
	.input_sel_zero(REG_READ_TWO),
	.output_selection(SYNTHESIZED_WIRE_1));


data_memory	b2v_inst17(
	.clk(CLOCK0_50),
	.reset(RESET_N),
	.write_enable(MEM_WR_EN),
	.read_enable(MEM_RD_EN),
	.input_addr(ALU_RESULT),
	.input_data(REG_READ_TWO),
	.output_data(SYNTHESIZED_WIRE_2));


mux32	b2v_inst18(
	.selector(MEM_TO_REG),
	.input_sel_one(SYNTHESIZED_WIRE_2),
	.input_sel_zero(ALU_RESULT),
	.output_selection(REG_WRITE_BACK));

assign	SYNTHESIZED_WIRE_9 = BRANCH_EN & ZERO_FLAG;


instruction_memory	b2v_inst2(
	.clk(CLOCK0_50),
	.reset(RESET_N),
	.program_cnt_addr(SYNTHESIZED_WIRE_10),
	.field_addr16(FIELD_ADDR16),
	.field_addr26(FIELD_ADDR26),
	.field_funct(FIELD_FUNCT),
	.field_opcode(FIELD_OPCODE),
	.field_rd(FIELD_RD),
	.field_rs(FIELD_RS),
	.field_rt(FIELD_RT));


register_file	b2v_inst3(
	.clk(CLOCK0_50),
	.reset(RESET_N),
	.reg_write_enable(REG_WR_EN),
	.field_reg_dest(SYNTHESIZED_WIRE_4),
	.field_reg_src1(FIELD_RS),
	.field_reg_src2(FIELD_RT),
	.reg_input_data(REG_WRITE_BACK),
	.reg_out_bus1(REG_READ_ONE),
	.reg_out_bus2(REG_READ_TWO));


adder	b2v_inst4(
	.operand_A(SYNTHESIZED_WIRE_5),
	.operand_B(SYNTHESIZED_WIRE_10),
	.output_sum(PC_PLUS_FOUR));


shift_left2	b2v_inst5(
	.addr_in(FIELD_ADDR26),
	.shifted_addr_out(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst5.input_size = 26;
	defparam	b2v_inst5.output_size = 28;


constant_four	b2v_inst6(
	.plus_four_pc(SYNTHESIZED_WIRE_5));


concatenator	b2v_inst7(
	.input_A(SYNTHESIZED_WIRE_7),
	.input_B(PC_PLUS_FOUR),
	.output_concat(JUMP_ADDR));


mux32	b2v_inst8(
	.selector(JUMP_EN),
	.input_sel_one(JUMP_ADDR),
	.input_sel_zero(SYNTHESIZED_WIRE_8),
	.output_selection(NEW_PC_VAL));


mux32	b2v_inst9(
	.selector(SYNTHESIZED_WIRE_9),
	.input_sel_one(BRANCH_ADDR),
	.input_sel_zero(PC_PLUS_FOUR),
	.output_selection(SYNTHESIZED_WIRE_8));


endmodule
