class Score
  def initialize(io =$stdout)
    @running_score = []
    @bonus = []
    @frame_index = 0
    @io = io
  end

  def score_calculation(turn)
    @running_score << turn
    @total_score = 0
    @turn = turn
  
    if @frame_index >= 1 && @running_score[@frame_index - 1][1] == 10 && @running_score[@frame_index - 2][1] == 10
      @bonus << 10
      @bonus << 10
      previous_frame = @running_score[@frame_index - 1]
      previous_frame[:StrikeBonus1] = 10
      previous_frame[:StrikeBonus2] = 10
    else
      calculate_bonus(@turn)
    end
  
    @running_score.each do |frame|
      @total_score += frame[1] + frame[2]
    end
  
    @total_score += @bonus.sum
    running_score
  end

  def running_score
    @io.puts "The Game So Far:"
    frames_to_print = [10, @running_score.size].min
    frames_to_print.times do |index|
      frame = @running_score[index]
      frame_info = "Frame #{index + 1}: Roll 1 = #{frame[1]}, Roll 2 = #{frame[2]}"
      frame_info += ", Bonus = #{frame[:SpareBonus]}" if frame.include?(:SpareBonus)
      if @running_score[index - 1].include?(:bonus_roll_1)
        frame_info += ", Strike Bonus Roll 1 = #{frame[:bonus_roll_1]}, Strike Bonus Roll 2 = #{frame[:bonus_roll_2]}"
      elsif frame.include?(:StrikeBonus1)
        frame_info += ", Strike Bonus 1 = #{frame[:StrikeBonus1]}, Strike Bonus 2 = #{frame[:StrikeBonus2]}"
      end
      @io.puts frame_info
    end
    @io.puts "Total Score: #{@total_score}"
  end

  def calculate_strike(turn)
    
    @bonus << turn[:bonus_roll_1]
    @bonus << turn[:bonus_roll_2]
    @total_score += @bonus.sum

  end
  private

  def calculate_bonus(turn)
    if @frame_index > 0 && @frame_index <= 9
      previous_frame = @running_score[@frame_index - 1]

      if previous_frame[1] == 10
        @bonus << turn[1]
        @bonus << turn[2]
        previous_frame[:StrikeBonus1] = turn[1]
        previous_frame[:StrikeBonus2] = turn[2]
      elsif previous_frame[1] + previous_frame[2] == 10 && previous_frame[1] < 10
        @bonus << turn[1]
        previous_frame[:SpareBonus] = turn[1]
      end

    end
    @frame_index += 1
  
  end


end
