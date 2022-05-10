class Round

  attr_reader :deck,
              :used_cards,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @used_cards = []
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards.first)
    @number_correct += 1 if @turns.last.guess == @deck.cards.first.answer
    @used_cards << @deck.cards.first
    @deck.cards.shift
    return @turns.last
  end

  def number_correct_by_category(cat)
    number_correct_by_category = @turns.count do |turn|
      turn.card.category == cat && turn.correct?
    end
  end

  def percent_correct
    @number_correct.to_f * 100 / @turns.count
  end

  def percent_correct_by_category(cat)
    number_correct_by_category(cat) * 100 / @turns.count do |turn|
      turn.card.category == cat
    end
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.length} cards."
    puts "-" * 30

    total_cards = deck.cards.length + used_cards.length

    # when card_number <= 4 /or/ deck.cards.length > 0

    card_number = 1
    # deck.cards.each do |card|
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{deck.cards.first.question}"
    answer_1 = gets.chomp.to_s.downcase
    first_turn = take_turn(answer_1)
    puts first_turn.feedback

    card_number += 1
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{deck.cards.first.question}"
    answer_2 = gets.chomp.to_s.downcase
    second_turn = take_turn(answer_2)
    puts second_turn.feedback

    card_number += 1
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{deck.cards.first.question}"
    answer_3 = gets.chomp.to_s.downcase
    third_turn = take_turn(answer_3)
    puts third_turn.feedback

    card_number += 1
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{deck.cards.first.question}"
    answer_4 = gets.chomp.to_s.downcase
    fourth_turn = take_turn(answer_4)
    puts fourth_turn.feedback

    # when deck.cards == []

    puts "***** Game over! *****"
    puts "You had #{number_correct} correct guesses out of #{total_cards} for a total score of #{percent_correct.to_i}%."
    used_cards_by_category = used_cards.group_by do |card|
      card.category
    end
    stats = used_cards_by_category.each do |k,v|
      puts "#{k} - #{percent_correct_by_category(k)}% correct"
    end
  end

end
