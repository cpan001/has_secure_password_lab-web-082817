class User < ActiveRecord::Base
  validates :password, confirmation: true

  def authenticate(password)
    return nil unless self.password == password
    self
  end

end
