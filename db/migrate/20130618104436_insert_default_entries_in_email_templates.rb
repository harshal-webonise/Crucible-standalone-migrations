class InsertDefaultEntriesInEmailTemplates < ActiveRecord::Migration
  def up
    execute <<SQL
INSERT INTO email_templates (id, organisation_id, product_id, email_template_name, from_name, from_email,
 email_subject, email_body, is_active, slug, created, modified) VALUES
(1, 0, 7, 'Pass Email', 'Admin', 'admin@crucibleapp.com', 'You are passed',
 '<p>Dear [Name],</p><p>This is a confirmation that you have passed the Cultural and Role Assessment for the Job Role - [Job Role] for <b>[Company Name]</b>.<br></p><p>Regards<br></p>',
 1, 'passed', now(), now()),
(2, 0, 7, 'Fail Email', 'Admin', 'admin@crucibleapp.com', 'You are failed',
 '<p>Dear [Name],</p><p>This is to inform you that unfortunately, you have not passed the Cultural and Role Assessment for the Job Role - [Job Role] for <b>[Company Name]</b>.</p><p>Regards<br></p>',
 1, 'failed', now(), now())
SQL
  end

  def down
  end
end
