require 'rspec'
require 'player'
require 'space'
require 'board'



describe "Player" do
  describe "initialize" do
    it "initializes a player with a name and symbol" do
      player_new = Player.new("Joe", "X")
      expect(player_new).to be_an_instance_of Player
    end
  end
end

describe "Space" do
  before do
    Space.clear
  end

  describe "initialize" do
    it "initializes a space with a number" do
      space_new = Space.new(0)
      expect(space_new).to be_an_instance_of Space
    end
  end

  describe "mark_space" do
    it "marks a space as occupied by a player" do
      space_new = Space.new(0)
      player_new = Player.new("Bob", "X")
      space_new.mark_space(player_new)
      expect(space_new.marked_by).to eq player_new
    end
    it "returns an error if the space is already marked" do
      space_new = Space.new(5)
      player_new = Player.new("Bob", "X")
      space_new.mark_space(player_new)
      expect(space_new.mark_space(player_new)).to eq "space already taken"
    end
    it "changes the display to the player's symbol" do
      space_new = Space.new(5)
      player_new = Player.new("Bob", "X")
      player_second = Player.new("Sue", "O")
      space_new.mark_space(player_second)
      expect(space_new.display).to eq "O"
    end
  end

  describe "three_in_row" do
    it "Tells if player got three in a row" do
      board_new = Board.new
      player_new = Player.new("Bob", "X")
      Space.all[0].mark_space(player_new)
      Space.all[1].mark_space(player_new)
      Space.all[2].mark_space(player_new)
      expect(Space.three_in_row(player_new)).to eq true
    end

    it "returns false if no 3 marks are in a row" do
      board_new = Board.new
      player_new = Player.new("Bob", "X")
      Space.all[1].mark_space(player_new)
      Space.all[3].mark_space(player_new)
      Space.all[8].mark_space(player_new)
      expect(Space.three_in_row(player_new)).to eq false
    end
  end

  describe ".display_all" do
    it "returns an array of all the displays for each space" do
      board_new = Board.new
      player_new = Player.new("Bob", "X")
      player_second = Player.new("Sue", "O")
      Space.all[1].mark_space(player_new)
      Space.all[3].mark_space(player_second)
      Space.all[8].mark_space(player_new)
      expect(Space.display_all).to eq [" ","X"," ","O"," "," "," "," ","X"]
    end
  end
end

describe "Board" do
  describe "initialize" do
    it "initializes a board with 2 players" do
      board_new = Board.new
      expect(board_new).to be_an_instance_of Board
    end
  end
end

