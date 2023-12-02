class Round
  attr_reader :deck,
              :turns,
              :current_card
                
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
    @number_correct = []
  end

  # take_turn takes a string as an argument representing the guess
  # it should create a new turn obj with the guess and card
  # it should store this new turn and return it as output from take_turn method
  # when called should move on to the next card as well
  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    if guess == @current_card.answer
      @number_correct << @current_card
    end
    @turns << turn
    @current_card = @deck.cards[@turns.length]
    turn
  end

  def number_correct
    @number_correct.length
  end

  def number_correct_by_category(category)
    (@number_correct.select { |card| card.category == category }).length
  end

  def percent_correct
    (@number_correct.length)/(@turns.length).to_f * 100 
  end

  def percent_correct_by_category(category)
    correct_category = (@number_correct.select { |card| card.category == category }).length
    turns_category = (@turns.select { |turn| turn.card.category == category }).length
    ((correct_category).to_f) / turns_category * 100
  end
end