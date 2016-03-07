# filename: ./spec/features/nurse/your_patients_spec.rb

feature 'Nurse, Your Patients' do
  scenario 'Nurse sees Your Patients upon login'
  scenario 'Nurse sees participants assigned to them listed in Your ' \
           'Patients table'
  scenario 'Nurse sees participants listed based on tasks due'
  scenario 'Nurse sees participants listed based on status of tasks'
  scenario 'Nurse sees participant with confirmation call task listed'
  scenario 'Nurse sees participant with initial in person appointment listed'
  scenario 'Nurse sees participant with follow up call week 1 listed'
  scenario 'Nurse sees participant with follow up call week 3 listed'
  scenario 'Nurse sees participant with call to schedule final appointment ' \
           'listed'
  scenario 'Nurse sees participant with final appointment listed'
  scenario 'Nurse sees participant with help request listed'
  scenario 'Nurse sees participant with non-connectivity call listed'
  scenario 'Nurse sees no adherence task for pt w connectivity task active'
  scenario 'Nurse sees participant with non-adherence call listed'
  scenario 'Nurse sees task count include confirmation call'
  scenario 'Nurse sees task count include initial in person appointment'
  scenario 'Nurse sees task count include follow up call week 1'
  scenario 'Nurse sees task count include follow up call week 3'
  scenario 'Nurse sees task count include call to schedule final appointment'
  scenario 'Nurse sees task count include final appointment'
  scenario 'Nurse sees task count include help request'
  scenario 'Nurse sees task count include non-connectivity call'
  scenario 'Nurse sees task count include non-adherence call'
  scenario 'Nurse sees green color-coding for participant who has all tasks ' \
           'resolved'
  scenario 'Nurse sees yellow color-coding for participant who has an ' \
           'active task'
  scenario 'Nurse sees red color-coding for participant with ' \
           'confirmation call scheduled before noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'initial in person appointment scheduled before noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'follow up call week 1 scheduled before noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'follow up call week 3 scheduled before noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'call to schedule final appointment scheduled before ' \
           'noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'final appointment scheduled before noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'help request scheduled before noon 2 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'non-connectivity call scheduled before noon 2 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'non-adherence call scheduled before noon 2 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'confirmation call scheduled after noon 4 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'initial in person appointment scheduled after noon 4 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'follow up call week 1 scheduled after noon 4 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'follow up call week 3 scheduled after noon 4 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'call to schedule final appointment scheduled after noon 4 days ' \
           'overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'final appointment scheduled after noon 4 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'help request scheduled after noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'non-connectivity call scheduled after noon 3 days overdue'
  scenario 'Nurse sees red color-coding for participant with ' \
           'non-adherence call scheduled after noon 3 days overdue'
  scenario 'Nurse sees scheduled tasks change when the initial ' \
           'in person appointment is rescheduled'
end
