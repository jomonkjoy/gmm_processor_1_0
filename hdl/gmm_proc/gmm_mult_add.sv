`timescale 1ns / 1ps

//  Complex Multiply Add (a * b) + c
(* use_dsp="yes" *)
module gmm_mult_add # (
                parameter SIZEIN = 16
               )
               (
                input clk,
                input ce,    // Clock enable
                input rst,   // Reset
                input signed [SIZEIN-1:0] ar, ai,
                input signed [SIZEIN-1:0] br, bi,
                input signed [2*SIZEIN:0] cr, ci,
                output signed [2*SIZEIN:0]  multaddr, multaddi
                );

logic signed [2*SIZEIN:0] pr, pi;

cmult # (.AWIDTH(SIZEIN),
         .BWIDTH(SIZEIN)
        )
mult
        (
         .clk(clk),
         .ce(ce),
         .ar(ar),
         .ai(ai),
         .br(br),
         .bi(bi),
         .pr(pr),
         .pi(pi)
        );

cadd # (.SIZEIN(2*SIZEIN)
        )
add
        (
         .clk(clk),
         .rst(rst),
         .ce(ce),
         .ar(pr),
         .ai(pi),
         .br(cr),
         .bi(ci),
         .sr(multaddr),
         .si(multaddi)
        );

endmodule
