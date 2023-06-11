require_relative 'frames'
require_relative 'score'

class Game
  def initialize
    @frames = Frames.new
    @score = Score.new()
    @index = 0
  
  end

  def bowling_game
    while @index < 10 do
      @index += 1

      puts "What was your score for the first roll?"
      roll = gets.to_i
      if roll > 10
        raise 'Please enter a valid score'
      end
      @frames.frame_no(@index)[1] = roll

      if roll < 10
        puts "What was your score for the second roll?"
        roll = gets.to_i
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
    puts "Strike bonus roll 1 score:"
    roll = gets.chomp.to_i
    if roll > 10
      fail 'Please enter a valid score'
    end
    @frames.frame_no(10)[:bonus_roll_1] = roll

    puts "Strike bonus roll 2 score:"
    roll = gets.chomp.to_i
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
    puts "The Game So Far:"
    @score.running_score
  end
end

game = Game.new
game.bowling_game
