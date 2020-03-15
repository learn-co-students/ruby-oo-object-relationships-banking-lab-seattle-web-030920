class Transfer
  # your code here
  attr_reader :sender,:receiver, :status,:amount
  attr_accessor 
  def initialize(sender,receiver,amount )
    @transfer = self
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if(self.valid? && sender.balance >= amount&&@status!="complete")
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
    elsif !self.valid?
      @status = "rejected"
      #write after @status to return the string
      "Transaction rejected. Please check your account balance."
    elsif sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    end

    def reverse_transfer
      if @status=="complete"
        @sender.balance += amount
        @receiver.balance -= amount
        @status = "reversed"
      end
    end
end
