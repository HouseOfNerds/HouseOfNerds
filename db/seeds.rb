# frozen_string_literal: true

Administrator.where(email: 'uwe@kubosch.no').first_or_create!(name: 'Uwe Kubosch')
