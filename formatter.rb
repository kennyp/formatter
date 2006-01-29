# Defines data to be parsed.
data = "// Fig. 1.2: fig01_02.cpp
// A first program in C++
#include <iostream>

int main()
{
  std::cout << \"Welcome to C++!\\n\";
  
  return 0;   // indicate that program ended successfully
}"

# Defines Regular Expressions to be worked through.
Comment = /\/\/.*[^\n]/
Quote = /\"[^\"]+\"/

# Replaces the regex in the data object with the holder and returns a array. 
def pull(data, holder, regex)
  store = data.scan(regex)
  data.gsub!(regex, holder)
  store
end

# Replaces the holder in the data object with the array items in sequence.
def place(data, holder, array)
  while array.length > 0
    data.sub!(holder, array[0])
    array.shift
  end
end

puts "Before Comment Removal"
puts data

comment = pull(data, "--::Comment::--", Comment)
quote = pull(data, "--::Quote::--", Quote)

puts
puts "After Comment Removal"
puts data

place(data, "--::Comment::--", comment)
place(data, "--::Quote::--", quote)

puts
puts "After Comment Reinsert"
puts data

# The beginings of an object.
class Source
  def initialize(file)
    @data = File.open("#{file}").read
  end
  def pull(data, holder, regex)
    store = data.scan(regex)
    data.gsub!(regex, holder)
    store
  end
  def place(holder, array)
    while array.length > 0
      @data.sub!(holder, array[0])
      array.shift
    end
  end
end