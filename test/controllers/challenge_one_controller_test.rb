# frozen_string_literal: true

require 'test_helper'

class ChallengeOneControllerTest < ActionDispatch::IntegrationTest
  test 'The path is correct' do
    post two_numbers_sum_path, params: { numbers: fixture_numbers, target: fixture_target }
    assert_equal '/two_numbers_sum', request.path
  end

  test 'response is successful when it finds at least one pair that sums up to the target' do
    post two_numbers_sum_path, params: { numbers: fixture_numbers, target: fixture_target }
    assert_response :success

    assert_equal 9, fixture_target, 'Sanity check'
    assert_match '[2, 7]', response.body
  end

  test 'response is successful when it finds several pairs that sums up to the target' do
    post two_numbers_sum_path, params: { numbers: fixture_numbers_with_two_matches, target: fixture_target }
    assert_response :success

    assert_equal 9, fixture_target, 'Sanity check'
    assert_match '[2, 7], [5, 4]', response.body
  end

  test 'response is an empty array when no values sum up to the target' do
    post two_numbers_sum_path, params: { numbers: fixture_numbers, target: 1 }
    assert_response :success

    assert_match '[]', response.body
  end

  test 'a flash message is showed when target is not valid' do
    post two_numbers_sum_path, params: { numbers: fixture_numbers_with_two_matches, target: fixture_invalid_target }
    assert_response :success

    assert_match '[]', response.body
    assert_not flash.empty?
    assert_equal 'Input invalid format', flash[:alert]
  end

  test 'a flash message is showed when given numbers are not valid' do
    post two_numbers_sum_path, params: { numbers: fixture_invalid_numbers, target: fixture_target }
    assert_response :success

    assert_match '[]', response.body
    assert_not flash.empty?
    assert_equal 'Input invalid format', flash[:alert]
  end

  test 'raises an exception with numbers are nil' do
    assert_raises(ActionController::ParameterMissing) do
      post two_numbers_sum_path, params: { numbers: nil, target: fixture_target }
    end
  end

  test 'raises an exception with target is nil' do
    assert_raises(ActionController::ParameterMissing) do
      post two_numbers_sum_path, params: { numbers: fixture_numbers, target: nil }
    end
  end

  private

  def fixture_numbers
    '2, 7, 11, 15'
  end

  def fixture_numbers_with_two_matches
    '2, 7, 11, 15, 5, 4'
  end

  def fixture_invalid_numbers
    '2, 7, 11, 15, 0'
  end

  def fixture_target
    9
  end

  def fixture_invalid_target
    'asaf'
  end
end
