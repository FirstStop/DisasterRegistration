class ServiceProvider
    include MongoMapper::Document
    
    key :name, String
    key :services_supplies, String
    key :clients, Array
   
   many :persons, :in => :clients
    one :authenticable, :class_name => "Authenticable", :as => :authenticable_object
    
    timestamps!

end
