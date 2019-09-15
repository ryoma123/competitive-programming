n = gets.to_i
p = gets.split.map(&:to_i)

a = b = nil

(0...n).each do |i|
  if p[i] != i+1
    if a.nil?
      a = i
    elsif b.nil?
      b = i
      tmp = p[a]
      p[a] = p[b]
      p[b] = tmp
    else
      puts 'NO'
      exit
    end
  end
end
puts 'YES'
