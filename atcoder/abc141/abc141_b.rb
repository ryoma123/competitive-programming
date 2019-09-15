s = gets.chomp.split('')

n = s.size

odd_allow = ['R', 'U', 'D']
even_allow = ['L', 'U', 'D']

for i in 0...n
  if (i+1).odd?
    unless odd_allow.include?(s[i])
      puts 'No'
      exit
    end
  else
    unless even_allow.include?(s[i])
      puts 'No'
      exit
    end
  end
end
puts 'Yes'
