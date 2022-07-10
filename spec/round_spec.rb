require_relative 'spec_helper'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                       'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe 'Round' do
    it 'can initialize a new Round' do
      expect(@round).to be_an_instance_of(Round)
    end

    it 'can take a turn ' do

      expect(@round.turns).to eq([])
    end

    it '3. round current card' do
      expect(@round.current_card).to eq(@card_1)
    end

    it 'new turn is an instance of Turn' do
      new_turn = @round.take_turn("Juneau")
      expect(new_turn).to be_an_instance_of(Turn)
    end

    it 'can return if the turn was correct' do
      new_turn = @round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
    end

    it 'can start a new turn' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.turns).to eq([new_turn])
    end

    it 'can return how many turns were correct' do
      new_turn = @round.take_turn("Juneau")
      expect(@round.number_correct).to eq(1)
    end




# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> round.take_turn("Venus")
# #=> #<Turn:0x00007f972a215b38...>
#
# pry(main)> round.turns.count
# #=> 2
  end
end
