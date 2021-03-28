class Round
  attr_reader :deck, :turns, :guess, :number_correct, :percent_correct, :percent_correct_by_category
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.current_card
  end

  def take_turn(guess)
    nturn = Turn.new(guess, current_card)
    @turns.push(nturn)
    deck.cards.rotate!
    nturn
  end

  def number_correct
    result = []
    @turns.each do |turn|
      if turn.correct?
        result.push(turn.card)
      end
    end
    result.length
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.card.answer.downcase == turn.guess.downcase #want to refactor this
     end.length
  end


  def percent_correct
    ((number_correct.to_f/turns.count)*100).to_i
  end

  def correct_category(category)
    @turns.count do |turn|
      turn.card.category == category
      end
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f/correct_category(category))*100).to_i
  end

  def start
    puts "Welcome! \n       You're playing with #{deck.count} cards.
        -------------------------------------------------
          This is card number #{turns.count + 1} out of #{deck.count}.
          Question: #{current_card.question}?
          Type answer below"
    first_turn
    until finished_with_cards == true
      if @guess.downcase == @turns.last.card.answer.downcase#refactor me
        puts "        #{@turns.last.feedback}
        This is card number #{@turns.count + 1} out of #{deck.count}.
        Question: #{current_card.question}?
        Type answer below"
        @guess = gets.chomp
          take_turn(@guess)
      elsif @guess.downcase != @turns.last.card.answer.downcase
        puts "        #{@turns.last.feedback}
        This is card number #{@turns.count + 1} out of #{deck.count}.
        Question: #{current_card.question}?
        Type answer below"
        @guess = gets.chomp
        take_turn(@guess)
      end
    end
    if @guess.downcase == @turns.last.card.answer.downcase
      #refactor me
      puts "        #{@turns.last.feedback}"
      ending_message
    else @guess.downcase != @turns.last.card.answer.downcase#refactor me
      puts "        #{@turns.last.feedback}"
      ending_message
    end
  end

  def first_turn
    nturn = Turn.new(@guess = gets.chomp, @deck.cards[0])
    @turns.push(nturn)
    @deck.cards.rotate!
  end

  def finished_with_cards
    @turns.count == (deck.cards.count)
  end

  def ending_message
    puts "****** Game over! ******
       You had #{number_correct} correct guesses out of #{@turns.count} for a total score of #{percent_correct}%.
       STEM - #{percent_correct_by_category(:STEM)}% correct
       Geography - #{percent_correct_by_category(:Geography)}% correct"
  end
end
