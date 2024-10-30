module half_subtractor (
    input wire a,b,
    output wire difference, borrow
);

    assign difference = a ^ b;
    assign borrow     = ~a & b;

endmodule

module full_subtractor (
    input wire a,b,c,
    output wire difference, borrow;
);

    wire wire_difference;
    wire wire_borrow1;
    wire wire_borrow2;

    half_subtractor ha_inst_1(
        .a(a),
        .b(b),
        .difference(wire_difference),
        .borrow(wire_borrow1)
    );

    half_subtractor ha_inst_2(
        .a(wire_difference),
        .b(c),
        .difference(difference),
        .borrow(wire_borrow2)
    );

    assign borrow = wire_borrow1 | wire_borrow2;
    
endmodule

