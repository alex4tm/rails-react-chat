Message.destroy_all
User.destroy_all
Channel.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

names = %w(general dubai london react support)
nicknames = %w(alex mike john mary jane)

channels = names.map do |name|
  Channel.find_or_create_by(name: name)
end

users = nicknames.map do |nickname|
  User.create(email: "#{nickname.downcase}@gmail.com", nickname: nickname, password: "testtest")
end

20.times do
  Message.create(user: users.sample, channel: channels.sample, content: Faker::TvShows::BigBangTheory.quote)
end

puts 'Channels:'
channels.each do |channel|
  puts "- #{channel.id}: #{channel.name}"
end
