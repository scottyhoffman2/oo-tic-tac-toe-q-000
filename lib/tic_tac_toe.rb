class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position(location)
    @board[location.to_i]
  end
  
  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def current_player
    turn_count % 2 == 0 ? "X"  : "O"
  end


  def position_taken?(location)
    !(position(location) == nil || position(location) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    if !valid_move?(input)
      turn
    else
      move(input, current_player)
    end
    display_board
  end
  
  def turn_count
    @board.count{|i| i == "X" || i == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |i|
    position(i[0]) == position(i[1]) && position(i[1]) == position(i[2]) && position_taken?(i[0])
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if i = won?
      @winner = position(i.first)
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

