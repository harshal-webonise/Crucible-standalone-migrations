class CreateTableEmailAttachments < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS email_attachments (
  id int(11) NOT NULL AUTO_INCREMENT,
  email_template_id int(11) NOT NULL,
  file_name varchar(255) NOT NULL,
  display_name varchar(255) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY fk_email_templates (email_template_id),
  FOREIGN KEY (email_template_id) REFERENCES email_templates (id)
  ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS email_attachments
SQL
  end
end
