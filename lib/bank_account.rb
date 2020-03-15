#BankeAccount ->Transfer | Transfer -> BankAccount

class BankAccount
    attr_accessor :amount, :balance, :status
    attr_reader :name 
    @@all = []

    def initialize(name) 
        @name = name 
        @balance = 1000
        @status = "open" 
        @@all << self 
    end

    def self.all
        @@all 
    end

    def deposit(dep_amount)
        self.balance += dep_amount 
    end

    def valid?
        @status == "open" && @balance > 0 
    end

    def close_account
        @status = "closed"
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def transfer(receiver, amount)
        Transfer.new(self, receiver, amount)
    end
end
