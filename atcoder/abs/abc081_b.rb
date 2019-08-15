_ = gets
arr = gets.chomp.split.map(&:to_i)

count = 0
while arr.all? {|i| i.even? } do
  arr.map! {|i| i / 2 }
  count += 1
end
puts count
