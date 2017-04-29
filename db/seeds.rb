# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

run_types = RunType.create([{name: "DL", heartrate: 0.8}, {name: "long, slow run", heartrate: 0.7}])
user = User.create(username: 'lyio', email: 'thfied@gmail.com', fullname: 'Thomas Fiedler')
shoe = Shoe.create(name: 'adjsk', bought_when: Date.today, user: user)
runs = Run.create(
  {
    date: Date.today,
    user: user,
    shoe: shoe,
    run_type: run_types[0],
    resting_pulse: 59,
    weight: 71.1,
    name: "dasefa", 
    pace: '80:00',
    heartrate: 149,
    duration: '3:45:67',
    distance: 10.8
  })


  
