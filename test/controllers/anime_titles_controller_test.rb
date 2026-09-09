require "test_helper"

class AnimeTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime_title = anime_titles(:one)
  end

  test "should get index" do
    get anime_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_title_url
    assert_response :success
  end

  test "should create anime_title" do
    assert_difference("AnimeTitle.count") do
      post anime_titles_url, params: { anime_title: { ave_value: @anime_title.ave_value, file: @anime_title.file, name: @anime_title.name, theme_id: @anime_title.theme_id } }
    end

    assert_redirected_to anime_title_url(AnimeTitle.last)
  end

  test "should show anime_title" do
    get anime_title_url(@anime_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_title_url(@anime_title)
    assert_response :success
  end

  test "should update anime_title" do
    patch anime_title_url(@anime_title), params: { anime_title: { ave_value: @anime_title.ave_value, file: @anime_title.file, name: @anime_title.name, theme_id: @anime_title.theme_id } }
    assert_redirected_to anime_title_url(@anime_title)
  end

  test "should destroy anime_title" do
    assert_difference("AnimeTitle.count", -1) do
      delete anime_title_url(@anime_title)
    end

    assert_redirected_to anime_titles_url
  end
end
