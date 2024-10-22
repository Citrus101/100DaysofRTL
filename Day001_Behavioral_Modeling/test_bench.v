module Day001_tb();
    reg a,b;
    wire and_gate, or_gate, not_gate, nand_gate, nor_gate, xor_gate, xnor_gate;
    
    initial begin
        a = 0;
        b = 0;
        #5
        a = 0;
        b = 1;
        #5
        a = 1;
        b = 0;
        #5
        a = 1;
        b = 1;
        #5
        $finish; //end of simulation
    end 
    
    Day001 Day001_inst(
    .a(a),
    .b(b),
    .and_gate(and_gate),
    .or_gate(or_gate),
    .not_gate(not_gate),
    .nand_gate(nand_gate),
    .nor_gate(nor_gate),
    .xor_gate(xor_gate),
    .xnor_gate(xnor_gate)
    );

endmodule : Day001_tb
