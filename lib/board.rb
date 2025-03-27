class Board
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }  # Un tableau 3x3 avec des cases vides
  end

  def display
    puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts "---|---|---"
    puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts "---|---|---"
    puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  def update(position, symbol)
    row, col = position_to_coordinates(position)  # Convertit la position en indices
    if @board[row][col] == " "  # Vérifie si la case est vide
      @board[row][col] = symbol  # Met à jour la case avec le symbole du joueur
    else
      puts "Case déjà occupée ! Choisissez une autre case."
    end
  end

  def winner?(symbol)
    (0..2).any? { |i| @board[i].all? { |cell| cell == symbol } } ||  # Lignes
    (0..2).any? { |i| @board.all? { |row| row[i] == symbol } } ||  # Colonnes
    (@board[0][0] == symbol && @board[1][1] == symbol && @board[2][2] == symbol) ||  # Diagonale principale
    (@board[0][2] == symbol && @board[1][1] == symbol && @board[2][0] == symbol)  # Diagonale secondaire
  end

  def full?
    @board.flatten.none? { |cell| cell == " " }
  end

  def to_s
    "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}\n" + 
    "--|---|--\n" + 
    "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}\n" + 
    "--|---|--\n" + 
    "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end

  private

  def position_to_coordinates(position)
    # Convertit la position (ex: "A1") en indices de tableau (0,0)
    mapping = {
      "A1" => [0, 0], "A2" => [0, 1], "A3" => [0, 2],
      "B1" => [1, 0], "B2" => [1, 1], "B3" => [1, 2],
      "C1" => [2, 0], "C2" => [2, 1], "C3" => [2, 2]
    }
    mapping[position.upcase]
  end
end
