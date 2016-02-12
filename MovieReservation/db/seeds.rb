# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  r1 = Room.create()
  r1.seats.create([{ row: 1, column: 1 }, { row: 1, column: 2 }, { row: 1, column: 3 },
                   { row: 2, column: 1 }, { row: 2, column: 2 }, { row: 2, column: 3 },
                   { row: 3, column: 1 }, { row: 3, column: 2 }, { row: 3, column: 3 },
                   { row: 4, column: 1 }, { row: 4, column: 2 }, { row: 4, column: 3 }])
  r2 = Room.create()
  r2.seats.create([{ row: 1, column: 1 }, { row: 1, column: 2 }, { row: 1, column: 3 },
                   { row: 2, column: 1 }, { row: 2, column: 2 }, { row: 2, column: 3 },
                   { row: 3, column: 1 }, { row: 3, column: 2 }, { row: 3, column: 3 },
                   { row: 4, column: 1 }, { row: 4, column: 2 }, { row: 4, column: 3 }])

  Movie.create([{ name: 'Avengers', image_url: 'avengers-movie-poster-1.jpg'},
                { name: 'Brave', image_url: 'brave-movie-poster.jpg'},
                { name: 'Finding Nemo', image_url: 'finding-nemo-poster.jpg'},
                { name: 'Jurassic Park', image_url: 'jurassicpark.jpg'},
                { name: 'The Godfather', image_url: 'the-Godfather-poster.jpg'},
                { name: 'Titanic', image_url: 'titanic-movie-poster.jpg'}])

  #r = Room.first
  #r.seats = [Seat.find(1), Seat.find(2), Seat.find(3)]
  Screening.create(movie: Movie.first, room: r1)
  Screening.create(movie: Movie.first, room: r1)
  Screening.create(movie: Movie.first, room: r2)

  #s = Screening.first
  #s.room = r
  #s.save

  User.create([{ name: 'Fernando Campana' }, { name: 'Emmanuel Rojas' }])

  User.first.reservations.create([{seat: Seat.first, screening: Screening.first}])
  User.last.reservations.create([{seat: Seat.last, screening: Screening.last}])