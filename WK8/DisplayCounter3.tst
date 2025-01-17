// File: DisplayCounter3.tst
// Test script for DisplayCounter3.hdl
load DisplayCounter3.hdl,
output-file DisplayCounter3.out,
compare-to DisplayCounter3.cmp,
output-list inc%B3.1.3 reset%B3.1.3 a%B3.1.3 b%B3.1.3 c%B3.1.3 d%B3.1.3 e%B3.1.3 f%B3.1.3 g%B3.1.3;

// Test Case 1: Initial state (should display 0)
set inc 0,
set reset 0,
eval,
output;
// Expected: 0 display pattern (1111110)

// Test Case 2: Reset active (should display 0)
set inc 0,
set reset 1,
eval,
output;
// Expected: 0 display pattern (1111110)

// Test Case 3: First increment (should display 1)
set inc 1,
set reset 0,
eval,
output;
// Expected: 1 display pattern (0110000)

// Test Case 4: Second increment (should display 2)
set inc 1,
set reset 0,
eval,
output;
// Expected: 2 display pattern (1101101)

// Test Case 5: Third increment (should display 3)
set inc 1,
set reset 0,
eval,
output;
// Expected: 3 display pattern (1111001)

// Test Case 6: Reset while counting (should return to 0)
set inc 1,
set reset 1,
eval,
output;
// Expected: 0 display pattern (1111110)