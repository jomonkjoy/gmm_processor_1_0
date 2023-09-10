

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "gmm_processor" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXILITE_CSR_BASEADDR" "C_S_AXILITE_CSR_HIGHADDR"
}
