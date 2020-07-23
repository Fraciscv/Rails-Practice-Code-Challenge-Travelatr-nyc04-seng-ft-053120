class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    validates :title, presence: true
    validates :content, length: { minimum: 101 }

end
