require 'transactions'
require 'time'

describe Transactions do
  let(:transaction_d) { double :transaction, transaction: { deposit: 20 } }
  let(:transaction_w) { double :transaction, transaction: { withdraw: 10 } }
  let(:transaction_w_overdraft) { double :transaction, transaction: { withdraw: 30 } }

  subject(:transactions) { described_class.new }

  it 'expects account to have an empty log at start' do
      expect(transactions.log).to eq []
  end

  describe '#logging' do
    it 'can log a transaction' do
      expect{ transactions.logging(transaction_d) }.to change{transactions.log.size}.from(0).to(1)
    end

    it 'can log a deposit' do
      now = Time.parse("2012-01-14 20:17:40")
      allow(Time).to receive(:now) { now }
      transaction_d = instance_double("Transaction")
      expect(transaction_d).to receive(:deposit).with(20)

      transactions = Transactions.new(transaction_d)
      transactions.logging

      expect(transactions.log.first.values).to include now.strftime("%d/%m/%Y")
      expect(transactions.log.first.values).to include 20
    end

    it 'can log a withdrawl' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }

    end

    it 'connot log a withrdawal if this causes overdraft' do

    end

  end

  describe '#overdraft' do
    it 'can check if current transaction is overdraft' do
      transaction_d = instance_double("Transaction")
      expect(transaction_d).to receive(:deposit).with(20)

      transaction_w = instance_double("Transaction")
      expect(transaction_w).to receive(:withdraw).with(30)

      transactions = Transactions.new(transaction_d)
      transactions.logging

      transactions(transaction_w)
      transactions.logging

      expect(transactions.overdraft?).to be(true)
    end
  end

end
