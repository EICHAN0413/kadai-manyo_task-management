User.create(
    name: '池田英輝', 
    email: 'chanike1993@yahoo.co.jp',
    password_digest: '22493629'
)

User.create!(
    name:  "管理者",admin@example.jp
    email: "",
    password:  "11111111",
    password_confirmation: "11111111",
    admin: true)