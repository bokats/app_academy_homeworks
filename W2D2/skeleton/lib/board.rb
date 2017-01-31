class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone }
      end
    end
    # # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)

    if start_pos > @cups.length || start_pos < 1
      raise "Invalid starting cup"
    end

  end

  def make_move(start_pos, current_player_name)

    starting_cup = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until starting_cup.empty?
      i = (i + 1) % 14
      if i == 6
        @cups[6] << starting_cup.pop if current_player_name == @name1
      elsif i == 13
        @cups[13] << starting_cup.pop if current_player_name == @name2
      else
        @cups[i] << starting_cup.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |cup| cup.empty? }
      return true
    end
    false
  end

  def winner

    return @name1 if @cups[6].count > @cups[13].count
    return @name2 if @cups[13].length > @cups[6].length
    :draw
  end
end
