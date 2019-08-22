n = gets.to_i
a = gets.split.map(&:to_i)

# 交換回数
$count = 0

def selection_sort(a, n)
  for i in 0..n-1
    minj = i

    for j in i..n-1
      if a[j] < a[minj]
        minj = j
      end
    end
    tmp = a[i]
    a[i] = a[minj]
    a[minj] = tmp

    if i != minj
      $count += 1
    end
  end
  a
end

puts selection_sort(a, n).join(' ')
puts $count
