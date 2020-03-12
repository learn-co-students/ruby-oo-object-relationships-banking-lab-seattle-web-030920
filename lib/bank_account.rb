class BankAccount
    attr_accessor :status
    attr_reader :name, :balance

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end    

    def balance=(balance)    
        @balance = balance        
    end

    def deposit(money_to_add)    
        self.balance = @balance + money_to_add
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        @status == "open" && self.balance > 0 ? true : false
    end

    def close_account
        @status = "closed"
    end
end
