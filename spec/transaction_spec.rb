require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  describe '#deposit' do
    it 'can make a deposit' do
      transaction.deposit(20)
      expect(transaction[:deposit]).to eq 20
      expect(transaction[:withdraw]).to eq 0
    end
  end

  describe '#withdraw' do
    it 'can make a withdrawl' do
      transaction.withdraw(10)
      expect(transaction[:withdraw]).to eq 10
      expect(transaction[:deposit]).to eq 0
    end
  end

  describe '#overdraft' do
    it 'can check if current transaction is overdraft' do
      transaction.deposit(20)
      transaction.withdraw(30)
      expect(transaction.overdraft?).to be(true)
    end
  end


end
