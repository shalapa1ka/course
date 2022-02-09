def calculate_roots(a, b, c)
  d = b**2 - 4 * a * c
  return 'Корней нет' unless d.positive?

  -b / (2 * a) if d.zero?
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  "D = #{d}, x1 = #{x1}, x2 = #{x2}"
end

print 'a = '
a = gets.chomp.to_f
print 'b = '
b = gets.chomp.to_f
print 'c = '
c = gets.chomp.to_f

puts calculate_roots(a, b, c)
