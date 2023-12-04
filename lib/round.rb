class Round
  attr_reader :deck, 
              :turns, 
              :current_card, 
              :correct, 
              :guess_counter
              
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card
    @correct = 0
    # @incorrect = 0
    @guess_counter = 0  #1?
  end

  def current_card
    deck.cards.first
  end

  #next card in the deck becomes the current card.
  
  def number_correct
    binding.pry
    @turns.count do |turn|
      @correct += 1 if turn.correct? #turn[0].guess.correct?
      @correct
    # current_turn = @turns.last
  end
    #add to @correct counter if guess is correct
    #I want to verify how many correct turns I have had
    #I need my turns.
    #I need to verify that my turn guess was correct
      #if it's correct, I want to add it to increase the counter. 
      #if it's incorrect, I do not want to add it to the counter.  
    #return the correct count. 
  
  def remove_top_card
    deck.cards.shift
  end
  
  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    current_turn
    # remove_top_card
  end
  
  
  def each_turn_adds_card_to_turns
    # @turns << turn.card
    #returns a new array of @turns
  end
end



#  #records guesses
#   def make_a_guess
#     # When we make a guess, the guess is recorded
#     guess = gets.chomp
#     turn = take_turn(guess)
#     guess_counter += 1
#     add_to_correct_counter
#     puts turn.feedback 
#   end





#  should create a new Turn object with the appropriate guess and Card
#  return it from the take_turn method.
#  when the take_turn method is called, the Round should move on to the next card in the dec