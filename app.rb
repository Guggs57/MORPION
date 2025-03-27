require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/board_case'
require 'bundler'
Bundler.require



puts "Quel est le nom du joueur 1 ?"
player1_name = gets.chomp
puts "Quel est le nom du joueur 2 ?"
player2_name = gets.chomp

# Création des joueurs avec les symboles "X" et "O"
player1 = Player.new(player1_name, "X")
player2 = Player.new(player2_name, "O")

# Création du jeu avec les joueurs
game = Game.new(player1, player2)

# Démarre la partie
game.play