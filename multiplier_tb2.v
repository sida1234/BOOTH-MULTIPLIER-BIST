module BIST_tb(
    );
    reg clk;
    reg [3:0]a;
    reg[3:0]b;
    reg start;
    reg test;
    
    //outputs
    wire [7:0] product;
    wire busy;
    wire pass;
    
    //Instantiate the UUT
    multiplier uut(
          .clk(clk),
          .a(a),
          .b(b),
          .start(start),
          .test(test),
          .product(product),
          .busy(busy),
          .pass(pass)
     );
     
     always #5 clk=~clk;
     
     always@(posedge clk) $strobe("product: %d busy: %d at time =%t", $signed(product),
     busy,$stime);
     
     initial begin
               clk=0;
               a=0;
               b=0;
               start=0;
               test=0;
               // add stimulus
               
               #10;
                          $display("first example: a=4 b=7");
                          a=4; b=7; start=1; #10 start=0;
                          #40 $display("first example done");
                          a =-4; b=5;start=1; #10 start=0;
                          #40 $display("second example done");
                          $finish;
      end
      
 endmodule
