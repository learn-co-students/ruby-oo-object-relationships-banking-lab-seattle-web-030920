require 'pry'

class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    sender.valid? && receiver.valid? && status == "pending" && sender.balance >= amount
  end 
  
  def execute_transaction
    if valid?
      @receiver.deposit(amount)
      @sender.deposit(-amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer 
    if @status == "complete"
      @receiver.deposit(-amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end

end
