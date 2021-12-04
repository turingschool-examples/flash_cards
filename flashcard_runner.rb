require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'
require 'io/console'

filename = './lib/cards.txt'
cards = CardGenerator.new(filename).cards
@deck = Deck.new(cards)
@round = Round.new(@deck)

def anykey
  puts "
>>
  "
  STDIN.getch
end

def play_card
  puts File.open('./lib/next_question.txt').flat_map{ |line| line.split (/\n/) }.sample + " #{@round.curr_card + 1} out of #{@deck.count}."
  anykey
  puts "#{@round.current_card.question}"
  guess = gets.chomp
  turn = @round.take_turn(guess)
  if turn.correct?
    puts " "
    puts ["Great Job! That answer is correct.", "Damn, you're smart!", "¡CORRECTAMUNDO!"].sample
  else
    puts " "
    puts ["WHIFF!", "So sorry, but that's not the answer we're looking for.", "Seriously??"].sample
    anykey
    if turn.card.answer.to_s.downcase == guess.downcase
      puts "
Attention to capitalization is Big Brain Energy!
      "
      anykey
    end
    puts ["The only correct response we can accept is ", "The answer we're looking for here is ", "I'm surprised you didn't know it was "].sample + "#{turn.card.answer}."
  end
  anykey
end

puts "
Welcome to the ULTIMATE KNOWLEDGE CHALLENGE!!!!!!!!
 "
sleep 2
puts "The rules are simple. You will be asked #{@deck.count} questions. Answer them to the best of your ability. Your score will be used to evaluate your intellectual prowess."
puts "--------------------------------------------------------------------------"
sleep 4
puts "
PRO TIP: Press any key to continue when you see the \">>\" symbol!"
anykey

@deck.count.times do
  play_card
end

puts "
This concludes the question portion of the ULTIMATE KNOWLEDGE CHALLENGE.
"
anykey
puts "
The results are in, but before we show you, we just wanted to say...
"
anykey
puts "
Everybody is special, in their own special way.
"
anykey
puts "
Especially you.
"
anykey
puts "
Ok, here is your OFFICIAL Intellectual Prowess Rating!
"
anykey
puts "
OVERALL SCORE: #{@round.percent_correct.round}%

You answered #{@round.number_correct} out of #{@deck.count} questions correctly.
"
anykey
puts "
Areas of Intelligence
----------------------
Famous People: #{@round.percent_correct_by_category(:FamousPeople).round}%
Math: #{@round.percent_correct_by_category(:Math).round}%
Philosophy: #{@round.percent_correct_by_category(:Philosophy).round}%
"
anykey
puts "
Thanks for playing!
 "
