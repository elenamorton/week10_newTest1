require 'transactions'


describe Transactions do
  subject(:transactions) { described_class.new }

  it "expects account to have an empty log at start" do
      expect(transactions.log).to eq []
  end

  describe '#deposit' do
    it 'can make a deposit' do
      transactions.deposit(20)
      expect(transactions.log.first.values).to include 20
    end

  end

end
