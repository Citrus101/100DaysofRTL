module Day010_tb ();

    reg clock;

    //input
    reg [3 : 0] a,b; 
    reg sub;

    //output
    wire [3 : 0] sum; 
    wire Cout;


    initial begin
        clock = 0;
        forever #2 clock = ~clock;
    end

    initial begin
            a <= 3'b101; b <= 3'b010; sub <= 1;
        #4  a <= 3'b101; b <= 3'b010; sub <= 0;
        #4  a <= 3'b010; b <= 3'b001; sub <= 1;
        #4  a <= 3'b010; b <= 3'b001; sub <= 0;
        #4  a <= 3'b001; b <= 3'b001; sub <= 1;
        #4  a <= 3'b001; b <= 3'b001; sub <= 0;
        #4
        $finish;

    end

    always @(posedge clock) $display("a = %d b = %d sub = %d sum = %d Cout = %d ", a, b, sub, sum, Cout);

    parralel_adder_subtractor pas_inst(
        .a(a),
        .b(b),
        .Sub(sub),
        .sum(sum),
        .Cout(Cout)
    );

endmodule