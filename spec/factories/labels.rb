FactoryBot.define do

  factory :label, class: Label do
    name { "テストラベル1" }
  end

  factory :second_label, class: Label do
    name { "テストラベル2" }
  end

  factory :third_label, class: Label do
    name { "テストラベル3" }
  end

end
