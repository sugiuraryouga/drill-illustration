json.array! @posts do |post|
  json.id      post.id
  json.title   post.title
  json.content post.content
  json.image   post.image.url
  json.user_id post.user_id
end