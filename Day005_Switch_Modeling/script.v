module day005(
    input wire a,b,
    output wire o_nand,
    output wire o_nor
    );
    supply0 gnd;
    supply1 Vdd;
    wire connect_nand;
    wire connect_nor;
    //Nand gate
    //pull up half 
    pmos pmos_inst_a_nand(o_nand, Vdd, a); //output input ctrl
    pmos pmos_inst_b_nand(o_nand, Vdd, b);
    
    //pull down half
    nmos nmos_inst_a_nand(o_nand, connect_nand, a);
    nmos nmos_inst_b_nand(connect_nand, gnd, b);
    
    //Nor gate
    //pull up half
    pmos pmos_inst_a_nor(connect_nor, Vdd, a);
    pmos pmos_inst_b_nor(o_nor, connect_nor, b);
    
    //pull down half
    nmos nmos_inst_a_nor(o_nor, gnd, a);
    nmos nmos_inst_b_nor(o_nor, gnd, b);
    
endmodule

