n = gets.to_i
a = gets.split.map(&:to_i)

# 交換回数
$count = 0

def bubble_sort(a, n)
  flag = true
  i = 1

  while flag
    flag = false

    (i..n-1).reverse_each do |j|
      if a[j] < a[j-1]
        tmp = a[j]
        a[j] = a[j-1]
        a[j-1] = tmp
        flag = true

        $count += 1
      end
    end
    i += 1
  end
  a
end

puts bubble_sort(a, n).join(' ')
puts $count
