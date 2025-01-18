`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2025 14:38:00
// Design Name: 
// Module Name: hidden_to_latent
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hidden_to_latent #(parameter N = 9, parameter H = 5, parameter L = 2)(
    input wire [H-1:0] hidden_neurons,
    output wire [L-1:0] latent_neurons,
    input wire [7:0] bram_data,
    output reg [11:0] bram_addr
     );
     
     //weights and biases for hidden-to-latent connections loaded from bram
    reg signed [7:0] weight_hidden_latent [L-1:0][H-1:0];
    reg signed [7:0] bias_latent [L-1:0];
    
    integer i, j;
    always @(*) begin
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 5; j = j + 1) begin
                weight_hidden_latent[i][j] = bram_data; //loading weights from bram
                bram_addr <= (i * 5 + j + 45);          //address calculation
            end
            bias_latent[i] = bram_data;               //loading biases from bram
            bram_addr <= (2 * 5 + i + 45);             //address calculation
        end
    end
    
    genvar k, m;
    generate
        for (k=0; k<L; k=k+1) begin
            for (m=0; m<H; m=m+1) begin
                assign latent_neurons[k] = $signed(hidden_neurons[m]) * $signed(weight_hidden_latent[k][m]) + bias_latent[k];
            end
        end
    endgenerate
     
endmodule
