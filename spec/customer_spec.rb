require 'customer'
require 'account'

describe Customer do
    
    describe '#initialize' do
        
        it 'should create a new customer' do
            customer = Customer.new("sara jones")
            expect(customer.name).to eql("sara jones")
            expect(customer.firstname).to eql("sara")
            expect(customer.lastname).to eql("jones")
        end
    end
    
    describe '#add_account' do
        it 'should add new account type to a new customer' do
            customer = Customer.new("sara jones")
            a = Account.new(:checking)
            accounts = customer.add_account(a)
            expect(accounts.size).to eql(1)
        end
        
        it 'should not add same kind of account type to a customer' do
            customer = Customer.new("sara jones")
            a = Account.new(:checking)
            nexta =  Account.new(:checking)
            customer.add_account(a)
            customer.add_account(nexta)
             accounts = customer.add_account(a)
            expect(accounts.size).to eql(1)
        end
    end
end
