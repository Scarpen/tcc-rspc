# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Interest.create(name: 'Tecnologia', description:'TIC')
Interest.create(name: 'Gestao de Projetos', description:'CEO')

Ability.create(name: 'Comunicacao', description: 'Modo de falar')
Ability.create(name: 'Escrita', description: 'Norma Culta')

User.create(email: 'teste@teste.com', password: '123123123', password_confirmation: '123123123')

Project.create(name: 'Dar coragem para o Ivan')
Project.create(name: 'Casar o Vitor com o Victor')
Project.create(name: 'Jogar Albion')