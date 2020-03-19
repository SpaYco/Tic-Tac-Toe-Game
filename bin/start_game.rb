require './bin/main.rb'

print 'Player1 enter your name: '.red.bg_gray
input1 = gets.chomp
sleep 0.35
puts ''
print 'Player2 enter your name: '.blue.bg_gray
input2 = gets.chomp
sleep 0.35

Game.new(input1, input2)
