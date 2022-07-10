
class Round 

    attr_reader :deck, :turns, :num_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @num_correct = []
 
end

def current_card
    @deck.cards[@turns.count]
end

def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if new_turn.correct?
        @num_correct << new_turn
    end
    new_turn
end

def number_correct
 @num_correct.count    
end


def number_correct_by_category(category)
    num_correct_in_category = []
@turns.each do |turn|
    if turn.correct? && turn.card.category == category
        num_correct_in_category << turn
    end
end

num_correct_in_category.count

end

# @turns.select { |turn| turn.card.category ==  info }.count.to_f

def total_number_of_cards_in_category(category)
    number_of_cards_in_category = []
    turns.select do |turn|
       if turn.card.category == category
        number_of_cards_in_category << turn
        end
    end
    number_of_cards_in_category.count
end

def percent_correct
   
    (num_correct.count.to_f / turns.count) * 100
    
 end

 def start

    p "Welcome! You're playing with #{deck.cards.count} cards"
    p "-------------------------------------------------"
    
    until deck.cards.count == turns.count do 
        p "This is card number #{turns.count + 1} out of #{deck.cards.count}"

        p current_card.question

        guess = gets.chomp
        next_turn = take_turn(guess)

        p next_turn.feedback

    end 

p "****** Game over! ******"

p "You had #{num_correct.count} out of #{deck.cards.count} for a total score of #{(num_correct.count / deck.cards.count) * 100} % "


card_categories = []
turns.each do |turn|
    card_categories << turn.card.category
end


(card_categories.uniq).each do |category|
   p "#{category} - #{(number_correct_by_category(category) / total_number_of_cards_in_category(category)) * 100} % correct"
#    p "#{category} - #{number_correct_by_category(category)} / #{total_number_of_cards_in_category}"

end


end
end















