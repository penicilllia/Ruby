# Идеальный вес 

print 'Введите ваше имя: '
name = gets.chomp
print 'Введите ваш рост: '
height = gets.chomp
ideal_weight = (height.to_i - 110) * 1.15 
puts "#{name}, ваш идеальный вес #{ideal_weight}."
if ideal_weight < 0
  print 'Ваш вес уже оптимальный.'
end