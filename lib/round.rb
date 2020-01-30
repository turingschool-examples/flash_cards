class Round
  attr_reader :deck, :turns, :correct_cards, :incorrect_cards
  def initialize(deck)
    @deck = deck
    @turns = []
  end
  def current_card
    @deck.cards[0]
  end
  def take_turn(guess)
    #revisit this
    @turns << Turn.new(guess, self.current_card)
    @turns[0]
  end
  def number_correct
    incorrect_cards = []
    correct_cards = []
    @turns.each do |card|
      if card.correct? == true
        correct_cards << card
      else
        incorrect_cards << card
      end
    end
    correct_cards.length
  end
end
