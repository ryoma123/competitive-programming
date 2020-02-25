(11..).step(2) do |i|
  if i.to_s == i.to_s.reverse &&
     i.to_s(2) == i.to_s(2).reverse &&
     i.to_s(8) == i.to_s(8).reverse
    puts i
    break
  end
end
