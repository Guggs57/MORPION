class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players[0]
    @board = Board.new
  end

  def play
    while true  # Une boucle infinie pour gérer les tours du jeu
      system "clear"  # Efface l'écran pour un affichage plus propre
      puts "C'est le tour de #{@current_player.name}"
      puts @board.to_s  # Affiche le plateau avec la méthode `to_s`
      
      position = ask_for_position  # Demander au joueur où il veut jouer
      @board.update(position, @current_player.symbol)  # Met à jour le plateau avec le coup du joueur

      if winner?  # Vérifie si quelqu'un a gagné
        puts "#{@current_player.name} a gagné !"
        break  # On termine le jeu si un joueur a gagné
      elsif draw?  # Vérifie s'il y a match nul
        puts "Match nul !"
        break  # On termine le jeu en cas de match nul
      else
        switch_player  # Changer de joueur
      end
    end
  end

  private

  def ask_for_position
    valid_positions = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]  # Les positions valides

    loop do
      puts "Où voulez-vous jouer ? (entrez une position entre A1 et C3)"
      position = gets.chomp.upcase  # Demande la position et met en majuscule pour éviter les erreurs

      if valid_positions.include?(position)  # Vérifie si la position est valide
        return position  # Retourne la position si elle est valide
      else
        puts "Position invalide. Choisissez une case entre A1 et C3."
      end
    end
  end

  def switch_player
    # Change le joueur actuel
    @current_player = @players.select { |player| player != @current_player }[0]
  end

  def winner?
    # Vérifie si un joueur a gagné
    @board.winner?(@current_player.symbol)
  end

  def draw?
    # Vérifie si toutes les cases sont remplies et qu'il n'y a pas de gagnant
    @board.full?
  end
end
