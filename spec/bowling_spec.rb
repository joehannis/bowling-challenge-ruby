require 'score'
require 'bowling'


RSpec.describe 'integration' do
  let(:game) { Game.new }

  context "initialize" do
    it "populates a menu and rints it to screen, then asks for an order and stores user input" do
      io = double(:io)
      allow(io).to receive(:puts) # Stubbing puts to avoid unnecessary output in the test
      allow(io).to receive(:gets).and_return("1", "1", "1", "1", "1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
      expect(io).to receive(:puts).with("Total Score: 20")
      
     game.bowling_game(io)
    end
  end

   
end
