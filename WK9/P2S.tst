// Test script for the Parallel to Serial (P2S) Converter
load P2S.hdl;
output-file P2S.out;
compare-to P2S.cmp;
output-list indata[0..3] %B1.4.1 enable %B1 load %B1 sout %B1 complete %B1;

// Load data into the circuit
set indata %B0000;
set load 1;
set enable 0;
tick;
tock;

// Load 4-bit value into the register
set indata %B1011;
set load 1;
set enable 0;
tick;
tock;

// Start transmitting
set load 0;
set enable 1;
tick;
tock;
tick;
tock;

// Observe sout output and complete signal during the 4 cycles
tick;
tock;
tick;
tock;
tick;
tock;
tick;
tock;

// Check that complete is set after the transmission
tick;
tock;
