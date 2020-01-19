n = gets.to_i

c = {}
num = 0

(1..n).each do |i|
  h, t = i.to_s[0].to_i, i.to_s[-1].to_i

  if c[h].nil?
    c[h] = {}
    c[h][t] = 1
  elsif !c[h].nil? && c[h][t].nil?
    c[h][t] = 1
  else
    c[h][t] += 1
  end
end

(0..9).each do |i|
  (0..9).each do |j|
    if !c[i].nil? && !c[j].nil?
      if !c[i][j].nil? && !c[j][i].nil?
        num += c[i][j] * c[j][i]
      end
    end
  end
end
p num
