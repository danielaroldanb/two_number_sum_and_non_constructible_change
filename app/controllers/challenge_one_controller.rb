# frozen_string_literal: true

# ChallengeOneController handles the logic for Challenge One.
class ChallengeOneController < ApplicationController
  def two_numbers_sum; end

  def calculate_two_numbers_sum
    @matches = []

    if input_valid?
      @numbers_array = numbers.scan(/\d+/).map(&:to_i)

      find_two_numbers_sum
    else
      flash.now[:alert] = 'Input invalid format'
    end
    render :two_numbers_sum
  end

  def find_two_numbers_sum
    @numbers_array
      .map
      .with_index do |number, index|
      @numbers_array
        .slice((index.succ)..)
        .map { |other_number| @matches.push([number, other_number]) if target.to_i == number + other_number }
    end
  end

  def input_valid?
    numbers.match?(/\A[1-9]\d*(,\s*[1-9]\d*)*\z/) && target.match?(/\A[1-9]\d*\z/)
  end

  private

  def numbers
    params.require(:numbers)
  end

  def target
    @target = params.require(:target)
  end
end
