n = gets.to_i

def lcs(x, y)
  m = x.size
  n = y.size
  c = []
  maxl = 0

  x.unshift(nil)
  y.unshift(nil)

  (0..m).each do |i|
    c[i] = []
    c[i][0] = 0
  end
  (1..n).each do |i|
    c[0][i] = 0
  end

  (1..m).each do |i|
    (1..n).each do |j|
      if x[i] == y[j]
        c[i][j] = c[i - 1][j - 1] + 1
      else
        c[i][j] = [c[i - 1][j], c[i][j - 1]].max
      end
      maxl = [maxl, c[i][j]].max
    end
  end
  maxl
end

(0...n).each do |i|
  s1 = gets.chomp
  s2 = gets.chomp
  puts lcs(s1.chars, s2.chars)
end
