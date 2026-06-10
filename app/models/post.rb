class Post < ApplicationRecord
  belongs_to :user

  validate :content_or_image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image


  private

  def content_or_image
  return if content.present? || image.attached?

  errors.add(:base, "Post must have content or image")
  end
end
