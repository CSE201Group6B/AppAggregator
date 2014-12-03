class App < ActiveRecord::Base
  default_scope {where(approved: true)}
end