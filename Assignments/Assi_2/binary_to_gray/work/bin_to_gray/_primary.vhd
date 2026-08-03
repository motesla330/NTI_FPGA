library verilog;
use verilog.vl_types.all;
entity bin_to_gray is
    generic(
        width           : integer := 3
    );
    port(
        A               : in     vl_logic_vector;
        B               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end bin_to_gray;
