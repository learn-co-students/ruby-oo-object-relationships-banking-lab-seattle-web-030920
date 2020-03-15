require 'pry'
require_relative 'console.rb'
class Transfer
  attr_accessor :confirmation, :status
  attr_reader :amount, :sender, :receiver
  @@all = []
  @@REJECTED = "rejected"
  @@PENDING = "pending"
  @@COMPLETE = "complete"
  @@REVERSED = "reversed"
  def initialize(sender, receiver, amount) 
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = @@PENDING

    @@all << self 
  end

  def self.all
    @@all 
  end

  def valid?
    @receiver.valid? && @sender.valid? 
  end 

  def execute_transaction
    if @status == @@PENDING && self.has_funds? && self.valid? 
      @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = @@COMPLETE
    else 
      @status = @@REJECTED
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def has_funds?
    @sender.balance > @amount 
  end

  def reverse_transfer 
    if @status == @@COMPLETE
      @sender.balance += @amount 
      @receiver.balance -= @amount
      @status = @@REVERSED
    end 
    @status 
  end 
end
