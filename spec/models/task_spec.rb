require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'scopeメソッドで検索をした場合' do
      
      let!(:task) { FactoryBot.create(:task, title: 'task') }
      let!(:second_task) { FactoryBot.create(:second_task, title: "sample") }

      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "scopeメソッドでタイトル検索ができる" do
        expect(Task.search_title('task')).to include(task)
        expect(Task.search_title('task')).not_to include(second_task)
        expect(Task.search_title('task').count).to eq 1
      end
    end

    context 'scopeメソッドでステータス検索をした場合' do
      it "scopeメソッドでステータス検索ができる" do
        expect(Task.search_status('着手中')).to include(task)
        expect(Task.search_status('着手中')).not_to include(second_task)
        expect(Task.search_status('着手中').count).to eq 1
      end
    end

    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "scopeメソッドでタイトルとステータスの両方が検索できる" do
        expect(Task.search_title('task').search_status('着手中').count).to eq 1
      end
    end


    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task =Task.new(title: 'task', content:'')
        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task =Task.new(title: 'task', content:'テスト')
        expect(task).to be_valid
      end
    end

  end
end
end