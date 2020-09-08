=begin
   Сумма покупок. Пользователь вводит поочередно название товара, 
   цену за единицу и кол-во купленного товара (может быть нецелым числом). 
   Пользователь может ввести произвольное кол-во товаров до тех пор, пока 
   не введет "стоп" в качестве названия товара. На основе введенных данных 
   требуетеся:

    - Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
    а значением - вложенный хеш, содержащий цену за единицу товара и кол-во 
    купленного товара. Также вывести итоговую сумму за каждый товар.

    - Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

item_hash = Hash.new()

puts 'Enter "stop" if you want to stop filling the list.'
loop do
  nested_hash = Hash.new()
  print 'Enter product name: '
  item = gets.chomp.to_str
  break if item == 'stop'
  print 'Enter the unit price: '
  price = gets.chomp.to_i
  print 'Enter the quantity of products: '
  quantity = gets.chomp.to_f
  nested_hash[price] = quantity
  item_hash[item] = nested_hash
end

amount = 0
puts item_hash

item_hash.each do |key, internal_hash|
  internal_hash.each do |key2, val2| 
    puts "#{key}: #{key2.to_f * val2.to_f}"
    amount += key2.to_f * val2.to_f
  end
end

puts "Total amount is #{amount}."