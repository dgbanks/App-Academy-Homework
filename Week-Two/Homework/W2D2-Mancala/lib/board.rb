require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    cups = Array.new(14) {Array.new}
    cups.map.with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times { cup << :stone }
    end
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting position" unless start_pos.between?(0,5) ||
      start_pos.between?(7, 12)
    raise "Invalid starting position" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    # return :prompt or :switch
    hand, @cups[start_pos] = @cups[start_pos], []

    idx = start_pos
    until hand.empty?
      idx += 1
      unless (idx == 6 && current_player_name == @name2) ||
        (idx == 13 && current_player_name == @name1)
        @cups[idx] << hand.pop
      end
    end
    case next_turn(idx)
    when :prompt
      return :prompt
    when :switch
      return :switch
    else
      make_move(idx, current_player_name)
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    else
      @cups[ending_cup_idx].length == 1 ? :switch : ending_cup_idx
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
    @cups[0..5].all? {|cup| cup.empty?} ||
    @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      return :draw
    when -1
      return @name2
    when 1
      return @name1
    end
  end
end
