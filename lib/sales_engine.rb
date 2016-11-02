# require 'csv'

# class SalesEngine

# se = SalesEngine.from_csv({
#   :items     => "./data/items.csv",
#   :merchants => "./data/merchants.csv",
# })


require_relative 'merchant_repo'
# require_relative 'item_repo'
# require_relative 'invoice_repo'
# require_relative 'invoice_item_repo'
# require_relative 'transaction_repo'
# require_relative 'customer_repo'
require 'bigdecimal'
require 'csv'

class SalesEngine

  attr_reader   :files
  attr_accessor :merchant_repo, :item_repo, :invoice_repo, :invoice_item_repo,
                :customer_repo, :transaction_repo

  def initialize(files)
    @files             = files
    @merchant_repo     = nil
    @item_repo         = nil
    @invoice_repo      = nil
    @invoice_item_repo = nil
    @transaction_repo  = nil
    @customer_repo     = nil
  end

  # def self.from_csv(files)
  #   SalesEngine.new(files)
  # end

  def merchants
    if @merchant_repo.nil?
      @merchant_repo = MerchantRepo.new(files, self)
      @merchant_repo.load_csv_data
    end
    @merchant_repo
  end

  def items
    if @item_repo.nil?
      @item_repo = ItemRepo.new(files[:items], self)
      @item_repo.load_csv_data
    end
    @item_repo
  end

  def invoices
    if @invoice_repo.nil?
      @invoice_repo = InvoiceRepo.new(files[:invoices], self)
      @invoice_repo.load_csv_data
    end
    @invoice_repo
  end

  def invoice_items
    if @invoice_item_repo.nil?
      @invoice_item_repo = InvoiceItemRepo.new(files[:invoice_items], self)
      @invoice_item_repo.load_csv_data
    end
    @invoice_item_repo
  end

  def transactions
    if @transaction_repo.nil?
      @transaction_repo = TransactionRepo.new(files[:transactions], self)
      @transaction_repo.load_csv_data
    end
    @transaction_repo
  end

  def customers
    if @customer_repo.nil?
      @customer_repo = CustomerRepo.new(files[:customers], self)
      @customer_repo.load_csv_data
    end
    @customer_repo
  end

  def load_csv_data
  #get all the data loading in here? 
  #do we then have to get rid of the data-loading in the repo?
  end

  def total_merchants
    merchants.all.length
  end

  def total_invoices
    invoices.all.length
  end

end

# mr = se.merchants
# merchant = mr.find_by_name("CJsDecor")
# # => <Merchant>

# item = se.items.find_by_id(20)
# item.merchant
# # => <merchant>