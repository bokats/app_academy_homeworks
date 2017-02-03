class LRUCache

  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif self.count == @size
      @cache.shift
    end
    @cache << el
    # adds element to cache according to LRU principle
  end

  def show
    print @cache
    # shows the items in the cache, with the LRU item first
  end
end
