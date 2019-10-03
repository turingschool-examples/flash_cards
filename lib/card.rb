class Card
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

# card_1 = Card.new("What is your favorite color?! 'Blue!'", "Monty Python", :Movie)
# card_2 = Card.new("Do or do not, there is no try", "", :Movie)
# card_3 = Card.new("You shot me in the goddamn liver", "Morty!", :TV)
# deck = [card_1, card_2, card_3]
#
# round = Round.new(deck)
