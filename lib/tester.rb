# require './lib/turn'
# require './lib/card'


# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# turn = Turn.new("Juneau", card)

# puts turn.card.question
# puts card

# puts turn.correct?
# puts turn.feedback

# test_array = []

# if test_array.class != Array
#     puts "not an array"
# else
#     puts "it's an array"
# end

# require './lib/card'
# require './lib/turn'
# require './lib/deck'
# require './lib/round'

# require 'rspec'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_4 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
# card_5 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3, card_4]
# deck = Deck.new(card_count # the array of cards object
# round = Round.new(deck)

# puts deck.cards_in_category(:STEM)

# puts round.all_flashcard_categories


# new_turn = round.take_turn("Juneau")
# new_turn = round.take_turn("Venus")
# new_turn = round.take_turn("Aurora")
# new_turn = round.take_turn("Aurora")
# new_turn = round.take_turn("Aurora")

# puts round.number_correct
# puts round.number_correct_by_category(:Geography)
# puts round.number_correct_by_category(:STEM)

# puts round.percent_correct
# p round.turns_taken_by_category(:Geography)

# puts round.percent_correct_by_category(:Geography)

# new_turn = round.take_turn("Venus")

# puts round.currnet_card
# puts 
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.currnet_card.question
# round.new_card
# puts
# puts round.deck.count
# puts round.currnet_card.question
# puts round.currnet_card.class

# ruby lib/tester.rb

# puts deck.cards[0].category

# test_var = " Hello"


# new_var = test_var.chars        # Converts the string into an array of characters
#             .join          # Joins the array back into a string (removes the transformation effect of .chars)
#             .capitalize    # Capitalizes the first character of the string
#             .size          # Returns the length of the string as an integer
#             .next          # Increments the integer by 1
#             .to_s          # Converts the integer to a string
#             .reverse       # Reverses the string
#             .to_f          # Converts the string to a float
#             .*(2)          # Multiplies the float by 2
# puts new_var 
# new_var = var.chars.join.capitalize.size.next.to_s.reverse.to_f.*(2)

# puts new_var
# puts new_var.class

# test = gets.chomp.to_i

# if test == ""
#   puts true
# end
# puts test

cards = [1,2,3,4,5]

def ask_user_for_amount_of_cards(card_count)
  
  puts "\nHow many cards would you like to play with? - Max(#{card_count})"
  play_count = gets.chomp
  if play_count == ""
    puts "Total of 5 then!\n"
    return card_count_request = 5

  elsif play_count.to_i == 0
    puts "please try again"
    ask_user_for_amount_of_cards(card_count)

  elsif play_count.to_i > card_count 
    puts "There are only #{card_count} in the deck, try again!"
    ask_user_for_amount_of_cards(card_count)


  else
    # puts "Good number #{play_count}"
    return card_count_request = play_count
  end
end


user_request_card_count = ask_user_for_amount_of_cards(cards.size)
puts test