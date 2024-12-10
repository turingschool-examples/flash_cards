Class Round 
  attr_accessor :deck, :turn
  @@current_card_num

  def initialize(deck)
    @deck = deck
    @turns = []
    @@current_card_num += 1
  end
  
  def current_card
    deck.cards[current_card_num]

  end
  
  def take_turn(string)
    new_turn = Turn.new(string, card)
    turns << new_turn
  end

  def number_correct
    turns.count (|turn| turn.correct?)
  end

  def percent_correct

  end

  def number_correct_by_category(cat)

  end

  def percent_correct_by_category(cat)

  end
end