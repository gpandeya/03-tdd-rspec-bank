class Account
   
    attr_reader :type,:balance,:transactions
    
    def initialize(type)
        @type = type
        @balance =0
        @transactions =[]
    end
    
    def deposit(amount)
        t= Transaction.new(:deposit,amount)
        transactions << t
        @balance += amount
    end
    
    def withdraw(amount)
        if amount > @balance
            # convert amount to fee amount
            type = :fee;
            amount = 50
        else
            type = :withdraw; 
        end
        
        t = Transaction.new(type,amount)
        @balance -= amount
        transactions << t
    end
    
    def filter_transactions(type=nil) 
        type ? @transactions.select{|t| t.type ==type} : @transactions
    end
    
    def stats(type)
        txn = filter_transactions(type)
        amtArray = txn.map{|t| t.amount}
        retmean = amtArray.sum/amtArray.size
        amtArray.sort
        retmedian = amtArray[1]
        
        {
            mean: retmean,median: retmedian
        }
        
        
    end
    
end
    
