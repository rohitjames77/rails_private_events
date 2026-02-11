# Private Events

A private event management application built with Ruby on Rails that allows users to create events and manage attendees. A simplified, private version of Eventbrite where users can create events, invite others, and track their attendance.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Database Schema](#database-schema)
- [What I Built](#what-i-built)
- [Challenges ](#challenges)
- [What I Learned](#what-i-learned)
- [Future Improvements](#future-improvements)

---

## Overview

This project was the introduction to ActiveRecord associations in Rails. Modeling many-to-many relationships -  handling the relationship between users and events where a user can create events AND attend events created by others.

I built this as part of The Odin Project's Ruby on Rails curriculum, focusing on associations, foreign keys, and database design.

---

## Features

### User Authentication
- User registration and login with Devise
- Secure password handling
- User profiles showing created and attended events

### Event Management
- Create new events with date and location
- View all events (separated into past and upcoming)
- Event details page showing attendees
- Edit and delete events (creator only)

### Attendances
- Attend public events
- View list of event attendees
- Remove yourself from events you're attending
- Track past and upcoming events separately

### Navigation
- Clean navigation across all pages
- Easy access to your created events and attended events
- Past/upcoming event filtering

---

## Technologies Used

- **Ruby on Rails** - Web application framework
- **PostgreSQL** - Database
- **Devise** - User authentication
- **ActiveRecord** - ORM and associations
- **ERB** - View templating
- **CSS** - Styling
-**Rubocop** - Linting 
---

## Installation

```bash
# Clone the repository
git clone https://github.com/rohitjames77/rails-private-events.git

# Navigate to project directory
cd private-events

# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate

# (Optional) Seed database with sample data
rails db:seed

# Start the server
rails server

# Visit http://localhost:3000
```

---

## Database Schema

### Users
- Has many created events (as creator)
- Has many attended events (through attendances)

### Events
- Belongs to a creator (User)
- Has many attendees (through attendances)
- Attributes: title, description, date, location

### Attendances (Join Table)
- Belongs to an attendee (User)
- Belongs to an event
- Manages the many-to-many relationship between users and events

This schema allows users to both create events and attend events created by others, which required careful naming of associations and foreign keys.

---

## Challenges

### Modeling the Many-to-Many Relationship
The hardest part wasn't just that users and events have a many-to-many relationship - it was that users interact with events in TWO different ways: as creators and as attendees. Carefully naming my associations and specifying foreign keys to avoid confusion.

### Building the Attendance Interface
Creating a clean way for users to attend/leave events required:
- A separate EventAttendancesController
- Proper routing for creating and destroying attendances
- View logic to show "Attend" or "Leave" buttons based on current state


### Private Events and Invitations
Adding the privacy layer meant:
- Another join table for invitations
- Logic to check if a user can view/attend a private event
- UI to handle invitation creation and acceptance

This added complexity to the already intricate association setup.

---

## What I Learned

### ActiveRecord Associations 
Rails' association system can handle complex relationships, but you need to be explicit about what you want. The magic defaults are great for simple cases, but they break down when you have multiple associations between the same models.

### Database Design 
Thinking through the data model before writing code saved me from major refactoring later. Drawing out the relationships helped me understand what tables and foreign keys I needed.

### Naming Is Important
Using clear, descriptive names for associations (`created_events` vs `attended_events`) made the code much more readable and prevented bugs.

### Scopes Keep Controllers Clean
Moving query logic into model scopes made my controllers simpler and my code more reusable. Instead of complex queries in multiple places, I could just call `Event.upcoming`.

### Many-to-Many Relationships Need Join Tables
I got hands-on experience with join tables and understood why they're necessary. The EventAttendances table acts as a bridge, storing the relationships between users and events.

### Devise Handles the Hard Parts
User authentication is complex, but Devise handles most of it. I learned to work with Devise's conventions and customize where needed.

---

## Future Improvements

### User Experience
- Add event search and filtering by location or date
- Implement pagination for event lists
- Add email notifications for event reminders and invitations
- Create a dashboard showing upcoming events at a glance
- Add event categories or tags

### Features
- Allow event creators to set maximum attendance limits
- Add comments or discussion threads for events
- Implement a calendar view of events
- Add the ability to create recurring events
- Allow users to add events to their Google Calendar

---
---

## Contact

**Rohit James**

- GitHub: [@rohitjames77](https://github.com/rohitjames77)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

---
