class Badge < ApplicationRecord

  RULES = %w[all_in_category first_try_success all_in_level].freeze
  
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, presence: true
  validates :rule, uniqueness: { scope: :param }
end
