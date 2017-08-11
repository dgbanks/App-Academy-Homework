class LRUcache

  def initialize
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    @cache = @cache.unshift(el)
    @cache = @cache.take(5) if @cache.length > 5
  end

  def show
    @cache
  end

  private

end
