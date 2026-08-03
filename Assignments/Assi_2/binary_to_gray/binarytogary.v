module bin_to_gray #(parameter width =3)(
    input [width-1:0] A,
    output reg [width-1:0] B
);


always @(*)begin 

B=A^(A>>1);

end 



endmodule