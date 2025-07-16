module light(clk, out);
    input clk;
    output reg[2:0] out;
    parameter s0=0, s1=1, s2=2;
    parameter Red= 3'b100, Yellow=3'b010, Green=3'b001;
        // Assuming s0 corresponds to RED light
        // Assuming s1 corresponds to YELLOW light
        // Assuming s2 corresponds to GREEN light
        /* Assuming the sequence starts with green, followed by red,
           and then yellow, and it continues in a loop. */
    reg [1:0] state;
    always @(posedge clk)
        case(state)
            s0:state<=s2;
            s1:state<=s0;
            s2:state<=s1;
            default: state<=s0;
        endcase
    always@(state)
        case(state)
            s0:out=Red;
            s1:out=Yellow;
            s2:out=Green;
        endcase

endmodule
