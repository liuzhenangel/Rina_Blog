class Article < ActiveRecord::Base
  has_many :comments

  validates :title, :content, presence: true

  def to_html
    self.content = Markdown.new(content).to_html
    self
  end
end
