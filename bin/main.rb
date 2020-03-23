#!/usr/bin/env ruby
# rubocop:disable Style/GlobalVars, Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
  end
end
class Board
  def show
    sleep 0.15
    puts '----------'
    puts "|#{$moves['a1']}|#{$moves['a2']}|#{$moves['a3']}|"
    puts '----------'
    puts "|#{$moves['b1']}|#{$moves['b2']}|#{$moves['b3']}|"
    puts '----------'
    puts "|#{$moves['c1']}|#{$moves['c2']}|#{$moves['c3']}|"
    puts '----------'
    p "Here's your current board"
  end
end
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    sleep 1.5
    puts "Welcome #{@player1} and #{@player2}"
  end

  def restart(answer)
    answer == 'y' ? start : (p 'see you next time, goodbye!')
  end

  def board_reset(*silent)
    $moves_played = 0
    $moves = {
      'a1' => 'a1',
      'a2' => 'a2',
      'a3' => 'a3',
      'b1' => 'b1',
      'b2' => 'b2',
      'b3' => 'b3',
      'c1' => 'c1',
      'c2' => 'c2',
      'c3' => 'c3'
    }
    p 'board reset successfully' if silent[0] != true
  end

  def start
    puts "Let's start the game"
    board_reset(true)
    sleep 1.5
    $game_board = Board.new
    $game_board.show
    sleep 1.5
    turns
    print 'would you like to play another game? (y/n) : '
    answer = gets.chomp
    restart(answer)
  end

  def method_checker_on
    board_reset(true)
    return 'game still on' if $moves_played != 9 && check != true
  end

  def method_checker_won
    board_reset(true)
    $moves['a1'] = 'X'.red
    $moves['a2'] = 'X'.red
    $moves['a3'] = 'X'.red
    return true if check
  end

  def method_checker_tie
    board_reset(true)
    $moves_played = 9
    $moves['a1'] = 'O'.blue
    $moves['a2'] = 'O'.blue
    $moves['a3'] = 'X'.red
    $moves['b1'] = 'X'.red
    $moves['b2'] = 'X'.red
    $moves['b3'] = 'O'.blue
    $moves['c1'] = 'O'.blue
    $moves['c2'] = 'O'.blue
    $moves['c3'] = 'X'.red
    'tie' if check == 'tie'
  end

  private

  def turns
    $current_player = @player1
    $game_over = false
    while $game_over == false
      print "#{$current_player} enter your move : "
      current_move = gets.chomp
      sleep 1
      add($current_player, current_move)
      $moves_played += 1 if $possible == true
      sleep 0.35
      if check == true
        puts "congrats #{$current_player}, you've won the game after #{$moves_played} moves".green.bg_gray
        break
      elsif check == 'tie'
        puts "game over, it's a tie!"
        break
      elsif $possible == true
        puts 'great move!'.reverse_color
      end
      $current_player = $current_player == @player1 ? @player2 : @player1 if $possible == true
    end
  end

  def add(player, move)
    $possible = true
    $possible = false if $moves[move] == 'X'.red || $moves[move] == 'O'.blue || $moves.key?(move) == false
    if $possible == true
      $moves[move] = 'X'.red if player == @player1
      $moves[move] = 'O'.blue if player == @player2
    end
    $game_board.show
    puts 'Please enter a valid move'.red.bg_gray.bold if $possible == false
  end

  def check
    win = [[$moves['a1'], $moves['a2'], $moves['a3']], [$moves['b1'], $moves['b2'], $moves['b3']], [$moves['c1'], $moves['c2'], $moves['c3']], [$moves['a1'], $moves['b1'], $moves['c1']], [$moves['a2'], $moves['b2'], $moves['c2']], [$moves['a3'], $moves['b3'], $moves['c3']], [$moves['a1'], $moves['b2'], $moves['c3']], [$moves['a3'], $moves['b2'], $moves['c1']]]
    status = false
    if $moves_played < 9
      win.each do |k|
        status = true if k.all? { |v| v == 'X'.red }
        status = true if k.all? { |v| v == 'O'.blue }
      end
    else
      status = 'tie'
    end
    status
  end
end

# rubocop:enable Style/GlobalVars, Layout/LineLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
