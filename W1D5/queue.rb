class Queue

  def initialize
    @queue = []
  end

  def add(el)
    @queue << el
    el
  end

  def remove
    @queue.shift
  end

  def show
    @queue
  end  
end
