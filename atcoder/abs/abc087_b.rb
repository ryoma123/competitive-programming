a = gets.to_i
b = gets.to_i
c = gets.to_i
total = gets.to_i

count = 0

for a_num in 0..a
  for b_num in 0..b
    for c_num in 0..c
      count += 1 if (500 * a_num) + (100 * b_num) + (50 * c_num) == total
    end
  end
end
puts count
