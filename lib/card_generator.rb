class CardGenerator
    attr_reader :filename

    def initialize(filename)
        @filename = filename
    end

    def cards
        cards = Card.new(question, answer, category)
    end
end