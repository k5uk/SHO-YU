# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User Samples
User.create(   :id => '31',   :name => 'test1',   :email => 'sample@gmail1.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '32',   :name => 'test2',   :email => 'sample@gmail2.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '33',   :name => 'test3',   :email => 'sample@gmail3.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '34',   :name => 'test4',   :email => 'sample@gmail4.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '35',   :name => 'test5',   :email => 'sample@gmail5.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '36',   :name => 'test6',   :email => 'sample@gmail6.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '37',   :name => 'test7',   :email => 'sample@gmail7.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '38',   :name => 'test8',   :email => 'sample@gmail8.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '39',   :name => 'test9',   :email => 'sample@gmail9.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
User.create(   :id => '40',   :name => 'test10',   :email => 'sample@gmail10.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )

#RelationShips
mainUserId = User.select(:id).first
users = User.pluck(:id)
users.delete_at(0)

for num in users do 
    Relationship.create(:follower_id => mainUserId["id"], :followed_id => num)
    Relationship.create(:follower_id => num, :followed_id => mainUserId["id"])
end