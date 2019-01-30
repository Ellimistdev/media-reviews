class IdentityValidator < ActiveModel::Validator
  def validate(record)    
    if record.identities.blank?
      if record.username.blank? && record.email.blank?
        record.errors[:base] << 'This user must have at least one username, email, or social identity'
      end
      record.errors[:base] << 'Users must have a password when created via username/email' if record.password_digest.blank?
    end
    record = enforce_unique(record)
  end

  # allow nil if users have identity
  def enforce_unique(record)
    # if submitting a username and an existing username is found, verify that the found user and submitted user are the same
    username_id = User.find_by(username: record.username)&.id
    email_id = User.find_by(email: record.email)&.id
    record.errors[:username] << 'Username already exists!' if !record.username.blank? && (!username_id.nil? && username_id != record.id)
    record.errors[:email] << 'Email already exists!' if !record.email.blank? && (!email_id.nil? && email_id != record.id)
    record
  end
end
