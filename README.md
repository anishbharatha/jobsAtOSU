# jobsAtOSU

Job portal application developed in Ruby on Rails.
This is built to demonstrate jobs/careers at Ohio State University, Columbus, OH.

Features:
   * Sorting the job position & department alphabetically and posted date chronologically
   * Searching the portal with job id, position and/or department
   * Automatically updates/refreshes the jobs from the OSU jobs ATOM feed
   * List and grid views with view switcher
   * Email any job posting to the provided Email id

Gems used:
   * Feedjira to fetch and parse the ATOM feed from OSU jobs portal
   * Sendgrid for implementing the Email feature
   * Bootstrap for responsiveness and pretty UI
   * Pagination for arranging the jobs/search results for easy browsing
   * And few other gems for supporting the SASS code, database, etc
