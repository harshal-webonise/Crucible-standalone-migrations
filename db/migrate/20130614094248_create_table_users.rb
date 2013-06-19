class CreateTableUsers < ActiveRecord::Migration
  def up
    #add a foreign key
    execute <<-SQL

--
-- Table structure for table users
--

CREATE TABLE IF NOT EXISTS users (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  user_title varchar(255) DEFAULT NULL,
  image varchar(255) DEFAULT NULL,
  phone_number varchar(15) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  dob date DEFAULT NULL,
  show_instruction tinyint(1) DEFAULT '0',
  assesment_instruction tinyint(1) DEFAULT '0',
  organisation_id int(11) NOT NULL,
  is_verified tinyint(1) DEFAULT '0',
  verify_token varchar(255) DEFAULT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_email_change tinyint(1) DEFAULT '0' COMMENT 'This field is added to get know that user email address change or not',
  is_deleted tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=950 ;

-- --------------------------------------------------------
    SQL

  end

  def down
    execute <<-SQL
     DROP TABLE IF EXISTS  users
    SQL

  end
end
