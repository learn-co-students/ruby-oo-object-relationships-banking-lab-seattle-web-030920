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
        "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 && status == "open"
    end

    def close_account
        self.status = "closed"
    end

end
