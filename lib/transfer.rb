class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    if(@status == "pending")      
      if(sender.balance > @amount && self.valid?)
        self.transferAction
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end        
    end
  end

  def reverse_transfer
    self.transferAction(true)
  end

  def transferAction(reverse=false)
    if(!reverse)
      sender.deposit(-amount)
      receiver.deposit(amount) 
      @status = "complete"
    elsif (@status == "complete")
      sender.deposit(amount)
      receiver.deposit(-amount) 
      @status = "reversed"
    end
  end
end
