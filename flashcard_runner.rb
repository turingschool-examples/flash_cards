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
  attr_reader :deck, :turns, :turn_counter, :correct, :num
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
  end
end

round = Round.new(deck)
p round
