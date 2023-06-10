class Score
  def initialize
    @running_score = []
    @bonus = []
    @index = 0
  end

  def score_calculation(turn, index)
    @index = index
    @running_score << turn
    total_score = 0
   
    if @index < 10
      if @running_score[-2][1] == 10
        @bonus << turn[1]
        @bonus << turn[2]
        @running_score[-2][:StrikeBonus1] = turn[1]
        @running_score[-2][:StrikeBonus2] = turn[2]
      end
    end
    if @index < 10
      if @running_score[-2][1] + @running_score[-2][2] == 10 && @running_score[-2][1] < 10
        @bonus << turn[1]
        @running_score[-2][:SpareBonus] = turn[1]
      end
    
    end
    @running_score.each do |frame|
      total_score += frame[1] + frame[2]
    end

    total_score = total_score + (@bonus.sum)
  end

  def running_score
    puts "The Game So Far:"
    @running_score.each do |frame|
      puts "Frame #{@index + 1}: #{frame}"
    end
  end
  
end
