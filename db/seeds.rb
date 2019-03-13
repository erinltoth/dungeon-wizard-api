require 'faker'

puts "Clearing data..."
JoinRequest.destroy_all
Campaign.destroy_all
User.destroy_all


puts "Re-creating users..."

Avatars = ["https://bit.ly/2XGVwkU",
          "https://bit.ly/2tX8YU2",
          "https://bit.ly/2H7saHd",
          "https://bit.ly/2CaG1bT",
          "https://bit.ly/2H4WFxy",
          "https://bit.ly/2TIELH6",
          "https://bit.ly/2VG0jRM",
          "https://bit.ly/2EWW1ji",
          "https://bit.ly/2tUndsO"]

CampaignImages =  ["https://bit.ly/2VOZZ3s",
                  "https://bit.ly/2NP1X0V",
                  "https://bit.ly/2SSo6w7",
                  "https://bit.ly/2IZdgVj",
                  "https://bit.ly/2EWHQtJ",
                  "https://bit.ly/2H9qb5u",
                  "https://bit.ly/2VLXpee",
                  "https://bit.ly/2TsVApR",
                  "https://bit.ly/2H9B7Qw",
                  "https://bit.ly/2EMtUCs",
                  "https://bit.ly/2UsFbOJ",
                  "https://bit.ly/2EM9KZc",
                  "https://bit.ly/2TIzBdO",
                  "https://bit.ly/2Hlac3w"]


u1 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "story-focused",
  exp_level: "beginner",
  avatar: Avatars.sample
})

u2 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "combat-focused",
  exp_level: "beginner",
  avatar: Avatars.sample
})

u3 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "story-focused",
  exp_level: "expert",
  avatar: Avatars.sample
})

u4 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "combat-focused",
  exp_level: "intermediate",
  avatar: Avatars.sample
})

u5 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "story-focused",
  exp_level: "wizard",
  avatar: Avatars.sample
})

u6 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "combat-focused",
  exp_level: "wizard",
  avatar: Avatars.sample
})

u7 = User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "story-focused",
  exp_level: "intermediate",
  avatar: Avatars.sample
})

5.times {
  User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "story-focused",
  exp_level: "expert",
  avatar: Avatars.sample
  })
}

5.times {
  User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "combat-focused",
  exp_level: "intermediate",
  avatar: Avatars.sample

  })
}

5.times {
  User.create!({
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.word,
  playing_style: "combat-focused",
  exp_level: "expert",
  avatar: Avatars.sample
  })
}

puts "Re-creating campaigns..."

c7 = u7.campaigns.create!({
  name: Faker::Games::ElderScrolls.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 2,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
})

2.times {
  u7.campaigns.create!({
  name: Faker::Games::Witcher.location,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 6,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
  })
}

c8 = u6.campaigns.create!({
  name: Faker::Games::ElderScrolls.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 3,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
})

2.times {
  u6.campaigns.create!({
  name: Faker::TvShows::GameOfThrones.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 6,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
  })
}

c9 = u5.campaigns.create!({
  name: Faker::Games::ElderScrolls.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 2,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
})

2.times {
  u5.campaigns.create!({
  name: Faker::TvShows::GameOfThrones.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 6,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
  })
}


2.times {
  u4.campaigns.create!({
  name: Faker::Games::ElderScrolls.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "combat-focused",
  exp_level: "beginner",
  player_limit: 6,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 22, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
  })
}

c10 = u4.campaigns.create!({
  name: Faker::Games::ElderScrolls.city,
  description: Faker::Books::Lovecraft.sentence,
  location: Faker::Address.street_address,
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 4,
  synopsis: (Faker::Books::Lovecraft.paragraphs(5)).join(' '),
  next_session: DateTime.civil_from_format( :local, 2019, 3, 18, 19 ),
  image: CampaignImages.sample,
  commitment: "casual",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
})

c1 = u1.campaigns.create!({
  name: "An Odyssey On the Sea",
  description: "Our hero Odysseus and his band of sailors sail the high seas in search of Penelope ",
  location: "Greece",
  playing_style: "story-focused",
  exp_level: "intermediate",
  player_limit: 5,
  synopsis: "It has been thirty years since Odysseus has seen his beloved Penelope. His heart tells him she is still alive, but he has no clue where she is. His search so far has taken him through every manner of harrowing circumstance, and every time Odysseus has come out on top. His crew seems as bright and spritely as when they began their search. The memory of pas victories gives our hero the strength he needs to go on... soon he will be reunited with Penelope and be able to live out his days away from the dangers that come with a seafaring life. ",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 26, 19 ),
  image: "https://bit.ly/2NP1X0V",
  commitment: "long-term",
  deep_immersion: true,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: false,
  exploration: true,
  random: false
})

