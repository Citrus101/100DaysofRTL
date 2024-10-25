module day005_tb();
    reg a,b;
    wire o_nand;
    wire o_nor;
    initial begin
           a = 0; b = 0;
        #5 a = 0; b = 1;
        #5 a = 1; b = 0;
        #5 a = 1; b = 1;
        #5
        $finish;
    end
    
    day005 day005_inst(
        .a(a),
        .b(b),
        .o_nand(o_nand),
        .o_nor(o_nor)
    );
endmodule : day005_tb

