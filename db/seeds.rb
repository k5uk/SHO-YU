# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User Samples

#User.delete_all

#User.create(   :id => '1001',   :name => 'test1',   :email => 'sample@gmail1.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1002',   :name => 'test2',   :email => 'sample@gmail2.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1003',   :name => 'test3',   :email => 'sample@gmail3.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1004',   :name => 'test4',   :email => 'sample@gmail4.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1005',   :name => 'test5',   :email => 'sample@gmail5.com',   :email_publish => '0',   :sex => '0',   :birthday => '1989/08/23',   :area => 'tokyo',   :age => '26',   :kiryoku => '6段',   :comment => 'テスト男',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1006',   :name => 'test6',   :email => 'sample@gmail6.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1007',   :name => 'test7',   :email => 'sample@gmail7.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1008',   :name => 'test8',   :email => 'sample@gmail8.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1009',   :name => 'test9',   :email => 'sample@gmail9.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )
#User.create(   :id => '1010',   :name => 'test10',   :email => 'sample@gmail10.com',   :email_publish => '0',   :sex => '1',   :birthday => '1995/08/23',   :area => 'kobe',   :age => '20',   :kiryoku => '初段',   :comment => 'テスト女',   :password => '12345678',   :uid => '',   :provider => '',   :confirmed_at => '2015-09-12 06:00:43.195565' )

#RelationShips

#RelationShips.delete_all

#mainUserId = User.select(:id).first
#users = User.pluck(:id)
#users.delete_at(0)

#for num in users do 
#    Relationship.create(:follower_id => mainUserId["id"], :followed_id => num)
#    Relationship.create(:follower_id => num, :followed_id => mainUserId["id"])
#end

#Messages

Message.delete_all

Message.create(   :id => '1',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '１フレーズ歌うので曲を当ててください',   :uid2Msg => '',   :created_at => '2015-08-03 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '2',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '了解です',   :created_at => '2015-08-04 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '3',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => 'やわらかい日々が波の音に染まる',   :uid2Msg => '',   :created_at => '2015-08-05 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '4',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '渚ですね',   :created_at => '2015-08-06 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '5',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '夏が過ぎ風あざみ誰の憧れにさまよう',   :uid2Msg => '',   :created_at => '2015-08-07 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '6',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '少年時代ですね',   :created_at => '2015-08-08 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '7',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '雨上がりの空を見ていた本当に君を守れるか',   :uid2Msg => '',   :created_at => '2015-08-09 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '8',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => 'たしかなことですね',   :created_at => '2015-08-10 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '9',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '格好悪くたっていいあなたと風になりたい',   :uid2Msg => '',   :created_at => '2015-08-11 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '10',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '風になりたいですね',   :created_at => '2015-08-12 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '11',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '晴れ渡る日も雨の日も浮かぶあの笑顔',   :uid2Msg => '',   :created_at => '2015-08-13 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '12',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '涙そうそうですね',   :created_at => '2015-08-14 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '13',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => 'あの子の命はひこうき雲',   :uid2Msg => '',   :created_at => '2015-08-15 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '14',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => 'ひこうき雲ですね',   :created_at => '2015-08-16 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '15',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '君の心へ続く長い一本道は',   :uid2Msg => '',   :created_at => '2015-08-17 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '16',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '青春の影ですね',   :created_at => '2015-08-18 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '17',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => 'あなたが触れない私なら無いのと同じだから',   :uid2Msg => '',   :created_at => '2015-08-19 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '18',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '流星群ですね',   :created_at => '2015-08-20 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '19',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '私らしく一日を終えたいこんな夜',   :uid2Msg => '',   :created_at => '2015-08-21 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '20',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => 'オリビアを聴きながらですね',   :created_at => '2015-08-22 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '21',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => 'ねぇいつか君は僕のことを忘れてしまうのかな',   :uid2Msg => '',   :created_at => '2015-08-23 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '22',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '思いがかさなるその前にですね',   :created_at => '2015-08-24 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '23',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '薄紅色の可愛い君のね果てない夢がちゃんと',   :uid2Msg => '',   :created_at => '2015-08-25 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '24',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => 'ハナミズキですね',   :created_at => '2015-08-26 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '25',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => 'あなたを待っていたいた人影の無い駅で',   :uid2Msg => '',   :created_at => '2015-08-27 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '26',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '夏の終わりですね',   :created_at => '2015-08-28 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '27',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '凄いです！全問正解ですよ！',   :uid2Msg => '',   :created_at => '2015-08-29 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '28',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => '発売されたＣＤ買ったので！',   :created_at => '2015-08-30 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '29',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '本当ですか！ありがとうございます！！',   :uid2Msg => '',   :created_at => '2015-08-31 02:56:38.969721',   :updated_at => '' )
Message.create(   :id => '30',   :uid1 => '63',   :uid2 => '1001',   :uid1Msg => '',   :uid2Msg => 'これからも応援しています！',   :created_at => '2015-09-01 02:56:38.969721',   :updated_at => '' )
