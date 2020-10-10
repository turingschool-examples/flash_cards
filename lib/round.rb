class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.count} cards."
    puts "-------------------------------------------------"
    card_count = @deck.cards.count
    card_count.times do |card|
      puts "This is card number #{@turns.count + 1} out of #{@deck.cards.count}."
      puts "#{current_card.question}"
      guess = gets.chomp
      new_turn = take_turn(guess)
      puts new_turn.feedback

    end

    if @turns.count == 3
      puts "****** Game over! ******\n
      You had #{number_correct} correct guesses out of #{@deck.cards.count} for a total score of #{percent_correct.ceil}%.\n
      STEM - #{percent_correct_by_category(:STEM)} % correct\n
      Geography - #{percent_correct_by_category(:Geography)}% correct\n
      "
    end
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    turns[-1]
  end

  def current_card
    deck.cards[turns.count]
  end

  def number_correct
    correct_guess = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guess +=1
      end
    end
      correct_guess
  end

    def percent_correct
      (number_correct.to_f/@turns.count.to_f) * 100
    end

    def number_correct_by_category(category)
      counter = 0
      @turns.each do |turn|
        if turn.guess == turn.card.answer && turn.card.category == category
          counter += 1
        end
      end
      counter
    end

    def percent_correct_by_category(category)
      (number_correct_by_category(category).to_f/
      @turns.map.count do |turn|
        turn.card.category == category
      end) * 100
    end
end
