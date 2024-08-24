require 'card.rb'
require 'deck.rb'
require 'round.rb'
require 'turn.rb'

class Flashcard_runner
  myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  myCard4 = Card.new("What is objectively the best rodent?", "Capybara", :STEM)
  
  cards = [myCard1,myCard2,myCard3,myCard4]
  
  deck1 = Deck.new(cards)
  
  round1 = Round.new(deck1)

  # Start the round using a new method called start
  def start
  end
end