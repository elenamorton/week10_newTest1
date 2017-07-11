class Printer

  HEADERS = "date || credit || debit || balance\n"

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end


  def statement
    headers
    @transactions.log.each_with_index do |transaction, index|
      result = transaction.reduce(0) {|sum,element| sum + element[:deposit] - element[:withdraw]}
      p result
      statementLine(transaction) + "#{result} \n"
    end
  end

#private

  def headers
    HEADERS
  end

  def statementLine(transaction)
    return "#{transaction[:date]} || || #{transaction[:withdraw]} || " if transaction[:withdraw] != 0
    return "#{transaction[:date]} || #{transaction[:deposit]} || || " if transaction[:deposit] != 0
    raise "Transaction type error!"
  end

end
