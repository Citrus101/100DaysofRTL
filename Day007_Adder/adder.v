module half_adder(
    input wire a,b,
    output wire s,Cout
);
    assign s = a ^ b;
    assign Cout = a & b;

endmodule

module full_adder (
    input wire a,b,Cin,
    output wire s,Cout
);

    wire wire_s;
    wire wire_Cout1;
    wire wire_Cout2;

    half_adder ha_inst1(
        .a(a),
        .b(b),
        .s(wire_s),
        .Cout(wire_Cout1)
    );

    half_adder ha_inst2(
        .a(wire_s),
        .b(Cin),
        .s(s),
        .Cout(wire_Cout2)
    );

    assign Cout = wire_Cout1 | wire_Cout2;

endmodule