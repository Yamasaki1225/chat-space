json.array! @new_messages do |message|
  json.user_name       message.user.name
  json.body       message.body
  json.image      message.image.url
  json.created_at       message.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.id         message.id
end
