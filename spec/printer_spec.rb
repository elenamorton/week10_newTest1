require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  describe '#headers' do
    it 'can print the statement headers' do
      expect(printer.headers).to eq Printer::HEADERS
    end
  end



end
