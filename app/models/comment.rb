class Comment < ActiveRecord::Base
  belongs_to :article

  validates :message, :username, :email, presence: true
  validates :username, length: { maximum: 20 }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
