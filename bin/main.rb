#!/usr/bin/env ruby
# rubocop:disable Style/GlobalVars, Layout/LineLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
class String
  def black
    "\e[30m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def brown
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end

  def gray
    "\e[37m#{self}\e[0m"
  end

  def bg_black
    "\e[40m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def italic
    "\e[3m#{self}\e[23m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blink
    "\e[5m#{self}\e[25m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
  end
end
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
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
    $moves_played = 0
  end

  def restart
    start
  end

  def start
    puts "Welcome #{@player1} and #{@player2}"
    sleep 1.5
    puts "Let's start the game"
    sleep 1.49
    puts "Here's your current board"
    sleep 0.15
    puts '----------'
    puts "|#{$moves['a1']}|#{$moves['a2']}|#{$moves['a3']}|"
    puts '----------'
    puts "|#{$moves['b1']}|#{$moves['b2']}|#{$moves['b3']}|"
    puts '----------'
    puts "|#{$moves['c1']}|#{$moves['c2']}|#{$moves['c3']}|"
    puts '----------'
    sleep 1.5
    current_player = @player1
    $game_over = false
    while $game_over == false
      print "#{current_player} enter your move : "
      current_move = gets.chomp
      sleep 1
      add(current_player, current_move)
      $moves_played += 1 if $possible == true
      sleep 0.35
      if check == true
        puts "congrats #{current_player}, you've won the game after #{$moves_played} moves".green.bg_gray
        break
      elsif check == 'tie'
        puts "game over, it's a tie!"
        break
      elsif $possible == true
        puts 'great move!'.reverse_color
      end
      current_player = current_player == @player1 ? @player2 : @player1 if $possible == true
    end
    print 'would you like to play another game? (y/n) : '
    answer = gets.chomp
    answer == 'y' ? restart : (puts 'see you next time, goodbye!')
  end

  def method_checker_on
    return 'game still on' if $moves_played != 9 && check != true
  end

  def method_checker_won
    $moves['a1'] = 'X'.red
    $moves['a2'] = 'X'.red
    $moves['a3'] = 'X'.red
    return true if check
  end

  def method_checker_tie
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

  def add(player, move)
    $possible = true
    $possible = false if $moves[move] == 'X'.red || $moves[move] == 'O'.blue || $moves.key?(move) == false
    if $possible == true
      $moves[move] = 'X'.red if player == @player1
      $moves[move] = 'O'.blue if player == @player2
    end
    puts "Here's your current board"
    puts '----------'
    puts "|#{$moves['a1']}|#{$moves['a2']}|#{$moves['a3']}|"
    puts '----------'
    puts "|#{$moves['b1']}|#{$moves['b2']}|#{$moves['b3']}|"
    puts '----------'
    puts "|#{$moves['c1']}|#{$moves['c2']}|#{$moves['c3']}|"
    puts '----------'
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

# rubocop:enable Style/GlobalVars, Layout/LineLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
