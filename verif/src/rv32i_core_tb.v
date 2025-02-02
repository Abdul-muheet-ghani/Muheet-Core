`timescale 1ns / 1ps

module rv32i_core_tb;
    parameter MEMORY="../memory.mem";
    // Clock signal declaration
    reg clk;
    reg reset_n;

    // Clock generation
    initial begin
        clk = 0; // Initial clock value
    end

    initial begin
      $readmemh(MEMORY,uut.instruction_mem.mem);
    end

    always #5 clk = ~clk; // Generate a clock with 10ns period (50MHz frequency)

    // Instantiate the rv32i_core module
    // Assuming rv32i_core has a clock input named `clk`
    rv32i_core uut (
        .clk    ( clk             ), // Connect the clock to the core
        .reset_n( reset_n         )
        // Add other ports as required, like reset or additional signals, if needed
    );

    // Simulation runtime control
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,rv32i_core_tb);

        reset_n=0;
        #35;
        
        reset_n=1; //release reset

        //$dumpvars(0,uut.i_reg_file.reg_file1[1], uut.i_reg_file.reg_file1[2], uut.i_reg_file.reg_file1[3], uut.i_reg_file.reg_file1[4], uut.i_reg_file.reg_file1[5]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[6], uut.i_reg_file.reg_file1[7], uut.i_reg_file.reg_file1[8], uut.i_reg_file.reg_file1[9], uut.i_reg_file.reg_file1[10]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[11],uut.i_reg_file.reg_file1[12],uut.i_reg_file.reg_file1[13],uut.i_reg_file.reg_file1[14],uut.i_reg_file.reg_file1[15]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[16],uut.i_reg_file.reg_file1[17],uut.i_reg_file.reg_file1[18],uut.i_reg_file.reg_file1[19],uut.i_reg_file.reg_file1[20]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[21],uut.i_reg_file.reg_file1[22],uut.i_reg_file.reg_file1[23],uut.i_reg_file.reg_file1[24],uut.i_reg_file.reg_file1[25]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[26],uut.i_reg_file.reg_file1[27],uut.i_reg_file.reg_file1[28],uut.i_reg_file.reg_file1[29],uut.i_reg_file.reg_file1[30]);
        //$dumpvars(0,uut.i_reg_file.reg_file1[31]);

        #1000; // Run the simulation for 1000ns
        $finish(); // Stop the simulation
    end
/*
    initial begin
        while(1)
        begin
            $display("reg 5 = %h",uut.i_reg_file.reg_file1[5]);
            $display("reg 6 = %h",uut.i_reg_file.reg_file1[6]);
        end
    end
*/
endmodule