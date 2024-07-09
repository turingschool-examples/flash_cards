class HighScore
    attr_reader :filename,
                :scores,
                :current_score,
                :user_name

    def initialize(round, filename)
        @filename = filename
        @scores = get_scores
        @current_score = round.number_correct
        @user_name = "Default John"
    end

    def get_scores
        @scores = File.readlines(filename)
        @scores = @scores.map do |score|
            score.chomp
        end
    end

    def get_user_name(name)
        @user_name = name
    end

    def add_score(name, score)
        scores << "#{name}, #{score}"
    end

    def save
        File.write(@filename, @scores.join("\n"))
    end
end