c2 = u1.campaigns.create!({
  name: "Hawaii 5-0",
  description: "A grim excursion to an abandoned island just outside Maui.",
  location: "123 Vancouver St. Vancouverton VC",
  playing_style: "story-focused",
  exp_level: "beginner",
  player_limit: 4,
  synopsis: "There is smoke in the distance. You look back at the the group and see they haven't noticed yet. It seems as though they wouldn't notice if you didn't point it out, but at this point it is all you can see. You are doubting whether or not the trip is a good idea, the stories you have heard haven't been pretty... The island has to be haunted, there's no other explanation. A silence falls over your 20ft dingy... they see the smoke too. ",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 26, 19 ),
  image: "https://bit.ly/2EWHQtJ",
  commitment: "single-session",
  deep_immersion: false,
  sandbox: true,
  battle_focused: true,
  kick_in_the_door: true,
  exploration: false,
  random: false
})

c3 = u2.campaigns.create!({
  name: "Besla Raiders",
  description: "A hot headed group of teenagers buy futuristic Besla cars in order to find the lost tomb of Leon Pusk...",
  location: "North Shore",
  playing_style: "story-focused",
  exp_level: "expert",
  player_limit: 3,
  synopsis: "It is day three of our quest. We have all left our lives behind us in order to give 100% of our efforts to what lies ahead. Bright, crisp days fly by as we sink deeper into our mission... it is burning between each of our ears from morning until night: to find the lost tomb of Leon Pusk. Our mission began one year ago almost exactly in a Besla recharging station. One of those old, classic recharging stations that let you sit down on the patio and sell you sample the local food pills. An old man came up to us, seemingly inebriated. He was babbling incessantly, obviously trying to get something very serious across. A few seconds into his soliloquy a package fell out of his jacket pocket onto the table. The big thud took everyone by surprise. As soon as the mas came he left in a confused histeria, taking no notice of the fallen package. Immediately we discovered what this was... a locator from Area 52. It wanted to be brought to the lost tomb of Leon Pusk.",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 27, 12 ),
  image: "https://bit.ly/2EMtUCs",
  commitment: "casual",
  deep_immersion: false,
  sandbox: true,
  battle_focused: false,
  kick_in_the_door: true,
  exploration: false,
  random: true
})

c4 = u6.campaigns.create!({
  name: "Roots of the Gulthias Tree",
  description: "A world where blights were caused by the death of the vampire Gulthias. We fight to save this world.",
  location: "401 W Georgia Street",
  playing_style: "story-focused",
  exp_level: "beginner",
  player_limit: 4,
  synopsis: "Legends tell of a vampire named Gulthias who worked terrible magic and raised up an abominable tower called Nightfang Spire. Gulthias was undone when a hero plunged a wooden stake through his heart, but as the vampire was destroyed, his blood infused the stake with a dreadful power. In time, tendrils of new growth sprouted from the wood, growing into a sapling infused with the vampire’s evil essence. It is said that a mad druid discovered the sapling, transplanting it to an underground grotto where it could grow. From this Gulthias tree came the seeds from which the first blights were sown.",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 26, 19 ),
  image: "https://bit.ly/2EWHQtJ",
  commitment: "single-session",
  deep_immersion: false,
  sandbox: true,
  battle_focused: true,
  kick_in_the_door: true,
  exploration: false,
  random: false
})

c5 = u4.campaigns.create!({
  name: "The Mad Manor of Astabar",
  description: "A haunted house campaign.",
  location: "123 Vancouver St. Vancouverton VC",
  playing_style: "story-focused",
  exp_level: "beginner",
  player_limit: 4,
  synopsis: "You have few complaints this night as you rest in the common room of the Crooked Crow Inn. While winter has passed, the night air carries enough of a chill to make any hearth a welcome sight.

  The village of Havehollow is typical for this part of the realm. Livelihoods made from farming and livestock with a few merchants and the Inn catering to travelers along the kingsroad. Good folk who know that hard work is what's needed to make it through harsh times.

  As you finish your meal you notice a fellow traveler, a raven haired woman, walk to the front of the common room with lyre in hand. She plucks a few practice cords then breaks into song.

  Seasons come and go
  Moons wax and wane
  Time seems so slow
  To the spirits of Havehollow...",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 26, 19 ),
  image: "https://bit.ly/2EWHQtJ",
  commitment: "single-session",
  deep_immersion: false,
  sandbox: true,
  battle_focused: true,
  kick_in_the_door: true,
  exploration: false,
  random: false
})

