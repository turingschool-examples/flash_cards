

class CardGenerator
  attr_reader :cards

  def initialize(cards)
    @cards = File.readlines(cards).map(&:chomp)
    deck = []
    # @cards.each do |question, answer, category|
    #   deck << Card.new(question, answer, category)
    # end
    # return deck
    # card_1 = Card.new(@cards[0])
    # card_2 = Card.new(@cards[1])
    # card_3 = Card.new(@cards[2])
    # card_4 = Card.new(@cards[3])
    # deck = [card_1, card_2, card_3, card_4]

  end

  # def card_info
  #   @cards.each do |card_info|
  #     card_info.chunk(",")
  #   end
  #   return @deck
end
