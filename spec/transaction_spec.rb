require 'transaction'
require 'time'

describe Transaction do
  subject(:bank_operation) { described_class.new }

  describe '#deposit' do
    it 'can make a deposit' do
      bank_operation.deposit(20)
      expect(bank_operation.transaction[:deposit]).to eq 20
      expect(bank_operation.transaction[:withdraw]).to eq 0
    end

    it 'can make a deposit and add the date it was made' do
      time = Time.now.strftime("%d/%m/%Y")
      bank_operation.deposit(20)
      expect(bank_operation.transaction.values).to include time

    end
  end

  describe '#withdraw' do
    it 'can make a withdrawl' do
      bank_operation.withdraw(10)
      expect(bank_operation.transaction[:withdraw]).to eq 10
      expect(bank_operation.transaction[:deposit]).to eq 0
    end

    it 'can make a withdrawl and add the date it was made' do
      time = Time.now.strftime("%d/%m/%Y")
      bank_operation.withdraw(10)
      expect(bank_operation.transaction.values).to include time
    end

  end

end
