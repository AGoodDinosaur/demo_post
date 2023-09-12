class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy
  belongs_to :user
  has_one_attached :avatar

  # def self.method1
  #   # class method
  # end

  # def liked_by?
  #   p "Ok"
  # end
end
