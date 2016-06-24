# frozen_string_literal: true
# module for contact information form shared in pending and active pt
module ContactInformationForm
  include Capybara::DSL

  def selector
    all('.select2-container')
  end

  def response_selector
    all('.select2-result-label')
  end

  def select_response(choice)
    find('.select2-result-label', text: choice).click
  end

  def has_form_visible?
    has_css? '#participant_first_name'
  end

  def fill_in_first_name
    fill_in_field('first_name', @first_name)
  end

  def fill_in_last_name
    fill_in_field('last_name', @last_name)
  end

  def fill_in_study_id
    fill_in_field('study_identifier', @id)
  end

  def select_health_unit
    find('.select2-container', match: :first)
    selector[0].click
    response = (2..10).map { |unit_number| "unit #{unit_number}" }
    select_response(response.sample)
  end

  def fill_in_address
    fill_in_field('address', @address)
  end

  def fill_in_first_alt_phone
    fill_in_field('alternate_phone_1', @phone)
  end

  def fill_in_second_alt_phone
    fill_in_field('alternate_phone_2', @phone)
  end

  def choose_gender
    choose @gender
  end

  private

  def fill_in_field(field, item)
    fill_in "participant[#{field}]", with: item
  end
end
