# Userシードデータ

User.create!(
    [
        {name: '池田英輝', 
         email: 'chanike1993@yahoo.co.jp',
         password: '22493629',
         password_confirmation: '22493629', 
         admin: false
        },
        {name:  "管理者",
         email: "admin@example.jp",
         password:  "11111111",
         password_confirmation: "11111111",  
         admin: true
        },
        {name:  "一般ユーザ1",
         email: "sample1@example.jp",
         password:  "11111111",
         password_confirmation: "11111111", 
         admin: false
        },
        {name:  "一般ユーザ2",
         email: "sample2@example.jp",
         password:  "22222222",
         password_confirmation: "22222222",
         admin: false
        },
        {name:  "一般ユーザ3",
         email: "sample3@example.jp",
         password:  "33333333",
         password_confirmation: "33333333", 
         admin: false
        },
        {name:  "一般ユーザ4",
         email: "sample4@example.jp",
         password:  "44444444",
         password_confirmation: "44444444",
         admin: false
        },
        {name:  "一般ユーザ5",
         email: "sample5@example.jp",
         password:  "55555555",
         password_confirmation: "55555555", 
         admin: false
        },
        {name:  "一般ユーザ6",
         email: "sample6@example.jp",
         password:  "66666666",
         password_confirmation: "66666666",
         admin: false
        },
        {name:  "一般ユーザ7",
         email: "sample7@example.jp",
         password:  "77777777",
         password_confirmation: "77777777", 
         admin: false
        },
        {name:  "一般ユーザ8",
         email: "sample8@example.jp",
         password:  "88888888", 
         password_confirmation: "88888888",
         admin: false
        },
        {name:  "一般ユーザ9",
         email: "sample9@example.jp",
         password:  "99999999", 
         password_confirmation: "99999999",
         admin: false
        },
        {name:  "一般ユーザ10",
            email: "sample10@example.jp",
            password:  "101111111",
            password_confirmation: "101111111",
            admin: false
        }
    ]   
)

#Taskシードデータ

10.times do |n|
    User.all.each do |user|
      rand1 = rand(0..2)
      state = ["未着手", "着手中", "完了"]
      user.tasks.create!(title: "タスク#{n}",
                         content: "#{n}content",
                         end_date: Date.today+rand1,
                         priority: rand1,
                         status: state[rand1]
                         )
    end
end

#Labelシードデータ

Label.create!(
    [
     {name:'仕事'},
     {name:'趣味'},
     {name:'フロントエンド'},
     {name:'バックエンド'},
     {name:'HTML'},
     {name:'CSS'},
     {name:'Ruby'},
     {name:'学習'},
     {name:'基礎'},
     {name:'急ぎ要件'}
    ]
)
    
