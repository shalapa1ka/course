arr = [0, 1, 1]
i = arr[-1] + arr[-2]
while i <= 100
  arr << i
  i = arr[-1] + arr[-2]
end
puts arr
