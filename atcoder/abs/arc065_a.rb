s = gets.chomp

a = ['dream', 'dreamer', 'erase', 'eraser']
a.sort_by! {|i| i.size }.reverse!
n = a.size

loop do
  if s.empty?
    puts 'YES'
    exit
  end

  for i in 0..n-1
    if /#{a[i]}\z/ === s
      s.sub!(/#{a[i]}\z/, '')
      break
    end

    if i == n-1
      puts 'NO'
      exit
    end
  end
end
