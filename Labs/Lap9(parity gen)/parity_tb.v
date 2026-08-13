`timescale 1ns/1ps
module parity_tb;
    reg  data_in;
    reg  clk,rst;
    wire parity_out;
integer i;
   
    parity Dut (
        .data_in(data_in),
        .parity_out(parity_out),
        .clk(clk),
        .rst(rst)
    );

    always #5 clk = ~clk;


    task data_input;
        input [7:0] data;
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1) begin
                @ (negedge clk);
                data_in = data[i];
               // #6;
            end
        end
    endtask 

    task parity_check;
        input [7:0] data;
        
        begin
           
            if (parity_out !== (^data)) begin
                $display("test failed for data : %b, Expected parity: %b, Got: %b", data,^data, parity_out);
            end else begin
                $display("test passed for data : %b, Parity: %b", data, parity_out);
            end
        end

    endtask

    initial begin
        clk = 0;
        rst = 1;
        data_in = 0;
        #10;
        rst = 0;
       
        for (i = 0; i < 256; i = i + 1) begin
            data_input(i);
            #10;
            parity_check(i);
        end
        $stop;
    end




endmodule 

    