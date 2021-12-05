class Card
  attr_reader :question, :answer, :category

  def initialize(question,answer,category)
    @question = question
    @answer = answer
    @category = category
  end
end

class Deck
  attr_reader :cards, :cards_in_category

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(arg)
    included_cards = []
    cards.each do |card|
      if card.category == arg
        included_cards << card
      end
    end
    return included_cards

  end
end











  puts "Welcome, you are playing with 4 cards!"
  puts "This is card number 1 out of 4"
