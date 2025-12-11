#bad example 
class Worker
    def work; end
    def eat; end
end

class Robot < Worker
    def eat
        raise "Robots don't eat!"
    end
end

#good example   

module Workable
    def work; end
end

module Eatable
    def eat; end
end

class Human
    include Workable
    include Eatable
end

class Robot
    include Workable
end