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
    correct_cat = []
    @turns.each do |turn|
      correct_cat << turn if turn.correct? && turn.card.category == category
    end
    correct_cat.count
  end

  def percent_correct
    total = self.turns.count
    ((@correct.to_f / total) * 100).round(1)
  end
   
  def percent_correct_by_category(category)
    category_correct = self.number_correct_by_category(category)
    total = self.cards_in_category(category)
    ((category_correct.to_f / total) * 100).round(1)
  end
  
  def cards_in_category(category)
    cards_in_cat = []
    @turns.each do |turn|
      if turn.card.category == category
        cards_in_cat << turn
      end
    end
    cards_in_cat.count
  end
end