class Space
  @@spaces = []

  attr_reader(:number, :display)

  def initialize(number)
    @number = number
    @@spaces << self
    @display = " "
  end

  def Space.clear
    @@spaces = []
  end

  def Space.all
    @@spaces
  end

  def Space.three_in_row(player)
    winning = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    winning.include?(@@spaces.each_index.select {|x| @@spaces[x].marked_by == player})
  end

  def mark_space(player)
    if self.marked_by == nil
      @marked_by = player
      @display = player.symbol
    else
      "space already taken"
    end
  end

  def marked_by
    @marked_by
  end

  def Space.display_all
    @@spaces.map {|space| space.display}
  end


end
