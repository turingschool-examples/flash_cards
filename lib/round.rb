

class Round 

  attr_accessor :deck, :turn
  

  def initialize(deck)
    @deck = deck
    @turns = []
    @@current_card_num = 0
  end
  

  def current_card
    deck.cards[@@current_card_num]; end
  
  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @@current_card_num += 1
    return new_turn; end

  def number_correct
    @turns.count {|turn| turn.correct?}; end

  def percent_correct
    percent = number_correct.to_f
    size = turns.size.to_f
    turns.empty? ?  0 : ((percent / size)*100).round(2); end

  def number_correct_by_category(cat)
    @turns.count { |turn| turn.card.category == category && turn.correct? }; end

  def percent_correct_by_category(cat)
    turn_category = @turns.select { |turn| turn.card.category == cat }
    return 0 if turn_category.empty?
    correct_in_category = turn_category.count { |turn| turn.correct? }
    ((correct_in_category.to_f / turn_category.size) * 100).round(2); end

end