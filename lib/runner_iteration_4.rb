require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require_relative 'card_generator'

card_data = CardGenerator.new("cards.txt").get_text


@deck = Deck.new(@cards)

@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "~" * 40

  until @round.turns.count == @card_total
    puts "This is question #{@round.turns.count + 1}. (Category = #{@deck.cards.first.category})"
    puts "Question: #{@deck.cards.first.question}"
    print "Answer: "

    @round.take_turn(gets.chomp.capitalize)

    if @round.turns.last.correct? == true
      puts "#{@round.turns.last.feedback}"
    else
      puts "#{@round.turns.last.feedback} The correct answer is #{@round.turns.last.card.answer}."
    end

    puts "-" * 40
  end

  puts "******* Game Over! *******"
  puts "You had #{@round.number_correct.to_i} correct guesses out of #{@card_total} for a total score of #{@round.percent_correct.to_i}%."
  puts "Capitals - #{@round.percent_correct_by_category(:Capitals)}% correct."
  puts "Math - #{@round.percent_correct_by_category(:Math)}% correct."
  puts "The Office - #{@round.percent_correct_by_category(:The_office)}% correct."
end

start
