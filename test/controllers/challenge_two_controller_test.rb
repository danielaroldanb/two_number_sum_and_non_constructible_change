# frozen_string_literal: true

require 'test_helper'

class ChallengeTwoControllerTest < ActionDispatch::IntegrationTest
  test 'The path is correct' do
    post non_constructible_change_path, params: { coins: fixture_coins }
    assert_equal '/non_constructible_change', request.path
  end

  test 'response is the minimum amount of money that cannot be created' do
    post non_constructible_change_path, params: { coins: fixture_coins }
    assert_response :success

    assert_match 'The minimum sum of money that cannot be created for coins [1, 2, 5] is 4', response.body
  end

  test 'response is the minimum amount of money that cannot be created when the coins are a sequence' do
    post non_constructible_change_path, params: { coins: fixture_coins_sequence }
    assert_response :success

    assert_match 'The minimum sum of money that cannot be created for coins [1, 2, 3] is 7', response.body
  end

  test "response is 1 when the coins doesn't include 1" do
    post non_constructible_change_path, params: { coins: fixture_coins_without_one }
    assert_response :success

    assert_match 'The minimum sum of money that cannot be created for coins [2, 3] is 1', response.body
  end

  test 'a flash message is showed when non coins are given' do
    post non_constructible_change_path, params: { coins: fixture_no_coins }
    assert_response :success

    assert_not flash.empty?
    assert_equal 'The minimum sum of money that cannot be created for no coins is 1', flash[:alert]
  end

  test 'a flash message is showed when input is not valid' do
    post non_constructible_change_path, params: { coins: fixture_invalid_coins }
    assert_response :success

    assert_not flash.empty?
    assert_equal 'Input invalid format', flash[:alert]
  end

  private

  def fixture_coins
    '1, 2, 5'
  end

  def fixture_coins_sequence
    '1, 2, 3'
  end

  def fixture_coins_without_one
    '2, 3'
  end

  def fixture_invalid_coins
    '2, 7, 15, 0'
  end

  def fixture_no_coins
    ''
  end
end
