class CardGenerator

  attr_reader :data, :nu_cards
  def initialize(data)
    @data = data
    @nu_cards = []
  end

  def format(question, answer, category)
    card_data = data.map {|line| line.split(",")}
    @nu_cards = card_data.map {|card| Card.new(*card)}
  end

  def cards
    @nu_cards = self.format(:question, :answer, :category)
  end
end
