
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/uberddr3_axi_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set CONTROLLER_CLK_PERIOD [ipgui::add_param $IPINST -name "CONTROLLER_CLK_PERIOD" -parent ${Page_0}]
  set_property tooltip {Clock period of the controller interface in picoseconds} ${CONTROLLER_CLK_PERIOD}
  set DDR3_CLK_PERIOD [ipgui::add_param $IPINST -name "DDR3_CLK_PERIOD" -parent ${Page_0}]
  set_property tooltip {1/4 of Controller Clock Period} ${DDR3_CLK_PERIOD}
  set ROW_BITS [ipgui::add_param $IPINST -name "ROW_BITS" -parent ${Page_0}]
  set_property tooltip {Width of row address} ${ROW_BITS}
  set COL_BITS [ipgui::add_param $IPINST -name "COL_BITS" -parent ${Page_0}]
  set_property tooltip {Width of column address} ${COL_BITS}
  set BA_BITS [ipgui::add_param $IPINST -name "BA_BITS" -parent ${Page_0}]
  set_property tooltip {Width of bank address} ${BA_BITS}
  set BYTE_LANES [ipgui::add_param $IPINST -name "BYTE_LANES" -parent ${Page_0}]
  set_property tooltip {Number of byte lanes of DDR3 RAM in the FPGA board (e.g. x16 DDR3 will have 2 byte lanes)} ${BYTE_LANES}
  set ECC_ENABLE [ipgui::add_param $IPINST -name "ECC_ENABLE" -parent ${Page_0}]
  set_property tooltip {0 = DIsabled, 1 = Side-band ECC per burst, 2 = Side-band ECC per 8 bursts , 3 = Inline ECC} ${ECC_ENABLE}
  set SKIP_INTERNAL_TEST [ipgui::add_param $IPINST -name "SKIP_INTERNAL_TEST" -parent ${Page_0}]
  set_property tooltip {Check to skip built-in self-test (check this if UberDDR3 will be connected to Microblaze)} ${SKIP_INTERNAL_TEST}
  set ODELAY_SUPPORTED [ipgui::add_param $IPINST -name "ODELAY_SUPPORTED" -parent ${Page_0}]
  set_property tooltip {Check if FPGA supports ODELAYE2 primitive (e.g. FPGA with HP banks like Kintex-7)} ${ODELAY_SUPPORTED}
  set MICRON_SIM [ipgui::add_param $IPINST -name "MICRON_SIM" -parent ${Page_0}]
  set_property tooltip {Check if design will be run on simulation to shorten calibration} ${MICRON_SIM}


}

proc update_PARAM_VALUE.AXI_ADDR_WIDTH { PARAM_VALUE.AXI_ADDR_WIDTH PARAM_VALUE.wb_addr_bits PARAM_VALUE.AXI_LSBS } {
	# Procedure called to update AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
	
	set AXI_ADDR_WIDTH ${PARAM_VALUE.AXI_ADDR_WIDTH}
	set wb_addr_bits ${PARAM_VALUE.wb_addr_bits}
	set AXI_LSBS ${PARAM_VALUE.AXI_LSBS}
	set values(wb_addr_bits) [get_property value $wb_addr_bits]
	set values(AXI_LSBS) [get_property value $AXI_LSBS]
	set_property value [gen_USERPARAMETER_AXI_ADDR_WIDTH_VALUE $values(wb_addr_bits) $values(AXI_LSBS)] $AXI_ADDR_WIDTH
}

proc validate_PARAM_VALUE.AXI_ADDR_WIDTH { PARAM_VALUE.AXI_ADDR_WIDTH } {
	# Procedure called to validate AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH PARAM_VALUE.wb_data_bits } {
	# Procedure called to update AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
	
	set AXI_DATA_WIDTH ${PARAM_VALUE.AXI_DATA_WIDTH}
	set wb_data_bits ${PARAM_VALUE.wb_data_bits}
	set values(wb_data_bits) [get_property value $wb_data_bits]
	set_property value [gen_USERPARAMETER_AXI_DATA_WIDTH_VALUE $values(wb_data_bits)] $AXI_DATA_WIDTH
}

proc validate_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to validate AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_LSBS { PARAM_VALUE.AXI_LSBS PARAM_VALUE.wb_data_bits } {
	# Procedure called to update AXI_LSBS when any of the dependent parameters in the arguments change
	
	set AXI_LSBS ${PARAM_VALUE.AXI_LSBS}
	set wb_data_bits ${PARAM_VALUE.wb_data_bits}
	set values(wb_data_bits) [get_property value $wb_data_bits]
	set_property value [gen_USERPARAMETER_AXI_LSBS_VALUE $values(wb_data_bits)] $AXI_LSBS
}

