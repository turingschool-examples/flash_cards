class Round
  attr_reader :turns,
              :deck
  
  def initialize(deck) 
    @deck   = deck
    @turns  = []
  end
  
  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    shuffle_deck
    return turn
  end

  def shuffle_deck
    shuffled_deck = deck.cards.rotate
    deck.cards.replace(shuffled_deck)
  end

  def number_correct
    correct_turns = turns.find_all do |turn|
      turn.correct? 
    end
    correct_turns.length 
  end 

  def number_correct_by_category(specific_category)
    #check if guess is correct according to category 
    #round >> turns >> correct? 
    #return the number of in correct by category array
    correct_by_category = turns.find_all do |turn|
      turn.correct? && turn.card.category == specific_category  
    end
    correct_by_category.length
  end

  def percent_correct
    #check number of guesses made 
    percent_correct = turns.find_all do |turn|
      turn.correct?
    end
    #calculate percent correct 
    percentage = (turns.length.to_f / percent.correct.length.to_f) * 100
    #return percent correct as a float
    return percentage
  end
end
 