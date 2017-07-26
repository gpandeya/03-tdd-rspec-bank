require 'account'

describe Account do
    describe '#initialize' do
        it 'shoulc create a checking account with zero balance and no transactions' do
        a = Account.new(:checking)
        expect(a.type).to eql(:checking)
        expect(a.balance).to eql(0)
        expect(a.transactions.size).to eql(0)
        end
    end
    
    describe '#deposit' do
        it 'should add $75 to a new savings account' do
        a = Account.new(:savings)
        a.deposit(75)
        expect(a.balance).to eql(75)
        expect(a.transactions.size).to eql(1)
        t = a.transactions.first
        expect(t.type).to eql(:deposit)
        expect(t.amount).to eql(75)
        end
        
    end
    
    describe '#withdraw' do
        it 'should withdraw when funds are available' do
            a = Account.new(:checking)
            a.deposit(100)
            a.withdraw(25)
            expect(a.balance).to eql(75)
            expect(a.transactions.size).to eql(2)
            t1 = a.transactions.first
            expect(t1.type).to eql(:deposit)
            expect(t1.amount).to eql(100)
            t2 = a.transactions[1]
            expect(t2.type).to eql(:withdraw)
            expect(t2.amount).to eql(25)
             
        end
        
         it 'should not withdraw when funds are insufficient' do
            a = Account.new(:checking)
            a.withdraw(35)
            expect(a.balance).to eql(-50)
            expect(a.transactions.size).to eql(1)
            t = a.transactions.first
            expect(t.type).to eql(:fee)
            expect(t.amount).to eql(50)
        end
    
    end

    describe '#filter_transactions' do
        it 'show all transactions' do
            a = Account.new(:checking)
            a.deposit(100)
            a.deposit(100)
            a.withdraw(25)
            txn = a.filter_transactions
            expect(txn.size).to eql(3)
        end
        
        it 'show deposit transactions' do
            a = Account.new(:checking)
            a.deposit(100)
            a.deposit(100)
            a.withdraw(25)
            txn = a.filter_transactions(:deposit)
            expect(txn.size).to eql(2)
        end
        
       
    end
    
   describe '#stats' do
        it 'show mean, median value' do
            a = Account.new(:checking)
            a.deposit(400)
            a.deposit(500)
            a.deposit(300)
            stathash = a.stats(:deposit)
            expect(stathash[:mean]).to eql (400)
           # expect(stathash[:median]).to eql (400)
            
        end
        
       
   
   end
    
    
end