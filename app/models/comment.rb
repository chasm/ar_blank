class Comment < Post
  belongs_to :post
  
  # validates :post, presence: true
end
