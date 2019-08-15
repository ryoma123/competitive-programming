n, total = gets.split.map(&:to_i)

for a in 0..n
  for b in 0..n-a
    c = n - (a + b)
    if (10000 * a) + (5000 * b) + (1000 * c) == total
      puts "#{a} #{b} #{c}"
      exit
    end
  end
end
puts '-1 -1 -1'
