class Round
    attr_accessor :deck,
                  :turns

      def initialize(deck)
        @deck = deck
        @turns = []
      end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end


  def number_correct
    default_guess = 0.0
    @turns.each do |turn|
      if turn.correct?
        default_guess += 1.0
      end
    end
    default_guess
  end

  def number_correct_by_category(category)
    default_cat_guess = 0.0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        default_cat_guess += 1.0
      end
    end
    default_cat_guess
  end

  def percent_correct
    (number_correct / @turns.count * 100).round(1)
  end

def percent_correct_by_category(pcat)
    default_percent_guess = 0.0
    @turns.each do |turn|
      if turn.card.correct?
        default_percent_guess += 1.0
      end
    end
    default_percent_guess
        (number_cat_correct / @turns.count * 100).round(1)
  end





end
