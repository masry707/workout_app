class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exercises

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
end
