class Round
  attr_reader :deck,
              :turns,
              :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end
  
  def current_card
    @deck.cards.first
  end
  
  def take_turn(answer)
    n_turn = Turn.new(answer, deck.cards.first)
    
    @turns << n_turn
    n_turn
    # require 'pry';binding.pry
  end
  
  def number_correct
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        @number_correct += 1
      end
    end
    @number_correct
  end
end

# require 'pry';binding.pry