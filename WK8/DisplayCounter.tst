// Test script for DisplayCounter chip
load DisplayCounter.hdl,
output-file DisplayCounter.out,
compare-to DisplayCounter.cmp,
output-list time%S1.4.1 inc%B3.1.3 reset%B3.1.3 a%B3.1.3 b%B3.1.3 c%B3.1.3 d%B3.1.3 e%B3.1.3 f%B3.1.3 g%B3.1.3;

// Test case 1: Reset functionality
set reset 1,
set inc 0,
tick, tock, output;

// Test case 2: Increment from 0 to 1
set reset 0,
set inc 1,
tick, tock, output;

// Test case 3: Continue incrementing
set inc 1,
tick, tock, output;

// Test case 4: Stop incrementing
set inc 0,
tick, tock, output;

// Test case 5: Reset while counting
set reset 1,
tick, tock, output;

// Test case 6: Multiple increments (testing 0-9)
set reset 0,
repeat 10 {
    set inc 1,
    tick, tock, output;
}

// Test case 7: Test overflow condition (15 -> 0)
// First, increment to 15
repeat 5 {
    set inc 1,
    tick, tock, output;
}

// Try to increment past 15 (should stay at 15)
set inc 1,
tick, tock, output;