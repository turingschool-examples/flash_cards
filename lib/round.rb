class Round

  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.cards.first)
    @turns << turn
    deck.cards.rotate!
    return turn
  end

  def correct?
    round.turns.first.string == round.turns.fist.card.answer
  end

  def number_correct
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct
  end

  def number_correct_by_category(category)
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].card.category == category && @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    num_correct
  end

  def percent_correct
    num_correct = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          turn_index += 1
        else
          turn_index += 1
        end
      end
    end
    p_correct = num_correct / @turns.count.to_f * 100
    p_correct.round(1)
  end

  def percent_correct_by_category(category)
    num_correct = 0
    category_count = 0
    turn_index = 0
    until turn_index == @turns.count
      @turns.each do |turn|
        if @turns[turn_index].card.category == category && @turns[turn_index].string == @turns[turn_index].card.answer
          num_correct += 1
          category_count += 1
          turn_index += 1
        elsif @turns[turn_index].card.category == category
          turn_index += 1
          category_count += 1
        else
          turn_index += 1
        end
      end
    end
    (num_correct / category_count.to_f * 100).round(1)
  end

  def start
    card_number = 0

    puts "Welcome! You're playing with #{deck.count} cards.
    -------------------------------------------------"
    until card_number == deck.count
      puts "This is card number #{card_number + 1} out of #{deck.count}.\nQuestion: #{deck.cards[0].question}"
      guess = gets
      if guess.strip == @deck.cards[0].answer
        puts "Correct!"
      else
        puts "Incorrect."
      end
      take_turn(guess.strip)
      card_number += 1
    end

    puts "****** Game over! ******\nYou had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.round}%."

    category_results

    # Iteration 3 hard coded results
    # "Geography - #{round.percent_correct_by_category(:Geography).round}% correct
    # STEM - #{round.percent_correct_by_category(:STEM).round}% correct"
  end

  # for Iteration 4: iterate through the questions to store the cateogires in an array (see flashcard_runner.rb lines 38-39)
  def category_collector
    cats = []
    index = 0
    until index == @deck.cards.count
      @deck.cards.each do |card|
        cats << @deck.cards[index].category
        index += 1
      end
    end
    cats.uniq
  end

  # for Iteration 4: iterate through the categories to output the % correct correct by category
  def category_results
    cat_index = 0
    until cat_index == self.category_collector.count
      self.category_collector.each do |category|
        cat_index += 1
        pct = self.percent_correct_by_category(category).round
        puts "#{category} - #{pct}% correct"
      end
    end
  end
end
