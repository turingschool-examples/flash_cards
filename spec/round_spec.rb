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

    expect(round.turns[0]).to eq(new_turn)
    #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
  end

  it '' do

    expect(round.number_correct).to eq (1)
    #=> 1
  end

  it '' do

    expect(round.current_card).to eq(card_2)
    #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
  end

  it '' do
    new_turn = round.take_turn("Venus")

    expect(new_turn.correct?).to eq(false)

    expect(round.turns.count).to eq(2)
    #=> 2

    expect(round.turns.last.feedback).to eq("Incorrect.")
    #=> "Incorrect."

    expect(round.number_correct).to eq(1)
    #=> 1

  end

  it '' do

    expect(round.number_correct_by_category(:Geography)).to eq(1)
    #=> 1
  end

  it '' do

    expect(round.number_correct_by_category(:STEM)).to eq(0)
    #=> 0
  end

  it '' do

    expect(round.percent_correct).to eq(50.0)
    #=> 50.0
  end

  it '' do

    expect(round.percent_correct_by_category(:Geography)).to eq (100.0)
    #=> 100.0
  end


  it '' do

    expect(round.current_card).to eq(card_3)
    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

    expect(round.deck_index).to eq(2)
  end
end
