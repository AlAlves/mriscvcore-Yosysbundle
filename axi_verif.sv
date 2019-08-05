module testbench (
	.clk

);
	reg rstn = 0;
	wire trap;

	always @(posedge clk)
		rstn <= 1;

	`RVFI_WIRES


    (* keep *) `rvformal_rand_reg [31:0] Rdata;
    (* keep *) `rvformal_rand_reg ARready;
    (* keep *) `rvformal_rand_reg Rvalid;
    (* keep *) `rvformal_rand_reg AWready;
    (* keep *) `rvformal_rand_reg Wready;
    (* keep *) `rvformal_rand_reg Bvalid; // prob: Wack
    (* keep *) wire [31:0] AWdata; // prob: AWaddr
    (* keep *) wire [31:0] ARdata; // prob: ARaddr
    (* keep *) wire [31:0] Wdata;
    (* keep *) wire ARvalid;
    (* keep *) wire Rready;
    (* keep *) wire AWvalid;
    (* keep *) wire Wvalid;
    (* keep *) wire [2:0] ARprot, AWprot; // IDK
    (* keep *) wire Bready;
    (* keep *) wire [3:0] Wstrb; // prob: AWcache

    // AXI-4 LITE INTERFACE (MASTER)
    // see: https://www.realdigital.org/doc/a9fee931f7a172423e1ba73f66ca4081
    // &: https://zipcpu.com/formal/2018/12/28/axilite.html
	mriscvcore uut (
		.clk   (clk),
		.rstn (resetn),
		.trap (trap),

        .Rdata(Rdata),
        .ARready(ARready),
        .Rvalid(Rvalid),
        .AWready(AWready),
        .Wready(Wready),
        .Bvalid(Bvalid), // prob: Wack
        .AWdata(AWdata), // prob: AWaddr
        .ARdata(ARdata), // prob: ARaddr
        .Wdata(Wdata),
        .ARvalid(ARvalid),
        .Rready(Rready),
        .AWvalid(AWvalid),
        .Wvalid(Wvalid),
        .ARprot(ARprot), // IDK
        AWprot(AWprot), // IDK
        .Bready(Bready),
        .Wstrb(Wstrb), // prob: AWcache

		`RVFI_CONN
	);

	(* keep *) wire                                spec_valid;
	(* keep *) wire                                spec_trap;
	(* keep *) wire [                       4 : 0] spec_rs1_addr;
	(* keep *) wire [                       4 : 0] spec_rs2_addr;
	(* keep *) wire [                       4 : 0] spec_rd_addr;
	(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata;
	(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata;
	(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr;
	(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask;
	(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask;
	(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata;

    initial	ARready = 1'b0;
	initial	AWready = 1'b0;
	initial	Wready  = 1'b0;
	initial	Bvalid  = 1'b0;
	initial	Rvalid  = 1'b0;

    // Communication with an AXI SLAVE port

endmodule
