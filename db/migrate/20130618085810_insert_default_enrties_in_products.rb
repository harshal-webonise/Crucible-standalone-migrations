class InsertDefaultEnrtiesInProducts < ActiveRecord::Migration
  def up
    execute <<SQL
INSERT INTO products (id, name, description, slug, default_product, is_active, is_deleted, modified, created) VALUES
(1, 'Online Screening Tool', 'Previously known as the SJT. This tool is a "light touch" online screening tool that presents candidates with a range of scenarios and potential responses from which they chose the most appropriate \n\nThis product is likely to be heavily branded to appear seamless with the clients own career site and also will manifest in a number of different creative treatments, from simple question and answer format through to more feature rich, animation.', 'ost', 1, 1, 0, now(), now()),
(2, 'Quality of Hire Assessment Tool', 'This tool is a "deeper dive" candidate assessment tool that will require the user - candidate in this case - to take an in depth assessment consisting of a number of questions. This is likely to be a 30 - 40 minute \n\nThis product is likely to be heavily branded to appear seamless with the clients own career site and also will manifest in a number of different creative treatments, from simple question and answer format through to more feature rich, animation.\n', 'qhat', 1, 1, 0, now(), now()),
(3, 'Hiring Manager Toolkit', 'This product is an aide to managers and is built around a revised recruitment process that we build and train into the client company. Taking the What Great Looks Like outputs the product will enable creation of bespoke interview templates for each job role or \n\nThe idea is that the system will take output from the Quality of Hire Assessment Tool and create a set of relevant competency, motivation and behaviour questions for the hiring manager to use during the interview which will output to pdf.', 'hmt', 1, 1, 0, now(), now()),
(4, 'Team Development Tool', 'This tool is designed as a "deep dive" assessment of existing It will be based on the same What Great Looks Like principle as the Quality of Hire Tool and will have similar \n\nAdditional functionality will include Manager assessment capability which will allow the manager or supervisor to do a 180 assessment on the individual. In practice this means the manager completes the same questionnaire as the individual but from a third person perspective.\n', 'tdt', 1, 1, 0, now(), now()),
(5, 'PodCoaching', 'Podcoaching is a tool that facilitates peer to peer coaching within organisations. Effectively it is a collaboration/conversation driven platform that will incorporate some of the assessments that feature in the Team Development Tool and the Quality of Hire Assessment Tool.\n\nCoaching is structured in "pods" with interaction between the pod leader, pod members and between pods. Information, conversation and media will be shared between members and pods.\n', 'pc', 1, 1, 0, now(), now()),
(6, 'What Great Looks Like', NULL, 'wgll', 0, 1, 0, now(), now()),
(7, 'Culture and Role preference tool', 'The cultural and role preferences tool are designed to sit at the front end of an INTOs recruitment process, at the initial application stage. Their purpose is to screen initial applicants either on cultural fit for the organisation or specific suitability for a role, or both.', 'crpt', 1, 1, 0, now(), now());
SQL
  end

  def down
    execute <<SQL
  TRUNCATE TABLE  products;
SQL
  end
end
