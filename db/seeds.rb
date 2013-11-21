User.destroy_all

u = User.create(name: "Joe")
u2 = User.create(name: "The Edge")
u3 = User.create(name: "Sam")
u4 = User.create(name: "Betty")
u5 = User.create(name: "Donna")

t = u.posts.create([
  {
    title: "This is a title",
    body: "This is the body."
  }
])

comments = Comment.create([
  {
    body: "This is comment 1 on the topic.",
    post: t[0],
    user: u2
  },
  {
    body: "This is comment 2 on the topic.",
    post: t[0],
    user: u
  }
])

Comment.create([
  {
    body: "This is a comment on comment 1",
    post: comments[0],
    user: u2
  },
  {
    body: "This is a comment on comment 2",
    post: comments[1],
    user: u
  }
])