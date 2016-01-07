require 'test_helper'

class ArticlesTest < Minitest::Test

  def setup
    @entity = TDWTF::Articles.new
  end

  def test_by_id
    query = @entity.by_id(8301)

    assert query, 'Article (by id) was not found'
    assert query.id, 'Article (by id) has no ID'
  end

  def test_by_slug
    query = @entity.by_slug('your-recommended-virus')

    assert query, 'Article (by slug) was not found'
    assert query.id, 'Article (by slug) has no ID'
  end

  def test_by_date
    query = @entity.by_month(10, 2015)
    puts query.inspect
    assert query.is_a?(Array), 'By month should return an array of articles'
  end

end
