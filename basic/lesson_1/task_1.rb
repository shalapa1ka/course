print 'Name: '
name = gets.chomp
print 'Height: '
height = gets.chomp.to_f

ideal_weight = height - 110
if ideal_weight.positive?
  puts "#{name} you're ideal weight is #{ideal_weight}"
else
  puts 'Your weight is already optimal'
end
