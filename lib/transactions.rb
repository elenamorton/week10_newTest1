class Transactions

  attr_reader :log

  def initialize(transaction = Transaction.new)
    @log = []
    @transaction = transaction
  end

  def logging
    record_to_log unless overdraft?
  end

  def overdraft?
    partial_balance < 0
  end

private

  def partial_balance
    @log.each.inject(0) { |sum, value| sum + value[:deposit] - value[:withdraw]}
  end

  def record_to_log
    log.unshift(@transaction)
  end


end
