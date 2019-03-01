puts "Re-creating users..."

User.destroy_all

User.create!({
  name: 'Gandalf Grey',
  email: 'mithran@dir.com',
  password: 'youshallnotpass',
  playing_style: "casual",
  exp_level: "beginner"
})

User.create!({
  name: 'Gimli Gloin',
  email: 'thatstillonly@countsasone.com',
  password: 'nobodytossesadwarf',
  playing_style: "combat-focused",
  exp_level: "beginner"
})

User.create!({
  name: 'Jaime Lannister',
  email: 'kingslayer@gmail.com',
  password: 'thethingsidoforlove',
  playing_style: "story-focused",
  exp_level: "expert"
})