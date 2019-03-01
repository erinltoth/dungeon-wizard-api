puts "Clearing data..."
Campaign.destroy_all
User.destroy_all
JoinRequest.destroy_all


puts "Re-creating users..."
u1 = User.create!({
  name: 'Gandalf Grey',
  email: 'mithran@dir.com',
  password: 'youshallnotpass',
  playing_style: "casual",
  exp_level: "beginner"
})

u2 = User.create!({
  name: 'Gimli Gloin',
  email: 'thatstillonly@countsasone.com',
  password: 'nobodytossesadwarf',
  playing_style: "combat-focused",
  exp_level: "beginner"
})

u3 = User.create!({
  name: 'Jaime Lannister',
  email: 'kingslayer@gmail.com',
  password: 'thethingsidoforlove',
  playing_style: "story-focused",
  exp_level: "expert"
})

puts "Re-creating campaigns..."

c1 = u1.campaigns.create!({
  name: 'Awesome Campaign',
  description: 'Awesome description!',
  location: 'Vancouver'
})

c2 = u1.campaigns.create!({
  name: 'Awesome Campaign 2',
  description: 'Awesome description 2!',
  location: 'Vancouver 2'
})

c3 = u2.campaigns.create!({
  name: 'Awesome Campaign 3',
  description: 'Awesome description 3!',
  location: 'Vancouver 3'
})

puts "Re-creating join requests..."

u3.join_requests.create(status: "I'm so cool!")

u3.join_requests.create(status: "I'm so sweet!")

u3.join_requests.create(status: "I'm so awesome!")

