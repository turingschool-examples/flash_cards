require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"




def create_cards
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
  card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
  cards = [card_1, card_2, card_3]
end

def create_deck
  deck = Deck.new(create_cards)
end

def start
  round = Round.new(create_deck)

  puts "Welcome! You're playing with #{round.total_cards} cards."
  puts "------------------------------------------------------------"
  while round.turns_remaining > 0 do
    puts "This is card number #{round.turns_remaining} out of #{round.total_cards}"
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.total_cards} for a total score of #{round.percent_correct.round}%."
  list_of_categories = []
  round.deck.cards.each do |card|
    list_of_categories << card.category
    end
    list_of_categories.uniq.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
    end
end



start
