require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :assigned_roles, :dependent => :destroy
  has_many :roles, :through => :assigned_roles
  has_many :assigned_groups, :dependent => :destroy
  has_many :groups, :through => :assigned_groups
  has_many :edit_histories, :order => "created_at", :dependent => :destroy
  has_many :patterns

  ajaxful_rater

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank

  def password_non_blank
    errors.add(:password, "Missing Password") if hashed_password.blank?
  end

  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def password
    @password
  end
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  #Gives the displayable name for the user
  def get_display_name
    self.name.capitalize
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "random" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
