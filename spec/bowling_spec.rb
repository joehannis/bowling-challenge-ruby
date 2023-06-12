require 'score'
require 'bowling'


RSpec.describe 'integration' do


  context "initialize" do
    it "inputs rolls, outputs total score" do
      io = double(:io)
      allow(io).to receive(:puts) # Stubbing puts to avoid unnecessary output in the test
      allow(io).to receive(:gets).and_return("1", "1", "1", "1", "1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
      expect(io).to receive(:puts).with("What was your score for the first roll?").exactly(10).times
      expect(io).to receive(:puts).with("What was your score for the second roll?").exactly(10).times
      expect(io).to receive(:puts).with("The Game So Far:")
      expect(io).to receive(:puts).with("Frame 1: Roll 1 = 1, Roll 2 = 1")
      expect(io).to receive(:puts).with("Total Score: 20")
      game = Game.new(io)
      
      game.bowling_game
    end
    it "inputs rolls, outputs total score with spares" do
      io = double(:io)
      allow(io).to receive(:puts) # Stubbing puts to avoid unnecessary output in the test
      allow(io).to receive(:gets).and_return("1", "1", "5", "5", "1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
      expect(io).to receive(:puts).with("What was your score for the first roll?").exactly(10).times
      expect(io).to receive(:puts).with("What was your score for the second roll?").exactly(10).times
      expect(io).to receive(:puts).with("The Game So Far:")
      expect(io).to receive(:puts).with("Frame 1: Roll 1 = 1, Roll 2 = 1")
      expect(io).to receive(:puts).with("Frame 2: Roll 1 = 5, Roll 2 = 5, Bonus = 1")
      expect(io).to receive(:puts).with("Total Score: 29")
      game = Game.new(io)
      
      game.bowling_game
    end

    it "inputs rolls, outputs total score with strikes" do
      io = double(:io)
      allow(io).to receive(:puts) # Stubbing puts to avoid unnecessary output in the test
      allow(io).to receive(:gets).and_return("1", "1", "10", "1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
      expect(io).to receive(:puts).with("What was your score for the first roll?").exactly(10).times
      expect(io).to receive(:puts).with("What was your score for the second roll?").exactly(9).times
      expect(io).to receive(:puts).with("The Game So Far:")
      expect(io).to receive(:puts).with("Frame 1: Roll 1 = 1, Roll 2 = 1")
      expect(io).to receive(:puts).with("Frame 2: Roll 1 = 10, Roll 2 = 0, Strike Bonus 1 = 1, Strike Bonus 2 = 1")
      expect(io).to receive(:puts).with("Total Score: 30")
      game = Game.new(io)
      
      game.bowling_game
    end
  end

   
end
