require 'test_helper'

class AnimeWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime_widget = anime_widgets(:one)
  end

  test "should get index" do
    get anime_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_widget_url
    assert_response :success
  end

  test "should create anime_widget" do
    assert_difference('AnimeWidget.count') do
      post anime_widgets_url, params: { anime_widget: { description: @anime_widget.description, image: @anime_widget.image, rating: @anime_widget.rating, title: @anime_widget.title } }
    end

    assert_redirected_to anime_widget_url(AnimeWidget.last)
  end

  test "should show anime_widget" do
    get anime_widget_url(@anime_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_widget_url(@anime_widget)
    assert_response :success
  end

  test "should update anime_widget" do
    patch anime_widget_url(@anime_widget), params: { anime_widget: { description: @anime_widget.description, image: @anime_widget.image, rating: @anime_widget.rating, title: @anime_widget.title } }
    assert_redirected_to anime_widget_url(@anime_widget)
  end

  test "should destroy anime_widget" do
    assert_difference('AnimeWidget.count', -1) do
      delete anime_widget_url(@anime_widget)
    end

    assert_redirected_to anime_widgets_url
  end
end
