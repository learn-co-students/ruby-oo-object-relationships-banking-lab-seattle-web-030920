class BankAccount
attr_reader :name
attr_accessor :balance, :status

@@all = []

    def initialize(name, status = "open", balance = 1000)
        @name = name
        @status = status
        @balance = balance
    end

    def deposit(num)
        @balance += num
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        valid = self.balance > 0 && self.status == "open"
        valid ? true : false
    end

    def close_account
        self.status = "closed"
    end


end
