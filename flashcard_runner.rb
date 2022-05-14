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

card_1 = Card.new("What is the fastest animal on earth?", "Cheetah", :Animal)
card_2 = Card.new("What is the capital of California?", "Sacramento", :Geography)
card_3 = Card.new("What is the largest planet?", "Jupiter", :STEM)

cards = [card_1, card_2, card_3]

p cards

class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @cards = cards
    @category = category
  end
end

deck = Deck.new(cards)
p deck

class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
      @guess = guess
      @card = card
      @answer = answer
  end
end

turns = Turns.new("Juneau", @card)
p turns

class Round
  attr_reader :deck, :turns, :turn_counter, :correct, :num, :user_input
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
    @user_input = user_input
  end

  def start
    puts "Welcome! You're playing with 4 cards."

    print "------------------------------------"
    puts "This is card 1 out of 4."
    puts "Question: What is 5 + 5?"
    user_input = gets
    puts "You guessed #{user_input}"
      if user_input == "10"
       return "Correct!"
     elsif user_input != "10"
       return "Incorrect"
      end
    end

end

round = Round.new(deck)
p round.start



  # if answer == 10
  #   turns.correct? == true
  # else
  #   turns.correct? == false
  #
  # turns.feedback
  #   p "This is card 2 out of 4."
