class CreateTableIndustries < ActiveRecord::Migration
  def up
    #add a foreign key
    execute <<-SQL
--
-- Table structure for table industries
--

CREATE TABLE IF NOT EXISTS industries (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  is_active tinyint(1) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------


    SQL

  end

  def down
    execute <<-SQL
     DROP TABLE IF EXISTS  industries
    SQL

  end
end
