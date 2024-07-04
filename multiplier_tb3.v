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
     
     
     initial begin
               clk=0;
               a=0;
               b=0;
               start=0;
               test=0;
               // add stimulus

                  #20;
                  test=1;

                  #100;
                  wait(product == 8'b1111_1100);

                  #10;
                  if(pass==1)
                         $display("Test passed !");
                  else
                         $display("Test failed !");
                  #30;
                  test=0;
        $finish;

               
            
      end
      
 endmodule
