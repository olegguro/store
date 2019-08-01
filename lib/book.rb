class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
        title: lines[0],
        genre: lines[1],
        author: lines[2],
        price: lines[3].to_i,
        amount: lines[4].to_i
    )
  end

  def initialize(params)
    # вызовем конструктор класса-родителя Product,
    # он заполнит переменные экземпляра @price и @amount,
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  # Метод to_s возвращает описанием и дергает родительский метод to_s, чтобы склеить эту строку с ценой и остатком.
  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
