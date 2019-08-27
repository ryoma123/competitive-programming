n = gets.to_i
a = n.times.map{gets.split.map(&:to_s)}

list = []

a.each do |c|
  if c[0] == 'delete'
    for i in 0..list.count-1
      if c[1].to_i == list[i]
        list.delete_at(i)
        break
      end
    end
  elsif c[0] == 'deleteFirst'
    list.shift
  elsif c[0] == 'deleteLast'
    list.pop
  else
    list.unshift(c[1].to_i)
  end
end
puts list.join(' ')
