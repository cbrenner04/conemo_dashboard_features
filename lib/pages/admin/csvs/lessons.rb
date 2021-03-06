# frozen_string_literal: true
# module for expected headers in csvs
module LessonsCSV
  HEADERS = [
    'Id', 'Title', 'Day in treatment', 'Locale', 'Created at', 'Updated at',
    'Guid', 'Has activity planning', 'Pre planning content',
    'Post planning content', 'Non planning content', 'Feedback after days',
    'Planning response yes content', 'Planning response no content',
    'Non planning response content', 'Activity choices', 'Id [Slideshow]',
    'Title [Slideshow]', 'Created at [Slideshow]', 'Updated at [Slideshow]',
    'Id [Slides]', 'Title [Slides]', 'Body [Slides]', 'Position [Slides]',
    'Type [Slides]', 'Is title visible [Slides]', 'Created at [Slides]',
    'Updated at [Slides]', 'Id [Content access events]',
    'Accessed at [Content access events]', 'Created at [Content access events]',
    'Updated at [Content access events]',
    'Day in treatment accessed [Content access events]',
    'Lesson datum guid [Content access events]',
    'Dialogue datum guid [Content access events]',
    'Uuid [Content access events]', 'Client created at [Content access events]',
    'Client updated at [Content access events]', 'Id [Session events]',
    'Event type [Session events]', 'Occurred at [Session events]',
    'Created at [Session events]', 'Updated at [Session events]',
    'Uuid [Session events]', 'Client created at [Session events]',
    'Client updated at [Session events]', 'Id [Participants]',
    'First name [Participants]', 'Last name [Participants]',
    'Participant ID [Participants]', 'Family health unit [Participants]',
    'Telephone [Participants]', 'Home address [Participants]',
    'Birth date [Participants]', 'Gender [Participants]',
    'Status [Participants]', 'Emergency contact (name) [Participants]',
    'Telephone [Participants]', 'Date added to dashboard [Participants]',
    'Updated at [Participants]', 'Locale [Participants]',
    'Alternate phone 1 [Participants]', 'Alternate phone 2 [Participants]',
    'Contact person [Participants]', 'Relationship [Participants]',
    'If other, specify here [Participants]', 'Contact person [Participants]',
    'Relationship [Participants]', 'If other, specify here [Participants]',
    'Relationship [Participants]', 'If other, specify here [Participants]',
    'Address [Participants]', 'Cell phone [Participants]',
    'Cell phone [Participants]'
  ].freeze
end
