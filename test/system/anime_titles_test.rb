require "application_system_test_case"

class AnimeTitlesTest < ApplicationSystemTestCase
  setup do
    @anime_title = anime_titles(:one)
  end

  test "visiting the index" do
    visit anime_titles_url
    assert_selector "h1", text: "Anime titles"
  end

  test "should create anime title" do
    visit anime_titles_url
    click_on "New anime title"

    fill_in "Ave value", with: @anime_title.ave_value
    fill_in "File", with: @anime_title.file
    fill_in "Name", with: @anime_title.name
    fill_in "Theme", with: @anime_title.theme_id
    click_on "Create Anime title"

    assert_text "Anime title was successfully created"
    click_on "Back"
  end

  test "should update Anime title" do
    visit anime_title_url(@anime_title)
    click_on "Edit this anime title", match: :first

    fill_in "Ave value", with: @anime_title.ave_value
    fill_in "File", with: @anime_title.file
    fill_in "Name", with: @anime_title.name
    fill_in "Theme", with: @anime_title.theme_id
    click_on "Update Anime title"

    assert_text "Anime title was successfully updated"
    click_on "Back"
  end

  test "should destroy Anime title" do
    visit anime_title_url(@anime_title)
    click_on "Destroy this anime title", match: :first

    assert_text "Anime title was successfully destroyed"
  end
end
