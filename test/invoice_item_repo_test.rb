require 'minitest/autorun'
require './lib/invoice_item_repo'
require 'csv'
require 'pry'

class InvoiceItemRepoTest < Minitest::Test
  attr_reader :file,
              :sales_engine

  def setup
    @file = "./data/small_invoice_file.csv"
    @sales_engine = Minitest::Mock.new
  end

  def test_it_has_a_class
    iir = InvoiceItemRepo.new(file, sales_engine)
    assert_equal InvoiceItemRepo, iir.class
  end

  def test_it_can_display_all_invoices_items
    iir = InvoiceItemRepo.new(file, sales_engine)
    assert iir.all
  end

  def test_it_can_search_by_id
    iir = InvoiceItemRepo.new(file, sales_engine)
    assert_equal 7, iir.find_by_id(7).id
  end

  def test_it_can_find_all_by_item_id
    iir = InvoiceItemRepo.new(file, sales_engine)
    assert_equal 1, iir.find_all_by_item_id(5)
  end
  
   def test_it_can_find_all_by_invoice_id
    iir = InvoiceItemRepo.new(file, sales_engine)
    assert_equal 7, iir.find_all_by_invoice_id(4)
  end
end