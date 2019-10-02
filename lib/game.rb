require_relative 'card'
require_relative 'deck'
require_relative 'turn'

card1 = Card.new("What is the capital of Germany?", "Berlin", :national_capitals)
card2 = Card.new("What is the capital of Sweden?", "Stockholm", :national_capitals)
card3 = Card.new("What is the capital of Argentina?", "Santa Fe", :national_capitals)
card4 = Card.new("What is the capital of Brazil?", "Brasilia", :national_capitals)
card5 = Card.new("What is the capital of France?", "Paris", :national_capitals)
card6 = Card.new("What is the capital of Spain?", "Madrid", :national_capitals)
card7 = Card.new("What is the capital of Mexico?", "Mexico City", :national_capitals)
card8 = Card.new("What is the capital of Switzerland?", "Bern", :national_capitals)
card9 = Card.new("What is the capital of Japan?", "Tokyo", :national_capitals)
card10 = Card.new("What is the capital of Egypt?", "Cairo", :national_capitals)
card11 = Card.new("What is the capital of Morocco?", "Rabat", :national_capitals)
card12 = Card.new("What is the capital of Guatamala?", "Guatamala City", :national_capitals)
card13 = Card.new("What is the medical term for low blood sugar?", "Hypoglycemia", :human_body)
card14 = Card.new("What’s the common term for a cerebrovascular accident?", "Stroke", :human_body)
card15 = Card.new("What does “CPR” stand for in medical emergencies?", "Cardiopulmonary resuscitation", :human_body)
card16 = Card.new("What, along with heart disease and cancer, accounts for 64 percent of U.S. deaths?", "Stroke", :human_body)
card17 = Card.new("What virus did the World Health Organization say would infect 40 million people by the year 2000?", "HIV", :human_body)
card18 = Card.new("What disease is the focus of oncology?", "Cancer", :human_body)
card19 = Card.new("What sticky sweetener was traditionally used as an antiseptic ointment for cuts and burns?", "Honey", :human_body)
card20 = Card.new("What’s the most frequently diagnosed cancer in men?", "Prostate Cancer", :human_body)
card22 = Card.new("What is the name of the biggest part of the human brain?", "The cerebrum",:human_body)
card23 = Card.new("What is the name of the substance that gives skin and hair its pigment?", "Melanin",:human_body)
card24 = Card.new("What substance are nails made of?", "Keratin",:human_body)
card25 = Card.new("The two holes in your nose are called?", "Nostrils",:human_body)
card26 = Card.new("The shape of DNA is known as?", "Helix", :human_body)
card27 = Card.new("True or false? Your ears are important when it comes to staying balanced.", "True",:human_body)
card28 = Card.new("The outside layer of skin on the human body is called the?", "Epidermus",:human_body)
card29 = Card.new("The muscles found in the front of your thighs are known as what?", "Quadriceps",:human_body)



deck1 = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10,
                  card11, card12, card13, card14, card15, card16, card17, card18, card19,
                  card20, card22, card23, card24, card25, card26, card27, card28, card29])

correct = 0
total = 0

puts "Welcome to Flashcards!"
puts "--------------------------"
puts "Select from the following categories: National Capitals, Human Body"
cat = gets.chomp

game_deck = Deck.new(deck1.cards_in_category(cat.downcase.tr!(" ","_").to_sym))

puts "Great choice! Let's begin."

current_card = 1
total_cards = game_deck.count

while current_card <= total_cards
  new_card = game_deck.draw
  puts new_card.question
  answer = gets.chomp

  new_turn = Turn.new(answer, new_card)

  result = new_turn.correct?
  puts result
  if result == "Correct"
    correct += 1
  end
  game_deck.remove_from_deck(new_card)

  puts "You have answered #{current_card} questions, out of #{total_cards}"
  total += 1
  current_card += 1

end

puts "You got #{correct} correct answers out of #{total}."
puts "Thanks for playing!"
