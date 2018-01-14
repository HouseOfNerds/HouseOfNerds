# frozen_string_literal: true

oslo = Department.create! name: 'Oslo', domain: 'houseofnerds.no'
Administrator.where(email: 'uwe@kubosch.no').first_or_create!(name: 'Uwe Kubosch', department: oslo)
