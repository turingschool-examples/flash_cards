class CardGenerator

  def initialize(file_location)
    @file_location = file_location
  end

  def create_array
    cards_txt = File.open(@file_location)
    cards_arr = cards_txt.readlines.map(&:chomp)
  end

  def seperate_array
    create_array.map {|card| card.split(',')}
  end

  def make_cards
    @card_set = seperate_array.map {|card| Card.new(*card)}
  end
end
