require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'
require 'io/console'


def anykey
  puts "
>>
  "
  STDIN.getch
end

def play_card
  puts File.open('./lib/next_question.txt').flat_map{ |line| line.split (/\n/)}.sample + " #{@round.curr_card + 1} out of #{@deck.count}."
  anykey
  puts "#{@round.current_card.question}"
  guess = gets.chomp
  turn = @round.take_turn(guess)
  if turn.correct?
    puts " "
    puts File.open('./lib/right.txt').flat_map{ |line| line.split (/\n/)}.sample
    anykey
  else
    puts " "
    puts File.open('./lib/wrong.txt').flat_map{ |line| line.split (/\n/)}.sample
    anykey
    puts File.open('./lib/actually.txt').flat_map{ |line| line.split (/\n/)}.sample + " #{turn.card.answer}."
    anykey
  end
  if !turn.correct? && turn.card.answer.to_s.downcase == guess.downcase
    puts "
Attention to capitalization is Big Brain Energy!
    "
    anykey
  end
end

puts "
Welcome to the ULTIMATE KNOWLEDGE CHALLENGE!!!!!!!!
 "
sleep 2
puts "The rules are simple. You will be asked a series of questions. Answer them to the best of your ability. Your score will be used to evaluate your intellectual prowess."
puts "--------------------------------------------------------------------------"
sleep 4
puts "
PRO TIP: Press any key to continue when you see the \">>\" symbol!"
anykey
puts "How many questions would you like? Choose any number from 1 to #{File.readlines('./lib/cards.txt').count}."
number = gets.chomp.to_i
cards = CardGenerator.new('./lib/cards.txt', number).cards
@deck = Deck.new(cards)
@round = Round.new(@deck)

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
