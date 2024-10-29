module Day007_tb();

    reg a,b,Cin;
    wire Sum_ha, Cout_ha;
    wire Sum_fa, Cout_fa;

    initial begin
            Cin <= 0;a <= 0; b <= 0;
        #2  Cin <= 0;a <= 0; b <= 1;
        #2  Cin <= 0;a <= 1; b <= 0;
        #2  Cin <= 0;a <= 1; b <= 1;
        #2  Cin <= 1;a <= 0; b <= 0;
        #2  Cin <= 1;a <= 0; b <= 1;
        #2  Cin <= 1;a <= 1; b <= 0;
        #2  Cin <= 1;a <= 1; b <= 1;
    end
    half_adder ha_inst (
        .a(a),
        .b(b),
        .s(Sum_ha),
        .Cout(Cout_ha)
    );

    full_adder fa_inst (
        .a(a),
        .b(b),
        .Cin(Cin),
        .s(Sum_fa),
        .Cout(Cout_fa)
    );


    
endmodule