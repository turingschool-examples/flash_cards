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
card30 = Card.new("Malcolm Little was a civil rights activist better known by what name?", "Malcolm X", :history)
card31 = Card.new("What was the name of the U.S. mail service, started in 1860, that used horses and riders?", "Pony Express", :history)
card32 = Card.new("Which Kentucky-born U.S. president is honored in the Wrestling Hall of Fame?", "Abraham Lincoln", :history)
card33 = Card.new("What is the roman name for the goddess Hecate?", "Trivia", :history)
card34 = Card.new("Name the second president of the United States of America.", "John Adams", :history)
card35 = Card.new("Which sought-after snack took eight months to return to shelves after its parent company, Hostess, declared bankruptcy?", "Twinkies", :history)
card36 = Card.new("When Pope Gregory IX rose to power, what domestic animal did he order to exterminate across Europe in the belief that they were used in devil’s worship and witch craft?", "Cats", :history)
card37 = Card.new("People in Victorian England said this word before having their picture taken instead of the word “cheese”. What fruit did they say?", "Prunes", :history)
card38 = Card.new("What natural human bodily fluid did Romans use as mouth wash because of the presence of ammonia in it?", "Urine", :history)
card39 = Card.new("On what year did the Ford Model T enter production?", "1908", :history)
card40 = Card.new("In USSR, What does the letter “R” sand for?", "Republics", :history)
card41 = Card.new("James Cook led and commanded what ship when he discovered Australia?", "HMS Endeavor", :history)
card42 = Card.new("Who is the Greek God of the Underworld?", "Hades", :history)
card43 = Card.new("Rubber was discovered by?", "Charles Mackintosh", :history)
card44 = Card.new("Who was the first black senator in the United States of America?", "Carol Moseley Brown", :history)


deck1 = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10,
                  card11, card12, card13, card14, card15, card16, card17, card18, card19,
                  card20, card22, card23, card24, card25, card26, card27, card28, card29,
                  card30, card31, card32, card33, card34, card35, card36, card37, card38, card39,
                  card40, card41, card42, card43, card44])

correct = 0
total = 0

puts "Welcome to Flashcards!"
puts "--------------------------"
puts "Select from the following categories: National Capitals, Human Body, History"
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
