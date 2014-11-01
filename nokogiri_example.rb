require 'nokogiri'

puts "File.read: #{Nokogiri::HTML(File.read 'nokogiri_input.html').at_css('body').text.inspect}"
File.open('nokogiri_input.html') do |file|
  puts "File.open: #{Nokogiri::HTML(file).at_css('body').text.inspect}"
end

# >> File.read: "\xE7"
# >> File.open: "ç"
