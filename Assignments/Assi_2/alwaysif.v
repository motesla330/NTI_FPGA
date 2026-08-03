module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    always@(*)begin
        
        if(!sel_b1)begin 
        out_always =a;
    end 
    else begin 
        if (sel_b2)
            out_always =b;
        else
            out_always =a;
    end 
        
    end
    assign out_assign=out_always ;

endmodule