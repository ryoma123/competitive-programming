n = gets.to_i
a = gets.split.map(&:to_i)

$m = a[0] - 1

def increse?(a, b)
  if a < b
    if $m != a
      $m = b - 1
    end
  end

  if a > b
    if a - 1 != b || $m > b
      return false
    end
  end
  true
end

for i in 0..n-2
  unless increse?(a[i], a[i+1])
    puts 'No'
    exit
  end
end
puts 'Yes'
