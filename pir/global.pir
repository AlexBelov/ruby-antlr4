.sub main

$P10 = new "ResizablePMCArray"
$P10[0] = 42
set_global "$global_var", $P10
gl()

.end

.sub gl
	get_global $P0, "$global_var"
	$P1 = $P0[0]
	say $P1
.end
