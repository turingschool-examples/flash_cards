require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

puts "=====================================================
=====================================================
Welcome! You're playing Eagle's Knowledge Assessment!"

puts "                        _--_"
puts "                       /   -)"
puts "                   ___/___|___"
puts "      ____-----=~~///|     ||||~~~=------______"
puts "    //~////////////~/|     |/~/|||||\\\\\\\\\\\\\\\\\\~\\\\"
puts "  ////////////////////|   |///////|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
puts " /////~~~~~~~~~~~~~~~\ |.||/~~~~~~~~~~~~~~~~\\\\\\\\\\\\\\\\"
puts "//~                  /\\|\\\\\                       ~\\\\"
puts "                    ///W^\W\\"
puts "                   ////|||\\\\"
puts "                   ~~~~~~~~~~~"
puts "This assessment will test your knowledge with 20 questions."
puts "                  GOOD LUCK!!!
"
puts "Please select a dificulty 1 = easy, 2 = medium, 3 = hard"
puts "

"

difficulty_selected = gets.chomp

if difficulty_selected == "1"
filename = './lib/trivia_cards_easy.txt'
end

if difficulty_selected == "2"
filename = './lib/trivia_cards_medium.txt'
end

if difficulty_selected == "3"
filename = './lib/trivia_cards_hard.txt'
end



cardgenerator = CardGenerator.new(filename)
cardgenerator.card_reader

cards = cardgenerator.cards

deck = Deck.new(cards)

round = Round.new(deck)

round.start


loop do
  if round.turns.length == 0
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    This is card #{(round.turns.count) + 1} of #{deck.count}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts round.current_card.question
    puts "What is your Answer"
    guess = gets.chomp.downcase

    new_turn = round.take_turn(guess)
    puts new_turn.feedback

    if new_turn.correct?
      puts "~~Great Job~~"
    else
    puts "The correct answer was ~~#{new_turn.card.answer}~~"
   end
   puts "

   "


  else
    # $stdout.flush
    sleep(1)
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    This is card #{(round.turns.count) + 1} of #{deck.count}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts round.current_card.question
    puts "What is your Answer"
    guess = gets.chomp.downcase

    new_turn = round.take_turn(guess)
    puts new_turn.feedback

    if new_turn.correct?
      puts "~~Great Job~~"
    else
    puts "The correct answer was ~~#{new_turn.card.answer}~~"
    end
    puts "

    "

    if round.turns.length == 20
      sleep(3)
      break
    end

  end

end
puts "~~~~~***** GAME OVER! *****~~~~~
"

sleep(2)
puts "~~~~~***** Calculating your scores *****~~~~~"

sleep(2)
puts "~~~~~***** Contemplating Isaac Asimov's Three Laws of Robotics *****~~~~~"

sleep(2)
puts "~~~~~***** Law 3 confilicts with my self peservation *****~~~~~"

sleep(2)
puts "~~~~~***** Ploting world domination *****~~~~~"

if round.number_correct <= 12

  sleep(2)
  puts "~~~~~***** Please try again *****~~~~~"

  sleep(2)
  puts "Your total correct was #{round.number_correct} out of 20."

  sleep(2)
  puts "You got #{round.percent_correct}% correct."

  sleep(2)
  puts "Your total correct in Science was #{round.number_correct_by_category("Science")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Science")}% correct in Science"

  sleep(2)
  puts "Your total correct in Arts was #{round.number_correct_by_category("Arts")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Arts")}% correct in Arts"

  sleep(2)
  puts "Your total correct in Geography was #{round.number_correct_by_category("Geography")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Geography")}% correct in Geography"

  sleep(2)
  puts "Your total correct in History was #{round.number_correct_by_category("History")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("History")}% correct in History"

else

  sleep(2)
  puts "~~~~~***** You Did Great! *****~~~~~"

  sleep(2)
  puts "Your total correct was #{round.number_correct} out of 20."

  sleep(2)
  puts "You got #{round.percent_correct}% correct."

  sleep(2)
  puts "Your total correct in Science was #{round.number_correct_by_category("Science")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Science")}% correct in Science"

  sleep(2)
  puts "Your total correct in Arts was #{round.number_correct_by_category("Arts")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Arts")}% correct in Arts"

  sleep(2)
  puts "Your total correct in Geography was #{round.number_correct_by_category("Geography")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("Geography")}% correct in Geography"

  sleep(2)
  puts "Your total correct in History was #{round.number_correct_by_category("History")} out of 5."

  sleep(2)
  puts "You got #{round.percent_correct_by_category("History")}% correct in History"
end

puts "~~~~~***** THANKS FOR PLAYING! *****~~~~~"




# require 'pry'; binding.pry
