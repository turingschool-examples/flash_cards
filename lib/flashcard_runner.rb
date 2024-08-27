require './card'
require './deck'
require './round'
require './turn'
require './card_reader'

class Flashcard_runner

  def self.start()
    # myCard1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    # myCard2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    # myCard3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # myCard4 = Card.new("What is objectively the best rodent?", "Capybara", :STEM)
    
    # cards = [myCard1,myCard2,myCard3,myCard4]
    deck_file = './resources/deck2.txt'
    card_reader = Card_reader.new(deck_file)
    # deck1 = Deck.new(cards)
    deck1 = card_reader.create_deck

    round1 = Round.new(deck1)
    puts "\n\n\n\n\nWelcome! You're playing with #{deck1.count} cards.
-------------------------------------------------"

    round1.deck.cards.each do |card|
      puts "This is card number #{round1.turns.length + 1} out of #{deck1.count}\nQuestion: #{round1.current_card.question}"
      round1.take_turn(gets.chomp)
    end

    puts "****** Game over! ******
You had #{round1.number_correct} correct guesses out of #{deck1.count} for a total score of #{round1.percent_correct}%."

categories = []

  deck1.cards.each do |card|
    if !categories.include?(card.category)
      categories << card.category
    end
  end

  categories.each do |category|
    puts "#{category} - #{round1.percent_correct_by_category(category)}% correct"
    nil
  end    
  end

  Flashcard_runner.start()
end