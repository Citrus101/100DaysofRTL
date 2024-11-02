module Day0011_tb ();

    reg clock;

    //input
    reg [3 : 0] a,b; 
    reg cin;

    //output
    wire [3 : 0] sum; 
    wire Cout;


    initial begin
        clock = 0;
        forever #2 clock = ~clock;
    end

    initial begin
            a <= 3'b010; b <= 3'b101; cin <= 1;
        #4  a <= 3'b010; b <= 3'b101; cin <= 0;
        #4  a <= 3'b001; b <= 3'b010; cin <= 1;
        #4  a <= 3'b001; b <= 3'b010; cin <= 0;
        #4  a <= 3'b001; b <= 3'b001; cin <= 1;
        #4  a <= 3'b001; b <= 3'b001; cin <= 0;
        #4
        $finish;

    end

    always @(posedge clock) $display("a = %d b = %d Cin = %d sum = %d Cout = %d ", a, b, cin, sum, Cout);

    parralel_adder pa_inst(
        .a(a),
        .b(b),
        .Cin(cin),
        .sum(sum),
        .Cout(Cout)
    );

endmodule