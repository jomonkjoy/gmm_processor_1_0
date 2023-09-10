`timescale 1ns / 1ps

//  Complex Adder
(* use_dsp="yes" *)
module cadd # (
                parameter SIZEIN = 16
               )
               (
                input clk,
                input ce,    // Clock enable
                input rst,   // Reset
                input signed [SIZEIN-1:0] ar, ai,
                input signed [SIZEIN-1:0] br, bi,
                output signed [SIZEIN:0]  sr, si
                );

reg signed [SIZEIN-1:0]	ai_d, bi_d;
reg signed [SIZEIN-1:0]	ar_d, br_d;
reg signed [SIZEIN:0]	sr_dd, si_dd;

   // Real part
   //
always @(posedge clk) begin
   if (rst) begin
      ar_d   <= '0;
      br_d   <= '0;
      sr_dd  <= '0;
   end else if (ce) begin
      ar_d   <= ar;
      br_d   <= br;
      sr_dd  <= ar_d + br_d;
   end
end

   // Imaginary part
   //
always @(posedge clk) begin
   if (rst) begin
      ai_d   <= '0;
      bi_d   <= '0;
      si_dd  <= '0;
   end else if (ce) begin
      ai_d   <= ai;
      bi_d   <= bi;
      si_dd  <= ai_d + bi_d;
   end
end

assign sr = sr_dd;
assign si = si_dd;

endmodule // cadd
// The following is an instantiation template for cadd
/*
cadd # (.SIZEIN(16)
        )
your_instance_name
        (
         .clk(clk),
         .rst(rst),
         .ce(ce),
         .ar(ar),
         .ai(ai),
         .br(br),
         .bi(bi),
         .sr(sr),
         .si(si)
        );
*/

				
			
