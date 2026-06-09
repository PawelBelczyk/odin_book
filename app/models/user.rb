class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



          has_many :comments, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_one :profile, dependent: :destroy

         has_many :sent_follow_requests,
         class_name: "FollowRequest",
         foreign_key: :follower_id,
         dependent: :destroy

          has_many :received_follow_requests,
         class_name: "FollowRequest",
         foreign_key: :followed_id,
         dependent: :destroy


         def following
        User.joins(:received_follow_requests)
       .where(follow_requests: {
        follower_id: id,
        status: "accepted"
       })
        end

        def following_ids
      following.pluck(:id)
        end


    after_create :send_welcome_email 
        
    
    private

       def send_welcome_email
      UserMailer.with(user: self).welcome.deliver_now
      end
end
