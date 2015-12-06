class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exercises

  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  validates :first_name, presence: true
  validates :last_name, presence: true

  self.per_page = 10

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_by_name(name)
    names = name.split(' ')
    if names.size == 1
      where('first_name LIKE ? or last_name LIKE ?', "%#{names[0]}%", "%#{names[0]}%").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',
            "%#{names[0]}%", "%#{names[1]}%", "%#{names[0]}%", "%#{names[1]}%").order(:first_name)
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) or self == new_friend
  end
end
