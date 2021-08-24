FactoryBot.define do
    factory :task do
      title { 'テスト１' }
      content { 'Factoryで作ったデフォルトのコンテント１' }
    end
    factory :second_task, class: Task do
      title { 'テスト２' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
    end
  end