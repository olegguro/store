class Book < Product
  attr_reader :title, :genre, :author

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
end
