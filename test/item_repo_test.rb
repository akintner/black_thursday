require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_repo'

class ItemRepoTest < Minitest::Test

  def test_it_exists
    assert ItemRepo.new("items.csv")
  end

  def test_it_has_a_class
    i = ItemRepo.new({:id => "Blue purse"})
    assert_equal ItemRepo, i.class
  end

  def test_it_can_display_all_items
  end

  def test_it_can_search_by_id
  end

  def test_it_can_find_by_name
  end

  def test_it_can_can_find_by_description
  end

  def test_it_can_find_by_price
  end

  def test_it_can_find_by_price_in_range
  end

  def test_it_can_find_by_merchant_id
  end

end