c6 = u6.campaigns.create!({
  name: "The Behemoths of Rhinn",
  description: "The city of Rhinn was built and rebuilt many times over what was likely millennia. ",
  location: "401 W Georgia Street",
  playing_style: "story-focused",
  exp_level: "beginner",
  player_limit: 4,
  synopsis: "The city of Rhinn was built and rebuilt many times over what was likely millennia. Imperial historians would make wild conjectures when it came to how old the city was, but in truth it was a complete mystery to everyone. Digging underneath it's sprawling streets and alleyways, one would find layer upon layer of blackened ash. Legends of gargantuan sieges, catastrophic dragon attacks and violent political subterfuge are quite commonplace among the locals. Needless to say, Rhinn's violent past could only further instill the collective sense of dread when the shapes first started appearing.<br />

  From the start, accounts already varied wildly. Small, skittering, inky black creatures that moved unnaturally fast, across walls and ceilings, oozing in and out of small cracks in the city's stone facades. Hazy, dark mists that would cause one to feel disoriented and barely able to breathe. Stories of disturbing sounds far off in the distance, with patrolling rangers reporting gargantuan, shifting dark shapes on the horizon at night, silent as ghosts.<br />

  Your party has arrived in Rhinn in the midst of rising panic. While far from outright chaos, tensions are definitely running high. The cityfolk are suspicious of you and reluctant to give information. While some actively avoid you, others seem barely aware that you're even there at all. Staring off into the distance vacantly, as if looking at something no one else can see. As nightfall looms, you're now faced with the choice of paying for an inn to stay the night, or test your luck in the eerily silent streets.
  ",
  next_session: DateTime.civil_from_format( :local, 2019, 3, 26, 19 ),
  image: "https://bit.ly/2EWHQtJ",
  commitment: "single-session",
  deep_immersion: false,
  sandbox: true,
  battle_focused: true,
  kick_in_the_door: true,
  exploration: false,
  random: false
})

puts "Re-creating join requests..."

JoinRequest.create!({
  user_id: u1.id,
  campaign_id: c7.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u2.id,
  campaign_id: c7.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u3.id,
  campaign_id: c8.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u4.id,
  campaign_id: c8.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u5.id,
  campaign_id: c8.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u1.id,
  campaign_id: c9.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u2.id,
  campaign_id: c9.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u2.id,
  campaign_id: c10.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u3.id,
  campaign_id: c10.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u4.id,
  campaign_id: c10.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u6.id,
  campaign_id: c10.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u1.id,
  campaign_id: c5.id,
  message: "I'm the best at D&D!",
  player_confirm: true,
  dm_confirm: "pending"
})

JoinRequest.create!({
  user_id: u1.id,
  campaign_id: c6.id,
  message: "I'm incredibly reliable!",
  player_confirm: true,
  dm_confirm: "pending"
})

JoinRequest.create!({
  user_id: u1.id,
  campaign_id: c3.id,
  message: "I'm so awesome!",
  player_confirm: false,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u2.id,
  campaign_id: c2.id,
  message: "I'll bring awesome snacks!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u2.id,
  campaign_id: c3.id,
  message: "I can drive other people!",
  player_confirm: true,
  dm_confirm: "accepted"
})

JoinRequest.create!({
  user_id: u3.id,
  campaign_id: c1.id,
  message: "I need new friends and you seem cool!",
  player_confirm: true,
  dm_confirm: "rejected"
})

JoinRequest.create!({
  user_id: u4.id,
  campaign_id: c4.id,
  message: "I'm so awesome!",
  player_confirm: true,
  dm_confirm: "rejected"
})

JoinRequest.create!({
  user_id: u5.id,
  campaign_id: c3.id,
  message: "I'm so awesome!",
  player_confirm: true,
  dm_confirm: "pending"
})
