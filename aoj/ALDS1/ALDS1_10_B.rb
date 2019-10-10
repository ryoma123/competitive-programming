n = gets.to_i
p, q = n.times.map{gets.split.map(&:to_i)}.transpose
p.push(q[-1])

m = []

(1..n).each do |i|
  m[i] = []
  m[i][i] = 0
end

(2..n).each do |l|
  (1..(n - l + 1)).each do |i|
    j = i + l - 1
    m[i][j] = (1 << 21)

    (i..(j - 1)).each do |k|
      m[i][j] = [m[i][j], m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j]].min
    end
  end
end
puts m[1][n]
