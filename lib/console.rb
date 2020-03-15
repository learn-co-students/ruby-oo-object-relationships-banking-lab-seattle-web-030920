require 'pry'
require_relative 'bank_account.rb'
require_relative 'transfer.rb'

account1 = BankAccount.new("james")
account2 = BankAccount.new('Cathryn')

account1.deposit(400)
account2.deposit(200)

