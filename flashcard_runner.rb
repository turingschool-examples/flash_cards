require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'
require 'io/console'

card_1 = Card.new('What recording artist in 1993 changed their name to a symbol that is not included in the Ruby character map?', 'Prince', :FamousPeople)
card_2 = Card.new('You have seven times more potatoes than the difference of nine and six. How many potatoes do you have?', 21, :Math)
card_3 = Card.new('Complete this piece of sage advice: "Live, Laugh, _____."', 'Love', :Philosophy)

card_4 = Card.new('Which famous scientologist starred in the year-2000 trainwreck known as Battlefield Earth?', 'John Travolta', :FamousPeople)
card_5 = Card.new('Two rabbits mate and have 4 baby rabbits, who grow up to make 16 new babies. If a rabbit eats two carrots a day, how many carrots are needed to feed the whole family for a week?', 308, :Math)
card_6 = Card.new('"Go to bed with itchy butt, wake up with _______."', 'stinky fingers', :Philosophy)

card_7 = Card.new('Who is the legendary pop diva that ROASTED rapper Jay-Z on a ground-breaking double album in 2016?', 'Beyoncé', :FamousPeople)
card_8 = Card.new('You cut a large cheese wheel into 40 equal wedges. You eat four of the cheese wedges, give one to your neighbor, and lose five when you accidentally leave them on the roof of your car before driving off. You put the remaining wedges back together to form a circle with a missing section. If one edge of the missing section of this incomplete cheese wheel were to represent the minute hand pointing at 12 on a clock, and if the other edge of the missing section represented the clock\'s hour hand, what is the SMALLEST number that the hour hand could be pointing to?', 3, :Math)
card_9 = Card.new('Between FAST, CHEAP, and GOOD, any project can only be how many of these things?', 2, :Philosophy)

@cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def anykey
  puts "
>>"
  STDIN.getch
end

def play_card
  puts ["Coming at you now is question ", "This is intellectual challenge number ", "Take a deep breath and prepare yourself for mental test "].sample + "#{@round.curr_card + 1} out of #{@deck.count}."
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
