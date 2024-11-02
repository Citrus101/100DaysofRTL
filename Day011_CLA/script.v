module CLA
    #(parameter WIDTH = 3)(
    input wire [WIDTH - 1 : 0] a,
    input wire [WIDTH - 1 : 0] b,
    input wire Cin,
    output wire [WIDTH - 1 : 0] sum,
    output wire Cout 
);

    wire [WIDTH - 1 : 0] g;
    wire [WIDTH - 1 : 0] p;
    wire [WIDTH : 0] c;
    assign c[0] = Cin;

    assign g = a & b;
    assign p = a ^ b;

    genvar i;
    generate
        for(i = 0; i < WIDTH; i = i + 1) begin : carry_calc
            assign c[i + 1] = g[i] | (p[i] & c[i]);
        end
    endgenerate
    
  
    assign sum = g ^ c[4 : 1];
    assign Cout = c[WIDTH];
    
endmodule
