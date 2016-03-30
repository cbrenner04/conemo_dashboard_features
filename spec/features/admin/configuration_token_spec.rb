# filename: ./spec/features/admin/configuration__token_spec.rb

feature 'Admin, Configuration Token', metadata: :not_first do
  scenario 'Admin destroys configuration token'
  scenario 'Admin creates configuration token'
  scenario 'Admin disables authentication token'
  scenario 'Admin re-enables configuration token'
  scenario 'Admin destroys authentication token'
end

feature 'Spanish Admin, Configuration Token', metadata: :not_first do
  scenario 'Spanish Admin sees correct translations'
end

feature 'Portuguese Admin, Configuration Token', metadata: :not_first do
  scenario 'Portuguese Admin sees correct translations'
end
