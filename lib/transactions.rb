class Transactions

  attr_reader :log

  def initialize
    @log = []
    @transaction = Hash.new { 0 }
  end

  def deposit(amount)
    @transaction[:deposit] = amount
    @transaction[:date] = Time.now.strftime("%d/%m/%Y")
    record_transaction(@transaction)
  end


private
  def record_transaction(operation)
    log.unshift(operation)
  end

end
