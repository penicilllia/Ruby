=begin
  4. Заполнить хеш гласными буквами, где значением будет являтся 
  порядковый номер буквы в алфавите (a - 1).
=end

vowels_arr = [:a, :e, :i, :o, :u, :y]
letters = Hash[(:a..:z).to_a.zip((1..26).to_a)]
vowels_hash = Hash.new{}

letters.each do |letter, number|
  vowels_arr.each do |vowel|
      vowels_hash[letter] = number if letter == vowel
  end
end
puts vowels_hash

