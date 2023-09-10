`timescale 1ns / 1ps

// Gaussian mixture models (GMM)-based classifiers
module gmm_proc #(
   parameter D_WIDTH = 16,
   parameter N_VARIABLE = 4
   ) (
   output logic signed [2*D_WIDTH-1:0] p_r,
   output logic signed [2*D_WIDTH-1:0] p_i,
   input  logic signed [D_WIDTH-1:0] x_r,
   input  logic signed [D_WIDTH-1:0] x_i,
   input  logic signed [D_WIDTH-1:0] u_r,
   input  logic signed [D_WIDTH-1:0] u_i,
   input  logic signed [D_WIDTH-1:0] g_r[N_VARIABLE],
   input  logic signed [D_WIDTH-1:0] g_i[N_VARIABLE],
   input  logic signed [D_WIDTH-1:0] k_r,
   input  logic signed [D_WIDTH-1:0] k_i,
   input  logic k_sload,
   input  logic y_sload,
   input  logic g_rst,
   input  logic ce,
   input  logic clk,
   input  logic rst
   );
   
   localparam Z_WIDTH = 40;
   localparam W_WIDTH = 40;

   logic signed [D_WIDTH:0] s_r;
   logic signed [D_WIDTH:0] s_i;
   logic signed [2*D_WIDTH-1:0] y_r;
   logic signed [2*D_WIDTH-1:0] y_i;
   logic signed [Z_WIDTH-1:0] z_r;
   logic signed [Z_WIDTH-1:0] z_i;
   logic signed [W_WIDTH-1:0] w_r;
   logic signed [W_WIDTH-1:0] w_i;

   // u is mean
   // g is covariance matrix
   // k is weight

   // Multi-mode, multi-variate Gaussian mixture model
   // Si =(Xi-Ui)
   // Yi = Si * Gi
   // Zi = square-acc(Yi), d times
   // Ei = exp(Zi), linear piecewise function
   // Probabitlity Pi = mult-acc(Ei,Ki)

   assign p_r = (2*D_WIDTH)'(w_r);
   assign p_i = (2*D_WIDTH)'(w_i);

   // Mean difference
   csub # (.SIZEIN(D_WIDTH)
        )
   mean_sub
        (
         .clk(clk),
         .rst(rst),
         .ce(ce),
         .ar(x_r),
         .ai(x_i),
         .br(u_r),
         .bi(u_i),
         .sr(s_r),
         .si(s_i)
        );

   // Serial-Parallel Vector-Matrix Multiplier
   gmm_vector_matrix_mult #(
      .D_WIDTH    (D_WIDTH),
      .N_VARIABLE (N_VARIABLE)
   ) vector_matrix_mult (
      .y_r(y_r),
      .y_i(y_i),
      .s_r(s_r),
      .s_i(s_i),
      .g_r(g_r),
      .g_i(g_i),
      .ce(ce),
      .clk(clk),
      .rst(g_rst)
   );

   // Square-Accumulate
   cmacc #(
        .AWIDTH(D_WIDTH), 
        .BWIDTH(D_WIDTH), 
        .SIZEOUT(Z_WIDTH) 
        )
   square_acc
        ( 
         .clk(clk),        
         .sload(y_sload),      
         .ce(ce),      
         .ar(D_WIDTH'(y_r)),  
         .ai(D_WIDTH'(y_i)),  
         .br(D_WIDTH'(y_r)), 
         .bi(D_WIDTH'(y_i)), 
         .pr(z_r), 
         .pi(z_i)  
        );

   // Weight-Average
   cmacc #(
        .AWIDTH(D_WIDTH), 
        .BWIDTH(D_WIDTH), 
        .SIZEOUT(W_WIDTH) 
        )
   weight_avg
        ( 
         .clk(clk),        
         .sload(k_sload),      
         .ce(ce),      
         .ar(D_WIDTH'(z_r)),  
         .ai(D_WIDTH'(z_i)),  
         .br(D_WIDTH'(k_r)), 
         .bi(D_WIDTH'(k_i)), 
         .pr(w_r), 
         .pi(w_i)  
        );

endmodule
