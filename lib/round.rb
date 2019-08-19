require 'pry'
  class Round
    attr_reader :turns, :deck, :number_correct, :current_card_index, :count, :new_turn, :guess, :current_card

      def initialize(deck)
        @turns = []
        @deck = deck.cards
        @number_correct = 0
        # @current_card_index = 0
        @count = 0
        @current_card = @deck[@current_card_index]
        @guess = guess
        @new_turn = Turn.new(guess, @current_card)
        # @category = category
      end


      def current_card
        @current_card = @deck[@current_card_index]
      end

      def take_turn(guess)
        @new_turn = Turn.new(guess, @current_card)
        @turns.push(@new_turn)
        @current_card_index += 1
        # @deck.shuffle = @current_card
        @new_turn
      end

        # def next_card
        #   @deck.each do |card|
        #   @deck = cards.shuffle
        #   @deck[@current_card_index] = @current_card
        # end
        # end

      def number_correct
        if @new_turn.correct? == true
          @number_correct = @number_correct +1
        end
          # @current_card_index = @current_card_index +1
      end

      # def current_card
      #   @deck [@current_card_index]
      # end
      #
      # def number_correct_by_category
      #   if @turn.caterogy == @category && @turn.correct == true
      #     @count == @count +1
      #     @count
      #   end
      # end
      #
      # def percent_correct
      #     if @turn.guess == @card.answer
      #       @turn.percent
      #     end
      #  end
      #
      #
      # def percent_correct_category
      #   @turns.each do |turn|
      #   if @turn.category == @category && @turn.correct == true 
      #     "Correct"
      #   else
      #     "Incorrect"
      #   end
      #   end
      #   @turns.category.percent
      # end

    end
