#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
output=$($CALCULATOR 1 + 1)
if [[ "$output" != *"2"* ]]; then  # Check if output contains "2"
  echo "ERROR! A valid run of the calculator (1 + 1) failed to produce 2 in output!"
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then
  echo "ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!"
  exit 1
fi

# Test 04: Ensure addition produces the correct result.
output=$($CALCULATOR 2 + 2)
if [[ "$output" != *"4"* ]]; then
  echo "ERROR! (2 + 2) did not return 4 in output!"
  exit 1
fi

# Test 05: Ensure subtraction produces the correct result.
output=$($CALCULATOR 7 - 3)
if [[ "$output" != *"4"* ]]; then
  echo "ERROR! (7 - 3) did not return 4 in output!"
  exit 1
fi

# Test 06: Ensure multiplication produces the correct result.
output=$($CALCULATOR 5 '*' 5)
if [[ "$output" != *"25"* ]]; then
  echo "ERROR! (5 * 5) did not return 25 in output!"
  exit 1
fi

# Test 07: Ensure division produces the correct result.
output=$($CALCULATOR 8 / 2)
if [[ "$output" != *"4"* ]]; then
  echo "ERROR! (8 / 2) did not return 4 in output!"
  exit 1
fi

# Test 08: Ensure division by zero fails.
output=$($CALCULATOR 5 / 0)
#echo " Division by zero"
#echo $output
if [[ "$output" == *"0"* ]]; then
  echo "ERROR! Division by zero should have failed but it succeeded!"
  exit 1
fi

# If all tests pass, print success message and exit with status 0
echo "All tests passed!"
exit 0
