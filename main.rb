require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

current_path = File.dirname(__FILE__)
film = Film.from_file(current_path + '/data/films/1.txt')
book = Film.from_file(current_path + '/data/books/1.txt')

puts film
puts book

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file(current_path + '/data/films/01.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end