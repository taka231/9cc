#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 40 "195 +      37 - 150+65-     107 "
assert 4 "(3+5)/2"
assert 15 '5*(9-6)'
assert 4 '(3+5)/2'

echo OK