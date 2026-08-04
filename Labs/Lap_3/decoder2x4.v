`default_nettype none
`timescale 1ns / 1ps

module decoder2x4 #
( 
  parameter N = 128
)
(
  // Think about it, is there any other way?!
  //input wire [(N>>1)-1:0] A,
  input wire [($clog2(N))-1:0] A,
  input wire en, 
  output reg [N-1:0] F
  //output reg [(2**N)-1:0] F
);


/*( 
parameter N = 2
)
(
  input wire [N-1:0] A,
  input wire en, 
  output reg [(1<<N)-1:0] F
  //output reg [(2**N)-1:0] F
);
*/



/*
  always@(*)
    begin
      //initial value
      //F = 4'b0000;
	  if(en)
	    begin
		  case(A)
		    2'b00: F = 4'b0001;
		    2'b01: F = 4'b0010;
		    2'b10: F = 4'b0100;
		    2'b11: F = 4'b1000;
		    default: F = 4'b0000;
		  endcase
		end
	  else
	    // Latch cleared
	     F = 4'b0000;
	// Unintentional latch 
	end
*/
/*
  always@(*)
    begin
	  case({en,A})
		3'b100: F = 4'b0001;
		3'b101: F = 4'b0010;
		3'b110: F = 4'b0100;
		3'b111: F = 4'b1000;
	    default: F = 4'b0000;
	  endcase
    end
*/

  always@(*)
    begin
      //initial value
      F = 4'b0000;
	  F = {N{1'b0}};
	  F = 'b0;
	  if(en)
	    begin
          F[A] = 1'b1;
		  /*
		  F[0] = 1'b1; F = 4'b0001;
		  F[1] = 1'b1; F = 4'b0010;
		  F[2] = 1'b1; F = 4'b0100;
		  F[3] = 1'b1; F = 4'b1000;
		  
		  // Equavalent to
		  
		  case(A)
		    2'b00: F = 4'b0001;
		    2'b01: F = 4'b0010;
		    2'b10: F = 4'b0100;
		    2'b11: F = 4'b1000;
		    default: F = 4'b0000;
		  endcase		  
		  */
		end
	end

/*
  always@(*)
    begin
      //initial value
      F = 4'b0000;
	  if(en)
	    begin
		  F = 1'b1 << A;

		  case(A)
		    2'b00: F = 4'b0001; // 1'b1 << 0;  // 1     >>> 0001
		    2'b01: F = 4'b0010; // 1'b1 << 1;  // 10    >>> 0010
		    2'b10: F = 4'b0100; // 1'b1 << 2;  // 100   >>> 0100
		    2'b11: F = 4'b1000; // 1'b1 << 3;  // 1000  >>> 1000
		    default: F = 4'b0000;
		  endcase
		  
		end
	end
*/
endmodule