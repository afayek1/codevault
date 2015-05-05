class User < ActiveRecord::Base
	include BCrypt
  before_save { self.email = email.downcase }

  # RELATIONSHIPS

  has_many :posts, dependent: :destroy
  
  # People that follow users
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
	
  has_many :memberships
	has_many :groups, through: :memberships
	
  
  # VALIDATIONS
  # todo: validate password

  validates :name,  presence: true,
                    length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },                  
                    uniqueness: {case_sensitive: false}

  validates :username,  uniqueness: {case_sensitive: false}

  def authenticate(supplied_password)
    self.password == supplied_password
  end
	
  def password
	  @password ||= Password.new(password_hash)
	end

	def password=(new_password)
	  @password = Password.create(new_password)
	  self.password_hash = @password
	end

  def feed
    Post.where("user_id = ?", id)
  end

  private

    # TODO:
    # Reserach where to best put gravatar method.
    
    # Based on Gravatar documentation
    # 1) strip leading/trailing whitespace
    # 2) downcase
    # 1) hash
    def generate_gravatar_url
      hash = Digest::MD5.hexdigest(email)
      self.gravatar_url = "http://www.gravatar.com/avatar/#{hash}"
    end
    
    def clean_email(email)
      email.strip.downcase
    end

end