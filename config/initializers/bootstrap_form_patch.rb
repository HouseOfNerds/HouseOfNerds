# frozen_string_literal: true

# Make route methods available in the model validations
ActionView::Base.send(:include, Rails.application.routes.url_helpers)

module BootstrapForm
  class FormBuilder < ActionView::Helpers::FormBuilder
    def generate_help(name, help_text)
      if has_error?(name) && inline_errors
        help_text = get_error_messages(name)
        help_klass = 'form-control-feedback'
      end
      return if help_text == false

      help_klass ||= 'form-text text-muted'
      help_text ||= get_help_text_by_i18n_key(name)

      content_tag(:span, help_text.html_safe, class: help_klass) if help_text.present? # rubocop:disable Rails/OutputSafety
    end
  end
end
