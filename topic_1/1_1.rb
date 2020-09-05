# Идеальный вес 

print 'Введите ваше имя: '
name = gets.chomp
print 'Введите ваш рост: '
height = gets.to_i
ideal_weight = (height - 110) * 1.15 
puts "#{name}, ваш идеальный вес #{ideal_weight}."
if ideal_weight < 0
  print 'Ваш вес уже оптимальный.'
end