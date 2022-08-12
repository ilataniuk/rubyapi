class Article < ApplicationRecord
  validates :title, :body, presence: true
  def formatted_created_at
    created_at.strftime("%d.%m.%Y %H:%M")
  end
end
