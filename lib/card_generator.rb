class CardGenerator

    def initialize(file)
        @file = file
        @file_data = []
    end

    def read_file
        @file_data = File.read(@file).split("\n")
    end
end