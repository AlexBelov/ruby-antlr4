.sub hello :main
  .local int a
  .local num b
  a = 1
  b = 1.2
  .local num tmp
  tmp = a + b
  print tmp
  say "\n"

  .local string hello
  hello = "Hello!\n"
  $S1 = hello
  print $S1
  $P1 = split "", hello
  $I0 = 0
  set $P2, $P1[$I0]
  print $P2
  say "\n"
  
  $P0 = new "ResizablePMCArray"
  push $P0, 'stringgg'
  push $P0, '1123445'
  $S2 = pop $P0
  .local string abcd
  abcd = "aVcd"
  $S2 = abcd
  $S0 = "abcd"
  $S1 = "ABCD"
  $I3 = ord $S2, 0
  $I4 = ord $S2, 1
  $I1 = isgt $S0, $S1
  say $I1

  $I1 = 10
  $I2 = 20

  if $I1 < $I2 goto FALSE_IF
  say "10 < 20\n"
  goto TRUE_IF
FALSE_IF:
  say "10 > 20\n"
TRUE_IF:

  func("Hello, world!\n" :named("str"))

  a = 1

  $P1 = calc(a, 2, 3)
  say "Calc!"
  say $P1
  say "\n"

  $P4 = new "Integer"
  $P4 = "hello!"
  say $P4
  $S1 = typeof $P4
  say $S1
  $I1 = 5
  $N1 = $I1*1.24

  say $N1

  $S1 = "hello "
  $S1 = repeat "hello ", 3
  $S1 = repeat $S1, 3
  say $S1

  .local pmc str
  str = new "String"
  $P1 = new "String"
  str = "hello"
  $P1 = str
  $S2 = $P1
  $I0 = length $S2
  say $I0
  say "\n"

  say "Array!"
  $P0 = new "ResizablePMCArray"
  $P3 = new "String"
  push $P0, "abc"
  push $P0, "def"
  $S1 = $P0[0]
  say $S1
  $S2 = "ghi"
  $P0[10] = $S2
  $P3 = $P0[10]
  say $P3
  $S2 = "1111"
  $P0[10] = $S2
  $P3 = $P0[10]
  say $P3
  elements $I0, $P0
  say $I0
  say "\n"

  a = 1
  $P1 = 4
  $P0 = $P1 + 1
  $I1 = 4 + 1
  say $P0

  say "\n"
  say "MOD"
  $N1 = 2.5
  $N2 = 1.7
  $N3 = $N1 % $N2
  say $N3

  .local pmc arr
  .local pmc arr_val
  arr = new "ResizablePMCArray"
  arr[1] = 1115
  $P3 = arr[1]
  arr_val = $P3
  $P2 = arr_val
  say $P2

  say "\n"
  .local pmc save_loop_var
  save_loop_var = new "Integer"

  .local int i
  i = 228
  save_loop_var = i
  $P1 = i
  say $P1

  say "FOR"
  .local int i
  i = 0
for_1_loop:
  unless i < 10 goto end_for
  say "FROM FOR_LOOP WITH LOVE"
  i = i + 1
  goto for_1_loop
end_for:
  say "END FOR"

  $P1 = i
  say $P1
  i = save_loop_var
  $P1 = i
  say $P1 

  .local pmc numm
  numm = new "Float"
  numm = 3.5


  $P5 = new "Integer"
  $P6 = new "Integer"
  $P7 = new "Integer"

  $P5 = 20

  $I1 = numm
  $I2 = 10
  $I3 = $P5

  $I0 = islt $I1, $I2
  $I4 = islt $I3, $I1
  $I5 = $I0 || $I4
  say "EXPPPPP"
  say $I5

  $S1 = "a"
  $S2 = "b"
  $I0 = islt $S1, $S2
  $I0 = not $I0
  say $I0 

  .local string str1
  str1 = "HAHAHA"
  $S1 = str1
  say $S1
  
  say "\nFUNCTIONS!!!!!!\n"
  func("Hello, i'm func!")
  func("And I!\n" :named("str"))
  a = 1
  $P1 = calc(a, 2, 3)
  say $P1
.end

.sub func
  .param string s :named("str")
  print s
.end

.sub global
  $P0 = get_hll_global 'env_g'
  say $P0
.end

.sub calc
  .param pmc a
  .param pmc b
  .param pmc c

  .local pmc d
  $P1 = b * c
  d = a + $P1  
  .return(d)
.end

.sub test_stdin
  .local pmc stdin
  .local string text
  stdin = getstdin
  text = stdin.'readline'()
  say text
.end