module full_adder (
    input wire a,
    input wire b,
    input wire Cin,
    output wire sum,
    output wire Cout
);

    assign sum = a ^ b ^ Cin;
    assign Cout = (a & b) + (Cin & (a ^ b));
    
endmodule

module parralel_adder_subtractor#(parameter WIDTH = 4)(
   input wire [WIDTH - 1 : 0] a,
   input wire [WIDTH - 1 : 0] b,
   input wire Sub, //Sub high = a - b else a + b
   output wire [WIDTH - 1 : 0] sum,
   output wire Cout
);

    wire [WIDTH : 0] carry;
    assign carry[0] = Sub;
    assign Cout = carry[WIDTH];
    genvar i;

    generate 
        for(i = 0;i < WIDTH; i = i + 1) begin : fa_inst
            full_adder inst(
                .a(a[i]),
                .b(b[i] ^ Sub),
                .Cin(carry[i]),
                .sum(sum[i]),
                .Cout(carry[i + 1])
            );
        end
    endgenerate
    
endmodule
