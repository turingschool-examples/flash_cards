class CardGenerator
    attr_reader :filename
    def initialize(filename)
        @filename = filename
    end
    
    def cards
        cards = []
        File.open(filename, "r") do |f|
            f.each_line do |line|
                arguments = line.chop.split(",")
                cards << Card.new(arguments[0], arguments[1], arguments[2])
            end
        end
        
        cards
    end
end

