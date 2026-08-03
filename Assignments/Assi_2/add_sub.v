module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire	[31:0] bn =b^{32{sub}};
    wire [15:0] sum1 ,sum2;
    wire cout ;
    add16(a[15:0],bn[15:0],sub,sum1,cout);
    add16(a[31:16],bn[31:16],cout,sum2, );
    
    assign sum ={sum2,sum1};
    
    

endmodule