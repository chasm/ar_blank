collection @posts

attributes :id, :title, :body

node :href do |post|
  user_post_url(@user, post)
end

node :links do |post|
  {
    user: user_url(@user)
  }
end
