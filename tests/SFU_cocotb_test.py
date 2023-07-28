# ==============================================================================
# Authors:              Doğu Erkan Arkadaş - Utkucan Doğan
#
# Cocotb Testbench:     For Signed Magnitude Adder/Subtractor
#
# Description:
# ------------------------------------
# Several test-benches as example for EE446
#
# License:
# ==============================================================================


import random
import warnings

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge
from cocotb.triggers import Edge
from cocotb.binary import BinaryValue
#from cocotb.regression import TestFactory

def print_func(dut):
    print("Mem out: ", dut.Inst_Mem_Out.value)
    print("Header Out: ", dut.Header_Field_Out.value)
    print("PDR_ID: ", dut.PDR_ID.value)

def print_func_lu(dut):
    print("LU control: ", dut.my_LU.control.value)
    print("LU Header: ", dut.my_LU.Header.value)
    print("LU Data: ", dut.my_LU.Data.value)
    print("LU bit_map_in: ", dut.my_LU.bit_map_in.value)
    print("LU Out: ", dut.my_LU.Out.value)
    print("LU bitmap Out: ", dut.my_LU.bit_map_out.value)

@cocotb.test()
async def au_basic_test(dut):
    """Setup testbench and run a test.""" 
    #Generate the clock MUST ADD MEMORY INITIALIZATION STEPS OR USE READMEMH !!!!!!!!!!!!!!!!!!!!!!!
    await cocotb.start(Clock(dut.clk, 10, 'us').start(start_high=False))
    vec = BinaryValue(value=0,n_bits=36)
    vec.binstr = "00010000000000000000000000000000"
    print(vec.binstr)
    #set clkedge as the falling edge for triggers
    negclkedge = FallingEdge(dut.clk)
    posclkedge = RisingEdge(dut.clk)
    #wait until the falling edge
    await posclkedge
    #change input values of the module
    dut.bit_map_in.value = 0
    dut.WE.value = 1
    dut.PDR_ID.value = 0
    dut.Header_Field_In.value = 5
    dut.WD.value = vec
    dut.W_ADDR.value = 0
    await posclkedge
    dut.WE.value = 0
    await negclkedge
    #check if the module added the values correctly   
    assert dut.bit_map_out.value == dut.bit_map_in.value
    assert dut.Header_Field_Out.value == dut.Header_Field_In.value

    dut.bit_map_in.value = 1
    vec.binstr = "00000000000000000000000000000000"
    dut.WD.value = vec
    dut.WE.value = 1
    dut.W_ADDR.value = 1
    await posclkedge
    await negclkedge

    print_func(dut)
    print_func_lu(dut)

    assert dut.bit_map_out.value == 0
    assert dut.Header_Field_Out.value == dut.Header_Field_In.value

    vec.binstr = "001000000000000000000000000000010000"
    dut.WD.value = vec

    await posclkedge
    await negclkedge

    print_func(dut)
    print_func_lu(dut)
    assert dut.bit_map_out.value == 1
    assert dut.Header_Field_Out.value == 16
    
    #You can print individuals bits with the below syntax
    #print(dut.Q[0].value,dut.Q[1].value,dut.Q[2].value)
    #print(dut.Q.value)
