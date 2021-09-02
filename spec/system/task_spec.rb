require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
    
    
    describe '一覧表示機能' do
        before do
            @user = FactoryBot.create(:user)
            visit new_session_path
            fill_in "Email", with: @user.email
            fill_in "Password", with: @user.password
            click_on "ログイン"
            FactoryBot.create(:task, user: @user) 
            FactoryBot.create(:second_task, user: @user) 
            FactoryBot.create(:third_task, user: @user)
            visit tasks_path
        end
        
        context '一覧画面に遷移した場合' do
            it '作成済みのタスク一覧が表示される' do
                expect(page).to have_content 'Factoryで作ったデフォルトのコンテント3'
            end
        end

        context 'タスクが作成日時の降順に並んでいる場合' do
            it '新しいタスクが一番上に表示される' do  
                task_list = all(".task_row") 
                expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのコンテント3' 
            end
        end

        context '終了期限でソートされる場合' do
            it '終了期限の降順に並び替えられたタスク一覧が表示される' do
                click_on '終了期限でソートする'
                task_list = all('.task_row') 
                expect(task_list[0]).to have_content '2021-11-01'
                expect(task_list[1]).to have_content '2021-10-01'
            end
        end

        context '優先順位でソートされる場合' do
            it '優先順位の高い順に並び替えられたタスク一覧が表示される' do
                click_on '優先順位でソートする'
                task_list = all('.task_row') 
                expect(task_list[0]).to have_content '高'
                expect(task_list[1]).to have_content '中'
            end
        end
        


        context 'タイトルであいまい検索をした場合' do
            it "検索キーワードを含むタスクで絞り込まれる" do
                 fill_in "title", with: 'テスト1'
                 click_on 'search'
                 expect(page).to have_content 'テスト1'
            end
        end

        context 'ステータス検索をした場合' do
            it "ステータスに完全一致するタスクが絞り込まれる" do
                select "着手中", from: 'status'
                click_on 'search'
                expect(page).to have_content '着手中'
            end
        end
          
        context 'タイトルのあいまい検索とステータス検索をした場合' do
            it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
                fill_in "title", with: 'テスト1'
                select "着手中", from: 'status'
                click_on 'search'
                expect(page).to have_content 'テスト1'
                expect(page).to have_content '着手中'
            end
        end
    end

    describe '新規作成機能' do
        
        before do
            @user = FactoryBot.create(:user)
            visit new_session_path
            fill_in "Email", with: @user.email
            fill_in "Password", with: @user.password
            click_on "ログイン"
            FactoryBot.create(:task, user: @user) 
            FactoryBot.create(:second_task, user: @user) 
            FactoryBot.create(:third_task, user: @user)
            visit tasks_path
        end

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
                @user = FactoryBot.create(:user)
                visit new_session_path
                fill_in "Email", with: @user.email
                fill_in "Password", with: @user.password
                click_on "ログイン"
                task = FactoryBot.create(:task, title: 'task', end_date: '2021-11-01', user: @user)
                visit task_path(task)
                expect(page).to have_content 'task'
                expect(page).to have_content '2021-11-01'
            end
        end
    end

end