proc validate_PARAM_VALUE.AXI_LSBS { PARAM_VALUE.AXI_LSBS } {
	# Procedure called to validate AXI_LSBS
	return true
}

proc update_PARAM_VALUE.DDR3_CLK_PERIOD { PARAM_VALUE.DDR3_CLK_PERIOD PARAM_VALUE.CONTROLLER_CLK_PERIOD } {
	# Procedure called to update DDR3_CLK_PERIOD when any of the dependent parameters in the arguments change
	
	set DDR3_CLK_PERIOD ${PARAM_VALUE.DDR3_CLK_PERIOD}
	set CONTROLLER_CLK_PERIOD ${PARAM_VALUE.CONTROLLER_CLK_PERIOD}
	set values(CONTROLLER_CLK_PERIOD) [get_property value $CONTROLLER_CLK_PERIOD]
	set_property value [gen_USERPARAMETER_DDR3_CLK_PERIOD_VALUE $values(CONTROLLER_CLK_PERIOD)] $DDR3_CLK_PERIOD
}

proc validate_PARAM_VALUE.DDR3_CLK_PERIOD { PARAM_VALUE.DDR3_CLK_PERIOD } {
	# Procedure called to validate DDR3_CLK_PERIOD
	return true
}

proc update_PARAM_VALUE.cmd_len { PARAM_VALUE.cmd_len PARAM_VALUE.BA_BITS PARAM_VALUE.ROW_BITS } {
	# Procedure called to update cmd_len when any of the dependent parameters in the arguments change
	
	set cmd_len ${PARAM_VALUE.cmd_len}
	set BA_BITS ${PARAM_VALUE.BA_BITS}
	set ROW_BITS ${PARAM_VALUE.ROW_BITS}
	set values(BA_BITS) [get_property value $BA_BITS]
	set values(ROW_BITS) [get_property value $ROW_BITS]
	set_property value [gen_USERPARAMETER_cmd_len_VALUE $values(BA_BITS) $values(ROW_BITS)] $cmd_len
}

proc validate_PARAM_VALUE.cmd_len { PARAM_VALUE.cmd_len } {
	# Procedure called to validate cmd_len
	return true
}

proc update_PARAM_VALUE.wb2_sel_bits { PARAM_VALUE.wb2_sel_bits PARAM_VALUE.WB2_DATA_BITS } {
	# Procedure called to update wb2_sel_bits when any of the dependent parameters in the arguments change
	
	set wb2_sel_bits ${PARAM_VALUE.wb2_sel_bits}
	set WB2_DATA_BITS ${PARAM_VALUE.WB2_DATA_BITS}
	set values(WB2_DATA_BITS) [get_property value $WB2_DATA_BITS]
	set_property value [gen_USERPARAMETER_wb2_sel_bits_VALUE $values(WB2_DATA_BITS)] $wb2_sel_bits
}

proc validate_PARAM_VALUE.wb2_sel_bits { PARAM_VALUE.wb2_sel_bits } {
	# Procedure called to validate wb2_sel_bits
	return true
}

proc update_PARAM_VALUE.wb_addr_bits { PARAM_VALUE.wb_addr_bits PARAM_VALUE.ROW_BITS PARAM_VALUE.COL_BITS PARAM_VALUE.BA_BITS } {
	# Procedure called to update wb_addr_bits when any of the dependent parameters in the arguments change
	
	set wb_addr_bits ${PARAM_VALUE.wb_addr_bits}
	set ROW_BITS ${PARAM_VALUE.ROW_BITS}
	set COL_BITS ${PARAM_VALUE.COL_BITS}
	set BA_BITS ${PARAM_VALUE.BA_BITS}
	set values(ROW_BITS) [get_property value $ROW_BITS]
	set values(COL_BITS) [get_property value $COL_BITS]
	set values(BA_BITS) [get_property value $BA_BITS]
	set_property value [gen_USERPARAMETER_wb_addr_bits_VALUE $values(ROW_BITS) $values(COL_BITS) $values(BA_BITS)] $wb_addr_bits
}

proc validate_PARAM_VALUE.wb_addr_bits { PARAM_VALUE.wb_addr_bits } {
	# Procedure called to validate wb_addr_bits
	return true
}

