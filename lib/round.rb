

Class Round 

  attr_accessor :deck, :turn
  @@current_card_num = 0

  def initialize(deck)
    @deck = deck
    @turns = []
    #@@current_card_num += 1
  end
  

  def current_card
    deck.cards[@@current_card_num]

  end
  
  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @@current_card_num +=1
    return new_turn
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def percent_correct
    percent = number_correct.to_f
    size = turn.size.to_f
    turns.empty == 0 ?  0 : ((percent / size)*100).round(2)
  end

  def number_correct_by_category(cat)
    turns.count { |turn| turn.card.category == category && turn.correct? }
  end

  def percent_correct_by_category(cat)

    turn_category = turn.select {|gory| gory.card.category == cat}
    turn_float = turn_category.to_f

    turns_category.empty == 0 ?  0 : ((turn_category {|turn| turn.correct?} / turn_float) * 100).round(2)
  end
end