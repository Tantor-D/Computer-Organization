`timescale 1ns/1ps

module mips_txt;

    reg clk;
    reg reset;

    wire [31:0] i_inst_addr;
    wire [31:0] i_inst_rdata;

    wire [31:0] m_data_addr;
    wire [31:0] m_data_rdata;
    wire [31:0] m_data_wdata;   
    wire [3 :0] m_data_byteen;

    wire [31:0] m_inst_addr;

    wire w_grf_we;
    wire [4:0] w_grf_addr;
    wire [31:0] w_grf_wdata;

    wire [31:0] w_inst_addr;

    mips uut(
        .clk(clk),
        .reset(reset),

        .i_inst_addr(i_inst_addr),
        .i_inst_rdata(i_inst_rdata),

        .m_data_addr(m_data_addr),
        .m_data_rdata(m_data_rdata),    //r是read
        .m_data_wdata(m_data_wdata),    //w是write
        .m_data_byteen(m_data_byteen),
 
        .m_inst_addr(m_inst_addr),

        .w_grf_we(w_grf_we),
        .w_grf_addr(w_grf_addr),
        .w_grf_wdata(w_grf_wdata),

        .w_inst_addr(w_inst_addr)
    );


    integer i;
    reg [31:0] fixed_addr;      //用于写
    reg [31:0] fixed_wdata;     //用于写
    reg [31:0] data[0:4095];
    reg [31:0] inst[0:4095];

    assign m_data_rdata = data[ m_data_addr >> 2];   //关于读出数据，不需管后两位的值，其会直接读一整个字出来，lb，lh之类的要在读出一个字后自行处理。 m_data_byteen是为了写入准备的
    assign i_inst_rdata = inst[(i_inst_addr - 32'h3000) >> 2];

    initial begin
        $readmemh("code.txt", inst);
        for (i = 0; i < 4096; i = i + 1) data[i] <= 0;
    end

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
    end

    always @(*) begin//这里是在准备进行写入，先把那个字的内容给读出来，然后按字节修改，修改完后写回一个字
        fixed_wdata = data[m_data_addr >> 2];       
        fixed_addr = m_data_addr & 32'hfffffffc;
        if (m_data_byteen[3]) fixed_wdata[31:24] = m_data_wdata[31:24];
        if (m_data_byteen[2]) fixed_wdata[23:16] = m_data_wdata[23:16];
        if (m_data_byteen[1]) fixed_wdata[15: 8] = m_data_wdata[15: 8];
        if (m_data_byteen[0]) fixed_wdata[7 : 0] = m_data_wdata[7 : 0];
    end

    always @(posedge clk) begin
        if (~reset) begin
            if (w_grf_we && (w_grf_addr != 0)) begin
                //$display("%d@%h: $%d <= %h", $time, w_inst_addr, w_grf_addr, w_grf_wdata);
                $display("@%h: $%d <= %h",  w_inst_addr, w_grf_addr, w_grf_wdata);
            end
        end
    end

    always @(posedge clk) begin
        if (reset) for (i = 0; i < 4096; i = i + 1) data[i] <= 0;
        else if (|m_data_byteen) begin
            data[fixed_addr >> 2] <= fixed_wdata;//fixed_addr主要还是为了输出写入的地址，强制后两位置0
            //$display("%d@%h: *%h <= %h", $time, m_inst_addr, fixed_addr, fixed_wdata);
            $display("@%h: *%h <= %h", m_inst_addr, fixed_addr, fixed_wdata);
        end
    end

    always #2 clk <= ~clk;

endmodule

/*
上机时配置：
	1.改VS code，设置中搜索 Auto Guess Encoding
	2.Mars常用测试代码
	3.ISE记得加default

/////////////////////////////////////////////////////////////////////////////////////////////////

上机时应该是不要用的
写一个mips.tcl文件，用txt写
run 500us;
exit

E:
cd software_data\ISE_data\P5Test1
D:\Program\ISE\14.7\ISE_DS\ISE\bin\nt\fuse -nodebug -prj mips.prj -o mips.exe mips_tb_p5> log.txt
set XILINX=D:\Program\ISE\14.7\ISE_DS\ISE
mips.exe -nolog -tclbatch mips.tcl 1> ans2.txt 2>err.txt

/////////////////////////////////////////////////////////////////////////////////////////////////

ori $t0,$0,1		#positive number
ori $t1,$0,4
ori $t2,$0,8
ori $t3,$0,200
ori $t4,$0,4000

subu $s0,$0,1		#negagive number
subu $s1,$0,4
subu $s2,$0,8
subu $s3,$0,200
subu $s4,$0,4000

ori $t5,$0,1
ori $t5,$0,1		#a boundary

/////////////////////////////////////////////////////////////////////////////////////////////////

ori $1, $0, 1
ori $2, $0, 11
ori $3, $0, 0
ori $4, $0, 11
sw $1, 0($0)
sw $3, 4($0)
sw $3, 8($0)
sw $4, 12($0)

TAG0:
ori $t0,$0,1		#positive number
ori $t1,$0,4
ori $t2,$0,8
ori $t3,$0,200
ori $t4,$0,4000

bgezal $t0,TAG1		#go forward and success
nop
nop
nop
nop

TAG1:
subu $s0,$0,1		#negagive number
subu $s1,$0,4
subu $s2,$0,8
subu $s3,$0,200
subu $s4,$0,4000

bgezal $s4,TAG2		#go forward and fail ,  should stop
#nop
addu $t5,$t4,$t0		#build a delay branching
addu $t5,$t4,$t0

TAG2:
ori $t6,$0,1
ori $t5,$0,3		#a boundary
ori $t0,$0,3
TAG3:
subu $t0,$t0,$t6    # $t0 --    ,cycle 3 times (2, 1, 0)

bgezal $s0,TAG3		#go back and fail
nop
bgezal $t0,TAG3		#go back and success
addu $t7,$31,$0    # $31 -> $t7  to test zhuanfa
nop


////////////////////////////////////////////////////////////////////////////
*/
