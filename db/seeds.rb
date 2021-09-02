User.create!(
    name: '池田英輝', 
    email: 'chanike1993@yahoo.co.jp',
    password: '22493629',
    password_confirmation: '22493629',
    admin: false
)

User.create!(
    name:  "管理者",
    email: "admin@example.jp",
    password:  "11111111",
    password_confirmation: "11111111",
    admin: true
)

Label.create!(
    name: '仕事'
)

Label.create!(
    name: '趣味'
)

Label.create!(
    name: 'フロントエンド'
)

Label.create!(
    name: 'バックエンド'
)

Label.create!(
    name: 'HTML'
)

Label.create!(
    name: 'CSS'
)

Label.create!(
    name: 'Ruby'
)

Label.create!(
    name: '学習'
)

Label.create!(
    name: '基礎'
)

Label.create!(
    name: '急ぎ要件'
)

