data = "// Fig. 1.2: fig01_02.cpp
// A first program in C++
#include <iostream>

int main()
{
  std::cout << \"Welcome to C++!\\n\";
  
  return 0;   // indicate that program ended successfully
}"

puts "Before Comment Removal"
puts data

Comment = /\/\/.*[^\n]/
Quote = /\"[^\"]+\"/

def pull(data, holder, regex)
  store = []
  while data =~ regex
    store += ["#{$&}"]
    data.sub!(regex, holder)
  end
  store
end

comment = pull(data, "--::Comment::--", Comment)
quote = pull(data, "--::Quote::--", Quote)

puts
puts "After Comment Removal"
puts data

def place(data, holder, array)
  while array.length > 0
    data.sub!(holder, array[0])
    array.shift
  end
end

place(data, "--::Comment::--", comment)
place(data, "--::Quote::--", quote)

puts
puts "After Comment Reinsert"
puts data