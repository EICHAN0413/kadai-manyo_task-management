require 'rails_helper'

RSpec.describe 'ラベル管理機能', type: :system do

 

  describe 'ラベル管理' do

    before do
        @user = FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_on 'ログイン'
        FactoryBot.create(:task, user: @user)
        FactoryBot.create(:second_task, user: @user)
        FactoryBot.create(:third_task, user: @user)
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        FactoryBot.create(:third_label)
        visit tasks_path
      end

    context'ラベルを作成した際' do
      it 'ラベルが作成できる' do
        visit new_label_path
        fill_in "Name", with: 'テストラベル4'
        click_on '登録する'
        expect(page).to have_content 'テストラベル4'
      end
    end

    context'タスクを新規に作成した場合' do
        it 'タスクにラベルをつけられる' do
          visit new_task_path
          fill_in "タスク", with: "テスト4"
          fill_in "詳細", with: "Factoryで作ったデフォルトのコンテント4"
          check 'テストラベル1'
          click_on "完了"
        end
    end

    context 'ラベルで絞り込んで検索した場合' do
      it 'ラベルで検索が絞り込まれる' do
        visit tasks_path
        select "テストラベル3", from: 'label_id'
        click_on 'search'
        expect(page).to have_content 'テストラベル3'
      end
    end
  end
end