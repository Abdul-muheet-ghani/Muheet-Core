//////////////////////////////////////////////////////////////////////////////////
// Company: MERL-UITU
// Engineer: Abdul Muheet Ghani
// 
// Design Name: RV32IMACZicsr for Linux
// Module Name: Control Unit
// Project Name: RV32IMACZicsr for linux
// Target Devices: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file (
   input              clk_in,
   input              reset_in,
   input       [4:0]  rs1_address_in,
   input       [4:0]  rs2_address_in,
   input       [4:0]  destination_register_in,
   input       [31:0] input_data_in,
   output wire [31:0] rs1_data_out,
   output wire [31:0] rs2_data_out
 );

 integer i;
 
 reg [31:0] reg_file1[31:0];

 always @(posedge clk_in ) begin
    if (reset_in == 1) begin
      for (i = 0 ; i<=31 ; i=i+1) begin
         reg_file1[i]=0;
      end 
    end else begin
      reg_file1[destination_register_in] = input_data_in;
    end
    
 end
    assign rs1_data_out = (rs1_address_in != 0) ? reg_file1[rs1_address_in] : 0;
    assign rs2_data_out = (rs2_address_in != 0) ? reg_file1[rs2_address_in] : 0;

endmodule
