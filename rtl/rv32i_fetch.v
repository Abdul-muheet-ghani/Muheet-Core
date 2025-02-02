//////////////////////////////////////////////////////////////////////////////////
// Company: MERL-UITU
// Engineer: Abdul Muheet Ghani
// 
// Design Name: RV32IMACZicsr for Linux
// Module Name: RV32I-top
// Project Name: RV32IMACZicsr for linux
// Target Devices: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////

module rv32i_fetch
#(
    parameter XLEN = 32
)
(   
    input             clk_in,
    input             reset_n,

    input             branch_true,
    input  [1:0]      pc_sel,

    input  [XLEN-1:0] UJ_immediate_in,
    input  [XLEN-1:0] SB_immediate_in,
    input  [XLEN-1:0] I_immediate_in,
    input  [XLEN-1:0] rs1_in,

    output reg [XLEN-1:0] fetch_address_o
);


   wire [XLEN-1:0] pc;
   reg  [XLEN-1:0] pcplus4;
   
   assign pc              = (pc_sel == 2'b00) ? pcplus4 :
                            (pc_sel == 2'b01) ? UJ_immediate_in :
                            (pc_sel == 2'b10) ? SB_immediate_in :
                            (pc_sel == 2'b11) ? I_immediate_in + rs1_in : 0;


    always @(posedge clk_in, negedge reset_n)
    begin
        if(!reset_n)
        begin
            fetch_address_o <= 0;
        end
        else begin
            fetch_address_o <= pc;
        end
    end

    always @(posedge clk_in, negedge reset_n)
    begin
        if(!reset_n)
        begin
            pcplus4 <= 0;
        end
        else begin
            pcplus4 <= pc + 4;
        end
    end

endmodule