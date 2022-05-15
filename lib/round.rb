require './lib/turn'
class Round
  attr_reader :deck, :turns, :new_turn, :number_correct, :number_of_turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_of_turns = 0
  end


  #note to self, practice instanciating classes in methods
  def take_turn(guess)
    turns.unshift(deck.cards[0])
    deck.cards.shift
    @new_turn = Turn.new(guess, current_card)
    if current_card.answer == guess
      add_correct
    end
    new_turn
  end

  def current_card
    turns[0]
  end

  def add_correct
    @number_correct =+ 1
  end

end
