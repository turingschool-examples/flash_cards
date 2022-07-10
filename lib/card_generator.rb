require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'



class CardGenerator
    attr_reader :temp_deck

    def initialize(filename = 'cards.txt')
        f_name = filename
        @temp_deck = []
        File.foreach(f_name) do |line|
            card_hash = Hash[ [:question, :answer, :category].zip(line.tr("\n",'').split(","))]
            card_question = card_hash[:question]
            if card_hash[:answer].downcase == "arbitrarily wrong"
                abort("\n\n\n~~~Answer passed in cannot be the phrase 'arbitrarily wrong', see #{f_name} for source.~~~\n\n\n")
            end
            card_answer = card_hash[:answer]
            card_cat = card_hash[:category].tr(' ','_').insert(0,':').to_sym
            @temp_deck << Card.new(card_question,card_answer,card_cat)
        end
        
    end
end