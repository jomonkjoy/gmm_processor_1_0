
`timescale 1 ns / 1 ps

	module gmm_processor_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXILITE_CSR
		parameter integer C_S_AXILITE_CSR_DATA_WIDTH	= 32,
		parameter integer C_S_AXILITE_CSR_ADDR_WIDTH	= 4,

		// Parameters of Axi Master Bus Interface M_AXIMM_DMA
		parameter  C_M_AXIMM_DMA_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M_AXIMM_DMA_BURST_LEN	= 16,
		parameter integer C_M_AXIMM_DMA_ID_WIDTH	= 6,
		parameter integer C_M_AXIMM_DMA_ADDR_WIDTH	= 32,
		parameter integer C_M_AXIMM_DMA_DATA_WIDTH	= 64,
		parameter integer C_M_AXIMM_DMA_AWUSER_WIDTH	= 1,
		parameter integer C_M_AXIMM_DMA_ARUSER_WIDTH	= 1,
		parameter integer C_M_AXIMM_DMA_WUSER_WIDTH	= 1,
		parameter integer C_M_AXIMM_DMA_RUSER_WIDTH	= 1,
		parameter integer C_M_AXIMM_DMA_BUSER_WIDTH	= 1,

		// Parameters of Axi Slave Bus Interface S_AXI_INTR
		parameter integer C_S_AXI_INTR_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_INTR_ADDR_WIDTH	= 5,
		parameter integer C_NUM_OF_INTR	= 1,
		parameter  C_INTR_SENSITIVITY	= 32'hFFFFFFFF,
		parameter  C_INTR_ACTIVE_STATE	= 32'hFFFFFFFF,
		parameter integer C_IRQ_SENSITIVITY	= 1,
		parameter integer C_IRQ_ACTIVE_STATE	= 1
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXILITE_CSR
		input wire  s_axilite_csr_aclk,
		input wire  s_axilite_csr_aresetn,
		input wire [C_S_AXILITE_CSR_ADDR_WIDTH-1 : 0] s_axilite_csr_awaddr,
		input wire [2 : 0] s_axilite_csr_awprot,
		input wire  s_axilite_csr_awvalid,
		output wire  s_axilite_csr_awready,
		input wire [C_S_AXILITE_CSR_DATA_WIDTH-1 : 0] s_axilite_csr_wdata,
		input wire [(C_S_AXILITE_CSR_DATA_WIDTH/8)-1 : 0] s_axilite_csr_wstrb,
		input wire  s_axilite_csr_wvalid,
		output wire  s_axilite_csr_wready,
		output wire [1 : 0] s_axilite_csr_bresp,
		output wire  s_axilite_csr_bvalid,
		input wire  s_axilite_csr_bready,
		input wire [C_S_AXILITE_CSR_ADDR_WIDTH-1 : 0] s_axilite_csr_araddr,
		input wire [2 : 0] s_axilite_csr_arprot,
		input wire  s_axilite_csr_arvalid,
		output wire  s_axilite_csr_arready,
		output wire [C_S_AXILITE_CSR_DATA_WIDTH-1 : 0] s_axilite_csr_rdata,
		output wire [1 : 0] s_axilite_csr_rresp,
		output wire  s_axilite_csr_rvalid,
		input wire  s_axilite_csr_rready,

		// Ports of Axi Master Bus Interface M_AXIMM_DMA
		input wire  m_aximm_dma_aclk,
		input wire  m_aximm_dma_aresetn,
		output wire [C_M_AXIMM_DMA_ID_WIDTH-1 : 0] m_aximm_dma_awid,
		output wire [C_M_AXIMM_DMA_ADDR_WIDTH-1 : 0] m_aximm_dma_awaddr,
		output wire [7 : 0] m_aximm_dma_awlen,
		output wire [2 : 0] m_aximm_dma_awsize,
		output wire [1 : 0] m_aximm_dma_awburst,
		output wire  m_aximm_dma_awlock,
		output wire [3 : 0] m_aximm_dma_awcache,
		output wire [2 : 0] m_aximm_dma_awprot,
		output wire [3 : 0] m_aximm_dma_awqos,
		output wire [C_M_AXIMM_DMA_AWUSER_WIDTH-1 : 0] m_aximm_dma_awuser,
		output wire  m_aximm_dma_awvalid,
		input wire  m_aximm_dma_awready,
		output wire [C_M_AXIMM_DMA_DATA_WIDTH-1 : 0] m_aximm_dma_wdata,
		output wire [C_M_AXIMM_DMA_DATA_WIDTH/8-1 : 0] m_aximm_dma_wstrb,
		output wire  m_aximm_dma_wlast,
		output wire [C_M_AXIMM_DMA_WUSER_WIDTH-1 : 0] m_aximm_dma_wuser,
		output wire  m_aximm_dma_wvalid,
		input wire  m_aximm_dma_wready,
		input wire [C_M_AXIMM_DMA_ID_WIDTH-1 : 0] m_aximm_dma_bid,
		input wire [1 : 0] m_aximm_dma_bresp,
		input wire [C_M_AXIMM_DMA_BUSER_WIDTH-1 : 0] m_aximm_dma_buser,
		input wire  m_aximm_dma_bvalid,
		output wire  m_aximm_dma_bready,
		output wire [C_M_AXIMM_DMA_ID_WIDTH-1 : 0] m_aximm_dma_arid,
		output wire [C_M_AXIMM_DMA_ADDR_WIDTH-1 : 0] m_aximm_dma_araddr,
		output wire [7 : 0] m_aximm_dma_arlen,
		output wire [2 : 0] m_aximm_dma_arsize,
		output wire [1 : 0] m_aximm_dma_arburst,
		output wire  m_aximm_dma_arlock,
		output wire [3 : 0] m_aximm_dma_arcache,
		output wire [2 : 0] m_aximm_dma_arprot,
		output wire [3 : 0] m_aximm_dma_arqos,
		output wire [C_M_AXIMM_DMA_ARUSER_WIDTH-1 : 0] m_aximm_dma_aruser,
		output wire  m_aximm_dma_arvalid,
		input wire  m_aximm_dma_arready,
		input wire [C_M_AXIMM_DMA_ID_WIDTH-1 : 0] m_aximm_dma_rid,
		input wire [C_M_AXIMM_DMA_DATA_WIDTH-1 : 0] m_aximm_dma_rdata,
		input wire [1 : 0] m_aximm_dma_rresp,
		input wire  m_aximm_dma_rlast,
		input wire [C_M_AXIMM_DMA_RUSER_WIDTH-1 : 0] m_aximm_dma_ruser,
		input wire  m_aximm_dma_rvalid,
		output wire  m_aximm_dma_rready,

		// Ports of Axi Slave Bus Interface S_AXI_INTR
		input wire  s_axi_intr_aclk,
		input wire  s_axi_intr_aresetn,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_awaddr,
		input wire [2 : 0] s_axi_intr_awprot,
		input wire  s_axi_intr_awvalid,
		output wire  s_axi_intr_awready,
		input wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_wdata,
		input wire [(C_S_AXI_INTR_DATA_WIDTH/8)-1 : 0] s_axi_intr_wstrb,
		input wire  s_axi_intr_wvalid,
		output wire  s_axi_intr_wready,
		output wire [1 : 0] s_axi_intr_bresp,
		output wire  s_axi_intr_bvalid,
		input wire  s_axi_intr_bready,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_araddr,
		input wire [2 : 0] s_axi_intr_arprot,
		input wire  s_axi_intr_arvalid,
		output wire  s_axi_intr_arready,
		output wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_rdata,
		output wire [1 : 0] s_axi_intr_rresp,
		output wire  s_axi_intr_rvalid,
		input wire  s_axi_intr_rready,
		output wire  irq
	);
	
wire  m_aximm_dma_init_axi_txn;
wire  m_aximm_dma_txn_done;
wire  m_aximm_dma_error;

// Instantiation of Axi Bus Interface S_AXILITE_CSR
	gmm_processor_v1_0_S_AXILITE_CSR # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXILITE_CSR_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXILITE_CSR_ADDR_WIDTH)
	) gmm_processor_v1_0_S_AXILITE_CSR_inst (
		.INIT_AXI_TXN(m_aximm_dma_init_axi_txn),
		.TXN_DONE(m_aximm_dma_txn_done),
		.ERROR(m_aximm_dma_error),
		.S_AXI_ACLK(s_axilite_csr_aclk),
		.S_AXI_ARESETN(s_axilite_csr_aresetn),
		.S_AXI_AWADDR(s_axilite_csr_awaddr),
		.S_AXI_AWPROT(s_axilite_csr_awprot),
		.S_AXI_AWVALID(s_axilite_csr_awvalid),
		.S_AXI_AWREADY(s_axilite_csr_awready),
		.S_AXI_WDATA(s_axilite_csr_wdata),
		.S_AXI_WSTRB(s_axilite_csr_wstrb),
		.S_AXI_WVALID(s_axilite_csr_wvalid),
		.S_AXI_WREADY(s_axilite_csr_wready),
		.S_AXI_BRESP(s_axilite_csr_bresp),
		.S_AXI_BVALID(s_axilite_csr_bvalid),
		.S_AXI_BREADY(s_axilite_csr_bready),
		.S_AXI_ARADDR(s_axilite_csr_araddr),
		.S_AXI_ARPROT(s_axilite_csr_arprot),
		.S_AXI_ARVALID(s_axilite_csr_arvalid),
		.S_AXI_ARREADY(s_axilite_csr_arready),
		.S_AXI_RDATA(s_axilite_csr_rdata),
		.S_AXI_RRESP(s_axilite_csr_rresp),
		.S_AXI_RVALID(s_axilite_csr_rvalid),
		.S_AXI_RREADY(s_axilite_csr_rready)
	);

// Instantiation of Axi Bus Interface M_AXIMM_DMA
	gmm_processor_v1_0_M_AXIMM_DMA # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M_AXIMM_DMA_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_M_AXIMM_DMA_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_M_AXIMM_DMA_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_M_AXIMM_DMA_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M_AXIMM_DMA_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_M_AXIMM_DMA_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_M_AXIMM_DMA_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_M_AXIMM_DMA_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_M_AXIMM_DMA_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_M_AXIMM_DMA_BUSER_WIDTH)
	) gmm_processor_v1_0_M_AXIMM_DMA_inst (
		.INIT_AXI_TXN(m_aximm_dma_init_axi_txn),
		.TXN_DONE(m_aximm_dma_txn_done),
		.ERROR(m_aximm_dma_error),
		.M_AXI_ACLK(m_aximm_dma_aclk),
		.M_AXI_ARESETN(m_aximm_dma_aresetn),
		.M_AXI_AWID(m_aximm_dma_awid),
		.M_AXI_AWADDR(m_aximm_dma_awaddr),
		.M_AXI_AWLEN(m_aximm_dma_awlen),
		.M_AXI_AWSIZE(m_aximm_dma_awsize),
		.M_AXI_AWBURST(m_aximm_dma_awburst),
		.M_AXI_AWLOCK(m_aximm_dma_awlock),
		.M_AXI_AWCACHE(m_aximm_dma_awcache),
		.M_AXI_AWPROT(m_aximm_dma_awprot),
		.M_AXI_AWQOS(m_aximm_dma_awqos),
		.M_AXI_AWUSER(m_aximm_dma_awuser),
		.M_AXI_AWVALID(m_aximm_dma_awvalid),
		.M_AXI_AWREADY(m_aximm_dma_awready),
		.M_AXI_WDATA(m_aximm_dma_wdata),
		.M_AXI_WSTRB(m_aximm_dma_wstrb),
		.M_AXI_WLAST(m_aximm_dma_wlast),
		.M_AXI_WUSER(m_aximm_dma_wuser),
		.M_AXI_WVALID(m_aximm_dma_wvalid),
		.M_AXI_WREADY(m_aximm_dma_wready),
		.M_AXI_BID(m_aximm_dma_bid),
		.M_AXI_BRESP(m_aximm_dma_bresp),
		.M_AXI_BUSER(m_aximm_dma_buser),
		.M_AXI_BVALID(m_aximm_dma_bvalid),
		.M_AXI_BREADY(m_aximm_dma_bready),
		.M_AXI_ARID(m_aximm_dma_arid),
		.M_AXI_ARADDR(m_aximm_dma_araddr),
		.M_AXI_ARLEN(m_aximm_dma_arlen),
		.M_AXI_ARSIZE(m_aximm_dma_arsize),
		.M_AXI_ARBURST(m_aximm_dma_arburst),
		.M_AXI_ARLOCK(m_aximm_dma_arlock),
		.M_AXI_ARCACHE(m_aximm_dma_arcache),
		.M_AXI_ARPROT(m_aximm_dma_arprot),
		.M_AXI_ARQOS(m_aximm_dma_arqos),
		.M_AXI_ARUSER(m_aximm_dma_aruser),
		.M_AXI_ARVALID(m_aximm_dma_arvalid),
		.M_AXI_ARREADY(m_aximm_dma_arready),
		.M_AXI_RID(m_aximm_dma_rid),
		.M_AXI_RDATA(m_aximm_dma_rdata),
		.M_AXI_RRESP(m_aximm_dma_rresp),
		.M_AXI_RLAST(m_aximm_dma_rlast),
		.M_AXI_RUSER(m_aximm_dma_ruser),
		.M_AXI_RVALID(m_aximm_dma_rvalid),
		.M_AXI_RREADY(m_aximm_dma_rready)
	);

// Instantiation of Axi Bus Interface S_AXI_INTR
	gmm_processor_v1_0_S_AXI_INTR # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_INTR_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_INTR_ADDR_WIDTH),
		.C_NUM_OF_INTR(C_NUM_OF_INTR),
		.C_INTR_SENSITIVITY(C_INTR_SENSITIVITY),
		.C_INTR_ACTIVE_STATE(C_INTR_ACTIVE_STATE),
		.C_IRQ_SENSITIVITY(C_IRQ_SENSITIVITY),
		.C_IRQ_ACTIVE_STATE(C_IRQ_ACTIVE_STATE)
	) gmm_processor_v1_0_S_AXI_INTR_inst (
		.S_AXI_ACLK(s_axi_intr_aclk),
		.S_AXI_ARESETN(s_axi_intr_aresetn),
		.S_AXI_AWADDR(s_axi_intr_awaddr),
		.S_AXI_AWPROT(s_axi_intr_awprot),
		.S_AXI_AWVALID(s_axi_intr_awvalid),
		.S_AXI_AWREADY(s_axi_intr_awready),
		.S_AXI_WDATA(s_axi_intr_wdata),
		.S_AXI_WSTRB(s_axi_intr_wstrb),
		.S_AXI_WVALID(s_axi_intr_wvalid),
		.S_AXI_WREADY(s_axi_intr_wready),
		.S_AXI_BRESP(s_axi_intr_bresp),
		.S_AXI_BVALID(s_axi_intr_bvalid),
		.S_AXI_BREADY(s_axi_intr_bready),
		.S_AXI_ARADDR(s_axi_intr_araddr),
		.S_AXI_ARPROT(s_axi_intr_arprot),
		.S_AXI_ARVALID(s_axi_intr_arvalid),
		.S_AXI_ARREADY(s_axi_intr_arready),
		.S_AXI_RDATA(s_axi_intr_rdata),
		.S_AXI_RRESP(s_axi_intr_rresp),
		.S_AXI_RVALID(s_axi_intr_rvalid),
		.S_AXI_RREADY(s_axi_intr_rready),
		.irq(irq)
	);

	// Add user logic here

	// User logic ends

	endmodule
