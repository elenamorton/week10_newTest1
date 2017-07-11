require 'transactions'
require 'time'

describe Transactions do
  subject(:transactions) { described_class.new }

  it 'expects account to have an empty log at start' do
      expect(transactions.log).to eq []
  end

  describe '#deposit' do
    it 'can make a deposit and records the amount' do
      transactions.deposit(20)
      expect(transactions.log.first.values).to include 20
    end

    it 'can make a deposit and records the date it was made' do
      now = Time.parse("2012-01-14 20:17:40")
      allow(Time).to receive(:now) { now }
      transactions.deposit(20)
      expect(transactions.log.first.values).to include now.strftime("%d/%m/%Y")
    end

  end

  describe '#withdraw' do
    it 'can make a withdrawl and records the amount' do
      transactions.withdraw(10)
      expect(transactions.log.first.values).to include 10
    end

    it 'can make a withdrawl and records the date it was made' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      transactions.withdraw(10)
      expect(transactions.log.first.values).to include now.strftime("%d/%m/%Y")
    end

  end

end
