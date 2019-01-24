require 'digest'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts 'Введите слово или фразу для шифрования:'
phrase = gets.chomp

puts 'Каким способом зашифровать:'
puts '1. MD5'
puts '2. SHA1'
way = gets.to_i

result =
    case way
    when 1
      Digest::MD5.hexdigest "#{phrase}"
    when 2
      Digest::SHA1.hexdigest "#{phrase}"
    end

puts 'Вот что получилось:'
puts "#{result}"
