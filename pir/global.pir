.sub main

#$P10 = new "ResizablePMCArray"
#$P10[0] = 42
.local pmc a
a = new "ResizablePMCArray"
a[0] = 42
set_global "$global_var", a
gl()

.end

.sub gl
	.local pmc i
	get_global i, "$global_var"
	$P1 = i[0]
	say $P1
.end
