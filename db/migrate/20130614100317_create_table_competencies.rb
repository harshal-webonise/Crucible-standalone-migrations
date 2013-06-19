class CreateTableCompetencies < ActiveRecord::Migration
  def up
    execute <<SQL
 --
-- Table structure for table competencies
--

CREATE TABLE IF NOT EXISTS competencies (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  category_id int(11) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  is_active tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name),
  KEY category_id (category_id),
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  competencies
SQL
  end
end
