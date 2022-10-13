#initialized w/ array of Card objects.
#should also return cards based on given category

class Deck

  attr_reader :card_obj

  def initialize(card_objects)
    @card_obj = card_objects
  end

  def count
    @card_obj.count
  end

  def cards_in_category(category)
    if category == @question
      cards
    elsif category == @answer
      cards
    elsif category == @category
      cards
    end
  end
  #rspec
  #expected: #<Card:0x00007fd51b8cbe58
  #@question="What is the capital of Alaska?", @answer="Juneau",
  # @category=:Geography>
  #got: nil
end
