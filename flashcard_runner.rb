#create some Cards
#put those card into a Deck
#create a Round using the Deck you created
#START the round using a new method called start
class Card
  attr_reader :question, :answer, :category
  def initialize (question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

# card_1 = Card.new("What is the fastest animal on earth?", "Cheetah", :Animal)
card_1 = Card.new("What is 5 + 5?", "10", :STEM)
# card_2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
card_2 = Card.new("What is Rachel's favorite animal?", "girrafe", :Animal)
card_3 = Card.new("What is Mike's middle name?", "No one knows", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

cards = [card_1, card_2, card_3]

# p cards

class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @cards = cards
    @category = category
  end
end

deck = Deck.new(cards)
# p deck





class Round
  attr_reader :deck, :turns, :turn_counter, :correct, :num, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
    @guess = guess

  end

  def start
    puts "Welcome! You're playing with 4 cards."

    print "------------------------------------"
    puts
    puts "This is card 1 out of 4."
    puts "Question: What is 5 + 5?"
    guess = gets
    print "You guessed #{guess}"
      # if guess == 10 ## I want to use my feedback method here##
      #  return "Correct!"
      # elsif
      #  return "Incorrect"
     end ##feedback method in place of this block
  end


round = Round.new(deck)
# return Round.new(deck)
# p round.start
## This will START the new round of the Game.

class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
      @guess = guess
      @card = card
      @answer = answer
  end

  def correct?
    if @guess == @answer
      true
    else
      false
    end
  end

  def feedback
    # if turns.correct? == true
    #How to call sister method scope for turns.correct??
    if @guess == @answer ## If the correct method isn't working this works
      "Correct!"
    else
      "Incorrect!"
    end
  end
end
# p turns.feedback
p round.start
p round.feedback

# turns = Turns.new("10", card_1) #This will create a new Turn.
# return turns.correct?
# p turns.feedback


  # if answer == 10
  #   turns.correct? == true
  # else
  #   turns.correct? == false
  #
  # turns.feedback
  #   p "This is card 2 out of 4."
