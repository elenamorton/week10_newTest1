require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:transactions) { double :transactions, log: [{ date: "10/01/2012", deposit: 20 }, { date: "14/01/2012", withdraw: 10 }] }

  describe '#headers' do
    it 'can print the statement headers' do
      expect(printer.headers).to eq Printer::HEADERS
    end
  end

  describe '#statement' do
    it 'can print a statement line' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      expect(printer.statementLine(transactions.log.first)).to include now.strftime("%d/%m/%Y")
    end

    it 'can print all transactions in a statement' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      expect(printer.statement).to include now.strftime("%d/%m/%Y")
    end

  end

end
