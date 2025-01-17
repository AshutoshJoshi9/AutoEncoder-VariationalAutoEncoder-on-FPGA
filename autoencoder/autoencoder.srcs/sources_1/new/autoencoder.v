`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2025 19:47:03
// Design Name: 
// Module Name: autoencoder
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


module autoencoder #(parameter N = 9, parameter H = 5, parameter L = 2)(
    input clk,
    input rst,
    input wire [N-1:0] input_neurons,
    input wire [7:0] bram_data,
    output wire [L-1:0] latent_space
    );
    
    //neurons in hiddenlayer, and latentspacce
    wire [H-1:0] hidden_neurons;
    wire [L-1:0] latent_neurons;
    
    
endmodule
