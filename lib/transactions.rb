class Transactions

  attr_reader :log

  def initialize
    @log = []
    @transaction = Hash.new { 0 }
  end

  def deposit(amount)
    @transaction[:deposit] = amount
    record_transaction(@transaction)
  end

  def withdraw(amount)
    @transaction[:withdraw] = amount
    record_transaction(@transaction)
  end


private

  def record_transaction(operation)
    operation[:date] = Time.now.strftime("%d/%m/%Y")
    log.unshift(operation)
    @transaction = Hash.new { 0 }
  end

end