proc update_PARAM_VALUE.wb_data_bits { PARAM_VALUE.wb_data_bits PARAM_VALUE.DQ_BITS PARAM_VALUE.BYTE_LANES } {
	# Procedure called to update wb_data_bits when any of the dependent parameters in the arguments change
	
	set wb_data_bits ${PARAM_VALUE.wb_data_bits}
	set DQ_BITS ${PARAM_VALUE.DQ_BITS}
	set BYTE_LANES ${PARAM_VALUE.BYTE_LANES}
	set values(DQ_BITS) [get_property value $DQ_BITS]
	set values(BYTE_LANES) [get_property value $BYTE_LANES]
	set_property value [gen_USERPARAMETER_wb_data_bits_VALUE $values(DQ_BITS) $values(BYTE_LANES)] $wb_data_bits
}

proc validate_PARAM_VALUE.wb_data_bits { PARAM_VALUE.wb_data_bits } {
	# Procedure called to validate wb_data_bits
	return true
}

proc update_PARAM_VALUE.wb_sel_bits { PARAM_VALUE.wb_sel_bits PARAM_VALUE.wb_data_bits } {
	# Procedure called to update wb_sel_bits when any of the dependent parameters in the arguments change
	
	set wb_sel_bits ${PARAM_VALUE.wb_sel_bits}
	set wb_data_bits ${PARAM_VALUE.wb_data_bits}
	set values(wb_data_bits) [get_property value $wb_data_bits]
	set_property value [gen_USERPARAMETER_wb_sel_bits_VALUE $values(wb_data_bits)] $wb_sel_bits
}

proc validate_PARAM_VALUE.wb_sel_bits { PARAM_VALUE.wb_sel_bits } {
	# Procedure called to validate wb_sel_bits
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH { PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to update AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH { PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to validate AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.BA_BITS { PARAM_VALUE.BA_BITS } {
	# Procedure called to update BA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BA_BITS { PARAM_VALUE.BA_BITS } {
	# Procedure called to validate BA_BITS
	return true
}

proc update_PARAM_VALUE.BYTE_LANES { PARAM_VALUE.BYTE_LANES } {
	# Procedure called to update BYTE_LANES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BYTE_LANES { PARAM_VALUE.BYTE_LANES } {
	# Procedure called to validate BYTE_LANES
	return true
}

proc update_PARAM_VALUE.COL_BITS { PARAM_VALUE.COL_BITS } {
	# Procedure called to update COL_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COL_BITS { PARAM_VALUE.COL_BITS } {
	# Procedure called to validate COL_BITS
	return true
}

proc update_PARAM_VALUE.CONTROLLER_CLK_PERIOD { PARAM_VALUE.CONTROLLER_CLK_PERIOD } {
	# Procedure called to update CONTROLLER_CLK_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CONTROLLER_CLK_PERIOD { PARAM_VALUE.CONTROLLER_CLK_PERIOD } {
	# Procedure called to validate CONTROLLER_CLK_PERIOD
	return true
}

proc update_PARAM_VALUE.DIC { PARAM_VALUE.DIC } {
	# Procedure called to update DIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIC { PARAM_VALUE.DIC } {
	# Procedure called to validate DIC
	return true
}

proc update_PARAM_VALUE.DQ_BITS { PARAM_VALUE.DQ_BITS } {
	# Procedure called to update DQ_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DQ_BITS { PARAM_VALUE.DQ_BITS } {
	# Procedure called to validate DQ_BITS
	return true
}

proc update_PARAM_VALUE.ECC_ENABLE { PARAM_VALUE.ECC_ENABLE } {
	# Procedure called to update ECC_ENABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ECC_ENABLE { PARAM_VALUE.ECC_ENABLE } {
	# Procedure called to validate ECC_ENABLE
	return true
}

proc update_PARAM_VALUE.MICRON_SIM { PARAM_VALUE.MICRON_SIM } {
	# Procedure called to update MICRON_SIM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MICRON_SIM { PARAM_VALUE.MICRON_SIM } {
	# Procedure called to validate MICRON_SIM
	return true
}

proc update_PARAM_VALUE.ODELAY_SUPPORTED { PARAM_VALUE.ODELAY_SUPPORTED } {
	# Procedure called to update ODELAY_SUPPORTED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ODELAY_SUPPORTED { PARAM_VALUE.ODELAY_SUPPORTED } {
	# Procedure called to validate ODELAY_SUPPORTED
	return true
}

proc update_PARAM_VALUE.ROW_BITS { PARAM_VALUE.ROW_BITS } {
	# Procedure called to update ROW_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROW_BITS { PARAM_VALUE.ROW_BITS } {
	# Procedure called to validate ROW_BITS
	return true
}

proc update_PARAM_VALUE.RTT_NOM { PARAM_VALUE.RTT_NOM } {
	# Procedure called to update RTT_NOM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RTT_NOM { PARAM_VALUE.RTT_NOM } {
	# Procedure called to validate RTT_NOM
	return true
}

proc update_PARAM_VALUE.SECOND_WISHBONE { PARAM_VALUE.SECOND_WISHBONE } {
	# Procedure called to update SECOND_WISHBONE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SECOND_WISHBONE { PARAM_VALUE.SECOND_WISHBONE } {
	# Procedure called to validate SECOND_WISHBONE
	return true
}

proc update_PARAM_VALUE.SKIP_INTERNAL_TEST { PARAM_VALUE.SKIP_INTERNAL_TEST } {
	# Procedure called to update SKIP_INTERNAL_TEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SKIP_INTERNAL_TEST { PARAM_VALUE.SKIP_INTERNAL_TEST } {
	# Procedure called to validate SKIP_INTERNAL_TEST
	return true
}

proc update_PARAM_VALUE.WB2_ADDR_BITS { PARAM_VALUE.WB2_ADDR_BITS } {
	# Procedure called to update WB2_ADDR_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WB2_ADDR_BITS { PARAM_VALUE.WB2_ADDR_BITS } {
	# Procedure called to validate WB2_ADDR_BITS
	return true
}

proc update_PARAM_VALUE.WB2_DATA_BITS { PARAM_VALUE.WB2_DATA_BITS } {
	# Procedure called to update WB2_DATA_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WB2_DATA_BITS { PARAM_VALUE.WB2_DATA_BITS } {
	# Procedure called to validate WB2_DATA_BITS
	return true
}

proc update_PARAM_VALUE.WB_ERROR { PARAM_VALUE.WB_ERROR } {
	# Procedure called to update WB_ERROR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WB_ERROR { PARAM_VALUE.WB_ERROR } {
	# Procedure called to validate WB_ERROR
	return true
}

proc update_PARAM_VALUE.serdes_ratio { PARAM_VALUE.serdes_ratio } {
	# Procedure called to update serdes_ratio when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.serdes_ratio { PARAM_VALUE.serdes_ratio } {
	# Procedure called to validate serdes_ratio
	return true
}


proc update_MODELPARAM_VALUE.CONTROLLER_CLK_PERIOD { MODELPARAM_VALUE.CONTROLLER_CLK_PERIOD PARAM_VALUE.CONTROLLER_CLK_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CONTROLLER_CLK_PERIOD}] ${MODELPARAM_VALUE.CONTROLLER_CLK_PERIOD}
}

proc update_MODELPARAM_VALUE.DDR3_CLK_PERIOD { MODELPARAM_VALUE.DDR3_CLK_PERIOD PARAM_VALUE.DDR3_CLK_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DDR3_CLK_PERIOD}] ${MODELPARAM_VALUE.DDR3_CLK_PERIOD}
}

