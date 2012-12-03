require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc=Nokogiri::HTML(open("http://betcityru.com/bets/bets2.php?line_id%5b%5d=2066"))
data=doc.css('.tc td')
data=data.map do |cell|
  cell.text.strip
end
data.delete_at(-1)

league=doc.css('thead b').text
date=doc.css('.date td').text

puts "League: #{league}"
puts "Date: #{date}"

cell_names= %w(time team1 handicap1 odds1 team2 handicap2 odds2 bet_1 bet_x bet_2 bet_1x bet_12 bet_x2 bet_total bet_under bet_over bet_ext)
result=cell_names.zip data
puts "Event: #{result[1][1]} - #{result[4][1]}"
result.each do |res|
  puts "#{res[0]} = #{res[1]}"
end

