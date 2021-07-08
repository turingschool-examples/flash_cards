require 'spec_helper'

RSpec.describe PlayGame do
  it 'exists' do
    play = PlayGame.new

    expect(play).to be_a PlayGame
  end

  # it 'starts the game' do
  #   play = PlayGame.new
  #   expect(play.begin_game).to eq("Welcome! You're playing with #{@deck.count} cards.")
  # end
end

# to - do:
  # 3 - 7 methods - testing depends on if it takes user input or just returns a string
  # don't need to test puts
  # cards method - tests instantiates and returns an array of cards
  # user input gets.chomp as it's own method so I can later stub