proc update_MODELPARAM_VALUE.ROW_BITS { MODELPARAM_VALUE.ROW_BITS PARAM_VALUE.ROW_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROW_BITS}] ${MODELPARAM_VALUE.ROW_BITS}
}

proc update_MODELPARAM_VALUE.COL_BITS { MODELPARAM_VALUE.COL_BITS PARAM_VALUE.COL_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COL_BITS}] ${MODELPARAM_VALUE.COL_BITS}
}

proc update_MODELPARAM_VALUE.BA_BITS { MODELPARAM_VALUE.BA_BITS PARAM_VALUE.BA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BA_BITS}] ${MODELPARAM_VALUE.BA_BITS}
}

proc update_MODELPARAM_VALUE.BYTE_LANES { MODELPARAM_VALUE.BYTE_LANES PARAM_VALUE.BYTE_LANES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BYTE_LANES}] ${MODELPARAM_VALUE.BYTE_LANES}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH { MODELPARAM_VALUE.AXI_ID_WIDTH PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH}] ${MODELPARAM_VALUE.AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.WB2_ADDR_BITS { MODELPARAM_VALUE.WB2_ADDR_BITS PARAM_VALUE.WB2_ADDR_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WB2_ADDR_BITS}] ${MODELPARAM_VALUE.WB2_ADDR_BITS}
}

proc update_MODELPARAM_VALUE.WB2_DATA_BITS { MODELPARAM_VALUE.WB2_DATA_BITS PARAM_VALUE.WB2_DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WB2_DATA_BITS}] ${MODELPARAM_VALUE.WB2_DATA_BITS}
}

