require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
    

    describe 'ユーザ登録のテスト' do
        
        context 'ログインしていない場合' do
            it '新規登録ができること' do
                visit new_user_path
                fill_in "名前", with:'テスト1'
                fill_in "メールアドレス", with:'samplemail@gmail.com'
                fill_in "パスワード", with:'11111111'
                fill_in "確認用パスワード", with:'11111111'
                click_on '新規登録'
                expect(page).to have_content 'テスト1'
            end
            
            it 'タスク画面に飛ぶとログイン画面に戻るテスト' do
                visit tasks_path
                expect(current_path).to eq new_session_path
            end
        end
    end

    describe 'session機能テスト' do
        before do
            visit new_user_path
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
        end

        context 'ログインしていない状態でユーザデータがある場合' do
            it 'ログインできること' do
                visit new_session_path
                fill_in "Email", with: @user.email
                fill_in "Password", with: @user.password
                click_on "ログイン"
                expect(page).to have_content 'タスク一覧'
            end
        end

        context 'ログインしている場合' do
        before do
            visit new_session_path
                fill_in "Email", with: @user.email
                fill_in "Password", with: @user.password
                click_on "ログイン"
        end

        it '自分の詳細画面に飛べること' do
            visit user_path(id: @user.id)
            expect(current_path).to eq user_path(id: @user.id)
        end

        it '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること' do
            visit user_path(id: @second_user.id)
            expect(current_path).to eq tasks_path
        end

        it 'ログアウトできること' do
            click_on "Logout"
            expect(current_path).to eq new_session_path
        end
        end
    end

    describe '管理画面のテスト' do
        before do
            visit new_user_path
            @user = FactoryBot.create(:user)
            @second_user = FactoryBot.create(:second_user)
        end
        
        context '管理ユーザの作成' do
            it '管理者は管理画面にアクセスできる' do
                visit new_session_path
                fill_in "Email", with: @second_user.email
                fill_in "Password", with: @second_user.password
                click_on "ログイン"
                visit admin_users_path
                expect(page).to have_content "管理者画面"  
            end
        end

        context '一般ユーザがログインしている場合' do
            it '一般ユーザは管理画面にアクセスできないこと' do
                visit new_session_path
                fill_in "Email", with: @user.email
                fill_in "Password", with: @user.password
                click_on "ログイン"
                visit admin_users_path
                expect(page).to have_content "タスク一覧" 
            end
        end

        context '管理ユーザがログインしている場合' do

            before do
                visit new_session_path
                fill_in "Email", with: @second_user.email
                fill_in "Password", with: @second_user.password
                click_on "ログイン"
                visit admin_users_path
            end

            it '管理ユーザはユーザの新規登録ができること' do
                visit new_admin_user_path
                fill_in "名前", with: 'テスト3'
                fill_in "メールアドレス", with: 'sample3@gmail.com'
                fill_in "パスワード", with:'33333333'
                fill_in "確認用パスワード", with:'33333333'
                click_on '登録する'
                expect(page).to have_content "テスト3" 
            end

            it '管理ユーザはユーザの詳細画面にアクセスできること' do
                visit admin_user_path(id: @user.id)
                expect(page).to have_content "sample@gmail.com"
            end

            it '管理ユーザはユーザの編集画面からユーザを編集できること' do
                visit edit_admin_user_path(id: @user.id)
                fill_in "名前", with: 'テスト4'
                fill_in "メールアドレス", with: 'sample4@gmail.com'
                fill_in "パスワード", with:'44444444'
                fill_in "確認用パスワード", with:'44444444'
                click_on '更新する'
                expect(page).to have_content "テスト4"
            end

            it '管理ユーザはユーザの削除をできること' do
                click_link "削除", match: :first
            end
        end




    end
end