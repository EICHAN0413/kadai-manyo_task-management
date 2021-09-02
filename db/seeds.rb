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