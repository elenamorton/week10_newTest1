class Transaction

  attr_reader :transaction

  def initialize
    @transaction = Hash.new { 0 }
  end

  def deposit(amount)
    @transaction[:deposit] = amount
    @transaction[:date] = Time.now.strftime("%d/%m/%Y")
  end

  def withdraw(amount)
    @transaction[:withdraw] = amount
    @transaction[:date] = Time.now.strftime("%d/%m/%Y")
  end


end
