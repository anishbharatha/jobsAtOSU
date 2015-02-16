class WelcomeController < ApplicationController
  require 'feedjira'
  helper_method :sort_column, :sort_direction, :send_email
  $view_field = 'list'
  $mesg=''

  def index
    # To fetch the atom feed for the first time
    initial_feed

    # Verifies for any search keyword and responds accordingly
    @entries = params[:search]&&params[:search]!='*'?searchable(params[:search]).paginate(:page => params[:page], :per_page => 50):
              Jobs.order(sort_column+' '+sort_direction).paginate(:page => params[:page], :per_page => 50)
  end

  # Method to support the view switching functionality
  def change_view
    $view_field = params[:view]
    redirect_to root_path
  end

  # Method to email the job details
  def email_job
    send_email(params[:email_id], params[:job_id])
    flash[:success]='Email has been successfully sent.'
    redirect_to root_path
  end

  # Method to provide email channel to Jobs Dept. to interested user
  def contact_us
    $mesg = params[:msg]
    send_email('anish.bharata@gmail.com','')
    flash[:success]='Your message has been successfully sent.'
    redirect_to root_path
  end

  private
  # Private method to perform search operation
  def searchable(keyword)
    Jobs.where('CAST(id AS TEXT) LIKE ? OR LOWER(title) LIKE LOWER(?) OR LOWER(author) LIKE LOWER(?)','%'+keyword+'%','%'+keyword+'%','%'+keyword+'%')
  end

  # Private method to perform initial fetch from Atom feed
  def initial_feed
    if(Jobs.count==0)
      Jobs.update_from_feed('https://www.jobsatosu.com/all_jobs.atom.xml')
    end
  end

  # Private method to sort the column values alphabetically
  def sort_column
    Jobs.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  # Private method to enable sorting in both ascending & descending directions
  def sort_direction
    #params[:direction]?params[:direction]:'asc'
    %w[asc desc].include?(params[:direction])?params[:direction] : 'asc'
  end

  # Private method to send email through SEND GRID
  def send_email(email_id, job_id)
    # As a hash
    @temp = Jobs.where(:id=>job_id).first
    client = SendGrid::Client.new(api_user: ''+ENV['SENDGRID_USERNAME'], api_key: ''+ENV['SENDGRID_KEY'])
    if !$mesg.blank?
      client.send(SendGrid::Mail.new(to: email_id, from: 'JobsatOSU', subject: 'JobsatOSU-Contact Us Page',
                                     text:'JobsatOSU-Contact Us Page', html: $mesg.to_s ))
    else
      client.send(SendGrid::Mail.new(to: email_id, from: 'Jobsatosu.com',
                                     subject: 'OSU Looking For '+@temp.title.to_s,
                                     text:'OSU Job Alert '+@temp.title.to_s,
                                     html: '<h3>Title: '+@temp.title.to_s+'</h3>'+
                                       '<h3>Posted by: '+@temp.author.to_s+'</h3> at '+@temp.created_at.to_s+
                                       '<p class=\'text-justify\'>Description: '+@temp.content.to_s+'</p>'+
                                       'Interested? <a href='+@temp.link.to_s+' target=\'_blank\'>Click here for more details.</a>'+
                                       '<p>--Thank you for your interest in OSU.</p><p>Sent to you by JobsAtOSU.</p>' ))
    end
  end

end
