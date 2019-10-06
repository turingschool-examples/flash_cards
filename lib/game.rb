require_relative 'card'
require_relative 'deck'
require_relative 'turn'
require_relative 'round'
require_relative 'card_generator'

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
card30 = Card.new("Malcolm Little was a civil rights activist better known by what name?", "Malcolm X", :historical_facts)
card31 = Card.new("What was the name of the U.S. mail service, started in 1860, that used horses and riders?", "Pony Express", :historical_facts)
card32 = Card.new("Which Kentucky-born U.S. president is honored in the Wrestling Hall of Fame?", "Abraham Lincoln", :historical_facts)
card33 = Card.new("What is the roman name for the goddess Hecate?", "Trivia", :historical_facts)
card34 = Card.new("Name the second president of the United States of America.", "John Adams", :historical_facts)
card35 = Card.new("Which sought-after snack took eight months to return to shelves after its parent company, Hostess, declared bankruptcy?", "Twinkies", :historical_facts)
card36 = Card.new("When Pope Gregory IX rose to power, what domestic animal did he order to exterminate across Europe in the belief that they were used in devil’s worship and witch craft?", "Cats", :historical_facts)
card37 = Card.new("People in Victorian England said this word before having their picture taken instead of the word “cheese”. What fruit did they say?", "Prunes", :historical_facts)
card38 = Card.new("What natural human bodily fluid did Romans use as mouth wash because of the presence of ammonia in it?", "Urine", :historical_facts)
card39 = Card.new("On what year did the Ford Model T enter production?", "1908", :historical_facts)
card40 = Card.new("In USSR, What does the letter “R” sand for?", "Republics", :historical_facts)
card41 = Card.new("James Cook led and commanded what ship when he discovered Australia?", "HMS Endeavor", :historical_facts)
card42 = Card.new("Who is the Greek God of the Underworld?", "Hades", :historical_facts)
card43 = Card.new("Rubber was discovered by?", "Charles Mackintosh", :historical_facts)
card44 = Card.new("Who was the first black senator in the United States of America?", "Carol Moseley Brown", :historical_facts)


deck1 = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10,
                  card11, card12, card13, card14, card15, card16, card17, card18, card19,
                  card20, card22, card23, card24, card25, card26, card27, card28, card29,
                  card30, card31, card32, card33, card34, card35, card36, card37, card38, card39,
                  card40, card41, card42, card43, card44])

puts "Welcome to Flashcards!"
puts "-" * 50
loop do

  puts "If you would like to upload your own deck, type 'yes'; otherwise, type 'no'."
  deck_choice = gets.chomp

  if deck_choice.downcase == "yes"
    puts "Enter the name of your file: "
    file_name = gets.chomp
    new_cards = CardGenerator.new.generate(file_name)
    game_deck = Deck.new(new_cards)
  elsif deck_choice.downcase == "no"
    game_deck = Deck.new(deck1.random_cards(15))
  else
    puts "Invalid input"
    next
  end

  new_round = Round.new(game_deck)
  new_round.start

  while new_round.turns < new_round.total
    new_card = new_round.select_card
    puts new_card.question
    answer = gets.chomp

    new_round.take_turn(answer, new_card)

    puts "You have answered #{(new_round.turns).to_s} questions, out of #{(new_round.total.to_s)}."
    puts ""
  end

  puts "You got #{new_round.correct} correct answers out of #{new_round.total}, resulting in a score of #{new_round.get_score(new_round.correct, new_round.total)}%"
  puts "Your results by category are as follows:"
  puts new_round.get_score_by_category
  break
end
puts "-" * 50
puts "Thanks for playing!"
