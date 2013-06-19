class CreateTableMailQueues < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS mail_queues (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) DEFAULT '0',
  product_id int(11) DEFAULT '0',
  sendgrid_status int(2) DEFAULT '0' COMMENT '1:sent from system, 2:Processed on sendgrid, 3:Delivered,  4:Dropped, 5:Deferred, 6:Bounce,  7:Open, 8:Click',
  email_type int(2) DEFAULT '0' COMMENT '1:psa assigned to product, 2:PA assigned to product, 3:PSA changed,  4:Invite Job Role, 5:Add User, 6:Change Email,  7:Reset Password',
  data text NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1364989083 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS mail_queues
SQL
  end
end
