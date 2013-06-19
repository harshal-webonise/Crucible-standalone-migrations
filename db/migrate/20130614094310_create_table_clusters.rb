class CreateTableClusters < ActiveRecord::Migration
  def up
    #add a foreign key
    execute <<-SQL
     --
-- Table structure for table clusters
--

CREATE TABLE IF NOT EXISTS clusters (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

    SQL

  end

  def down
    execute <<-SQL
     DROP TABLE IF EXISTS  clusters
    SQL

  end
end
