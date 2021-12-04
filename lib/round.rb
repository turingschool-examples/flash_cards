class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct,
              :number_wrong,
              :number_correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
    @number_number_correct_by_category = 0
  end

  def take_turn(guess)
    x = Turn.new(guess, current_card)
    x.correct? ? @number_correct += 1 : @number_wrong += 1
    # puts x.card.category
    # number_turns_in_catagory = []
    # turns.each do |turn|
    #   number_turns_in_catagory << turn if turn.category == x.card.category
    # end
    # if x.correct?
    @turns << x
    @current_card = deck.cards[+1]
    @turns.last
  end

  def percent_correct
    (number_correct / turns.size.to_f) * 100
  end

  def number_correct_by_category(category)
    turns_correct_by_category = turns.count do |turn|
      category == turn.card.category && turn.guess == turn.card.answer
    end
  end
end

# def take_turn(guess)
#   @turns << Turn.new(guess, current_card)
#   if turns.correct?
#     @number_correct += 1
#   elsif @number_wrong += 1
#   end
#   @turns.last
# end
