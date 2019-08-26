n, q = gets.split.map(&:to_i)
queue = n.times.map {gets.split}.map! {|a| [a[0], a[1].to_i] }

time = 0

while !queue.empty?
  a = queue.shift
  m = [a[1], q].min
  a[1] = a[1] - m
  time += m

  if a[1] > 0
    queue.push(a)
  else
    puts "#{a[0]} #{time}"
  end
end
