n = gets.to_i
arr = gets.split.map(&:to_i)

arr.sort!.reverse!
a, b = 0, 0

for i in 0..n-1
  if i.odd?
    a += arr[i]
  else
    b += arr[i]
  end
end
puts (a - b).abs
