=begin
  4. Заполнить хеш гласными буквами, где значением будет являтся 
  порядковый номер буквы в алфавите (a - 1).
=end

vowels_arr = [:a, :e, :i, :o, :u, :y]
letters = Hash[(:a..:z).to_a.zip((1..26).to_a)]
vowels_hash = {}

letters.each do |letter, number|
  vowels_hash[letter] = number if vowels_arr.include?(letter)
end
puts vowels_hash

