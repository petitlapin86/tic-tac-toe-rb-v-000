# Define your WIN_COMBINATIONS constant
puts "Welcome to Tic Tac Toe!"

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],#
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

  def over?(board)
  won?(board) || draw?(board)
end

#input_to_index here
def input_to_index(user_input)
  user_input.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#CURRENT PLAYER HERE
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end


def turn_count(board)
  board.count{|player| player == "X" || player == "O"}
end

#MOVE HERE
def move(board, index, current_player = "X")
  board[index] = current_player
end

#WINNER HERE
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
