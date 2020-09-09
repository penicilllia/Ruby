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

item_hash = {}

puts 'Enter "stop" if you want to stop filling the list.'
loop do
  nested_hash = {}
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

item_hash.each do |item1, internal_hash|
  internal_hash.each do |pice2, quantitiy2| 
    puts "#{item1}: #{pice2 * quantitiy2}"
    amount += pice2 * quantitiy2
  end
end

puts "Total amount is #{amount}."