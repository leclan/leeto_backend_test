organisation = Organisation.create!(name: 'My Organisation Inc.')

Perk.create!(organisation: organisation, name: 'Theatre tickets', period: 3, maximum_amount: 30)
Perk.create!(organisation: organisation, name: 'Sport activities ', period: 12, maximum_amount: 100)

Employee.create!(
  organisation: organisation,
  email: 'john.doe@example.com',
  password: 'some_password',
  first_name: 'John',
  last_name: 'Doe',
  seniority: 6,
)
