class Round
  attr_reader :deck,
              :turns,
              :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
  end
  
  def current_card
    @deck.cards.first
  end
  
  def take_turn(answer)
    n_turn = Turn.new(answer, deck.cards.first)
    @turns << n_turn
    @deck.cards.shift
    n_turn
    # require 'pry';binding.pry
  end
  
  def number_correct
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        @correct += 1
      end
    end
    @correct
  end
  
  def number_correct_by_category(category)
    require 'pry';binding.pry
  end
  # 
  # def percent_correct
  # end
  # 
  # def percent_correct_by_category(category)
  # end
  
end

# require 'pry';binding.pry