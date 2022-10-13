class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(cat)
    # sub_cat = cat
    same_category = []
    @cards.each do |deck_card|
    same_category << deck_card if (deck_card.category == cat)
      # same_category << deck_card if deck_card.category == @subcat
    end
    return same_category
  end

  # it 'test 1' do
  #   names = ["alice", "bob", "charlie"]
  #   capitalized_names = []
  #   names.each do |name|
  #     capitalized_names << name.capitalize
  #   end
  #   expect(capitalized_names).to eq(["Alice", "Bob", "Charlie"])
  # end

  def count
    @cards.length
  end

  def shift
    @cards.shift
  end

end
