`default_nettype none
module top_module(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out,
    output wire out_n   ); 
    
    wire anb ;
    wire cnd ;
    wire res ;
    
    assign anb =a&b;
    assign cnd =c&d ;
    assign res =anb | cnd;

    assign out =res;
    assign out_n =~res;
    

endmodule