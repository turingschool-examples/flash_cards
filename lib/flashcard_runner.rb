 require './card'
require './deck'
require './round'
require './turn'

class Flashcard_runner

  def self.start()
    myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    myCard4 = Card.new("What is objectively the best rodent?", "Capybara", :STEM)
    
    cards = [myCard1,myCard2,myCard3,myCard4]
    
    deck1 = Deck.new(cards)
    
    round1 = Round.new(deck1)
    puts "\n\n\n\n\nWelcome! You're playing with #{cards.length} cards.
-------------------------------------------------"

    round1.deck.cards.each do |card|
      puts "This is card number #{round1.turns.length + 1} out of #{cards.length}\nQuestion: #{round1.current_card.question}"
      round1.take_turn(gets.chomp)
    end

    #add results
  end

  Flashcard_runner.start()
end