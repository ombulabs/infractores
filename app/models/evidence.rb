class Evidence < ActiveRecord::Base
  mount_uploader :media, EvidenceUploader
end
