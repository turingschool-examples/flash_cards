class CardGenerator
    attr_reader :cards

    def initialize(filename)
        @cards = []

        File.foreach(filename) do |line|
            args = line.chomp.split(',')
            @cards << Card.new(args[0], args[1], args[2])
        end
    end
end