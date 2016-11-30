## Ruby does not support function overloading, so a list must be used instead
def hi(*name)
  if name.size < 1
    puts "Hello World from a function!"
  else
    puts "Hello #{name.at(0)} from a function!"
  end
end

class Greeter
  def initialize(name = "World")
    @name = name ## @ means instance variable, avaible to all methods in the class
  end
  
  def say_hi
    puts "Hi #{@name}!"
  end
  
  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end  
  

puts "Hello World!"
puts 3+2
puts 3**2
puts Math.sqrt(9)

hi
hi("Rhys")

Greeter.instance_methods(false)
greeter = Greeter.new("Rhys")
greeter.say_hi
greeter.say_bye

## File IO

fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Testing"
somefile.puts "File IO"
somefile.puts "For"
somefile.puts "Multiple"
somefile.puts "Lines"
somefile.close

puts ""
puts "------"
puts ""

file = File.open("sample.txt", "r")
contents = file.read
puts contents

puts ""
puts "------"
puts ""

File.open("sample.txt").readlines.each do |line|
  puts "-> " + line
end




