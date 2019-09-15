n, k, q = gets.split.map(&:to_i)
a = q.times.map{gets.to_i}

ans = {}
point = 0

a.each do |i|
  ans[i] = ans[i].nil? ? 1 : ans[i] + 1
end

(1..n).each do |i|
  point = ans[i].nil? ? k - q : k - q + ans[i]
  puts point > 0 ? 'Yes' : 'No'
end
