class CreateOrganisationsLevels < ActiveRecord::Migration
  def up
  execute <<SQL
  CREATE TABLE IF NOT EXISTS organisations_levels (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL,
  level_id int(11) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY organisation_id (organisation_id,level_id),
  KEY level_id (level_id),
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE,
  FOREIGN KEY (level_id) REFERENCES levels (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;
SQL
  end

  def down
    execute <<SQL
  DROP TABLE if EXISTS  organisations_levels
SQL
  end
end
