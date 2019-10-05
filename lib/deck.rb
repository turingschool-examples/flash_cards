class Deck

  attr_reader :cards, :deck_final

  def initialize(cards, shuffle, nr_cards)
    @cards = cards
    @shuffle = shuffle
    @nr_cards = nr_cards
    @deck_final = []
  end

  def finalize_deck
    if @shuffle
      @nr_cards.times do |i|
        loop do
          new_card = @cards.sample
          if not @deck_final.include?(new_card)
            @deck_final << new_card
            break
          end
        end
      end
    else
      @deck_final = @cards
    end
  end


  def count
    @deck_final.length
  end

  def cards_in_category(category)
    cards_cat = []
    @deck_final.each do |card|
      if card.category == category
        cards_cat << card
      end
    end
    cards_cat
  end

end
