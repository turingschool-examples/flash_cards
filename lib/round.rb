require'pry'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
     @deck = deck
     @turns = []
  end

  def current_card 
    deck.cards.shift
  end

  def take_turn(prediction)
    card = current_card
    turn =  Turn.new(prediction, card)
    @turns << turn
    turn
  end

  def number_correct 
   correct_answers = @turns.select do |turn|
      turn.card.answer == turn.guess
    end
    correct_answers.count
  end
end

