# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Group has_many events) 
- [x] Include at least one belongs_to relationship (Event belongs_to Group)
- [x] Include at least two has_many through relationships (User has_many Groups through Memberships, User has_many Events through Attendances)
- [x] Include at least one many-to-many relationship (Group has_many Users through Memberships, Event has_many Users through Attendances)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (memberships.interests)
- [x] Include reasonable validations for simple model objects (User's email is unique, Group's name is unique, Event date hasn't passed)
- [x] Include a class level ActiveRecord scope method (Event.upcoming, Event.past)
- [x] Include signup (Devise/Registration)
- [x] Include login (Devise/Session)
- [x] Include logout (Devise/Session)
- [x] Include third party signup/login (Google login)
- [x] Include nested resource show or index (groups/:id/events/:id)
- [x] Include nested resource "new" form (groups/:id/events/new)
- [x] Include form display of validation errors (included in all forms)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate