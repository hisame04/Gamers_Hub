class OpponentsWantedPost < ApplicationRecord
  belongs_to :user
  belongs_to :game_title
  belongs_to :game_mode 

  has_many :game_role_opponents_post_relations, dependent: :destroy

  has_many :game_roles, through: :game_role_opponents_post_relations

  has_many :user_opponents_post_relations, dependent: :destroy
  has_many :applicants, through: :user_opponents_post_relations, source: :user

  validates :start_time, presence: true
  validates :game_title_id, presence: true
  validates :game_mode_id, presence: true
  validates :voice_chat, presence: true
  validates :need_num, presence: true

  before_create :set_initial_current_need_num

  attr_accessor :start_date_part, :start_time_part

  after_initialize :set_date_and_time_parts

  before_validation :combine_date_and_time

  def entered_by?(user)
    user_opponents_post_relations.exists?(user_id: user.id)
  end

  private

  def set_date_and_time_parts
    return unless start_time

    self.start_date_part ||= start_time.to_date.to_s
    self.start_time_part ||= start_time.strftime("%H:%M")
  end

  def combine_date_and_time
    if start_date_part.present? && start_time_part.present?
      self.start_time = Time.zone.parse("#{start_date_part} #{start_time_part}")
    end
  rescue ArgumentError
    self.start_time = nil
  end

  private
  def set_initial_current_need_num
    self.current_need_num = self.need_num
  end

  
end
