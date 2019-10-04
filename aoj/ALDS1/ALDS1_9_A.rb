n = gets.to_i
a = gets.split.map(&:to_i)

def parent(i)
  i / 2
end

def left(i)
  2 * i
end

def right(i)
  2 * i + 1
end

(1..n).each do |i|
  s =  "node #{i}: key = #{a[i - 1]}, "
  s << "parent key = #{a[parent(i) - 1]}, " if parent(i) >= 1
  s << "left key = #{a[left(i) - 1]}, " if left(i) <= n
  s << "right key = #{a[right(i) - 1]}, " if right(i) <= n
  puts s
end
