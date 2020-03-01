a = [10, 50, 100, 500]
cnt = 0

(2..15).each do |i|
  a.repeated_combination(i).each do |j|
    cnt += 1 if j.inject(:+) == 1000
  end
end
puts cnt
