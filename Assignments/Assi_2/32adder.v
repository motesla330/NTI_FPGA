module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c1,c2;
    wire [15:0]sum1 ,sum2;
    
    add16 (a[15:0],b[15:0],1'b0,sum1,c1);
    add16 (a[31:16] ,b[31:16] ,c1,sum2);
    
    assign sum ={sum2,sum1};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout,sum}= a+b+cin ;

endmodule
