RTL_PATH="../rtl"
OUTPUT_DIR="./obj"

rtlfiles="../include/RV32_pkg.vh \
            sim/data.v \
            sim/instruction_memory.v \
          ../rtl/rv32i_fetch.v \
          ../rtl/alu.v \
          ../rtl/branch.v \
          ../rtl/control_unit.v \
          ../rtl/imm.v \
          ../rtl/register_file.v \
          ../rtl/rv32i_core.v \
          ../rtl/Type_decoder.v \
          src/rv32i_core_tb.v"

rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR

iverilog -I $RTL_PATH -o $OUTPUT_DIR/testbench.vvp $rtlfiles
vvp -n $OUTPUT_DIR/testbench.vvp > $OUTPUT_DIR/test.log