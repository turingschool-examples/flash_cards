class CardGenerator
    attr_reader :cards

    def initialize(filename)
        @cards = []

        File.foreach(filename) do |line|
            args = line.chomp.split(',')
            card = Card.new(args[0], args[1], args[2])
            @cards << card
        end
    end
end