class CardGenerator

  attr_reader :data, :cards
  def initialize(data)
    @data = data
    @cards = []
  end

  def format(question, answer, category)
    card_data = data.map {|line| line.split(",")}
    @cards = card_data.map {|card| Card.new(*card)}
  end
end
