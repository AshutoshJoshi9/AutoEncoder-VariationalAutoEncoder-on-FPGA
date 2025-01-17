`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2025 20:11:32
// Design Name: 
// Module Name: input_to_hidden
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


module input_to_hidden #(parameter N = 9, parameter H = 5, parameter L = 2)(
    input wire [N-1:0] input_neurons,
    output wire [H-1:0] hidden_neurons,
    input wire [7:0] bram_data,
    output reg [11:0] bram_addr  //12 bit for scalability in future for bigger architecturees
    );
    
    //weights and biases for inp-to-hidd connections loaded from bram
    reg signed [7:0] weight_input_hidden [H-1:0][N-1:0];
    reg signed [7:0] bias_hidden [H-1:0];
    
    integer i,j;
    always @(*) begin
        for (i=0; i<H; i=i+1) begin
            for (j=0; j<N; j=j+1) begin
                weight_input_hidden[i][j] = bram_data; //loading weights from bram
                bram_addr <= (i * N + j); //addr calculation
            end
            bias_hidden[i] = bram_data;   //loading biases from bram
            bram_addr <= (H * N + i);   //addr calculation
        end
    end
    
    genvar k;
    generate
        for (k=0; k<H; k=k+1) begin
            assign hidden_neurons[k] = $signed(input_neurons) * $signed(weight_input_hidden[k][]) + bias_hidden[k]; //rewrite this 
        end
    endgenerate
    
endmodule
