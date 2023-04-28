# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin user
admin_user = {
    username: "aebibtech",
    password: "Camano123!@#",
    bio: "I love computers",
    stars: 0
}
User.create(admin_user)