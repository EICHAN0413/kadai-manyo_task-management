FactoryBot.define do

  factory :user do
    id { 1 }
    name {'テスト1'}
    email {'sample@gmail.com'}
    password {'11111111'}
    admin { false }
  end

  factory :second_user, class: User do
    id { 2 }
    name {'テスト2'}
    email {'sample2@gmail.com'}
    password {'22222222'}
    admin { true }
  end
end
