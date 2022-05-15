class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_cards = []
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
      @correct_cards << turn.card
    end
    turn
  end
  # Do not need this method since it is also defined above in reader
  def number_correct
    @number_correct
  end

  def number_correct_by_category(category)
    category_correct = []
      @correct_cards.each do |correct_card|
        if correct_card.category == category
          category_correct << correct_card.category
        end
    end
    category_correct.count
  end

  def percent_correct
    (@correct_cards.count.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    # correct_cards_by_category = []
    # @correct_cards.each do |correct_card|
    #   if correct_card.category == category
    #     correct_cards_by_category << correct_card
    #   end
    # end
    # total_turns_by_category = []
    # @turns.each do |turn|
    #   if turn.card.category == category
    #     total_turns_by_category << turn
    #   end
    # end
    #
    # (correct_cards_by_category.count.to_f / total_turns_by_category.count.to_f) * 100

    correct_cards_by_category = 0

    @correct_cards.each do |correct_card|
      if correct_card.category == category
        correct_cards_by_category += 1
      end
    end

    total_turns_by_category = 0

    @turns.each do |turn|
      if turn.card.category == category
        total_turns_by_category += 1
      end
    end

    (correct_cards_by_category.to_f / total_turns_by_category.to_f) * 100
  end

  def start
    card_number = 0
    while card_number < deck.count
      card_number += 1
    end
    puts "This is card number #{card_number} out of #{deck.cards.count}."
    puts "Question: #{current_card}"
  end

end
