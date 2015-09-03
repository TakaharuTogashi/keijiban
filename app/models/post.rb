class Post < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
    unless: Proc.new { |a| a.email.blank? }
  validates :name, :comment, presence: true
end
