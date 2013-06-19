class CreateTableCrptCtQuestions < ActiveRecord::Migration
  def up
  execute <<SQL
  CREATE TABLE IF NOT EXISTS crpt_ct_questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  core_themes_organisations_product_id int(11) DEFAULT '0',
  crpt_question_id int(11) DEFAULT '0',
  user_alias text NOT NULL,
  is_reverse tinyint(1) DEFAULT '0',
  background_image varchar(50) DEFAULT NULL COMMENT 'This field holds the selected background image name for question',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY core_themes_organisations_product_id (core_themes_organisations_product_id,crpt_question_id),
  KEY crpt_question_id (crpt_question_id),
  FOREIGN KEY (core_themes_organisations_product_id)
  REFERENCES core_themes_organisations_products (id) ON DELETE CASCADE,
  FOREIGN KEY (crpt_question_id) REFERENCES crpt_questions (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS crpt_ct_questions
SQL
  end
end
