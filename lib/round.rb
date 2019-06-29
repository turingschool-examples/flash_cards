class Round
  attr_reader :deck, :turns, :cards, :current_card, :round

  def initialize(deck)
    @deck = deck
    @turns = []
    @cards = cards
    @round = round
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

 def take_turn(guess)
   new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @current_card += 1
   return new_turn
 end

 def number_correct
   correct_cards = 0
   turns.each do |turn|
     if turn.correct?
       correct_cards += 1
     end
    end
    correct_cards
  end

  def number_correct_by_category(card_cat)
    cat_correct_cards = 0
    @turns.find_all do |turn|
      if turn.correct? && turn.card.category == card_cat
        cat_correct_cards += 1
      end
    end
    cat_correct_cards
  end

  def percent_correct
    number_correct.to_f / turns.count * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end.count
    number_correct_by_category(category).to_f / turns_in_category * 100
  end
end
