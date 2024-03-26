class Card_generator

    attr_reader :file_path, cards

    def initialize(file_path)
        @file_path = file_path
        @cards = []
        ingest_file if file_exists?
    end

    def ingest_file(filename)
        if File.exist?(filename)
            file_content = File.read(filename)
            puts file_content
        else
            puts "File does not exist"
        end
    end
end

# file_reader.rb

# Function to read the content of a given file
def ingest_file(file_path)
    # Check if the file exists
    if File.exist?(file_path)
    # Open and read the file, storing its content
    file_content = File.read(file_path)
    puts "File content:"
    # Output the content to the console
    puts file_content
    else
    # If the file doesn't exist, output an error message
    puts "File does not exist."
    end
end

# Replace 'yourfile.txt' with the path to your text file
ingest_file('./cards.txt')