class Round
  attr_reader :deck, 
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @deck.cards.rotate!(1)
    @new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end


      #@turns.card.category
      #I need to iterate on @turns to isolate correct turns.
        #isolate category
        #count correct guesses cards with category
  def number_correct_by_category(category)
    correct_count = 0
    require 'pry' ; binding.pry
    @turns.each do |turn|
      correct_count += 1 if turn.correct?
    end
      correct_count
  end

  # def percent_correct
  #   @turns / self.number_correct
  # end

  # def percent_correct_by_category
    #@turns / self.number_correct_by_category
  # end
end

  
    
  