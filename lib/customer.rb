class Customer
    
    attr_reader  :name, :firstname, :lastname, :accounts
    
    def initialize(name)
        @name=name;
        names = name.split(" ")
        @firstname = names.first
        @lastname = names.last
        @accounts = []    
    end
    
    def add_account(account)
        accountTypes = accounts.map{|localacc| localacc.type}
        if accountTypes.include?(account.type)
        else
            accounts << account
        end
        accounts
    end
    
end