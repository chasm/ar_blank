collection @users

attributes :id, :name

node :href do |user|
  user_url(user)
end

node :links do |user|
  {
    posts: user_posts_url(user)
  }
end
