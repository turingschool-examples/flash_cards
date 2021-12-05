

class CardGenerator
  attr_reader :cards, :info, :deck

  def initialize(cards)
    @info = []
    @deck = []
    @cards = File.readlines(cards).map(&:chomp)
    @cards.each do |string|
      @info << string.split(",")
    end
    @info.each do |card_info|
      question = card_info[0]
      answer = card_info[1]
      category = card_info[2]
      @deck << Card.new(question, answer, category)
    end
    return @deck
  end
end
  # def sort
  #   @cards.each do |question, answer, category|
  #     @deck << Card.new(question, answer, category)
  #   end
  #   return deck
  #   # card_1 = Card.new(@cards[0])
    # card_2 = Card.new(@cards[1])
    # card_3 = Card.new(@cards[2])
    # card_4 = Card.new(@cards[3])
    # deck = [card_1, card_2, card_3, card_4]

  # def card_info
  #   @cards.each do |card_info|
  #     card_info.chunk(",")
  #   end
  #   return @deck
