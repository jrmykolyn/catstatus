# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

statuses = %w{sleep standby online offline}

statuses.each do | s |
    Status.create( { :name => s, :title => s.titleize } )
end

user = User.create( { :name => "John Smith" } )

cats = %w{snowman mittens}

cats.each do | c |
    cat = Cat.create( { :name => c, user_id: user.id } )
    Entry.create( { :cat_id => cat.id, :status_id => Status.all.sample.id } )
end
