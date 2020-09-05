# Прямоугольный треугольник 

print 'Введите первую сторону треугольника: '
a = gets.to_i
print 'Введите вторую сторону треугольника: '
b = gets.to_i
print 'Введите третбю сторону треугольника: '
c = gets.to_i

def pythagoras(a1, b1, c1)
  if a1**2 == b1**2 + c1**2 
    return a1 
  elsif b1**2 == a1**2 + c1**2
    return b1
  elsif c1**2 == b1**2 + a1**2  
    return c1
  else
    return nil
  end
end

if a == b && b == c
  puts 'Треугольник равносторонний и равнобедренный.'
elsif a == b || b == c || a == c
  puts 'Треугольник равнобедренный.'
end
if pythagoras(a, b, c) 
  puts 'Треугольник прямоугольный.'
end  