class Printer

  HEADERS = "date || credit || debit || balance\n"

  def initialize(transactions = Transactions.new)
    @transactions = transactions
  end


  def statement
    headers
    results = 0
    @transactions.log.map do |transaction|
      results += transaction[:deposit] - transaction[:withdraw]
      statementLine(transaction) + "#{results} \n"
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
