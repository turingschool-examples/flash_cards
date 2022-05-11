require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Card do
  it 'can create instances of Cards' do
    card_1 = Card.new(
      "What is the capital of Alaska?",
      "Juneau",
      :Geography
    )

    expect(card_1).to be_instance_of(Card)
  end 

  # it 'can create three '
  #
  #   card_2 = Card.new(
  #     "The Viking spacecraft sent back to Earth photographs and
  #     reports about the surface of which planet?",
  #     "Mars",
  #     :STEM
  #   )
  #
  #   card_3 = Card.new("Describe in words the exact direction that
  #     is 697.5° clockwise from due north?",
  #     "North north west",
  #     :STEM
  #   )
  end
