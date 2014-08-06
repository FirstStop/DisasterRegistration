class AddAdminUser < ActiveRecord::Migration
  def self.up
    user = Authenticable.create!( :username => 'admin', :password => 'admin' )
  end

  def self.down
    user = Authenticable.find_by_login( 'admin' )
    user.destroy
  end
end
