module Day001(
    input wire a,b,
    output wire and_gate,or_gate, not_gate, nand_gate, nor_gate, xor_gate, xnor_gate
    );
    
    assign and_gate =   a & b;
    assign or_gate =    a | b;
    assign not_gate =   ~a;
    assign nand_gate =  ~(a & b); 
    assign nor_gate =   ~(a | b);
    assign xor_gate =   (~a & b) | (a & ~b);
    assign xnor_gate =  (~a & ~b) | (a & b);
endmodule

