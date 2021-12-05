class Round
  attr_reader :round, :turns, :current_card, :deck, :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
  end


    def current_card
      @deck.cards[0]
    end
    # @deck = deck



  # def current_card
  #   @deck.cards.first
  # end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @turns.last
   @deck.cards.rotate!
   return new_turn
  end
  # def turns
  #
  # end
#can be done in take turn class
  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end
    return correct_guesses
  end

  def number_correct_by_category(category)
    cat_geography = 0
    cat_stem = 0
    @turns.each do |turn|
      # require 'pry'; binding.pry
      if turn.card.category == :Geography
        cat_geography += 1
      elsif turn.card.category = :STEM
        cat_stem +=1
      else
        puts "There is no category"
      end
    end
    return cat_geography
    return cat_stem
  end
end
