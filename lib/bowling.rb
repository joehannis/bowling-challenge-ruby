require_relative 'frames'
require_relative 'score'

class Game
  def initialize(io =$stdout)
    @io = io
    @frames = Frames.new
    @score = Score.new(@io)
    @index = 0
  
  
  end

  def bowling_game
    while @index < 10 do
      @index += 1

      @io.puts "What was your score for the first roll?"
      roll = @io.gets.to_i
      if roll > 10
        raise 'Please enter a valid score'
      end
      @frames.frame_no(@index)[1] = roll

      if roll < 10
        @io.puts "What was your score for the second roll?"
        roll = @io.gets.to_i
        if roll > 10
          raise 'Please enter a valid score'
        end
        @frames.frame_no(@index)[2] = roll
      end

      if @frames.frame_no(10)[1] == 10
        frame_10
      end

      turn_calculation
    end
    show_total_score
  end

  def frame_10
    @io.puts "Strike bonus roll 1 score:"
    roll = @io.gets.chomp.to_i
    if roll > 10
      fail 'Please enter a valid score'
    end
    @frames.frame_no(10)[:bonus_roll_1] = roll

    @io.puts "Strike bonus roll 2 score:"

    roll = @io.gets.chomp.to_i
    if roll > 10
      fail 'Please enter a valid score'
    end
    @frames.frame_no(10)[:bonus_roll_2] = roll

    turn = @frames.frame_no(10)
    @score.calculate_strike(turn)

    @score.running_score
  end


  def turn_calculation
    turn = @frames.frame_no(@index)
    @score.score_calculation(turn)
  end

  def show_total_score
    @score.running_score
  end
end
