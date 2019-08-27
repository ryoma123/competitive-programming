arr = gets.chomp.split('')

s1 = []
s2 = []

for i in 0..(arr.count-1)
  if arr[i] == '\\'
    s1.push(i)
  elsif arr[i] == '/' && s1.size > 0
    j = s1.pop
    a = i - j

    while s2.size > 0 && s2[-1][0] > j
      a += s2[-1][1]
      s2.pop
    end
    s2.push([j, a])
  end
end

if s2.empty?
  puts "0\n0"
  exit
end

puts s2.map {|a| a[1] }.inject(:+)
puts "#{s2.count} #{s2.map {|a| a[1]}.join(' ')}"
