require "./card.rb"
require "./turn.rb"
require "./deck.rb"

class Round
  attr_reader :deck
  def initialize(deck)
    @rounddeck = deck.cards
    @turns = []
    @current_card = deck.cards[@turns.length]
    @number_correct = 0

  end

  def take_turn
    print "#{@current_card.question}  "
    guess = gets.chomp
    turn = Turn.new(guess, @current_card)
    p turn.correct?
    # p "Next question"
  end
end

data  = [
  {
    "question" => "What was the first shooter that was exclusive Xbox?",
    "answer" => "Halo",
    "category" => :gaming
  },
  {
    "question" => "Who is the main character of Dragonball Z?",
    "answer" => "Goku",
    "category" => :anime
  },
  {
    "question" => "What country makes the PS4?",
    "answer" => "Japan",
    "category" => :gaming
  },
  {
    "question" => "What was the first Japanese animation to be played in American theaters?",
    "answer" => "Akira",
    "category" => :anime
  }
]
card1 = Card.new(data[0]["question"], data[0]["answer"], data[0]["category"])
card2 = Card.new(data[1]["question"], data[1]["answer"], data[1]["category"])
card3 = Card.new(data[2]["question"], data[2]["answer"], data[2]["category"])
card4 = Card.new(data[3]["question"], data[3]["answer"], data[3]["category"])
cardArray = [card1, card2, card3, card4]
deck = Deck.new(cardArray)
round = Round.new(deck)

round.take_turn

