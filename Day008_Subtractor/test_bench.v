module Day008_tb();
    reg a,b,c;
    wire difference_hs, borrow_hs;
    wire difference_fs, borrow_fs;
    reg clock;

    initial begin //Clock generation
        clock = 0;
        forever #2 clock = ~clock;
    end

    initial begin
            a <= 0; b <= 0; c <= 0;
        #2  a <= 0; b <= 0; c <= 1;
        #2  a <= 0; b <= 1; c <= 0;
        #2  a <= 0; b <= 1; c <= 1;
        #2  a <= 1; b <= 0; c <= 0;
        #2  a <= 1; b <= 0; c <= 1;
        #2  a <= 1; b <= 1; c <= 0;
        #2  a <= 1; b <= 1; c <= 1;
        $finish;
    end

    always @(posedge clock) $display("a = %d b = %d c = %d difference = %d borrow %d",a,b,c,difference_fs,borrow_fs);

    half_subtractor ha_inst(
        .a(a),
        .b(b),
        .difference(difference_hs),
        .borrow(borrow_hs)
    );

    full_subtractor fa_inst(
        .a(a),
        .b(b),
        .c(c),
        .difference(difference_fs),
        .borrow(borrow_fs)
    );

endmodule

