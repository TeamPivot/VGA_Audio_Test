`timescale 1ns / 1ps

module ROM(
    input [4:0] address,
    output reg [3:0] data
    );

	//This ROM contains 32 samples of y = sin(x) from x = 0 to x = 2*pi.
	always @ (address)
	begin
		case(address)
			0: data = 4'h8;
			1: data = 4'h9;
			2: data = 4'hA;
			3: data = 4'hC;
			4: data = 4'hD;
			5: data = 4'hE;
			6: data = 4'hE;
			7: data = 4'hF;
			8: data = 4'hF;
			9: data = 4'hF;
			10: data = 4'hE;
			11: data = 4'hE;
			12: data = 4'hD;
			13: data = 4'hC;
			14: data = 4'hA;
			15: data = 4'h9;
			16: data = 4'h7;
			17: data = 4'h6;
			18: data = 4'h5;
			19: data = 4'h3;
			20: data = 4'h2;
			21: data = 4'h1;
			22: data = 4'h1;
			23: data = 4'h0;
			24: data = 4'h0;
			25: data = 4'h0;
			26: data = 4'h1;
			27: data = 4'h1;
			28: data = 4'h2;
			29: data = 4'h3;
			30: data = 4'h5;
			31: data = 4'h6;
			default: data = 4'hX;
		endcase
	end
endmodule
