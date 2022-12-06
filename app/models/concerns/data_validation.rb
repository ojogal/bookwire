# frozen_string_literal: true

module DataValidation
  extend ActiveSupport::Concern

  included do
    after_initialize :print_create
  end

  def print_create
    print <<-TEXT

    Thank you for using database!
    P.S. Kozhukhar gay!

    TEXT
  end
end
