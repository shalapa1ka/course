cart = {}
loop do
  print 'Enter title of stuff: '
  title = gets.chomp
  break if title == 'stop'

  print 'Enter price of stuff: '
  price = gets.chomp.to_f
  print 'Enter count of stuff: '
  count = gets.chomp.to_f
  puts
  cart[title] = { price: price, count: count, total_price: price * count }
end

puts "#{'Title'.ljust(20)} #{'Price'.ljust(20)} #{'Count'.ljust(20)} Total"
total = 0
cart.each do |key, i|
  puts "#{key.ljust(20)} #{i[:price].to_s.ljust(20)} #{i[:count].to_s.ljust(20)} #{i[:total_price]}"
  total += i[:total_price]
end
puts "Total is #{total}$"
