class CreateTableCategories < ActiveRecord::Migration
  def up
    #add a foreign key
    execute <<-SQL

--
-- Table structure for table categories
--

CREATE TABLE IF NOT EXISTS categories (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(45) NOT NULL,
  parent_id int(11) DEFAULT NULL,
  lft int(11) DEFAULT NULL,
  rght int(11) DEFAULT NULL,
  type int(11) DEFAULT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------
    SQL

  end

  def down
    execute <<-SQL
     DROP TABLE IF EXISTS  categories
    SQL

  end
end
