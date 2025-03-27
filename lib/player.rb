class Player
    attr_reader :name, :symbol
  
    def initialize(name, symbol)
      @name = name       # Nom du joueur
      @symbol = symbol   # Symbole (X ou O)
    end
  end