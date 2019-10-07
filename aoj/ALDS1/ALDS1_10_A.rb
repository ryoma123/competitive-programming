n = gets.to_i

$dp = Array.new(50, -1)

def fib(n)
  return $dp[n] = 1 if n == 0 || n == 1
  return $dp[n] if $dp[n] != -1
  $dp[n] = fib(n - 1) + fib(n - 2)
end
puts fib(n)
