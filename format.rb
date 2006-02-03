require 'optparse'
require 'rdoc/usage'
# Require all files in the lib directory.
LIB_DIR = File.join(File.dirname(__FILE__), 'lib')
$:.unshift(LIB_DIR) unless $:.include? LIB_DIR
Dir::entries(LIB_DIR).each {|f| require $1 if /^(.*)\.rb$/i =~ f}

def show_help
  puts "What is your problem. Don't you know how I work?!\nYOU WROTE ME!!!"
end

def go_for_it(filename)
  f = Format::Source.new(filename)

  puts "Before My Editing"
  puts f.data

  f.pull_comments_and_quotes(/\/\/.*[^\n]/, /\"[^\"]+\"/)

  puts "\n\n"
  puts "After My Editing"
  puts f.data

  f.place_comments_and_quotes

  puts "\n\n"
  puts "After My Replace"
  puts f.data
end

opts = OptionParser.new
opts.on("-f", "--file") { |str| filename = str }
opts.parse(ARGV) rescue show_help

begin
go_for_it(filename)
rescue
  puts "No File Bozo"
end