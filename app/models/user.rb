class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_game_relations, dependent: :destroy
  has_many :user_titles, through: :user_game_relations
  has_many :opponents_wanted_post, dependent: :destroy
  has_many :user_opponents_post_relations, dependent: :destroy
  has_many :friend_wanted_posts

  accepts_nested_attributes_for :user_game_relations, allow_destroy:true #reject_if:all_blankですべて空欄の場合保存しないようにする
  has_one_attached :photo
end
