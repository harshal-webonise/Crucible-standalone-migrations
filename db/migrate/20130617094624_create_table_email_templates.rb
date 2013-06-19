class CreateTableEmailTemplates < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS email_templates (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  email_template_name varchar(255) NOT NULL,
  from_name varchar(255) NOT NULL,
  from_email varchar(255) NOT NULL,
  email_subject varchar(255) NOT NULL,
  email_body text NOT NULL,
  is_active tinyint(1) NOT NULL DEFAULT '1',
  slug varchar(255) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS email_templates
SQL
  end
end
