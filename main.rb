require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками films и books. ProductCollection сам знает, как там внутри лежат
# эти файлы и сам разбереться, как их оттуда считать.
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :price)

basket = []

loop do
  puts
  puts "Что хотите купить?"
  puts
  puts collection
  puts "0. Выход"
  puts
  print "Ваш выбор: "

  user_choice = STDIN.gets.to_i
  break if user_choice == 0

  chosen_product = collection.by_user_choice(user_choice)

  # если пользователь выбрат товар, которого нет (вернется nil) - то переходит на следующий круг цикла
  next unless chosen_product

  if chosen_product.amount > 0
    basket << chosen_product
    chosen_product.amount -= 1


    puts "Вы выбрали: #{chosen_product}"
    puts
    puts "Всего товаров на сумму: #{basket.sum(&:price)}"
  end
end
puts

puts "Вы купили:"
puts basket.group_by {|x| x}.map {|k,v| [k,v.count]}
puts 
puts "C Вас - #{basket.sum(&:price)} руб. Спасибо за покупки!"
