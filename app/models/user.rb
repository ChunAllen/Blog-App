class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true

  has_many :posts, dependent: :destroy

  # Instance Method
  def full_name
    "#{first_name} #{last_name}"
  end

  # Class Method
  def self.by_first_name(fname)
    where(first_name: fname)
  end


end
