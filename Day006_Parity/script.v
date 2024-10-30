module even_parity_generator(
    input wire clock,
    input wire [3 : 0] data_in,
    output wire parity
);
    
    assign parity = data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3]; 

endmodule 

module even_parity_checker(
    input wire clock,
    input wire [3 : 0] data_in,
    input wire parity,
    output wire error
);

  wire check_parity = ddata_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[3];
  assign error = (check_parity == parity) ? 1 : 0;
    
endmodule

module Day006_tb();
    reg clock;
    reg [3 : 0] data_in;
    wire parity;
    wire checker;

    initial begin //Clock generation
        clock = 0;
        forever #5 clock <= ~clock;
    end
    
    
    integer i = 0;   
    initial begin;
        data_in = i;
        for(i = 1; i < (2 << 3);i = i + 1) #10 data_in = i;
            $finish;
    end
    
    even_parity_generator gen_inst(
      .clock(clock),
      .data_in(data_in),
      .parity(parity)      
    );

    even_parity_checker check_inst(
        .clock(clock),
        .data_in(data_in),
        .parity(parity),
        .checker(checker)
    )


endmodule : Day006_tb
 
