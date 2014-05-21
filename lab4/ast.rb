require 'ruby_parser'
require 'ripper'
require 'colored'
require 'pry'

file = ARGV[0]
src = File.read(file)

puts "Real code".blue
puts src.to_s.green

puts "\nRubyParser".blue
rp = RubyParser.new.parse src
puts rp.to_s.yellow

puts "\nRipper".blue
ast = Ripper.sexp src
puts ast.to_s.red

binding.pry