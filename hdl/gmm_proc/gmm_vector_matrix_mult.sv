`timescale 1ns / 1ps

// Serial-Parallel Vector-Matrix Multiplier
module gmm_vector_matrix_mult #(
   parameter D_WIDTH = 16,
   parameter N_VARIABLE = 4
   ) (
   output logic signed [2*D_WIDTH-1:0] y_r,
   output logic signed [2*D_WIDTH-1:0] y_i,
   input  logic signed [D_WIDTH-1:0] s_r,
   input  logic signed [D_WIDTH-1:0] s_i,
   input  logic signed [D_WIDTH-1:0] g_r[N_VARIABLE],
   input  logic signed [D_WIDTH-1:0] g_i[N_VARIABLE],
   input  logic ce,
   input  logic clk,
   input  logic rst
   );

   logic signed [2*D_WIDTH:0]  multaddr[N_VARIABLE];
   logic signed [2*D_WIDTH:0]  multaddi[N_VARIABLE];

   // Yi = Si * Gi
   // s is mean difference value
   // g is covariance matrix

   assign y_r = (2*D_WIDTH)'(multaddr[N_VARIABLE-1]);
   assign y_i = (2*D_WIDTH)'(multaddi[N_VARIABLE-1]);

   generate for (genvar i=0; i<N_VARIABLE; i++) begin : loop

      gmm_mult_add # (.SIZEIN(D_WIDTH)
           )
      mult_add_i
           (
            .clk(clk),
            .rst(rst),
            .ce(ce),
            .ar(s_r),
            .ai(s_i),
            .br(g_r[i]),
            .bi(g_i[i]),
            .cr(i==0 ? '0 : multaddr[i-1]),
            .ci(i==0 ? '0 : multaddi[i-1]),
            .multaddr(multaddr[i]),
            .multaddi(multaddi[i])
           );

   end endgenerate

endmodule
