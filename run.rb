require_relative 'app/game'

puts 'Hello! What\'s you name?'
name = gets.chomp

game = Game.new(name)
loop do
  game.run

  puts 'Put \'yes\' to continuer or \'no\' for quit black jack..'
  answer = gets.chomp
  break if answer == 'no'
end
