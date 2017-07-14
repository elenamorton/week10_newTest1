require_relative 'transaction'

class Transactions

  attr_reader :log

  def initialize
    @log = []
  end

  def logging(transaction)
    @data = transaction.transaction
    record_transaction_to_log(@data) unless overdraft?
  end

private

  def overdraft?
    partial_balance(@data) < 0
  end

  def partial_balance(data)
    @log.each.inject(data[:deposit] - data[:withdraw]) { |sum, value| sum + value[:deposit] - value[:withdraw]}
  end

  def record_transaction_to_log(data)
    log.unshift(data)
  end


end
