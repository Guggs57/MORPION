class BoardCase 
    attr_accessor :position, :value

    def initialize(position) 
        @position = position 
        @value = " "
    end
    
    def update(value)
        @value = value
    end

end
