class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    #need to figure out how to show the card
    @deck.cards[0]
  end

  def take_turn(guess)
    #takes a string representing the guess
    #creates new turn object with guess and card
    #stores new turn and returns it from take_turn
    #when called the round moves to the next card in the deck
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end
end
