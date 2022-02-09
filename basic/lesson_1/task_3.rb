def right_triangle?(arr)
  ans = 'triangle is right'
  ans += 'and isosceles' if arr[0] == arr[1] || arr[0] == arr[2] || arr[1] == arr[2]
  ans if (arr[0]**2) == (arr[1]**2 + arr[2]**2)

end

print 'Enter 3 side of the triangle (sep - space): '
a, b, c = gets.chomp.split.map(&:to_f)
sides_length = [a, b, c]
sides_length.sort!.reverse!

if right_triangle?(sides_length)
  puts 'triangle is right'
elsif a == b && a == c
  puts 'triangle is equilateral'
end
