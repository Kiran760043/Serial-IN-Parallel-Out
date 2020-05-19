///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Test Bench for Serial In Parallel Out (SIPO)
// Engineer: kiran
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_bench_SIPO();

        parameter N = 8;        //depth of the parallel Register
    //input for DUT
        reg clk;
        reg rst;
        reg in;
    //outputs from DUT
        wire [N-1:0]out;
        wire [N-1:0]outP;
        
        
    SIPO DUT (.clk(clk),.rst(rst),.in(in),.out(out),.outP(outP));
    
    initial
        begin
            $display($time," << Simulation Results >>");
            $monitor($time,"clk=%b, rst=%b, in=%b, out=%b, outP=%b", clk, rst, in, out, outP);
        end
    
    always #5 clk = ~clk;
    
    always #10 in = ~in;  
      
    initial
        begin
            clk = 1;
            in  = 1;
            rst = 1;
            #10;
            rst = 0;
            #360;                   //change the simulation rumtime accordingly
            $finish;
        end
        
endmodule
