require_relative "split/builder"
require_relative "builderable"
require_relative "../amount_parser"

class Qif::Transaction::Builder
  include Builderable

  def initialize(date_parser = ->(date) { Time.parse(date) })
    @txn = Qif::Transaction.new
    @date_parser = date_parser
    @splits = []
  end

  set_builder_method :date, :parse_date
  set_builder_method :action
  set_builder_method :security
  set_builder_method :price
  set_builder_method :quantity
  set_builder_method :transaction_amount
  set_builder_method :cleared_status
  set_builder_method :reminders
  set_builder_method :memo
  set_builder_method :commission
  set_builder_method :transfer_account
  set_builder_method :transfer_amount

  def build
    @txn
  end

  private

  def parse_date(date)
    @date_parser.call(date)
  end
end
