require './lib/flashcard_runner.rb'

RSpec.describe Game do
    it 'exists' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        game = Game.new(deck)
        require 'pry'; binding.pry
        expect(game).to be_instance_of(Game)
    
    end

end