class CreateTableKeyContacts < ActiveRecord::Migration
  def up
    execute <<SQL
--
-- Table structure for table key_contacts
--

CREATE TABLE IF NOT EXISTS key_contacts (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  job_title varchar(255) NOT NULL,
  aliases_level_id int(11) DEFAULT '0',
  linked_in varchar(255) DEFAULT NULL,
  twitter varchar(255) DEFAULT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY user_id (user_id,aliases_level_id),
  KEY aliases_level_id (aliases_level_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (aliases_level_id) REFERENCES aliases_levels (id) ON DELETE CASCADE


) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  key_contacts
SQL
  end
end
