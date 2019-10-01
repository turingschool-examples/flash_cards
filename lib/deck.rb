require './card.rb'
data  = [
  {
    "question" => "What shooter is an Xbox exclusive?",
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

class Deck
  attr_reader :cards, :count 
  def initialize(cards)
    @cards = cards
    @count = cards.length
  end
  def cards_in_category(category)
    amount = 0
    cards.each do |card|
      if card.category == category
        amount += 1
      end
    end
    amount
  end
end

deck = Deck.new(cardArray)

p "count: #{deck.count}"
p deck.cards[2]
p deck.cards_in_category(:anime)