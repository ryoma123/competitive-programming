require 'date'

t = Date.parse('19641010')..Date.parse('20200724')
a = t.map {|d| d.strftime('%Y%m%d').to_i }

puts a.select {|d| d == d.to_s(2).reverse.to_i(2) }
