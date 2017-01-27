class Map

  def initialize
    @map = []
  end

  def assign(key, value)

    existing_pair = nil
    @map.each do |k, v|
      existing_pair = [k, v] if k == key
      break
    end

    if existing_pair.nil?
      @map << [key, value]
    else
      @map.delete(existing_pair)
      @map << [key, value]
    end
    [key, value]
  end

  def lookup(key)
    existing_pair = nil
    @map.each do |k, v|
      existing_pair = [k, v] if k == key
      break
    end
    return nil if existing_pair.nil?
    existing_pair[1]
  end

  def remove(key)
    existing_pair = nil
    @map.each do |k, v|
      existing_pair = [k, v] if k == key
      break
    end
    @map.delete(existing_pair)
  end

  def show
    @map
  end
end
