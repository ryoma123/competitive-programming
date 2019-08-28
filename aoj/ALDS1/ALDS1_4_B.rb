n = gets.to_i
s = gets.split.map(&:to_i)
_ = gets.to_i
t = gets.split.map(&:to_i)

sum = 0

def binary_search(s, n, key)
  left = 0
  right = n

  while left < right
    mid = (left + right) / 2

    if key == s[mid]
      return true
    elsif key < s[mid]
      right = mid
    else
      left = mid + 1
    end
  end
  false
end

t.each do |key|
  sum += 1 if binary_search(s, n, key)
end
puts sum
