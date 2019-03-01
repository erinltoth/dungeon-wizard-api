puts "Re-creating users..."

User.destroy_all

User.create!({ })