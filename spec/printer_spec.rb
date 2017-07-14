require 'printer'

describe Printer do
  subject(:printer) { described_class.new(transactions) }
  let(:transactions) { double :transactions, log: [{ date: "10/01/2012", deposit: 20, withdraw: 0 },
      { date: "14/01/2012", deposit: 0, withdraw: 10 }] }
  let(:transactions_wrong_format) { double :transactions, log: [{ date: "10/01/2012", deposit: 0, withdraw: 0 }] }

  describe '#headers' do
    it 'can print the statement headers' do
      expect(printer.headers).to eq Printer::HEADERS
    end
  end

  describe '#statement' do

    it 'can print a statement line' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      expect(printer.statement_line(transactions.log.first)).to include now.strftime("%d/%m/%Y")
    end

    it 'can throw error if unknown transaction type' do
      expect {printer.statement_line(transactions_wrong_format.log.first)}.to raise_error 'Transaction type error!'
    end

    it 'can print all transactions in a statement' do
      now = Time.parse("2012-01-10 20:17:40")
      allow(Time).to receive(:now) { now }
      expect(printer.statement.first).to include now.strftime("%d/%m/%Y")
    end

  end
end
