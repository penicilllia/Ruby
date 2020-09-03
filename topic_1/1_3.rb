# Квадратное уравнение

print "Введите первый коэффициент: "
a = Integer(gets.chomp)
print "Введите второй коэффициент: "
b = Integer(gets.chomp)
print "Введите третий коэффициент: "
c = Integer(gets.chomp)

d = b ** 2 - 4 * a * c

if d < 0
    puts "Действительных корней нет."
else
    x1 = (-b + Math.sqrt(d)) / (2 * a)
    x2 = (-b - Math.sqrt(d)) / (2 * a)
    if x1 == x2
        puts "Дискриминант равен #{d}. Корень равен #{x1}."
    else
        puts "Дискриминант равен #{d}. Корни равны #{x1} и #{x2}."
    end
end