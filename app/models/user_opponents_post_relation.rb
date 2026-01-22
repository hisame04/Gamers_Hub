class UserOpponentsPostRelation < ApplicationRecord
  belongs_to :opponents_wanted_post
  belongs_to :user

  validate :post_limit_check, on: :create

  after_create :decrease_count_and_close_if_full
  after_destroy :increase_count_and_reopen

  validates :user_id, uniqueness: { scope: :opponents_wanted_post_id }

  private

  def post_limit_check
    post = opponents_wanted_post
    
    if post.status || post.current_need_num <= 0
      errors.add(:base, "この募集は既に満員です")
    end
  end

  def decrease_count_and_close_if_full
    post = self.opponents_wanted_post

    if post.current_need_num > 0
      post.current_need_num -= 1
      
      if post.current_need_num == 0
        post.status = true
      end
      
      post.save!
    end
  end

  def increase_count_and_reopen
    post = self.opponents_wanted_post
    
    post.current_need_num += 1

    if post.status == true
      post.status = false
    end

    post.save!
  end
end
