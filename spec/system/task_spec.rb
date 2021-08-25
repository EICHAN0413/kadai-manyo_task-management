require 'rails_helper'

describe 'タスク管理機能', type: :system do
    
  
    describe '一覧表示機能' do
        let!(:task) { FactoryBot.create(:task, title: 'task3') }
        before do
            task = FactoryBot.create(:task, title: 'タスク1') 
            task = FactoryBot.create(:task, title: 'タスク2') 
            task = FactoryBot.create(:second_task, title: 'task')
            task = FactoryBot.create(:second_task, title: 'task2')
            visit tasks_path
        end
        
        context '一覧画面に遷移した場合' do
            it '作成済みのタスク一覧が表示される' do
                expect(page).to have_content 'task'
            end
        end

        context 'タスクが作成日時の降順に並んでいる場合' do
            it '新しいタスクが一番上に表示される' do  
                task_list = all(".task_row") 
                expect(task_list[0]).to have_content 'task2' 
            end
        end

        context 'タイトルであいまい検索をした場合' do
            it "検索キーワードを含むタスクで絞り込まれる" do
                 fill_in "title", with: 'タスク1'
                 click_on 'search'
                 sleep 10
                 expect(page).to have_content 'タスク1'
            end
        end
    end

    describe '新規作成機能' do
        context 'タスクを新規作成した場合' do
            it '作成したタスクが表示される' do
                visit new_task_path
                fill_in "task_title", with: 'テスト'
                fill_in "task_content", with: 'テストタスク'
                click_on '完了'
                expect(page).to have_content 'テスト'
                expect(page).to have_content 'テストタスク'
            end
        end
    end
  
    describe '詳細表示機能' do
        context '任意のタスク詳細画面に遷移した場合' do
            it '該当タスクの内容が表示される' do
                task = FactoryBot.create(:task, title: 'task')
                visit task_path(task.id)
                expect(page).to have_content 'task'
            end
        end
    end

end