proc update_MODELPARAM_VALUE.MICRON_SIM { MODELPARAM_VALUE.MICRON_SIM PARAM_VALUE.MICRON_SIM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MICRON_SIM}] ${MODELPARAM_VALUE.MICRON_SIM}
}

proc update_MODELPARAM_VALUE.ODELAY_SUPPORTED { MODELPARAM_VALUE.ODELAY_SUPPORTED PARAM_VALUE.ODELAY_SUPPORTED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ODELAY_SUPPORTED}] ${MODELPARAM_VALUE.ODELAY_SUPPORTED}
}

proc update_MODELPARAM_VALUE.SECOND_WISHBONE { MODELPARAM_VALUE.SECOND_WISHBONE PARAM_VALUE.SECOND_WISHBONE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SECOND_WISHBONE}] ${MODELPARAM_VALUE.SECOND_WISHBONE}
}

proc update_MODELPARAM_VALUE.WB_ERROR { MODELPARAM_VALUE.WB_ERROR PARAM_VALUE.WB_ERROR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WB_ERROR}] ${MODELPARAM_VALUE.WB_ERROR}
}

proc update_MODELPARAM_VALUE.SKIP_INTERNAL_TEST { MODELPARAM_VALUE.SKIP_INTERNAL_TEST PARAM_VALUE.SKIP_INTERNAL_TEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SKIP_INTERNAL_TEST}] ${MODELPARAM_VALUE.SKIP_INTERNAL_TEST}
}

proc update_MODELPARAM_VALUE.ECC_ENABLE { MODELPARAM_VALUE.ECC_ENABLE PARAM_VALUE.ECC_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ECC_ENABLE}] ${MODELPARAM_VALUE.ECC_ENABLE}
}

proc update_MODELPARAM_VALUE.DIC { MODELPARAM_VALUE.DIC PARAM_VALUE.DIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIC}] ${MODELPARAM_VALUE.DIC}
}

proc update_MODELPARAM_VALUE.RTT_NOM { MODELPARAM_VALUE.RTT_NOM PARAM_VALUE.RTT_NOM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RTT_NOM}] ${MODELPARAM_VALUE.RTT_NOM}
}

proc update_MODELPARAM_VALUE.DQ_BITS { MODELPARAM_VALUE.DQ_BITS PARAM_VALUE.DQ_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DQ_BITS}] ${MODELPARAM_VALUE.DQ_BITS}
}

proc update_MODELPARAM_VALUE.serdes_ratio { MODELPARAM_VALUE.serdes_ratio PARAM_VALUE.serdes_ratio } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.serdes_ratio}] ${MODELPARAM_VALUE.serdes_ratio}
}

proc update_MODELPARAM_VALUE.wb_addr_bits { MODELPARAM_VALUE.wb_addr_bits PARAM_VALUE.wb_addr_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wb_addr_bits}] ${MODELPARAM_VALUE.wb_addr_bits}
}

proc update_MODELPARAM_VALUE.wb_data_bits { MODELPARAM_VALUE.wb_data_bits PARAM_VALUE.wb_data_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wb_data_bits}] ${MODELPARAM_VALUE.wb_data_bits}
}

proc update_MODELPARAM_VALUE.wb_sel_bits { MODELPARAM_VALUE.wb_sel_bits PARAM_VALUE.wb_sel_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wb_sel_bits}] ${MODELPARAM_VALUE.wb_sel_bits}
}

proc update_MODELPARAM_VALUE.wb2_sel_bits { MODELPARAM_VALUE.wb2_sel_bits PARAM_VALUE.wb2_sel_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wb2_sel_bits}] ${MODELPARAM_VALUE.wb2_sel_bits}
}

proc update_MODELPARAM_VALUE.cmd_len { MODELPARAM_VALUE.cmd_len PARAM_VALUE.cmd_len } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cmd_len}] ${MODELPARAM_VALUE.cmd_len}
}

proc update_MODELPARAM_VALUE.AXI_LSBS { MODELPARAM_VALUE.AXI_LSBS PARAM_VALUE.AXI_LSBS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_LSBS}] ${MODELPARAM_VALUE.AXI_LSBS}
}

proc update_MODELPARAM_VALUE.AXI_ADDR_WIDTH { MODELPARAM_VALUE.AXI_ADDR_WIDTH PARAM_VALUE.AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_DATA_WIDTH { MODELPARAM_VALUE.AXI_DATA_WIDTH PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.AXI_DATA_WIDTH}
}

