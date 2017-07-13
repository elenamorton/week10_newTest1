class Transaction

  attr_reader :transaction

  def initialize
    @transaction = Hash.new { 0 }
  end

  def deposit(amount)
    @transaction[:deposit] = amount
  end

  def withdraw(amount)
    @transaction[:withdraw] = amount
  end


end
