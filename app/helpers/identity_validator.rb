class IdentityValidator < ActiveModel::Validator
  def validate(record)    
    if record.identities.blank?
      if record.username.blank? && record.email.blank?
        record.errors[:base] << 'This user must have at least one username, email, or social identity'
      end
      record.errors[:base] << 'Users must have a password when created via username/email' if record.password_digest.blank?
      record = enforce_unique(record)
    end
  end

  # allow nil if users have identity
  def enforce_unique(record)
    record.errors[:username] << 'Username already exists!' if record.username && User.exists?(username: record.username)
    record.errors[:email] << 'Email already exists!' if record.email && User.exists?(email: record.email)
    record
  end
end
