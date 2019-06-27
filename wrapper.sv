module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);

    // AXI-4 LITE INTERFACE
    (* keep *) `rvformal_rand_reg [31:0] Rdata;
    (* keep *) `rvformal_rand_reg ARready;
    (* keep *) `rvformal_rand_reg Rvalid;
    (* keep *) `rvformal_rand_reg AWready;
    (* keep *) `rvformal_rand_reg Wready;
    (* keep *) `rvformal_rand_reg Bvalid;
    (* keep *) wire [31:0] AWdata;
    (* keep *) wire [31:0] ARdata;
    (* keep *) wire [31:0] Wdata;
    (* keep *) wire ARvalid;
    (* keep *) wire Rready;
    (* keep *) wire AWvalid;
    (* keep *) wire Wvalid;
    (* keep *) wire [2:0] ARprot;
    (* keep *) wire [2:0] AWprot;
    (* keep *) wire Bready;
    (* keep *) wire [3:0] Wstrb;

    // IRQ interface

    (* keep *) `rvformal_rand_reg [31:0] inirr;
    (* keep *) wire [31:0] outirr;
    (* keep *) wire trap;



    mriscvcore uut (
        .clk(clock),
        .rstn(!reset),

        // AXI-4 LITE INTERFACE
        .Rdata(Rdata),
        .ARready(ARready),
        .Rvalid(Rvalid),
        .AWready(AWready),
        .Wready(Wready),
        .Bvalid(Bvalid),
        .AWdata(AWdata),
        .ARdata(ARdata),
        .Wdata(Wdata),
        .ARvalid(ARvalid),
        .Rready(Rready),
        .AWvalid(AWvalid),
        .Wvalid(Wvalid),
        .ARprot(ARprot),
        .AWprot(AWprot),
        .Bready(Bready),
        .Wstrb(Wstrb),


        `RVFI_CONN,


        // IRQ interface

        .inirr(inirr),
        .outirr(outirr),
        .trap(trap)

        );





endmodule
