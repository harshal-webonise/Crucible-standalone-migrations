class CreateTableProductBehaviorResponses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS product_behavior_responses (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_behavior_parameter_id int(11) DEFAULT '0',
  user_alias varchar(255) NOT NULL,
  manager_alias varchar(255) NOT NULL,
  response_number int(2) DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_behavior_parameter_id (product_behavior_parameter_id,response_number),
  FOREIGN KEY (product_behavior_parameter_id)
  REFERENCES product_behavior_parameters (id)
  ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS product_behavior_responses
SQL
  end
end

