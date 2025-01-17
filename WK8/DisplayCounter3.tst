// Test script for DisplayCounter3.hdl
load DisplayCounter3.hdl,
output-file DisplayCounter3.out,
compare-to DisplayCounter3.cmp,
output-list a%B3.1.3 b%B3.1.3 c%B3.1.3 d%B3.1.3 e%B3.1.3 f%B3.1.3 g%B3.1.3;

// Test 0: Initialize the counter
// Set reset high to ensure the counter starts at 0
set reset 1,
set inc 0,
eval,
output;

// Disable reset to begin testing increment
set reset 0,
eval;

// Test 1: Increment the counter
set inc 1,
eval,
output;

// Simulate multiple increments
repeat 16 {
    tick,
    tock,
    output;
}

// Test 2: Reset the counter
set reset 1,
eval,
output;

// Disable reset and increment again
set reset 0,
set inc 1,
tick,
tock,
output;

// Test 3: No change when inc=0
set inc 0,
tick,
tock,
output;
