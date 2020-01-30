# See LICENSE for license details.

#*****************************************************************************
# simple.S
#-----------------------------------------------------------------------------
#
# This is the most basic self checking test. If your simulator does not
# pass thiss then there is little chance that it will pass any of the
# more complicated self checking tests.
#

addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0
addi zero, a1, 0

pass:
  addi zero, a1, 0

