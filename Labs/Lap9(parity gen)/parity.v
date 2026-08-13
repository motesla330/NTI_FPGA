module parity #(parameter WIDTH = 8) (
    input   wire    data_in,
    input   wire    clk,rst,
    output  reg     parity_out
);
reg [$clog2(WIDTH):0]counter;
reg [WIDTH-1:0] data_reg;

function parity_clc;
    input [WIDTH-1:0] data;
  
    begin
        parity_clc = ^data;
    end
endfunction 

always @(posedge clk or posedge rst) begin
    if (rst )begin 
        counter <= 0;
        data_reg <= 0;
        parity_out <= 0;
    end 
    else begin 
        if (counter == WIDTH ) begin
            parity_out <= parity_clc(data_reg);
            counter <= 0; 
        end 
        else begin 
            data_reg[counter] <= data_in; 
            counter <= counter + 1; 
        end 
    end 
   
end 
      

endmodule