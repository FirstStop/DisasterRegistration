class AddTestData < ActiveRecord::Migration
  def up
    john = Person.create!( :first_name => 'John',
                                  :last_name => 'Doe',
                                  :dob => '24/12/1983',
                                  :sex => :male,
                                  :has_privacy_concerns => false,
                                  :mobile => '0410 000 123',
                                  :email => 'JohnDoe@example.org',
                                  :address => '1 Bue Mountains Rd.',
                                  :suburb => 'Mountain Hills',
                                  :state => 'NSW',
                                  :postcode => '2000',
                                  :authenticable => Authenticable.create!(
                                      :username => 'jd',
                                      :password => 'jd'
                                  )
    )

    marie = Person.create!( :first_name => 'Marie',
                                  :last_name => 'Doe',
                                  :dob => '2/10/1983',
                                  :sex => :female,
                                  :has_privacy_concerns => false,
                                  :mobile => '0410 000 999',
                                  :email => 'MarieDoe@example.org',
                                  :address => '1 Bue Mountains Rd.',
                                  :suburb => 'Mountain Hills',
                                  :state => 'NSW',
                                  :postcode => '2000',
                                  :authenticable => Authenticable.create!(
                                      :username => 'md',
                                      :password => 'md'
                                  )
    )

    red_cross = ServiceProvider.create!(
        :name => 'Red Cross',
        :services_supplies => '',
        :clients => [john, marie],
        :authenticable => Authenticable.create!(
            :username => 'rc',
            :password => 'rc'
        )
    )

    salvation_arm = ServiceProvider.create!(
        :name => 'Salvation Army',
        :services_supplies => '',
        :clients => [john],
        :authenticable => Authenticable.create!(
            :username => 'sa',
            :password => 'sa'
        )
    )
  end
end
