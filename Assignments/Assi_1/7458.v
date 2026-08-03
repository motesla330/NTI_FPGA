`default_nettype wire 
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire a;
    assign a=p2a & p2b ;
    wire b ;
    assign b=p2c &p2d ;
    
    assign p2y =a|b;
    
     wire c;
    assign c = p1a & p1b & p1c ;
    wire d;
    assign d= p1f & p1e & p1d ;
    
    assign p1y =c|d;
    


endmodule