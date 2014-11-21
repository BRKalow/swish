require 'test_helper'

class FavoriteSnippetsControllerTest < ActionController::TestCase
  setup do
    @favorite_snippet = favorite_snippets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_snippets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_snippet" do
    assert_difference('FavoriteSnippet.count') do
      post :create, favorite_snippet: { snippet_id: @favorite_snippet.snippet_id, user_id: @favorite_snippet.user_id }
    end

    assert_redirected_to favorite_snippet_path(assigns(:favorite_snippet))
  end

  test "should show favorite_snippet" do
    get :show, id: @favorite_snippet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_snippet
    assert_response :success
  end

  test "should update favorite_snippet" do
    patch :update, id: @favorite_snippet, favorite_snippet: { snippet_id: @favorite_snippet.snippet_id, user_id: @favorite_snippet.user_id }
    assert_redirected_to favorite_snippet_path(assigns(:favorite_snippet))
  end

  test "should destroy favorite_snippet" do
    assert_difference('FavoriteSnippet.count', -1) do
      delete :destroy, id: @favorite_snippet
    end

    assert_redirected_to favorite_snippets_path
  end
end
