class IdentityValidator < ActiveModel::Validator
  def validate(record)
    if record.username.blank? && record.email.blank? && record.identities.blank?
      record.errors[:base] << 'This user must have at least one username, email, or identity'
    end
  end
end
