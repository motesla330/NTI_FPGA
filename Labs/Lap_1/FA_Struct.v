module FA_Struct
(
  input  wire A, 
  input  wire B,
  input  wire Cin,
  
  output wire sum,
  output wire cout
);

  // internal signals
  wire cout0, sum0, cout1;
  
  // modules instantiation
  HA_Behav HA0 (.A(A), .B(B), .sum(sum0), .cout(cout0));
  HA_Behav HA1 (.A(Cin), .B(sum0), .sum(sum), .cout(cout1));
  
  // Out, inputs
  //assign cout = cout0 | cout1;
  or OR_gate (cout, cout0, cout1);
  
endmodule