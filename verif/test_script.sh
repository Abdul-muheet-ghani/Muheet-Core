RTL_PATH="../rtl"
OUTPUT_DIR="./obj"

rtlfiles="../include/RV32_pkg.vh \
          ../rtl/alu.v \
          ../rtl/branch.v \
          ../rtl/control_unit.v \
          ../rtl/data.v \
          ../rtl/imm.v \
          ../rtl/instruction_memo.v \
          ../rtl/register_file.v \
          ../rtl/top.v \
          ../rtl/Type_decoder.v"

rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR

iverilog -I $RTL_PATH -o $OUTPUT_DIR/testbench.vvp $rtlfiles
vvp -n $OUTPUT_DIR/testbench.vvp > $OUTPUT_DIR/test.log