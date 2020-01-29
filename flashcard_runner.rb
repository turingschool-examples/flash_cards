

puts "Welcome! You're playing with #{total cards} cards."
puts "------------------------------------------------------------"
puts "This is card number #{current_card} out of #{total cards}"
puts "Question: #{card question}"





def create_cards
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
  card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
  cards = [card_1, card_2, card_3]
end

def create_deck
  deck = Deck.new(create_cards)
end

def create_round
 round = Round.new(create_deck)
end
