n, m = gets.split.map(&:to_i)
arr = m.times.map{gets.split.map(&:to_i)}

num = 'x' * n

arr.each do |a|
  if num[a[0] - 1] == 'x'
    num[a[0] - 1] = a[1].to_s
  elsif num[a[0] - 1] != a[1].to_s
    puts -1
    exit
  end
end

if n != 1 && num[0] == '0'
  puts -1
  exit
elsif n != 1 && num[0] == 'x'
  num[0] = '1'
elsif n == 1 && num[0] == 'x'
  num[0] = '0'
end

puts num.gsub(/x/, '0')
