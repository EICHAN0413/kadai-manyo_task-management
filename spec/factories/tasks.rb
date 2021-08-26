FactoryBot.define do
    factory :task do
      title { 'テスト１' }
      content { 'Factoryで作ったデフォルトのコンテント１' }
      end_date { '2021-09-01' }
      priority { '高' }
      status { '着手中' }
    end
    factory :second_task, class: Task do
      title { 'テスト２' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
      end_date { '2021-10-01' }
      priority { '中' }
      status { '未着手' }
    end
  end