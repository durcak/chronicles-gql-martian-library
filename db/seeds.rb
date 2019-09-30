  john = User.create!(
    email: "john.doe@example.com",
    first_name: "John",
    last_name: "Doe",
    role: Role::ADMIN,
  )

  jane = User.create!(
    email: "jane.doe@example.com",
    first_name: "Jane",
    last_name: "Doe",
    role: Role::DIRECTOR,
  )

  anton = User.create!(
    email: "anton.doe@example.com",
    first_name: "Anton",
    last_name: "Doe",
    role: Role::BROKER,
  )

  peter = User.create!(
    email: "peter.doe@example.com",
    first_name: "Peter",
    last_name: "Doe",
    role: Role::NEW,
  )

  Item.create!(
    [
      {
        title: "Martian Chronicles",
        description: "Cult book by Ray Bradbury",
        user: john,
        role: Role::NEW,
        image_url: "https://upload.wikimedia.org/wikipedia/en/4/45/The-Martian-Chronicles.jpg"
      },
      {
        title: "The Martian",
        description: "Novel by Andy Weir about an astronaut stranded on Mars trying to survive",
        user: john,
        role: Role::NEW,
        image_url: "https://upload.wikimedia.org/wikipedia/en/c/c3/The_Martian_2014.jpg"
      },
      {
        title: "Doom",
        description: "A group of Marines is sent to the red planet via an ancient " \
                     "Martian portal called the Ark to deal with an outbreak of a mutagenic virus",
        user: jane,
        role: Role::NEW,
        image_url: "https://upload.wikimedia.org/wikipedia/en/5/57/Doom_cover_art.jpg"
      },
      {
        title: "Mars Attacks!",
        description: "Earth is invaded by Martians with unbeatable weapons and a cruel sense of humor",
        user: jane,
        role: Role::NEW,
        image_url: "https://upload.wikimedia.org/wikipedia/en/b/bd/Mars_attacks_ver1.jpg"
      }
    ]
  )
