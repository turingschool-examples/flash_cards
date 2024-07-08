# require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("1+1", "2", :STEM)
# card_5 = Card.new("What is the Chemical Symbol for water?", "H20", :STEM)
# card_6 = Card.new("Who was a chef in mod 1?", "Stefan", :Turing)
# card_7 = Card.new("Who is the dude with the awesome One Piece backgrounds in zoom?", "Kyle", :Turing)
# card_8 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
# card_9 = Card.new("What is Nick Teets cats name?", "Edgar", :Turing)
# card_10 = Card.new("What is Zoe Farrel cats name?", "Krenko", :Turing)

# cards = [
#   card_1,
#   card_2,
#   card_3,
#   card_4,
#   card_5,
#   card_6,
#   card_7,
#   card_8,
#   card_9,
#   card_10
# ]

cards = CardGenerator.new("./lib/card.txt").cards

def random_array_of_cards(cards, amount_of_cards = 5)
  all_cards = cards
  new_cards = []

  amount_of_cards.times do
    # take a random number between 0 and the length of the array
    random_number = rand(0..(all_cards.size - 1))
    # puts random_number
    random_card = all_cards[random_number]
    new_cards.push(random_card)
    all_cards.delete(random_card)
  end
  # p new_cards.count
  new_cards
end



# def initalize_game(cards)
#   deck = Deck.new(cards) 
#   round = Round.new(deck)

# end



def start(cards)

  cards_random = random_array_of_cards(cards)
  deck = Deck.new(cards_random) 
  round = Round.new(deck)

  counter = 0
  # initalize_game(cards_random)

  puts "Welcome! You're playing with #{round.deck.count} cards.\n-------------------------------------------"

  while counter != round.deck.count
    counter += 1
    puts "\nThis is card number #{counter} out of #{round.deck.count}"
    puts "Question: #{round.current_card.question}"

    user_input = gets.chomp # get rid of the pesky "\n" that is being returned!
    round.take_turn(user_input)
    puts round.turns.last.feedback
  end

  puts "\n***** Game over! *****"
  puts "You had #{round.number_correct} guesses out of #{round.deck.count} for a total of #{round.percent_correct}%"
  all_flashcard_categories = round.all_flashcard_categories
  all_flashcard_categories.each do |category|
    percent_correct = round.percent_correct_by_category(category)
    puts "#{category} - #{percent_correct}% correct"

  end




end

start(cards)