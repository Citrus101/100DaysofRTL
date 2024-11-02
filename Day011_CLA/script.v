module CLA
    #(WIDTH = 3)(
    input wire a[WIDTH - 1 : 0],b[WIDTH - 1 : 0],
    input wire Cin,
    output reg sum[WIDTH - 1 : 0],
    output reg Cout 
);

    wire g[WIDTH - 1 : 0];
    wire p[WIDTH - 1 : 0];
    wire c[WIDTH : 0];
    assign c[0] = Cin;

    assign g = a & b;
    assign p = a ^ b;

    genvar i;
    generate
        for(i = 0; i <= WIDTH; i = i + 1) c[i + 1] = g[i] + (p[i] & c[i - 1]);
    endgenerate

    assign sum = g ^ c[4 : 1];
    assign Cout = c[WIDTH;
    
endmodule