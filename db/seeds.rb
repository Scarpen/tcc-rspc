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

User.create(name: 'user', email: 'user@user.com', password: '123123123', password_confirmation: '123123123')
User.create(name: 'user1', email: 'user1@user.com', password: '123123123', password_confirmation: '123123123')
User.create(name: 'user2', email: 'user2@user.com', password: '123123123', password_confirmation: '123123123')
User.create(name: 'user3', email: 'user3@user.com', password: '123123123', password_confirmation: '123123123')
User.create(name: 'user4', email: 'user4@user.com', password: '123123123', password_confirmation: '123123123')
User.create(name: 'user5', email: 'user5@user.com', password: '123123123', password_confirmation: '123123123')

Project.create(name: 'Dar coragem para o Ivan', creator_id: 1, visible_project: false)
Project.create(name: 'Casar o Vitor com o Victor', creator_id: 1, visible_project: false)
Project.create(name: 'Jogar Albion', creator_id: 2, visible_project: false)
Project.create(name: 'Bora Terminar logo thiagoo', creator_id: 2, visible_project: false)

Member.create(user_id: 1, project_id: 1, situation: 1)
Member.create(user_id: 1, project_id: 2, situation: 1)
Member.create(user_id: 1, project_id: 3, situation: 1)
Member.create(user_id: 1, project_id: 4, situation: 1)

Member.create(user_id: 2, project_id: 1, situation: 1)
Member.create(user_id: 2, project_id: 2, situation: 1)
Member.create(user_id: 2, project_id: 3, situation: 1)
Member.create(user_id: 2, project_id: 4, situation: 1)

Member.create(user_id: 3, project_id: 1, situation: 1)
Member.create(user_id: 3, project_id: 2, situation: 1)
Member.create(user_id: 3, project_id: 3, situation: 1)
Member.create(user_id: 3, project_id: 4, situation: 1)

Member.create(user_id: 4, project_id: 1, situation: 1)
Member.create(user_id: 4, project_id: 2, situation: 1)
Member.create(user_id: 4, project_id: 3, situation: 1)
Member.create(user_id: 4, project_id: 4, situation: 1)

Member.create(user_id: 5, project_id: 1, situation: 1)
Member.create(user_id: 5, project_id: 2, situation: 1)
Member.create(user_id: 5, project_id: 3, situation: 1)
Member.create(user_id: 5, project_id: 4, situation: 1)

Member.create(user_id: 6, project_id: 1, situation: 1)
Member.create(user_id: 6, project_id: 2, situation: 1)
Member.create(user_id: 6, project_id: 3, situation: 1)
Member.create(user_id: 6, project_id: 4, situation: 1)

Friend.create(user_id: 1, friend_id: 2, status: 'accept')
Friend.create(user_id: 1, friend_id: 3, status: 'accept')
Friend.create(user_id: 1, friend_id: 4, status: 'accept')
Friend.create(user_id: 1, friend_id: 5, status: 'accept')
Friend.create(user_id: 1, friend_id: 6, status: 'accept')

Friend.create(user_id: 2, friend_id: 1, status: 'accept')
Friend.create(user_id: 2, friend_id: 3, status: 'accept')
Friend.create(user_id: 2, friend_id: 4, status: 'accpet')
Friend.create(user_id: 2, friend_id: 5, status: 'accpet')
Friend.create(user_id: 2, friend_id: 6, status: 'accpet')

Friend.create(user_id: 3, friend_id: 1, status: 'accept')
Friend.create(user_id: 3, friend_id: 2, status: 'accept')
Friend.create(user_id: 3, friend_id: 4, status: 'accept')
Friend.create(user_id: 3, friend_id: 5, status: 'accept')
Friend.create(user_id: 3, friend_id: 6, status: 'accept')

Friend.create(user_id: 4, friend_id: 1, status: 'accept')
Friend.create(user_id: 4, friend_id: 2, status: 'accept')
Friend.create(user_id: 4, friend_id: 3, status: 'accept')
Friend.create(user_id: 4, friend_id: 5, status: 'accept')
Friend.create(user_id: 4, friend_id: 6, status: 'accept')

Friend.create(user_id: 5, friend_id: 1, status: 'accept')
Friend.create(user_id: 5, friend_id: 2, status: 'accept')
Friend.create(user_id: 5, friend_id: 3, status: 'accept')
Friend.create(user_id: 5, friend_id: 4, status: 'accept')
Friend.create(user_id: 5, friend_id: 6, status: 'accept')

Friend.create(user_id: 6, friend_id: 1, status: 'accept')
Friend.create(user_id: 6, friend_id: 2, status: 'accept')
Friend.create(user_id: 6, friend_id: 3, status: 'accept')
Friend.create(user_id: 6, friend_id: 4, status: 'accept')
Friend.create(user_id: 6, friend_id: 5, status: 'accept')

Publication.create(description: 'Lorem ipsum dolor sit amet, cetero inimicus an mei, ea ius viderer saperet iudicabit, in lobortis adversarium ius. Nulla persecuti has ne, ius in illum gubergren. Ne nec tamquam admodum. Has ad quidam eirmod definiebas, ei mel essent evertitur urbanitas. Aeterno dolorem evertitur in duo. His et discere imperdiet, cim tota utroque eu.', user_id: 1, project_id: 1)
Publication.create(description: 'Publication1', user_id: 3, project_id: 1)
Publication.create(description: 'Lorem ipsum dolor sit amet, cetero inimicus an mei, ea ius viderer saperet iudicabit, in lobortis adversarium ius. Nulla persecuti has ne, ius in illum gubergren. Ne nec tamquam admodum. Has ad quidam eirmod definiebas, ei mel essent evertitur urbanitas. Aeterno dolorem evertitur in duo. His et discere imperdiet, cim tota utroque eu.', user_id: 4, project_id: 1)

Publication.create(description: 'Publication', user_id: 2, project_id: 2)
Publication.create(description: 'Publication1', user_id: 3, project_id: 2)
Publication.create(description: 'Publication2', user_id: 4, project_id: 2)

Publication.create(description: 'Publication', user_id: 2, project_id: 3)
Publication.create(description: 'Publication1', user_id: 3, project_id: 3)
Publication.create(description: 'Publication2', user_id: 4, project_id: 3)

Publication.create(description: 'Publication', user_id: 2, project_id: 4)
Publication.create(description: 'Publication1', user_id: 3, project_id: 4)
Publication.create(description: 'Publication2', user_id: 4, project_id: 5)

