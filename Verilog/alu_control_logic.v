// Basic ALU Control Logic. MIPS CPU
// Nicolas Rodriguez
// Nov 13, 2020

module alu_control_logic (input_aluop, input_funct, output_alufunct);

// i/o
input wire [1:0] input_aluop;
input wire [5:0] input_funct;

output reg [3:0] output_alufunct;

// logic
always @ ( * ) begin

    if (input_aluop == 2'b00) begin
        output_alufunct <= 4'b0010;
    end // perform addition

    else if (input_aluop[0] == 1'b1) begin
        output_alufunct <= 4'b0110;
    end // perform subtraction

    else if (input_aluop[1] == 1'b1) begin
        case (input_funct)
            5'b00000: output_alufunct <= 4'b0010;
            5'b00010: output_alufunct <= 4'b0110;

            default:  output_alufunct <= 4'bzzzz;
            // the following are unecessary for the
            // completion of this lab
            //5'b00100: output_alufunct <= 4'b0000;
            //5'b00101: output_alufunct <= 4'b0001;
            //5'b01010: output_alufunct <= 4'b0111;

        endcase // input_funct
    end // Refer to funct field

    else begin
        output_alufunct <= output_alufunct;
    end // else input_aluop
end // @ *

endmodule // alu_control_logic
