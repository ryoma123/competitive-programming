a = gets.split.map(&:to_i)

arr = [a.inject(:+), a.inject(:-), a.inject(:*)]
puts arr.max
