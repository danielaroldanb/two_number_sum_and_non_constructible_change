# frozen_string_literal: true

# ChallengeOneController handles the logic for Challenge Two.
class ChallengeTwoController < ApplicationController
  def non_constructible_change; end

  def calculate_non_constructible_change
    if input_valid?
      @minimum_sum_of_money = []
      @coins_array = @coins.scan(/\d+/).map(&:to_i)
      find_minimum_sum_of_money
    else
      flash.now[:alert] = coins.nil? ? 'The minimum sum of money that cannot be created for no coins is 1' : 'Input invalid format'
    end

    render :non_constructible_change
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def find_minimum_sum_of_money
    maximum = @coins_array.max

    (1..maximum).map do |target|
      combination_found = @coins_array
                          .map
                          .with_index { |_coin, index| @coins_array.combination(index.succ).to_a.select { |comb| comb.sum == target } }
      @minimum_sum_of_money.push(target) if combination_found.flatten.empty?
    end

    @minimum_sum_of_money = if @minimum_sum_of_money.empty?
                              @coins_array.sum + 1
                            else
                              @minimum_sum_of_money.first
                            end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def input_valid?
    coins&.match?(/\A[1-9]\d*(,\s*[1-9]\d*)*\z/)
  end

  private

  def coins
    @coins = params[:coins].present? ? params.require(:coins) : nil
  end
end
