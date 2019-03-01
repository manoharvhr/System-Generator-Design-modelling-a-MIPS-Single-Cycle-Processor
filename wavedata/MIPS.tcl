load C:/Xilinx/Vivado/2018.2/lib/win64.o/librdi_dsp_tcltasks.dll
cd {C:/432/ecte432-project-1/wavedata}
dsp_wave_convert {MIPS.wfv} 
set_param project.waveformStandaloneMode 1
start_gui
current_fileset
dsp_register_design_manager
dsp_open_waveform {MIPS.wdb}
open_wave_config {MIPS.wcfg}
source C:/Xilinx/Vivado/2018.2/scripts/sysgen/tcl/SgPaSlaveInterp.tcl
