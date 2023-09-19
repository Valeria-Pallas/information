# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Crear algunos usuarios
User.create(email: 'user1@example.com', password: 'password1')
User.create(email: 'user2@example.com', password: 'password2')

# Crear algunos artículos
Article.create(name: 'Artículo 1', banner_url: 'https://media.istockphoto.com/id/1358078279/fr/vectoriel/nageoires-orques.jpg?s=1024x1024&w=is&k=20&c=lb10BYeIIwZ7dwKl8_NHXdboV3UJX44sdIJFi3vSzS8=', description: 'Descripción del artículo 1')
Article.create(name: 'Artículo 2', banner_url: 'https://media.istockphoto.com/id/1437224503/fr/vectoriel/cr%C3%A2nes-de-n%C3%A8gres.jpg?s=1024x1024&w=is&k=20&c=ATD8fNdgofAGdFXkRvpKX0F4XeyYDCcu90u0Zr8wjwc=', description: 'Descripción del artículo 2')

# Crear algunos comentarios
Commentaire.create(article: Article.first, name: 'Comentario 1', description: 'Descripción del comentario 1')
Commentaire.create(article: Article.second, name: 'Comentario 2', description: 'Descripción del comentario 2')
