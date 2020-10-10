class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    turns[-1]
  end

  def current_card
    deck.cards.shift
  end

  def number_correct
    # require "pry"; binding.pry
    correct_guess = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guess +=1
      end
      end
      correct_guess
    end

    def number_correct_by_category(category)

      counter = 0
      @turns.each do |turn|
        if turn.guess == turn.card.answer && turn.card.category == category
          counter += 1
        end
      end
      counter
    end

    def percent_correct_by_category
      
    end
    #def percent_correct_by_category(category)
    #number_correct_by_category(category)
    # end
end
