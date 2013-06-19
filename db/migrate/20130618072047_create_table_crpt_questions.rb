class CreateTableCrptQuestions < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS crpt_questions (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary id of crt question',
  title text NOT NULL COMMENT 'Title of crt question',
  core_theme_id int(11) NOT NULL COMMENT 'Core Theme Id of crt question',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  KEY core_theme_id (core_theme_id),
 FOREIGN KEY (core_theme_id) REFERENCES core_themes (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS crpt_questions
SQL
  end
end
