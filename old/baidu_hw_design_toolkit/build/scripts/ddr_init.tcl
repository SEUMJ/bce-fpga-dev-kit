source ./scripts/step_00_setup.tcl

set refDir $commonDir/ref_xdc
set usrXdcDir $usrDir/usr_xdc
set ddrIncFile $commonDir/hdl/usr_ddr4_define.vh
set comment "#"
set fp_define [open $ddrIncFile w]
exec rm -f $usrXdcDir/ddr_c0.xdc
exec rm -f $usrXdcDir/ddr_c1.xdc
exec rm -f $usrXdcDir/ddr_c2.xdc
exec rm -f $usrXdcDir/ddr_c3.xdc

if { ($USE_DDR4_C0 == 0) && ($USE_DDR4_C1 == 0) && ($USE_DDR4_C2 == 0) && ($USE_DDR4_C3 == 0)} {
    puts $fp_define "`define USE_NO_DDR 1"
}
if { $USE_DDR4_C0 == 1} {
    exec cp $refDir/ddr_c0.xdc $usrXdcDir
    puts $fp_define "`define USE_DDR4_C0 1"
} 
if { $USE_DDR4_C1 == 1} {
    exec cp $refDir/ddr_c1.xdc $usrXdcDir
    puts $fp_define "`define USE_DDR4_C1 1"
} 
if { $USE_DDR4_C2 == 1} {
    exec cp $refDir/ddr_c2.xdc $usrXdcDir
    puts $fp_define "`define USE_DDR4_C2 1"
} 
if { $USE_DDR4_C3 == 1} {
    exec cp $refDir/ddr_c3.xdc $usrXdcDir
    puts $fp_define "`define USE_DDR4_C3 1"
} 
close $fp_define

if { ($USE_DDR4_C0 == 1) || ($USE_DDR4_C1 == 1) || ($USE_DDR4_C2 == 1) || ($USE_DDR4_C3 == 1)} {
    source $scriptDir/rp_mig_bd.tcl
    validate_bd_design
    save_bd_design
    close_bd_design [get_bd_designs rp_mig_bd]

    # Set the appropriate OOC Synthesis settings for the .bd
    set_property synth_checkpoint_mode None [get_files  $projDir/${projName}.srcs/sources_1/bd/rp_mig_bd/rp_mig_bd.bd]
}
