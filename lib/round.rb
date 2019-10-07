class Round
  attr_reader :deck, :round_counter, :turns, :percent_correct

  def initialize(deck)
    @deck = deck
    @round_counter = 0
    @number_correct = 0
    @turns = []
  end

    def current_card
      deck.cards[@round_counter]
    end

    def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
      turns << new_turn
      @round_counter += 1
      new_turn
    end

    def number_correct
      if take_turn.guess == take_turn.answer
        @number_correct +=1
    end


    def number_correct_by_category(category)
      if @turns.guess == @turns.asnwer
      turns(category)
      end
    end


    def percent_correct
      @number_correct / @round_counter
    end


    def percent_correct_by_category
    end

  end

end
