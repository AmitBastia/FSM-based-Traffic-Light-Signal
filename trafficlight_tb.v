`include "trafficlight.v"
`timescale 10ns / 1ps
module test;
    reg clk;
    wire [2:0] out;
    light uut (.clk(clk), .out(out));
    always #5 clk=~clk;                  // A clock of time period 50ns is generated
    initial
        begin
            clk=1'b0;
            #100 $finish;
        end
    initial
        begin
            $dumpfile("dump.vcd");
            $dumpvars;
            $monitor($time, "R-Y-G = %b",out);
        end

endmodule
