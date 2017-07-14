require 'transactions'
require 'time'

describe Transactions do

  let(:transaction_d) { double :transaction, transaction: { date: "10/01/2012", deposit: 20, withdraw: 0 } }
  let(:transaction_w) { double :transaction, transaction: { date: "12/01/2012", deposit: 0, withdraw: 10 } }
  let(:transaction_w_overdraft) { double :transaction, transaction: { date: "14/01/2012", deposit: 0, withdraw: 30} }

  subject(:transactions) { described_class.new }

  it 'expects account to have an empty log at start' do
      expect(transactions.log).to eq []
  end

  describe '#logging' do
    it 'can log a transaction' do
      expect{ transactions.logging(transaction_d) }.to change{transactions.log.size}.from(0).to(1)
    end

    it 'can log a deposit' do
      transactions.logging(transaction_d)
      expect(transactions.log.first.values).to include "10/01/2012"
      expect(transactions.log.first.values).to include 20
    end

    it 'can log a withdrawl' do
      transactions.logging(transaction_d)
      transactions.logging(transaction_w)
      expect(transactions.log.first.values).to include "12/01/2012"
      expect(transactions.log.first.values).to include 10
    end

    it 'connot log a withrdawal if this causes overdraft' do
      transactions.logging(transaction_d)
      transactions.logging(transaction_w_overdraft)
      expect(transactions.log.first.values).to include "10/01/2012"
      expect(transactions.log.first.values).to include 20
    end

  end


end
