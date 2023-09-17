`timescale 1ns / 1ps

//  Complex exponential calculation using a Look-Up Table (LUT) 

module complex_exponential (
    input [31:0] exponent,
    output reg [31:0] result
);

// Define LUT parameters
localparam LUT_SIZE = 256;
localparam LUT_BITS = 8;
localparam MAX_EXPONENT = 127; // Max exponent for single-precision

// Create LUT for the exponentials
reg [31:0] lut [0:LUT_SIZE-1];
initial begin
    // Fill the LUT with precomputed exponential values
    for (int i = 0; i < LUT_SIZE; i = i + 1) begin
        lut[i] = $realtobits(2**((i - LUT_SIZE/2) * MAX_EXPONENT / (LUT_SIZE/2)));
    end
end

// Calculate the index for the LUT
wire [LUT_BITS-1:0] lut_index;
assign lut_index = exponent[7:0] - 127;

// Output the result using the LUT
always @(exponent) begin
    if (lut_index >= 0 && lut_index < LUT_SIZE) begin
        result = lut[lut_index];
    end else if (exponent > MAX_EXPONENT) begin
        // Handle overflow
        result = 32'h7F800000; // Set result to +INF
    end else begin
        // Handle underflow
        result = 32'h00000001; // Set result to smallest denormalized value
    end
end

endmodule
