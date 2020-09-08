# 3. Заполнить массив числами фибоначчи до 100

array = [0, 1]
k = 1
loop do
  new_el = array[k - 1] + array[k]
  break if new_el > 100
  array.push(new_el)
  k += 1
end
puts array