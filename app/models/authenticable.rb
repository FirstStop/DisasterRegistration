class Authenticable
    include MongoMapper::Document

    key :username, String, :required => true, :unique => true
    key :encrypted_password, String
    key :salt, String
  

  before_save :encrypt_password
  after_save :clear_password

  attr_accessor :password

  belongs_to :authenticable_object, polymorphic: true

  def self.authenticate(username, password)
    user = Authenticable.find_by_username(username)

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end


  private
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end