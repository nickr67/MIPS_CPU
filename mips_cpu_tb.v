module mips_cpu_tb();

reg clk;
reg reset;

always
	#5 clk <= ~clk;

mips_cpu mips_cpuinstance(
    .CLOCK0_50(clk),
    .RESET_N(reset)
    );

initial	begin
	$dumpfile("mips_cpu.vcd");
	$dumpvars(0, mips_cpu_tb);

	clk <= 1'b0;
	reset <= 1'b0;
	#7 reset <= 1'b1;

	#600

    $finish;

end // initial

endmodule // mips_cpu_tb
