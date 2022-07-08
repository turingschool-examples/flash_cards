class Round 
  attr_accessor :deck, :turns, :current_card, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = []
  end 
  def current_card
    self.deck.cards[self.turns.count]
  end 
  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    @turns << new_turn
    if new_turn.correct?
      @number_correct << new_turn 
    end 
    new_turn
  end
  def number_correct
    @number_correct.count
  end 
  def number_correct_by_category(correct_category)
    correct_by_category = 0
    self.turns.each do |turn|
      if turn.card.category == correct_category 
        if turn.correct?
          correct_by_category += 1
        end 
      end 
    end 
    correct_by_category
  end 
end 
