// Test script for A6Q2201847757.hdl
load A6Q2201847757.hdl,
output-file A6Q2201847757.out,
compare-to A6Q2201847757.cmp,
output-list a b c d f;

// Test Case 1: First term (¬a ∧ ¬b ∧ ¬c ∧ ¬d) = 1
set a 0,
set b 0,
set c 0,
set d 0,
eval,
output;
// Expected: f=1

// Test Case 2: Second term (¬a ∧ ¬b ∧ ¬c ∧ d) = 1
set a 0,
set b 0,
set c 0,
set d 1,
eval,
output;
// Expected: f=1

// Test Case 3: Third term (¬a ∧ b ∧ ¬c ∧ ¬d) = 1
set a 0,
set b 1,
set c 0,
set d 0,
eval,
output;
// Expected: f=1

// Test Case 4: Fourth term (¬a ∧ b ∧ c ∧ d) = 1
set a 0,
set b 1,
set c 1,
set d 1,
eval,
output;
// Expected: f=1

// Test Case 5: Fifth term (a ∧ ¬b ∧ ¬c ∧ ¬d) = 1
set a 1,
set b 0,
set c 0,
set d 0,
eval,
output;
// Expected: f=1

// Test Case 6: Sixth term (a ∧ b ∧ c ∧ d) = 1
set a 1,
set b 1,
set c 1,
set d 1,
eval,
output;
// Expected: f=1

// Test Case 7: Non-matching case (a ∧ b ∧ ¬c ∧ d) = 0
set a 1,
set b 1,
set c 0,
set d 1,
eval,
output;
// Expected: f=0

// Test Case 8: Non-matching case (¬a ∧ b ∧ c ∧ ¬d) = 0
set a 0,
set b 1,
set c 1,
set d 0,
eval,
output;
// Expected: f=0