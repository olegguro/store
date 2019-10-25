class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true)

    self.new(
        title: lines[0],
        genre: lines[1],
        author: lines[2],
        price: lines[3].to_i,
        amount: lines[4].to_i
    )
  end

  def initialize(title:, genre:, author:, **)
    # вызовем конструктор класса-родителя Product,
    # он заполнит переменные экземпляра @price и @amount,
    super
    @title = title
    @genre = genre
    @author = author
  end

  def update(title: nil, genre: nil, author: nil, **)
    super

    @title = title unless title.nil?
    @genre = genre unless genre.nil?
    @author = author unless author.nil?

    self
  end

  # Метод to_s возвращает описанием и дергает родительский метод to_s, чтобы склеить эту строку с ценой и остатком.
  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end
end
