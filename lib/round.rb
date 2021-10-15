class Round
  attr_reader :deck,
              :turns,
              :number_correct


  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 1
  end

  def current_card
    @deck.cards[@count - 1]
  end

  def take_turn(guess)
    @turns <<  Turn.new(guess, current_card)
    @count += 1
    @turns.last
  end

    def number_correct
      @turns.find_all do |turn|
        turn.card.answer == turn.guess
      end.size
    end

    def number_correct_by_category(genre)
      @turns.find_all do |correct_category|
        correct_category.card.answer == correct_category.guess && correct_category.card.category == genre
      end.size
    end

    def percent_correct
      
    end
end
