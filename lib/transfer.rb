require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? and self.receiver.valid?
      true
    else
      false
    end
  end

  def unique?
    if @@all.find {|trans| trans == self} == nil
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? and self.sender.balance >= self.amount and self.unique?
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status = "complete"
      @@all << self
    else
      self.status = "rejected"
      @@all << self
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = "reversed"
    end
  end
end
