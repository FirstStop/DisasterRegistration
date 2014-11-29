class ServiceProvider
    include MongoMapper::Document
    extend Enumerize


    key :name, String

    key :clients, Array
    many :person, :in => :clients

    one :wizard, class: Wizard::Wizard

    key :special_role
    enumerize :special_role, in: [:registration], scope: true
   


    timestamps!

end
