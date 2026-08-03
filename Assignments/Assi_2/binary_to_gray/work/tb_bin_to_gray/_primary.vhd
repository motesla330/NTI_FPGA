library verilog;
use verilog.vl_types.all;
entity tb_bin_to_gray is
    generic(
        WIDTH           : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end tb_bin_to_gray;
