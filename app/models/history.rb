class History < ActiveRecord::Base
  serialize :backtrace
  serialize :params

  before_save :generate_secure_id

  def self.sample_params
    file = File.read(Rails.root.join('sample.json'))
    json = JSON.parse(file)
    ActionController::Parameters.new(json)
  end

  def params=(params)
    super(params)

    self.error_id = error['id']                                        rescue nil
    self.message = error['error_message']                              rescue nil
    self.error_class = error['error_class']                            rescue nil
    self.file = error['file']                                          rescue nil
    self.line_number = error['line_number']                            rescue nil
    self.project_id = error['project']['id']                           rescue nil
    self.project_name = error['project']['name']                       rescue nil
    self.last_notice_id = error['last_notice']['id']                   rescue nil
    self.last_notice_request_url = error['last_notice']['request_url'] rescue nil
    self.backtrace = error['last_notice']['backtrace']                 rescue nil
    self.environment = error['environment']                            rescue nil
    self.first_occurred_at = Time.parse(error['first_occurred_at'])    rescue nil
    self.last_occurred_at = Time.parse(error['last_occurred_at'])      rescue nil
    self.times_occurred = error['times_occurred']                      rescue nil
  end

  def title
    "#{project_name} (#{environment})"
  end

  def last_occurrence_string
    self.last_occurred_at.
      in_time_zone.
      strftime("%m/%d/%Y %I:%M%p")
  end

  private

  def error
    self.params['error']
  end

  def generate_secure_id
    sid = SecureRandom.hex(100)
    if History.where(sid: sid).any?
      generate_secure_id
    else
      self.sid = sid
    end
  end
end
