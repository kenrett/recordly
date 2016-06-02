require "rails_helper"

describe "When visiting the home page", type: :feature do

  context "if not logged in" do
    it "show sign up and sign in links" do
      visit "/"

      expect(page).to have_content("Welcome to Recordly")
      expect(page).to have_link("Sign up now!")
      expect(page).to have_link("Sign in!")
    end
  end

  context "when signing up" do
    before(:each) do
      visit "/"
      click_link("Sign up now!")

      expect(page).to have_content("Sign up")
      expect(page).to have_content("(8 characters minimum)")

      fill_in 'user_email', with: 'Bob@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'

      click_button("Sign up")
    end

    it "they can sign up if they are a new user" do
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    it "they get an error if they already have an account" do
      click_link("Log Out")
      click_link("Sign up now!")

      fill_in 'user_email', with: 'Bob@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'

      click_button("Sign up")

      expect(page).to have_content("Email has already been taken")
    end

    it "if already logged in it shows a nav menu" do
      visit "/"

      expect(page).to have_content("Welcome back")
    end
  end
end

describe "when visiting the album index" do
  before(:each) do
    @user = User.create(email: "jim@example.com", password: "password", password_confirmation: "password")
    @album = Album.create(title: "Fancy Name", artist: "U2", genre: "Pop, Rock")
    visit "/albums"
  end

  it "shows all albums" do
    expect(page).to have_content("All Albums")
    expect(page).to have_content(@album.title)
    expect(page).to have_content(@album.artist)
  end

  it "user can favorite albums" do
    find("span.glyphicon").click

    expect(page).to have_css(".glyphicon-star")
  end
end