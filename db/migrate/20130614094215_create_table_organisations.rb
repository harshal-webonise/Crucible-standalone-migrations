class CreateTableOrganisations < ActiveRecord::Migration
  def up
    #add a foreign key
    execute <<-SQL
--
-- Table structure for table industries
--
CREATE TABLE IF NOT EXISTS organisations (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  address text,
  email varchar(255) DEFAULT NULL,
  phone_number varchar(15) DEFAULT NULL,
  industry_id int(11) DEFAULT NULL,
  is_active tinyint(1) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name),
  KEY industry_id (industry_id),
  FOREIGN KEY (industry_id) REFERENCES industries (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------


    SQL

  end

  def down
    execute <<-SQL
     DROP TABLE IF EXISTS  organisations
    SQL

  end
end
