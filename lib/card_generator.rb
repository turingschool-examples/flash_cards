class CardGenerator

  def initialize(cards)
    @cards = cards

  end

  def create_array
    cards_txt = File.open(@cards)
    cards_arr = cards_txt.readlines.map(&:chomp)
  end

  def seperate_array
    create_array.map {|card| card.split(',')}
  end

end
