require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  it 'exists' do
    expect(round).to be_instance_of Round
  end

  it '' do
    expect(round.deck).to eq(deck)
  end

  it '' do
    expect(round.turns).to eq([])
  end

  it '' do
    expect(round.current_card).to eq(card_1)
  end

  it '' do
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    #=> Turn

    expect(new_turn.correct?).to eq(true)
    #=> true

    expect(round.turns).to eq(new_turn)
    #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
  end

  xit '' do

    expect(round.number_correct)
    #=> 1
  end

  xit '' do

    expect(round.current_card)
    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
  end

  xit '' do

    expect(round.take_turn("Venus"))
    #=> #<Turn:0x00007f972a215b38...>
  end

  xit '' do

    expect(round.turns.count)
    #=> 2
  end

  xit '' do

    expect(round.turns.last.feedback)
    #=> "Incorrect."
  end

  xit '' do

    expect(round.number_correct)
    #=> 1
  end

  xit '' do

    expect(round.number_correct_by_category(:Geography))
    #=> 1
  end

  xit '' do

    expect(round.number_correct_by_category(:STEM))
    #=> 0
  end

  xit '' do

    expect(round.percent_correct)
    #=> 50.0
  end

  xit '' do

    expect(round.percent_correct_by_category(:Geography))
    #=> 100.0
  end


  xit '' do

    expect(round.current_card)
    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
  end
end
