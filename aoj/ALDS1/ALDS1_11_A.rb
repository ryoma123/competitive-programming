n = gets.to_i
a = n.times.map{gets.split.map(&:to_i)}

m = Array.new(n){Array.new(n){0}}

(0...n).each do |i|
  u, k = a[i][0], a[i][1]
  u -= 1

  (0...k).each do |j|
    v = a[i][j + 2]
    v -= 1

    m[u][v] = 1
  end
end
puts m.map{|l| l.join(' ')}
