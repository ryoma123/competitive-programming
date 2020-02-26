op = ['*', '']
(1000..9999).each do |i|
  i = i.to_s
  op.each do |j|
    op.each do |k|
      op.each do |l|
        next if j.empty? && k.empty? && l.empty?

        val = i[0] + j + i[1] + k + i[2] + l + i[3]
        next if val.include?("*0")

        n = eval(val)
        next if n[0].zero?

        puts "#{i} (#{val} = #{n})" if n == i.reverse.to_i
      end
    end
  end
end
