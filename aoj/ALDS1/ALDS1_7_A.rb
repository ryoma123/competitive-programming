if !ENV['RUBY_THREAD_VM_STACK_SIZE']
    #require 'rbconfig';RUBY=File.join(RbConfig::CONFIG['bindir'],RbConfig::CONFIG['ruby_install_name'])
    require 'rubygems';RUBY=Gem.ruby
    exec({'RUBY_THREAD_VM_STACK_SIZE'=>'100000000'},RUBY,$0) #100MB
end

N = gets.to_i

NONE = -1
$t = {}

def type(u)
  if $t[u][:p].nil?
    'root'
  elsif $t[u][:l].nil?
    'leaf'
  else
    'internal node'
  end
end

def child(u)
  a = []
  is_first = true
  c = $t[u][:l]
  s = '['

  while !c.nil?
    s << ', ' unless is_first
    s << c.to_s

    c = $t[c][:r]
    is_first = false
  end
  s << ']'
end

def print()
  (0...N).each do |u|
    puts "node #{u}: parent = #{$t[u][:p].nil? ? NONE : $t[u][:p]}, depth = #{$t[u][:d]}, #{type(u)}, #{child(u)}"
  end
end

def rec(u, p)
  $t[u][:d] = p
  rec($t[u][:r], p) unless $t[u][:r].nil?
  rec($t[u][:l], p + 1) unless $t[u][:l].nil?
end

(0...N).each do |i|
  $t[i] = {p: nil, l: nil, r: nil, d: nil}
end

N.times do |_|
  a = gets.split.map(&:to_i)

  if a[2].nil?
    next
  end

  v = a[0]
  d = a[1]
  l = 0

  (0...d).each do |i|
    c = a[i + 2]

    if i == 0
      $t[v][:l] = c
    else
      $t[l][:r] = c
    end

    l = c
    $t[c][:p] = v
  end
end

(0...N).each do |i|
  if $t[i][:p].nil?
    $r = i
  end
end

rec($r, 0)
print()
