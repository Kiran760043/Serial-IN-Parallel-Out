///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Serial In Parallel Out (SIPO)
// Engineer: kiran
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module SIPO(clk,rst,in,out,outP);

    parameter N = 8;                 //depth of the parallel register, change based on requirement

    input  wire clk;
    input  wire rst;
    input  wire in;
    output reg [N-1:0] out;           //parallel output
    output wire[N-1:0] outP;          //serial to parallel Converter Output 
    
    reg start;
    reg [N:0]count;                  
    
    always@(posedge clk, posedge rst) 
        begin
            if(rst) begin
                out   <= 4'h0;
                start <= 1;
            end else begin
                start     <= 0;
                out[N-1]  <= in;
                out[N-2:0]<=out[N-1:1];
            end
         end
         
         
     always@(posedge clk)
        begin
            if(start | count == N) begin
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
      
      assign outP = (count==N) ? out : 0;          
    
endmodule
