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
    output wire [11:0] bram_addr,
    output wire [L-1:0] latent_neurons
    );
    
    //neurons in hiddenlayer, and latentspacce
    wire [H-1:0] hidden_neurons;
    wire [11:0] bram_addr_internal; //internal signal for bram address, because reg cannot be used inside an always block
    
    assign bram_addr = bram_addr_internal; //assigning internal bram adddress to the output signal 
    
    //instantiating input to hidden inference
    input_to_hidden input_hidden_infer (
        .input_neurons(input_neurons),
        .hidden_neurons(hidden_neurons),
        .bram_data(bram_data),
        .bram_addr(bram_addr_internal)
    );
    
    //instantiating hiddeen to latent inference
    hidden_to_latent hidden_latent_infer (
        .hidden_neurons(hidden_neurons),
        .latent_neurons(latent_neurons),
        .bram_data(bram_data),
        .bram_addr(bram_addr_internal)    
    );
    
endmodule
