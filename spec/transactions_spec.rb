require 'transactions'
require 'time'

describe Transactions do
  subject(:transactions) { described_class.new }
  let(:deposit_transaction) { double :transaction, transaction: { deposit: 20 } }
  let(:withdraw_transaction) { double :transaction, transaction: { withdraw: 30 } }


  it 'expects account to have an empty log at start' do
      expect(transactions.log).to eq []
  end

  describe '#logging' do
    it 'can log a deposit transaction with its amount' do
      transactions.logging(:deposit)
      expect(transactions.log.first.values).to include 20
    end

    it 'can log a deposit and add the date it was made' do
      now = Time.parse("2012-01-14 20:17:40")
      allow(Time).to receive(:now) { now }
      transactions.deposit_transaction(20)
      expect(transactions.log.first.values).to include now.strftime("%d/%m/%Y")
    end

    it 'can log a withdrawl transaction with its amount' do
      transactions.withdraw(10)
      expect(transactions.log.first.values).to include 10
    end

    it 'can log a withdrawl and add the date it was made' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      transactions.withdraw(10)
      expect(transactions.log.first.values).to include now.strftime("%d/%m/%Y")
    end

  end

  describe '#overdraft' do
    it 'can check if current transaction is overdraft' do
      transactions.deposit(20)
      transactions.withdraw(30)
      expect(transactions.overdraft?).to be(true)
    end
  end

end
