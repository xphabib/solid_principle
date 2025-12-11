#bad example
class Bird
  def fly; end
end

class Penguin < Bird
  def fly
    raise "I cannot fly"
  end
end


#good example
class Bird; end
class FlyingBird < Bird
  def fly; end
end
class Penguin < Bird; end
class Sparrow < FlyingBird; end