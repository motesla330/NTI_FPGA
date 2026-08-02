module FA_GL
(
  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output wire sum,
  output wire cout
);

  assign sum = A ^ B ^ Cin;
  
  // Kmap Logic
  //assign cout = (A & B)|(A & Cin)|(B & Cin);
  
  // Two stage HA
  assign cout = (Cin & (A^B)) | ( A & B);
  
endmodule