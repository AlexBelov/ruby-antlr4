.sub main

.local pmc mas
mas = new "ResizablePMCArray"
mas[0] = 1
mas[1] = 2
$I0 = len(mas)
say $I0

.local string b
b = "hello"
$I0 = len(b)
say $I0

#.local pmc a
#a = gets()
#say a

#.local pmc c
#c = to_int(a)
#c = to_string(c)
#say c

.local string s
b = "hello"
s = ""
$S0 = b
$S1 = s
$P0 = new "ResizablePMCArray"
$P0 = split_str($S1, $S0)
#$P0 = split "", "abc"
set $P1, $P0[0]
print $P1

$P1 = read_file("test.txt")
$S1 = $P1[0]
print $S1

write_file("test1.txt", $P1)

.end

.sub len
	.param pmc array
	elements $I0, array
	.return($I0)
.end

.sub gets
  .local pmc stdin
  .local string str
  stdin = getstdin
  str = stdin.'readline'()
  .return(str)
.end

.sub to_int
	.param pmc var
	$I0 = var
	.return($I0)
.end

.sub to_float
	.param pmc var
	$N0 = var
	.return($N0)
.end

.sub to_string
	.param pmc var
	$S0 = var
	.return($S0)
.end

.sub split_str
	.param pmc str
	.param pmc splitter
	$S0 = splitter
	$S1 = str
	$P0 = split $S0, $S1
	.return($P0)
.end

.loadlib 'io_ops'

.sub read_file
	.param pmc file_name
	.local pmc array
	array = new "ResizablePMCArray"
	$S0 = file_name
  $P0 = open $S0, "r"
loop_file:
  $S0 = readline $P0
  push array, $S0
  if $P0 goto loop_file
  .return(array)
.end

.sub write_file
	.param pmc file_name
	.param pmc array
	$P1 = array
	$I1 = len($P1)
	$S0 = file_name
  $P0 = open $S0, "w"
  $I0 = 0
loop_file:
	$S0 = $P1[$I0]
	print $P0, $S0
  $I0 = $I0 + 1
  $S1 = $P1[$I0]
  if $I0 <= $I1 goto loop_file
  close $P0
.end
