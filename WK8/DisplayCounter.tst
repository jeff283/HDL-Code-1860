// Test script for DisplayCounter
// Tests normal counting, reset functionality, and edge cases
load DisplayCounter.hdl,
output-file DisplayCounter.out,
compare-to DisplayCounter.cmp,
output-list time%S1.4.1 inc%B1.1.1 reset%B1.1.1 a%B1.1.1 b%B1.1.1 c%B1.1.1 d%B1.1.1 e%B1.1.1 f%B1.1.1 g%B1.1.1;

// Test 1: Initial state should be 0
// Seven segment should show: 1111110 (0)
set inc 0,
set reset 0,
tick, tock, output;

// Test 2: Reset while at 0
// Should remain at 0: 1111110
set reset 1,
tick, tock, output;

// Test 3: First increment to 1
// Seven segment should show: 0110000 (1)
set reset 0,
set inc 1,
tick, tock, output;

// Test 4: Continue counting up to 5
// Testing normal counting operation
repeat 4 {
    tick, tock, output;
}

// Test 5: Stop incrementing
// Should hold current value
set inc 0,
tick, tock, output;

// Test 6: Reset while at 5
// Should go back to 0: 1111110
set reset 1,
tick, tock, output;

// Test 7: Count up to 9
// Testing full decimal range
set reset 0,
set inc 1,
repeat 9 {
    tick, tock, output;
}

// Test 8: Count up to F (15)
// Testing hexadecimal range
repeat 6 {
    tick, tock, output;
}

// Test 9: Try to increment past 15
// Should stay at 15
tick, tock, output;

// Test 10: Reset from 15
// Should go back to 0: 1111110
set reset 1,
tick, tock, output;

// Test 11: Simultaneous reset and increment
// Reset should take precedence, should show 0
set inc 1,
set reset 1,
tick, tock, output;