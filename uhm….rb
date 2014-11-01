# encoding: ISO-8859-1

puts "-----  Default external/internal encodings (UTF8 and nil, despite magic comment and flags)  -----"
puts "  external encoding          | #{Encoding.default_external.inspect}"
puts "  internal encoding          | #{Encoding.default_internal.inspect}"
puts

puts "-----  File system says it is iso-8859-1, but reads in as UTF-8  -----"
puts "  file system says:          | #{`file --brief --mime-encoding input.txt`.chomp.inspect}"
file  = File.read "input.txt"
puts "  file                       | #{file.inspect} #{file.encoding.inspect}"
puts

puts "-----  It isn't a valid UTF-8 file b/c, you know, it's not UTF-8...  -----"
begin
  match = file[/\w/]
  puts "!!expected this to blow up O.o!!"
rescue
  puts "  exception when matching    | #{$!.inspect}"
end
puts

puts "-----  Forcing the encoding causes gives a hex representation and regexp doesn't match  -----"
file2 = file.dup
file2.force_encoding(Encoding::ISO_8859_1)
puts "  after forcing              | #{file2.inspect} #{file2.encoding.inspect}"
puts "  regexp doesn't match       | #{file2[/\w/].inspect}"
puts

puts "-----  Force and then converting makes it human readable, but regex is still confused  -----"
file3 = file2.encode('utf-8')
puts "  after forcing & converting | #{file3.inspect} #{file3.encoding.inspect}"
puts "  regexp still doesn't match | #{file3[/\w/].inspect}"
puts

puts "-----  Comparing representations  -----"
printf "  original file              | %-8p %-15p %p\n", file,  file.bytes,  file.encoding
printf "  forced encoding            | %-8p %-15p %p\n", file2, file2.bytes, file2.encoding
printf "  converted file             | %-8p %-15p %p\n", file3, file3.bytes, file3.encoding
