n = gets.to_i
a = gets.split.map(&:to_i)

def insertion_sort(a, n)
  for i in 1..n-1
    puts a.join(' ')

    v = a[i]
    j = i - 1

    while j >= 0 && a[j] > v
      a[j+1] = a[j]
      j -= 1
    end
    a[j+1] = v
  end
  a
end

puts insertion_sort(a, n).join(' ')
