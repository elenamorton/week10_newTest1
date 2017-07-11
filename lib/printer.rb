class Printer

  HEADERS = "date || credit || debit || balance"

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end


  def statement

  end

#private

  def headers
    HEADERS
  end

  def statementLine(transaction)
    return "#{transaction[:date]} || || #{transaction[:amount]} || " if transaction[:withdraw]
    return "#{transaction[:date]} || #{transaction[:amount]} || || " if transaction[:deposit]
    raise "Transaction type error!"
  end

end
