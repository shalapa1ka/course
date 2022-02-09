vowels = ['a', 'e', 'i', 'o', 'u']
all = ('a'..'z').to_a
vowels_hash = {}
all.each_with_index { |l, i| vowels_hash[l.to_s] = i + 1 if vowels.include?(l) }
puts vowels_hash
