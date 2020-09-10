=begin
  5. Заданы три числа, которые обозначают число, месяц, год 
  (запрашиваем у пользователя). Найти порядковый номер даты, 
  начиная отсчет с начала года. Учесть, что год может быть високосным. 
  (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday 
  или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru
=end

print 'Введите число: '
day = gets.chomp.to_i
print 'Введите месяц: '
month = gets.chomp.to_i
print 'Введите год: '
year = gets.chomp.to_i

months_arr = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap = year%400 == 0 || (year%4 ==0 && year%100 != 0)

cur_day = 0
for i in (1...month)
  cur_day += months_arr[i] 
end

cur_day += day 
cur_day +=1 if leap == true && month > 2

puts "Порядковый номер даты, начиная с начала года: #{cur_day}."