class Score
  def initialize(io = $stdout)
    @running_score = []
    @bonus = []
    @frame_index = 0
    @io = io
  end

  def score_calculation(turn)
    @running_score << turn
    @total_score = 0
    @turn = turn

    
  end

  def running_score
    @io.puts "The Game So Far:"
    @io.puts @running_score
    @io.puts "Total Score: #{@total_score}" if @frame_index > 9
  end

  private

  def calculate_bonus(turn)
    
      end
    end

    @frame_index += 1
  end
end
