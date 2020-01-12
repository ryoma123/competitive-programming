n, m = gets.split.map(&:to_i)
a = m.times.map {gets.split}.map! {|a| [a[0].to_i, a[1].chomp] }

p = Array.new(n)
ans, pen = 0, 0

a.each do |v|
  if v[1] == 'WA'
    if p[v[0]].nil?
      p[v[0]] = {p: 1, s: nil}
    elsif p[v[0]][:s].nil?
      p[v[0]][:p] += 1
    end
  else
    if p[v[0]].nil?
      p[v[0]] = {p: 0, s: 1}
    else
      p[v[0]][:s] = 1
    end
  end
end

p.compact.each do |v|
  unless v[:s].nil?
    ans += 1
    pen += v[:p]
  end
end
puts "#{ans} #{pen}"
