FactoryBot.define do
    factory :task do
      title { 'テスト1' }
      content { 'Factoryで作ったデフォルトのコンテント１' }
      end_date { '2021-09-01' }
      priority { '高' }
      status { '着手中' }
      association :user
    end

    factory :second_task, class: Task do
      title { 'テスト2' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
      end_date { '2021-10-01' }
      priority { '中' }
      status { '未着手' }
      association :user
    end

    factory :third_task, class: Task do
      title { 'テスト3' }
      content { 'Factoryで作ったデフォルトのコンテント3' }
      end_date { '2021-11-01' }
      priority { '低' }
      status { '完了' }
      association :user
    end
  end