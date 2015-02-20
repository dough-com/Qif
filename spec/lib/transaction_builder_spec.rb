require 'spec_helper'
require 'qif/transaction/builder'
require 'qif/transaction/split/builder'

describe Qif::Transaction::Builder do
  let(:builder) { Qif::Transaction::Builder.new }
  def do_build
    builder.build
  end

  context '#build' do
    it 'should return a transaction object' do
      expect(builder.build).to be_kind_of(Qif::Transaction)
    end
  end

 context '#set_date' do
    it_should_behave_like 'builder method', :date, '1994-06-01', :set_date, Time.mktime(1994, 6, 1)
    it 'should use a given date parser' do
      b = Qif::Transaction::Builder.new(->(date) { date })
      b.set_date('1994')
      expect(b.build.date).to eq('1994')
    end
  end

  context '#set_action' do
    it_should_behave_like 'builder method', :action, 'Buy', :set_action, 'Buy'
  end

  context '#set_security' do
    it_should_behave_like 'builder method', :security, 'ZNGA - ZYNGA INC', :set_security, 'ZNGA - ZYNGA INC'
  end

  context '#set_price' do
    it_should_behave_like 'builder method', :price, '2.3075', :set_price, '2.3075'
  end

  context '#set_quantity' do
    it_should_behave_like 'builder method', :quantity, '100', :set_quantity, '100'
  end

  context '#set_transaction_amount' do
    it_should_behave_like 'builder method', :transaction_amount, '239.7', :set_transaction_amount, '239.7'
  end

  context '#set_cleared_status' do
    it_should_behave_like 'builder method', :cleared_status, '?', :set_cleared_status, '?'
  end

  context '#set_reminders' do
    it_should_behave_like 'builder method', :reminders, '?', :set_reminders, '?'
  end

  context '#set_memo' do
    it_should_behave_like 'builder method', :memo, '159694322', :set_memo, '159694322'
  end

  context '#set_commission' do
    it_should_behave_like 'builder method', :commission, '8.95', :set_commission, '8.95'
  end

  context '#set_transfer_account' do
    it_should_behave_like 'builder method', :transfer_account, '?', :set_transfer_account, '?'
  end

  context '#set_transfer_amount' do
    it_should_behave_like 'builder method', :transfer_amount, '?', :set_transfer_amount, '?'
  end

end
