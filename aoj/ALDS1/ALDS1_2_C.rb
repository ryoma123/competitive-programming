n = gets.to_i
c1 = gets.split.map(&:to_s)
c2 = Marshal.load(Marshal.dump(c1))

def bubble_sort(c, n)
  for i in 0..n-1
    (n-1).downto(i+1) do |j|
      if c[j][1] < c[j-1][1]
        tmp = c[j]
        c[j] = c[j-1]
        c[j-1] = tmp
      end
    end
  end
  c
end

def selection_sort(c, n)
  for i in 0..n-1
    minj = i

    for j in i..n-1
      if c[j][1] < c[minj][1]
        minj = j
      end
    end
    tmp = c[i]
    c[i] = c[minj]
    c[minj] = tmp
  end
  c
end

bs = bubble_sort(c1, n).join(' ')
ss = selection_sort(c2, n).join(' ')

puts bs
puts 'Stable'
puts ss
puts (bs == ss) ? 'Stable' : 'Not stable'
