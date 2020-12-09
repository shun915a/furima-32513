require 'rails_helper'

RSpec.describe 'Users', type: :system do
  # FactoryBotのインスタンスを生成
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示される' do
    # トップページへ移動
    visit root_path

    # 新規登録とログインボタンを確認
    expect(page).to have_content('新規登録')
    expect(page).to have_content('ログイン')
  end

  it 'ログイン状態では、ヘッダーにニックネーム、ログアウトボタンが表示される' do
    # トップページへ移動
    visit root_path

    # ログインをクリック
    click_on 'ログイン'

    # ログイン
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'ログイン'

    # トップページにいるか確認
    expect(current_path).to eq root_path

    # ニックネームとログアウトボタンを確認
    expect(page).to have_content(@user.nickname)
    expect(page).to have_content('ログアウト')
  end

  it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページへ遷移できる' do
    # トップページへ移動
    visit root_path
    # 新規登録をクリック
    click_on '新規登録'
    # 新規登録ページに移動したか確認
    expect(current_path).to eq new_user_registration_path

    # トップページへ移動
    visit root_path

    # ログインをクリック
    click_on 'ログイン'

    # ログインページへ移動したか確認
    expect(current_path).to eq new_user_session_path
  end

  it 'ヘッダーのログアウトボタンをクリックすることでログアウトができる' do
    # トップページへ移動
    visit root_path

    # ログインをクリック
    click_on 'ログイン'

    # ログインする
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'ログイン'

    # トップページへ移動したか確認
    expect(current_path).to eq root_path

    # ログアウトをクリック
    click_on 'ログアウト'

    # トップページに移動したか確認
    expect(current_path).to eq root_path

    # ログアウトできたか確認
    expect(page).to have_no_content('ログアウト')
  end
end
