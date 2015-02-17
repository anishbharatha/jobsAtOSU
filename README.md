<h1> JobsAtOSU</h1>

Job portal application developed in Ruby on Rails.
This web app is built to strictly demonstrate jobs/careers at Ohio State University, Columbus, OH.
The same application is hosted and running in <i>Cloud Application Platform, Heroku</i> at <a href="https://sheltered-sierra-1264.herokuapp.com">JobsAtOSU</a>

Features:
   * <b>Sorting</b> the job position & department alphabetically and posted date chronologically
   * <b>Searching</b> the portal with job id, position and/or department
   * <b>Automatically updates/refreshes</b> the jobs from the OSU jobs ATOM feed
   * List and grid views with view switcher
   * <b>Email any job posting</b> to the provided Email id

Gems used:
   * <i>Feedjira-1.6.0</i> to fetch and parse the ATOM feed from OSU jobs portal
   * <i>Sendgrid-1.2.0</i> for implementing the Email feature
   * <i>Bootstrap-sass-3.3.3</i> for responsiveness and pretty UI
   * <i>Will-pagination-3.0.7</i> for arranging the jobs/search results for easy browsing
   * And few other gems (<i>sass-rails, rails, pg, jquery-rails</i>) for supporting the SASS code, database, etc
