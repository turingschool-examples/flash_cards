require 'cards.txt'

class CardGenerator
    attr_reader cards

    def initialize (filename)
        @cards = filename.split(",").in_slices_of(3)
    end
end