class CreateTableTrackings < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS trackings (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(255) DEFAULT NULL COMMENT 'This field will store the users email address if he/she is login',
  name varchar(255) DEFAULT NULL COMMENT 'It will store user name',
  url varchar(255) DEFAULT NULL COMMENT 'It will store url that user hits',
  browser varchar(255) DEFAULT NULL COMMENT 'It will store browser name used by the user',
  browser_version varchar(255) DEFAULT NULL COMMENT 'It will store browser version used by the user',
  ip_address varchar(255) DEFAULT NULL COMMENT 'This field will store the IP address',
  os varchar(255) DEFAULT NULL COMMENT 'This field will store the details of operating system',
  user_agent varchar(255) DEFAULT NULL COMMENT 'This field will store the version of operating system',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=878 ;
SQL
  end

  def down
    execute <<SQL
   DROP TABLE IF EXISTS trackings
SQL

  end
end

