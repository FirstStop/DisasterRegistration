require File.dirname(__FILE__) + "/../../app/models/authenticable"
class RenameNameToFirstName < Exodus::Migration
    self.migration_number = 1
    
    def initialize(args = {})
        super(args)
        self.status_complete = 1
        self.description = 'Add default admin user'
    end
    
    def up
        step("Create default admin user", 1) do
            user = Authenticable.create!( :username => 'admin', :password => 'admin' )
        end
        self.status.message = "Migration Executed!"
    end

    def down
        step("Remove default admin user", 0) do
             user = Authenticable.find_by_username( 'admin' )
             user.destroy
        end
        self.status.message = "Migration Executed!"
    end

end