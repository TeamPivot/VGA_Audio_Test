`timescale 1ns / 1ps

module VGA_Controller(
    input clk25MHz,
    output reg hsync,
    output reg vsync,
    output reg [2:0] rgb
    );

reg [9:0] hcount;
reg [9:0] vcount;

reg [6:0] column_count;
reg [2:0] current_color;

always @ (posedge clk25MHz)
begin
	if(hcount == 799)
	begin
		hcount <= 0;
		if(vcount == 524)
			vcount <= 0;
		else
			vcount <= vcount + 1;
	end
	else
		hcount <= hcount + 1;
	
	if(vcount >= 490 && vcount < 492)
		vsync <= 0;
	else
		vsync <= 1;
		
	if(hcount >= 656 && hcount < 752)
		hsync <= 0;
	else
		hsync <= 1;
		
	if(hcount < 640 && vcount < 480)
	begin
		if(column_count < 80)
			column_count <= column_count + 1;
		else
		begin
			column_count <= 0;
			current_color <= current_color + 1;
		end
		
		rgb <= current_color;
	end
	else
	begin
		rgb <= 3'b000;
		current_color <= 3'b000;
		column_count <= 7'b0000000;
	end
end

initial
begin
	hcount = 0;
	vcount = 0;
	current_color = 3'b000;
	column_count = 0;
end

endmodule
