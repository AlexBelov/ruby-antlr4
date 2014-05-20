##Result

__Real code__  
a = 100+2*3  

__RubyParse__  
s(:lasgn, :a, s(:call, s(:lit, 100), :+, s(:call, s(:lit, 2), :*, s(:lit, 3))))  

__Ripper__  
[:program, [[:assign, [:var_field, [:@ident, "a", [1, 0]]], [:binary, [:@int, "100", [1, 4]], :+, [:binary, [:@int, "2", [1, 8]], :*, [:@int, "3", [1, 10]]]]]]]  