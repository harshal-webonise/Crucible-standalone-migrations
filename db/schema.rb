# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130618105843) do

  create_table "accesses", :force => true do |t|
    t.string   "plugin"
    t.string   "controller"
    t.string   "action"
    t.integer  "module_id",  :default => 0
    t.datetime "modified",                  :null => false
    t.datetime "created",                   :null => false
  end

  create_table "activities", :force => true do |t|
    t.integer  "organisation_id",                       :default => 0, :null => false
    t.integer  "product_id",                            :default => 0, :null => false
    t.integer  "job_role_id",                           :default => 0, :null => false
    t.integer  "user_id",                               :default => 0, :null => false
    t.integer  "reporting_manager_id",                  :default => 0, :null => false
    t.integer  "type",                                  :default => 0, :null => false
    t.datetime "created",                                              :null => false
    t.datetime "modified",                                             :null => false
    t.string   "data",                 :limit => 10000,                :null => false
  end

  add_index "activities", ["organisation_id"], :name => "organisation_id"
  add_index "activities", ["product_id"], :name => "product_id"

  create_table "aliases_levels", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "level_id",        :null => false
    t.integer  "parent_id"
    t.integer  "organisation_id", :null => false
    t.integer  "lft"
    t.integer  "rght"
    t.datetime "created",         :null => false
    t.datetime "modified",        :null => false
  end

  add_index "aliases_levels", ["level_id", "parent_id", "organisation_id"], :name => "level_id", :unique => true
  add_index "aliases_levels", ["organisation_id"], :name => "organisation_id"

  create_table "answers", :force => true do |t|
    t.string   "answer",      :null => false
    t.integer  "question_id", :null => false
    t.datetime "created",     :null => false
    t.datetime "modified",    :null => false
  end

  add_index "answers", ["question_id"], :name => "question_id"

  create_table "behavior_job_roles_targets", :force => true do |t|
    t.integer  "cluster_id",                            :null => false
    t.integer  "job_role_id",                           :null => false
    t.integer  "target_id",                             :null => false
    t.integer  "products_target_id",                    :null => false
    t.boolean  "is_active",          :default => true
    t.boolean  "is_deleted",         :default => false
    t.boolean  "is_completed",       :default => false
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  add_index "behavior_job_roles_targets", ["cluster_id", "job_role_id", "target_id"], :name => "cluster_id", :unique => true
  add_index "behavior_job_roles_targets", ["job_role_id"], :name => "job_role_id"

  create_table "behavior_job_roles_targets_parameters", :force => true do |t|
    t.integer  "behavior_job_roles_target_id",                    :null => false
    t.integer  "starts_at",                                       :null => false
    t.integer  "ends_at",                                         :null => false
    t.integer  "motivation_type_id",                              :null => false
    t.boolean  "is_active",                    :default => true
    t.boolean  "is_deleted",                   :default => false
    t.boolean  "is_completed",                 :default => false
    t.datetime "created",                                         :null => false
    t.datetime "modified",                                        :null => false
  end

  add_index "behavior_job_roles_targets_parameters", ["behavior_job_roles_target_id", "motivation_type_id"], :name => "behavior_job_roles_target_id", :unique => true

  create_table "candidates", :force => true do |t|
    t.string   "name",     :null => false
    t.string   "email",    :null => false
    t.datetime "created",  :null => false
    t.datetime "modified", :null => false
  end

  add_index "candidates", ["email"], :name => "email", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",      :limit => 45, :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rght"
    t.integer  "type"
    t.datetime "modified",                :null => false
    t.datetime "created",                 :null => false
  end

  add_index "categories", ["name"], :name => "name", :unique => true

  create_table "cfa_candidates_answers", :force => true do |t|
    t.integer  "job_roles_candidate_id", :default => 0
    t.integer  "crpt_ct_question_id",    :default => 0
    t.integer  "response_id",            :default => 0
    t.integer  "response_value",         :default => 0
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  add_index "cfa_candidates_answers", ["job_roles_candidate_id", "crpt_ct_question_id", "response_id"], :name => "job_roles_candidate_id", :unique => true

  create_table "cfa_candidates_scores", :force => true do |t|
    t.integer  "job_roles_candidate_id", :default => 0, :null => false
    t.integer  "min_pass_score",         :default => 0, :null => false
    t.integer  "max_pass_score",         :default => 0, :null => false
    t.integer  "achieved_pass_score",    :default => 0, :null => false
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  add_index "cfa_candidates_scores", ["job_roles_candidate_id"], :name => "JOB_ROLE_CANDIDATES_INDEX"

  create_table "cfa_themes_candidates_scores", :force => true do |t|
    t.integer  "job_roles_candidate_id",               :default => 0,     :null => false
    t.integer  "core_themes_organisations_product_id", :default => 0,     :null => false
    t.integer  "achieved_score",                       :default => 0,     :null => false
    t.boolean  "is_critical",                          :default => false
    t.integer  "points_achieved",                      :default => 0,     :null => false
    t.datetime "created",                                                 :null => false
    t.datetime "modified",                                                :null => false
  end

  add_index "cfa_themes_candidates_scores", ["core_themes_organisations_product_id"], :name => "core_themes_organisations_product_id"
  add_index "cfa_themes_candidates_scores", ["job_roles_candidate_id", "core_themes_organisations_product_id"], :name => "job_roles_candidate_id", :unique => true
  add_index "cfa_themes_candidates_scores", ["job_roles_candidate_id"], :name => "JOB_ROLE_CANDIDATES_INDEX"

  create_table "clusters", :force => true do |t|
    t.string   "name"
    t.datetime "modified", :null => false
    t.datetime "created",  :null => false
  end

  create_table "clusters_competencies", :force => true do |t|
    t.integer  "cluster_id",    :default => 0
    t.integer  "competency_id", :default => 0
    t.datetime "modified",                     :null => false
    t.datetime "created",                      :null => false
  end

  add_index "clusters_competencies", ["cluster_id", "competency_id"], :name => "cluster_id", :unique => true
  add_index "clusters_competencies", ["competency_id"], :name => "competency_id"

  create_table "competencies", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description",                    :null => false
    t.integer  "category_id", :default => 0
    t.boolean  "is_deleted",  :default => false
    t.boolean  "is_active",   :default => false
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  add_index "competencies", ["category_id"], :name => "category_id"
  add_index "competencies", ["name"], :name => "name", :unique => true

  create_table "competencies_job_roles", :force => true do |t|
    t.integer  "competencies_organisations_product_id",                    :null => false
    t.integer  "da_job_role_id",                                           :null => false
    t.integer  "cluster_id",                                               :null => false
    t.boolean  "is_active",                             :default => true
    t.boolean  "is_completed",                          :default => false
    t.boolean  "is_deleted",                            :default => false
    t.datetime "created",                                                  :null => false
    t.datetime "modified",                                                 :null => false
  end

  add_index "competencies_job_roles", ["cluster_id"], :name => "cluster_id"
  add_index "competencies_job_roles", ["competencies_organisations_product_id", "da_job_role_id", "cluster_id"], :name => "competencies_organisations_product_id", :unique => true
  add_index "competencies_job_roles", ["da_job_role_id"], :name => "da_job_role_id"

  create_table "competencies_job_roles_targets", :force => true do |t|
    t.integer  "competencies_job_role_id",                       :null => false
    t.integer  "parameter_product_detail_id",                    :null => false
    t.boolean  "is_active",                   :default => true
    t.boolean  "is_deleted",                  :default => false
    t.boolean  "is_completed",                :default => false
    t.datetime "created",                                        :null => false
    t.datetime "modified",                                       :null => false
  end

  add_index "competencies_job_roles_targets", ["competencies_job_role_id", "parameter_product_detail_id"], :name => "competencies_job_role_id", :unique => true
  add_index "competencies_job_roles_targets", ["parameter_product_detail_id"], :name => "parameter_product_detail_id"

  create_table "competencies_joint_review_scores", :force => true do |t|
    t.integer  "job_roles_user_id",                   :null => false
    t.integer  "job_role_id",                         :null => false
    t.integer  "user_id",                             :null => false
    t.string   "joint_review_score",                  :null => false
    t.integer  "joint_review_score_value",            :null => false
    t.string   "target_score",                        :null => false
    t.integer  "target_score_value",                  :null => false
    t.integer  "competencies_job_roles_id",           :null => false
    t.integer  "parameter_product_details_id",        :null => false
    t.integer  "target_parameter_product_details_id", :null => false
    t.datetime "created",                             :null => false
    t.datetime "modified",                            :null => false
  end

  create_table "competencies_managers_scores", :force => true do |t|
    t.integer  "job_roles_user_id",                   :null => false
    t.integer  "job_role_id",                         :null => false
    t.integer  "user_id",                             :null => false
    t.string   "manager_score",                       :null => false
    t.integer  "manager_score_value",                 :null => false
    t.string   "target_score",                        :null => false
    t.integer  "target_score_value",                  :null => false
    t.integer  "competencies_job_roles_id",           :null => false
    t.integer  "parameter_product_details_id",        :null => false
    t.integer  "target_parameter_product_details_id", :null => false
    t.datetime "created",                             :null => false
    t.datetime "modified",                            :null => false
  end

  create_table "competencies_organisations_products", :force => true do |t|
    t.integer  "competency_id",               :default => 0
    t.integer  "da_organisations_product_id", :default => 0
    t.integer  "cluster_id",                                 :null => false
    t.string   "name",                                       :null => false
    t.string   "slug",                                       :null => false
    t.datetime "modified",                                   :null => false
    t.datetime "created",                                    :null => false
  end

  add_index "competencies_organisations_products", ["cluster_id"], :name => "competencies_organisations_products_ibfk_5"
  add_index "competencies_organisations_products", ["competency_id", "da_organisations_product_id", "cluster_id"], :name => "competency_id", :unique => true
  add_index "competencies_organisations_products", ["da_organisations_product_id"], :name => "da_organisations_product_id"

  create_table "competencies_users_scores", :force => true do |t|
    t.integer  "job_roles_user_id",                   :null => false
    t.integer  "job_role_id",                         :null => false
    t.integer  "user_id",                             :null => false
    t.string   "score",                               :null => false
    t.integer  "score_value",                         :null => false
    t.string   "target_score",                        :null => false
    t.integer  "target_score_value",                  :null => false
    t.integer  "competencies_job_roles_id",           :null => false
    t.integer  "parameter_product_details_id",        :null => false
    t.integer  "target_parameter_product_details_id", :null => false
    t.datetime "created",                             :null => false
    t.datetime "modified",                            :null => false
  end

  add_index "competencies_users_scores", ["competencies_job_roles_id"], :name => "competencies_job_roles_id"
  add_index "competencies_users_scores", ["job_role_id"], :name => "job_role_id"
  add_index "competencies_users_scores", ["job_roles_user_id"], :name => "job_roles_user_id"
  add_index "competencies_users_scores", ["parameter_product_details_id"], :name => "parameter_product_details_id"
  add_index "competencies_users_scores", ["user_id"], :name => "user_id"

  create_table "core_themes", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description",                    :null => false
    t.boolean  "is_active",   :default => false
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  add_index "core_themes", ["name"], :name => "name", :unique => true

  create_table "core_themes_organisations_products", :force => true do |t|
    t.integer  "core_theme_id",   :default => 0
    t.integer  "product_id",      :default => 0
    t.integer  "organisation_id", :default => 0
    t.string   "name",                               :null => false
    t.string   "slug",                               :null => false
    t.boolean  "is_critical",     :default => false
    t.integer  "min_pass_score"
    t.integer  "max_pass_score"
    t.boolean  "is_completed",    :default => false
    t.datetime "modified",                           :null => false
    t.datetime "created",                            :null => false
  end

  add_index "core_themes_organisations_products", ["core_theme_id", "product_id", "organisation_id"], :name => "core_theme_id", :unique => true
  add_index "core_themes_organisations_products", ["organisation_id"], :name => "organisation_id"
  add_index "core_themes_organisations_products", ["product_id"], :name => "product_id"

  create_table "crpt_assessment_scores", :force => true do |t|
    t.string   "hash",                :limit => 100
    t.integer  "product_id",                         :default => 0
    t.integer  "organisation_id",                    :default => 0
    t.integer  "on_which_step",                      :default => 0
    t.boolean  "is_completed",                       :default => false
    t.integer  "min_pass_score",                     :default => 0
    t.integer  "max_pass_score",                     :default => 0
    t.boolean  "is_candidate_active",                :default => false
    t.datetime "created",                                               :null => false
    t.datetime "modified",                                              :null => false
  end

  add_index "crpt_assessment_scores", ["hash"], :name => "UNIQUE_TITLE", :unique => true
  add_index "crpt_assessment_scores", ["organisation_id"], :name => "organisation_id"
  add_index "crpt_assessment_scores", ["product_id", "organisation_id"], :name => "product_id", :unique => true

  create_table "crpt_core_theme_scores", :force => true do |t|
    t.integer  "core_themes_organisations_product_id", :default => 0
    t.integer  "bucket_number",                        :default => 0
    t.integer  "min_value",                            :default => 0
    t.integer  "max_value",                            :default => 0
    t.integer  "points"
    t.datetime "created",                                             :null => false
    t.datetime "modified",                                            :null => false
  end

  add_index "crpt_core_theme_scores", ["core_themes_organisations_product_id", "bucket_number"], :name => "core_themes_organisations_product_id", :unique => true
  add_index "crpt_core_theme_scores", ["core_themes_organisations_product_id"], :name => "core_themes_organisations_product_id1"

  create_table "crpt_ct_questions", :force => true do |t|
    t.integer  "core_themes_organisations_product_id",               :default => 0
    t.integer  "crpt_question_id",                                   :default => 0
    t.text     "user_alias",                                                            :null => false
    t.boolean  "is_reverse",                                         :default => false
    t.string   "background_image",                     :limit => 50
    t.datetime "modified",                                                              :null => false
    t.datetime "created",                                                               :null => false
  end

  add_index "crpt_ct_questions", ["core_themes_organisations_product_id", "crpt_question_id"], :name => "core_themes_organisations_product_id", :unique => true
  add_index "crpt_ct_questions", ["crpt_question_id"], :name => "crpt_question_id"

  create_table "crpt_questions", :force => true do |t|
    t.text     "title",         :null => false
    t.integer  "core_theme_id", :null => false
    t.datetime "modified",      :null => false
    t.datetime "created",       :null => false
  end

  add_index "crpt_questions", ["core_theme_id"], :name => "core_theme_id"

  create_table "da_job_roles", :force => true do |t|
    t.integer  "job_role_id",                                    :null => false
    t.integer  "da_organisations_product_id",                    :null => false
    t.boolean  "is_active",                   :default => true
    t.boolean  "is_completed",                :default => false
    t.boolean  "is_deleted",                  :default => false
    t.datetime "created",                                        :null => false
    t.datetime "modified",                                       :null => false
  end

  add_index "da_job_roles", ["da_organisations_product_id"], :name => "da_organisations_product_id"
  add_index "da_job_roles", ["job_role_id", "da_organisations_product_id"], :name => "job_role_id", :unique => true

  create_table "da_organisations_products", :force => true do |t|
    t.integer  "product_id",      :default => 0
    t.integer  "organisation_id", :default => 0
    t.integer  "category_id",     :default => 0
    t.string   "name",                           :null => false
    t.string   "slug",                           :null => false
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  add_index "da_organisations_products", ["category_id"], :name => "category_id"
  add_index "da_organisations_products", ["organisation_id"], :name => "organisation_id"
  add_index "da_organisations_products", ["product_id", "organisation_id", "category_id"], :name => "product_id", :unique => true

  create_table "das_users_scores", :force => true do |t|
    t.integer  "job_roles_user_id",     :null => false
    t.integer  "job_role_id",           :null => false
    t.integer  "user_id",               :null => false
    t.integer  "cluster_id",            :null => false
    t.string   "score",                 :null => false
    t.integer  "behavior_parameter_id", :null => false
    t.integer  "target_id",             :null => false
    t.datetime "created",               :null => false
    t.datetime "modified",              :null => false
  end

  add_index "das_users_scores", ["cluster_id"], :name => "cluster_id"
  add_index "das_users_scores", ["job_role_id"], :name => "job_role_id"
  add_index "das_users_scores", ["job_roles_user_id"], :name => "job_roles_user_id"
  add_index "das_users_scores", ["user_id"], :name => "user_id"

  create_table "email_attachments", :force => true do |t|
    t.integer  "email_template_id", :null => false
    t.string   "file_name",         :null => false
    t.string   "display_name",      :null => false
    t.datetime "created",           :null => false
    t.datetime "modified",          :null => false
  end

  add_index "email_attachments", ["email_template_id"], :name => "fk_email_templates"

  create_table "email_templates", :force => true do |t|
    t.integer  "organisation_id",                       :null => false
    t.integer  "product_id",                            :null => false
    t.string   "email_template_name",                   :null => false
    t.string   "from_name",                             :null => false
    t.string   "from_email",                            :null => false
    t.string   "email_subject",                         :null => false
    t.text     "email_body",                            :null => false
    t.boolean  "is_active",           :default => true, :null => false
    t.string   "slug",                                  :null => false
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  create_table "industries", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "slug",                          :null => false
    t.boolean  "is_active",  :default => false
    t.boolean  "is_deleted", :default => false
    t.datetime "modified",                      :null => false
    t.datetime "created",                       :null => false
  end

  add_index "industries", ["name"], :name => "name", :unique => true

  create_table "instructions", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "organisation_id", :default => 0
    t.integer  "product_id",      :default => 0
    t.string   "page_name",                          :null => false
    t.string   "title"
    t.text     "body"
    t.boolean  "is_active",       :default => false
    t.string   "slug",            :default => "0",   :null => false
    t.datetime "created",                            :null => false
    t.datetime "modified",                           :null => false
  end

  create_table "job_role_question_responses", :force => true do |t|
    t.integer  "job_role_question_id",                             :null => false
    t.integer  "product_behavior_parameter_id",                    :null => false
    t.boolean  "is_score_reversed",             :default => false
    t.boolean  "is_active",                     :default => true
    t.boolean  "is_deleted",                    :default => false
    t.datetime "created",                                          :null => false
    t.datetime "modified",                                         :null => false
  end

  add_index "job_role_question_responses", ["job_role_question_id", "product_behavior_parameter_id"], :name => "job_role_question_id", :unique => true
  add_index "job_role_question_responses", ["product_behavior_parameter_id"], :name => "product_behavior_parameter_id"

  create_table "job_role_questions", :force => true do |t|
    t.integer  "cluster_id",                       :null => false
    t.integer  "job_role_id",                      :null => false
    t.integer  "question_id",                      :null => false
    t.string   "title",                            :null => false
    t.string   "user_alias",                       :null => false
    t.string   "manager_alias",                    :null => false
    t.boolean  "is_completed",  :default => false
    t.boolean  "is_active",     :default => true
    t.boolean  "is_deleted",    :default => false
    t.datetime "created",                          :null => false
    t.datetime "modified",                         :null => false
  end

  add_index "job_role_questions", ["cluster_id", "job_role_id", "question_id"], :name => "cluster_id", :unique => true
  add_index "job_role_questions", ["job_role_id"], :name => "job_role_id"
  add_index "job_role_questions", ["question_id"], :name => "question_id"

  create_table "job_roles", :force => true do |t|
    t.string   "name",                                 :null => false
    t.string   "slug",                                 :null => false
    t.integer  "aliases_level_id",  :default => 0
    t.integer  "organisation_id",                      :null => false
    t.integer  "product_id",                           :null => false
    t.integer  "on_which_step",                        :null => false
    t.boolean  "is_completed",      :default => false
    t.date     "expiry_date"
    t.boolean  "can_delete",        :default => true
    t.boolean  "is_deleted",        :default => false
    t.datetime "invite_later_date",                    :null => false
    t.boolean  "is_invited",        :default => false
    t.datetime "modified",                             :null => false
    t.datetime "created",                              :null => false
  end

  add_index "job_roles", ["aliases_level_id"], :name => "aliases_level_id"
  add_index "job_roles", ["organisation_id"], :name => "organisation_id"
  add_index "job_roles", ["product_id"], :name => "product_id"

  create_table "job_roles_candidates", :force => true do |t|
    t.integer  "candidate_id",                 :default => 0
    t.integer  "job_role_id",                  :default => 0
    t.string   "certificate_no", :limit => 15
    t.boolean  "is_started",                   :default => false
    t.boolean  "is_completed",                 :default => false
    t.boolean  "is_cfa_pass",                  :default => false
    t.boolean  "is_rpa_pass",                  :default => false
    t.boolean  "cfa_result",                   :default => false
    t.datetime "created",                                         :null => false
    t.datetime "modified",                                        :null => false
  end

  add_index "job_roles_candidates", ["candidate_id"], :name => "CANDIDATE_INDEX"
  add_index "job_roles_candidates", ["certificate_no"], :name => "UNIQUE_NO", :unique => true
  add_index "job_roles_candidates", ["job_role_id"], :name => "JOB_ROLE_INDEX"

  create_table "job_roles_parameters", :force => true do |t|
    t.integer  "total_responses",                    :null => false
    t.integer  "job_role_id",                        :null => false
    t.boolean  "type",            :default => false
    t.datetime "modified",                           :null => false
    t.datetime "created",                            :null => false
  end

  add_index "job_roles_parameters", ["job_role_id", "total_responses"], :name => "job_role_id", :unique => true

  create_table "job_roles_statements", :force => true do |t|
    t.integer  "job_role_id",                                 :null => false
    t.integer  "statement_id",                                :null => false
    t.integer  "competencies_job_role_id",                    :null => false
    t.string   "user_alias",                                  :null => false
    t.string   "manager_alias",                               :null => false
    t.string   "title",                                       :null => false
    t.boolean  "is_completed",             :default => false
    t.boolean  "is_active",                :default => true
    t.boolean  "is_deleted",               :default => false
    t.datetime "created",                                     :null => false
    t.datetime "modified",                                    :null => false
  end

  add_index "job_roles_statements", ["competencies_job_role_id"], :name => "competencies_job_role_id"
  add_index "job_roles_statements", ["job_role_id", "statement_id", "competencies_job_role_id"], :name => "job_role_id", :unique => true
  add_index "job_roles_statements", ["statement_id"], :name => "statement_id"

  create_table "job_roles_statements_responses", :force => true do |t|
    t.integer  "job_roles_statement_id",                    :null => false
    t.integer  "response_id",                               :null => false
    t.string   "user_alias",                                :null => false
    t.string   "manager_alias",                             :null => false
    t.string   "response"
    t.string   "allocate_point",                            :null => false
    t.boolean  "is_active",              :default => true
    t.boolean  "is_deleted",             :default => false
    t.datetime "created",                                   :null => false
    t.datetime "modified",                                  :null => false
  end

  add_index "job_roles_statements_responses", ["job_roles_statement_id"], :name => "job_roles_statement_id"

  create_table "job_roles_users", :force => true do |t|
    t.integer  "job_role_id",                                      :null => false
    t.integer  "user_id",                                          :null => false
    t.integer  "organisation_id",                                  :null => false
    t.integer  "product_id",                                       :null => false
    t.integer  "invitation_sent",               :default => 0,     :null => false
    t.integer  "on_which_step",                 :default => 0,     :null => false
    t.integer  "on_which_assessment",           :default => 0,     :null => false
    t.integer  "is_started",                    :default => 0,     :null => false
    t.integer  "is_completed",                  :default => 0,     :null => false
    t.integer  "is_manager",                    :default => 0,     :null => false
    t.boolean  "is_active",                     :default => true
    t.boolean  "is_deleted",                    :default => false
    t.boolean  "is_manager_review_started",     :default => false
    t.boolean  "is_manager_reviewed",           :default => false
    t.boolean  "is_joint_review_started",       :default => false
    t.boolean  "is_joint_reviewed",             :default => false
    t.datetime "invite_sent_date",                                 :null => false
    t.datetime "jr_start_date",                                    :null => false
    t.datetime "jr_completion_date",                               :null => false
    t.datetime "manager_review_start_date",                        :null => false
    t.datetime "manager_review_completed_date",                    :null => false
    t.datetime "joint_review_start_date",                          :null => false
    t.datetime "joint_review_completed_date",                      :null => false
    t.datetime "created",                                          :null => false
    t.datetime "modified",                                         :null => false
  end

  add_index "job_roles_users", ["job_role_id"], :name => "job_role_id"
  add_index "job_roles_users", ["organisation_id"], :name => "organisation_id"
  add_index "job_roles_users", ["product_id"], :name => "product_id"
  add_index "job_roles_users", ["user_id"], :name => "user_id"

  create_table "jr_parameters_details", :force => true do |t|
    t.string   "name",                   :null => false
    t.string   "slug",                   :null => false
    t.integer  "job_roles_parameter_id", :null => false
    t.integer  "scales_start",           :null => false
    t.integer  "scales_end",             :null => false
    t.datetime "modified",               :null => false
    t.datetime "created",                :null => false
  end

  add_index "jr_parameters_details", ["job_roles_parameter_id"], :name => "job_roles_parameter_id"

  create_table "key_contacts", :force => true do |t|
    t.integer  "user_id",                         :null => false
    t.string   "job_title",                       :null => false
    t.integer  "aliases_level_id", :default => 0
    t.string   "linked_in"
    t.string   "twitter"
    t.datetime "created",                         :null => false
    t.datetime "modified",                        :null => false
  end

  add_index "key_contacts", ["aliases_level_id"], :name => "aliases_level_id"
  add_index "key_contacts", ["user_id", "aliases_level_id"], :name => "user_id", :unique => true

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rght"
    t.string   "slug"
    t.datetime "created",   :null => false
    t.datetime "modified",  :null => false
  end

  add_index "levels", ["name"], :name => "name", :unique => true

  create_table "mail_queues", :force => true do |t|
    t.integer  "organisation_id", :default => 0
    t.integer  "product_id",      :default => 0
    t.integer  "sendgrid_status", :default => 0
    t.integer  "email_type",      :default => 0
    t.text     "data",                           :null => false
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  create_table "manager_answered_statements", :force => true do |t|
    t.integer  "job_roles_statement_id",                              :null => false
    t.integer  "agreed_on_response_id",                               :null => false
    t.integer  "job_roles_statements_response_id",                    :null => false
    t.integer  "job_roles_user_id",                                   :null => false
    t.boolean  "is_completed",                     :default => false
    t.boolean  "is_joint_review_completed",        :default => false
    t.datetime "created",                                             :null => false
    t.datetime "modified",                                            :null => false
  end

  create_table "modules", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",                 :null => false
    t.string   "slug"
    t.integer  "product_id", :default => 0
    t.datetime "modified",                  :null => false
    t.datetime "created",                   :null => false
  end

  create_table "organisations", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone_number", :limit => 15
    t.integer  "industry_id"
    t.boolean  "is_active",                  :default => false
    t.boolean  "is_deleted",                 :default => false
    t.datetime "created",                                       :null => false
    t.datetime "modified",                                      :null => false
  end

  add_index "organisations", ["industry_id"], :name => "industry_id"
  add_index "organisations", ["name"], :name => "name", :unique => true

  create_table "organisations_levels", :force => true do |t|
    t.integer  "organisation_id", :null => false
    t.integer  "level_id",        :null => false
    t.datetime "modified",        :null => false
    t.datetime "created",         :null => false
  end

  add_index "organisations_levels", ["level_id"], :name => "level_id"
  add_index "organisations_levels", ["organisation_id", "level_id"], :name => "organisation_id", :unique => true

  create_table "organisations_products", :force => true do |t|
    t.integer  "organisation_id",                     :null => false
    t.integer  "product_id",                          :null => false
    t.string   "logo"
    t.string   "background_color"
    t.string   "link_color"
    t.string   "highlight_color"
    t.integer  "usage_limit"
    t.boolean  "is_active",        :default => true
    t.integer  "on_which_step",    :default => 0,     :null => false
    t.boolean  "is_completed",     :default => false
    t.datetime "modified",                            :null => false
    t.datetime "created",                             :null => false
  end

  add_index "organisations_products", ["organisation_id", "product_id"], :name => "organisation_id", :unique => true
  add_index "organisations_products", ["product_id"], :name => "product_id"

  create_table "organisations_products_parameters", :force => true do |t|
    t.integer  "product_id",      :default => 0
    t.integer  "organisation_id", :default => 0
    t.integer  "total_responses", :default => 0
    t.integer  "type",            :default => 0
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  add_index "organisations_products_parameters", ["organisation_id"], :name => "organisation_id"
  add_index "organisations_products_parameters", ["product_id", "organisation_id"], :name => "product_id", :unique => true

  create_table "pages", :force => true do |t|
    t.integer  "reference_id"
    t.integer  "organisation_id",                :default => 0
    t.integer  "product_id",                     :default => 0
    t.integer  "language_id"
    t.string   "meta_keywords",                                   :null => false
    t.string   "meta_description",                                :null => false
    t.string   "title",            :limit => 50,                  :null => false
    t.text     "body",                                            :null => false
    t.integer  "is_active",                      :default => 0,   :null => false
    t.string   "slug",                           :default => "0", :null => false
    t.datetime "created",                                         :null => false
    t.datetime "modified",                                        :null => false
  end

  create_table "parameter_product_details", :force => true do |t|
    t.integer  "organisations_products_parameter_id", :default => 0
    t.string   "name",                                               :null => false
    t.integer  "scale_starts",                        :default => 0
    t.integer  "scale_ends",                          :default => 0
    t.datetime "modified",                                           :null => false
    t.datetime "created",                                            :null => false
  end

  add_index "parameter_product_details", ["organisations_products_parameter_id", "name"], :name => "organisations_products_parameter_id", :unique => true

  create_table "product_behavior_parameters", :force => true do |t|
    t.integer  "product_id",      :default => 0
    t.integer  "organisation_id", :default => 0
    t.integer  "no_of_questions", :default => 0
    t.integer  "no_of_responses", :default => 0
    t.boolean  "is_active",       :default => true
    t.boolean  "is_deleted",      :default => false
    t.datetime "modified",                           :null => false
    t.datetime "created",                            :null => false
  end

  add_index "product_behavior_parameters", ["organisation_id"], :name => "organisation_id"
  add_index "product_behavior_parameters", ["product_id", "organisation_id"], :name => "product_id", :unique => true

  create_table "product_behavior_responses", :force => true do |t|
    t.integer  "product_behavior_parameter_id", :default => 0
    t.string   "user_alias",                                       :null => false
    t.string   "manager_alias",                                    :null => false
    t.integer  "response_number",               :default => 0
    t.boolean  "is_active",                     :default => true
    t.boolean  "is_deleted",                    :default => false
    t.datetime "modified",                                         :null => false
    t.datetime "created",                                          :null => false
  end

  add_index "product_behavior_responses", ["product_behavior_parameter_id", "response_number"], :name => "product_behavior_parameter_id", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name",                               :null => false
    t.text     "description"
    t.string   "slug"
    t.boolean  "default_product", :default => true
    t.boolean  "is_active",       :default => false
    t.boolean  "is_deleted",      :default => false
    t.datetime "modified",                           :null => false
    t.datetime "created",                            :null => false
  end

  add_index "products", ["name"], :name => "name", :unique => true

  create_table "products_targets", :force => true do |t|
    t.string   "alias"
    t.integer  "organisation_id", :default => 0
    t.integer  "product_id",      :default => 0
    t.integer  "target_id",       :default => 0
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  create_table "products_users", :force => true do |t|
    t.integer  "product_id",                          :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "role_id",                             :null => false
    t.boolean  "is_psa",           :default => false
    t.boolean  "is_accepted",      :default => false
    t.string   "hash"
    t.boolean  "is_active",        :default => false
    t.boolean  "show_instruction", :default => false
    t.datetime "modified",                            :null => false
    t.datetime "created",                             :null => false
  end

  add_index "products_users", ["product_id", "user_id", "role_id"], :name => "product_id", :unique => true
  add_index "products_users", ["role_id"], :name => "products_users_ibfk_3"
  add_index "products_users", ["user_id"], :name => "products_users_ibfk_5"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",                             :null => false
    t.string   "employee_id"
    t.string   "job_title"
    t.integer  "aliases_level_id",     :default => 0
    t.datetime "created",                             :null => false
    t.datetime "modified",                            :null => false
    t.integer  "reporting_manager_id",                :null => false
  end

  add_index "profiles", ["user_id", "employee_id"], :name => "user_id", :unique => true

  create_table "questions", :force => true do |t|
    t.text     "title",                          :null => false
    t.text     "description",                    :null => false
    t.boolean  "is_reverse",  :default => false
    t.integer  "cluster_id",                     :null => false
    t.datetime "created",                        :null => false
    t.datetime "modified",                       :null => false
  end

  add_index "questions", ["cluster_id"], :name => "cluster_id"

  create_table "responses", :force => true do |t|
    t.text     "response",     :null => false
    t.integer  "statement_id", :null => false
    t.datetime "created",      :null => false
    t.datetime "modified",     :null => false
  end

  add_index "responses", ["statement_id"], :name => "statement_id"

  create_table "roles", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "slug",                          :null => false
    t.boolean  "is_active",  :default => false
    t.boolean  "is_deleted", :default => false
    t.datetime "created",                       :null => false
    t.datetime "modified",                      :null => false
  end

  create_table "roles_accesses", :force => true do |t|
    t.integer "role_id",    :default => 0
    t.integer "access_id",  :default => 0
    t.boolean "is_allowed", :default => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer  "role_id",  :null => false
    t.integer  "user_id",  :null => false
    t.datetime "modified", :null => false
    t.datetime "created",  :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "role_id", :unique => true
  add_index "roles_users", ["user_id"], :name => "user_id"

  create_table "rpa_assessments", :force => true do |t|
    t.string   "hash",                :limit => 100
    t.integer  "job_role_id",                        :default => 0
    t.integer  "on_which_step",                      :default => 0
    t.boolean  "is_completed",                       :default => false
    t.integer  "min_pass_score",                     :default => 0
    t.integer  "max_pass_score",                     :default => 0
    t.integer  "retake_days",                        :default => 0
    t.boolean  "is_candidate_active",                :default => false
    t.string   "button_title"
    t.string   "job_role_url"
    t.datetime "created"
    t.datetime "modified"
  end

  add_index "rpa_assessments", ["hash"], :name => "UNIQUE_TITLE", :unique => true
  add_index "rpa_assessments", ["job_role_id"], :name => "job_role_id"

  create_table "rpa_behaviours", :force => true do |t|
    t.integer  "rpa_assessment_id",           :default => 0
    t.integer  "da_organisations_product_id", :default => 0
    t.boolean  "is_critical",                 :default => false
    t.boolean  "is_completed",                :default => false
    t.integer  "min_pass_score",              :default => 0
    t.integer  "max_pass_score",              :default => 0
    t.datetime "created",                                        :null => false
    t.datetime "modified",                                       :null => false
  end

  add_index "rpa_behaviours", ["da_organisations_product_id"], :name => "da_organisations_product_id"
  add_index "rpa_behaviours", ["rpa_assessment_id", "da_organisations_product_id"], :name => "rpa_assessment_id", :unique => true

  create_table "rpa_behaviours_candidates_scores", :force => true do |t|
    t.integer  "job_roles_candidate_id", :default => 0,     :null => false
    t.integer  "rpa_behaviour_id",       :default => 0,     :null => false
    t.boolean  "is_critical",            :default => false
    t.integer  "min_pass_score",         :default => 0,     :null => false
    t.integer  "max_pass_score",         :default => 0,     :null => false
    t.integer  "achieved_pass_score",    :default => 0,     :null => false
    t.datetime "created",                                   :null => false
    t.datetime "modified",                                  :null => false
  end

  add_index "rpa_behaviours_candidates_scores", ["job_roles_candidate_id", "rpa_behaviour_id"], :name => "job_roles_candidate_id", :unique => true
  add_index "rpa_behaviours_candidates_scores", ["job_roles_candidate_id"], :name => "JOB_ROLE_CANDIDATES_INDEX"
  add_index "rpa_behaviours_candidates_scores", ["rpa_behaviour_id"], :name => "RPA_BEHAVIOUR_INDEX"

  create_table "rpa_candidates_answers", :force => true do |t|
    t.integer  "job_roles_candidate_id", :default => 0
    t.integer  "rpa_tag_id",             :default => 0
    t.integer  "rpa_scenario_id",        :default => 0
    t.integer  "rpa_response_id",        :default => 0
    t.integer  "score",                  :default => 0
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  add_index "rpa_candidates_answers", ["job_roles_candidate_id", "rpa_tag_id", "rpa_scenario_id", "rpa_response_id"], :name => "job_roles_candidate_id", :unique => true
  add_index "rpa_candidates_answers", ["rpa_response_id"], :name => "rpa_response_id"
  add_index "rpa_candidates_answers", ["rpa_scenario_id"], :name => "rpa_scenario_id"
  add_index "rpa_candidates_answers", ["rpa_tag_id"], :name => "rpa_tag_id"

  create_table "rpa_candidates_scores", :force => true do |t|
    t.integer  "job_roles_candidate_id", :default => 0, :null => false
    t.integer  "min_pass_score",         :default => 0, :null => false
    t.integer  "max_pass_score",         :default => 0, :null => false
    t.integer  "achieved_pass_score",    :default => 0, :null => false
    t.datetime "created",                               :null => false
    t.datetime "modified",                              :null => false
  end

  add_index "rpa_candidates_scores", ["job_roles_candidate_id"], :name => "JOB_ROLE_CANDIDATES_INDEX"

  create_table "rpa_responses", :force => true do |t|
    t.integer  "rpa_scenario_id",                       :default => 0
    t.integer  "scenario_response_id",                  :default => 0
    t.integer  "rpa_tag_id",                            :default => 0
    t.string   "name",                 :limit => 10000
    t.datetime "created",                                              :null => false
    t.datetime "modified",                                             :null => false
  end

  add_index "rpa_responses", ["rpa_scenario_id", "scenario_response_id", "rpa_tag_id"], :name => "rpa_scenario_id", :unique => true
  add_index "rpa_responses", ["rpa_tag_id"], :name => "rpa_tag_id"
  add_index "rpa_responses", ["scenario_response_id"], :name => "scenario_response_id"

  create_table "rpa_scenarios", :force => true do |t|
    t.integer  "rpa_behaviour_id",                  :default => 0
    t.integer  "scenario_id",                       :default => 0
    t.string   "alias",            :limit => 10000
    t.boolean  "is_critical",                       :default => false
    t.boolean  "is_completed",                      :default => false
    t.string   "background_image", :limit => 50
    t.datetime "created",                                              :null => false
    t.datetime "modified",                                             :null => false
  end

  add_index "rpa_scenarios", ["rpa_behaviour_id", "scenario_id"], :name => "rpa_behaviour_id", :unique => true
  add_index "rpa_scenarios", ["scenario_id"], :name => "scenario_id"

  create_table "rpa_tags", :force => true do |t|
    t.integer  "organisation_id", :default => 0, :null => false
    t.integer  "product_id",      :default => 0, :null => false
    t.integer  "response_id",     :default => 0, :null => false
    t.string   "name",                           :null => false
    t.datetime "modified",                       :null => false
    t.datetime "created",                        :null => false
  end

  add_index "rpa_tags", ["organisation_id", "product_id", "response_id"], :name => "organisation_id", :unique => true
  add_index "rpa_tags", ["product_id"], :name => "product_id"

  create_table "scenario_responses", :force => true do |t|
    t.integer  "scenario_id",                                  :null => false
    t.string   "response",    :limit => 10000, :default => ""
    t.datetime "created",                                      :null => false
    t.datetime "modified",                                     :null => false
  end

  add_index "scenario_responses", ["scenario_id"], :name => "scenario_id"

  create_table "scenarios", :force => true do |t|
    t.integer  "category_id",                 :null => false
    t.string   "title",       :limit => 1000, :null => false
    t.datetime "created",                     :null => false
    t.datetime "modified",                    :null => false
  end

  add_index "scenarios", ["category_id"], :name => "category_id"

  create_table "settings", :force => true do |t|
    t.integer  "organisation_id",                  :default => 0
    t.integer  "product_id",                       :default => 0
    t.string   "name",               :limit => 50,                :null => false
    t.string   "value",                                           :null => false
    t.string   "original_file_name"
    t.integer  "type",                             :default => 0
    t.datetime "created",                                         :null => false
    t.datetime "modified",                                        :null => false
  end

  create_table "statements", :force => true do |t|
    t.text     "title",         :null => false
    t.text     "description",   :null => false
    t.integer  "competency_id", :null => false
    t.datetime "created",       :null => false
    t.datetime "modified",      :null => false
  end

  add_index "statements", ["competency_id"], :name => "competency_id"

  create_table "targets", :force => true do |t|
    t.string   "name"
    t.integer  "score"
    t.datetime "modified", :null => false
    t.datetime "created",  :null => false
    t.string   "class"
  end

  create_table "trackings", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "url"
    t.string   "browser"
    t.string   "browser_version"
    t.string   "ip_address"
    t.string   "os"
    t.string   "user_agent"
    t.datetime "created",         :null => false
    t.datetime "modified",        :null => false
  end

  create_table "user_answered_questions", :force => true do |t|
    t.integer  "job_role_question_id",                             :null => false
    t.integer  "job_role_question_response_id",                    :null => false
    t.integer  "job_roles_user_id",                                :null => false
    t.boolean  "is_score_reversed",             :default => false
    t.string   "response_name",                                    :null => false
    t.integer  "response_id",                                      :null => false
    t.datetime "created",                                          :null => false
    t.datetime "modified",                                         :null => false
  end

  add_index "user_answered_questions", ["job_role_question_id"], :name => "job_role_question_id"
  add_index "user_answered_questions", ["job_roles_user_id"], :name => "user_answered_questions_ibfk_7"
  add_index "user_answered_questions", ["response_id"], :name => "user_answered_questions_ibfk_8"

  create_table "user_answered_statements", :force => true do |t|
    t.integer  "job_roles_statement_id",           :null => false
    t.integer  "job_roles_statements_response_id", :null => false
    t.integer  "job_roles_user_id",                :null => false
    t.datetime "created",                          :null => false
    t.datetime "modified",                         :null => false
  end

  add_index "user_answered_statements", ["job_roles_statement_id"], :name => "user_answered_statements_ibfk_4"
  add_index "user_answered_statements", ["job_roles_statements_response_id"], :name => "user_answered_statements_ibfk_5"
  add_index "user_answered_statements", ["job_roles_user_id"], :name => "user_answered_statements_ibfk_3"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_title"
    t.string   "image"
    t.string   "phone_number",          :limit => 15
    t.string   "gender",                :limit => 10
    t.date     "dob"
    t.boolean  "show_instruction",                    :default => false
    t.boolean  "assesment_instruction",               :default => false
    t.integer  "organisation_id",                                        :null => false
    t.boolean  "is_verified",                         :default => false
    t.string   "verify_token"
    t.boolean  "is_active",                           :default => true
    t.boolean  "is_email_change",                     :default => false
    t.boolean  "is_deleted",                          :default => false
    t.datetime "modified",                                               :null => false
    t.datetime "created",                                                :null => false
  end

  create_table "wgll_assessment_projects", :force => true do |t|
    t.integer  "organisation_id", :null => false
    t.string   "name",            :null => false
    t.text     "description",     :null => false
    t.datetime "date",            :null => false
    t.datetime "created",         :null => false
    t.datetime "modified",        :null => false
  end

  add_index "wgll_assessment_projects", ["name", "organisation_id"], :name => "name", :unique => true
  add_index "wgll_assessment_projects", ["organisation_id"], :name => "organisation_id"

  create_table "wgll_assessment_projects_job_roles", :force => true do |t|
    t.integer  "wgll_assessment_project_id", :null => false
    t.integer  "job_role_id",                :null => false
    t.datetime "invite_later_date",          :null => false
    t.datetime "created",                    :null => false
    t.datetime "modified",                   :null => false
  end

  add_index "wgll_assessment_projects_job_roles", ["job_role_id"], :name => "job_role_id"
  add_index "wgll_assessment_projects_job_roles", ["wgll_assessment_project_id", "job_role_id"], :name => "wgll_assessment_project_id", :unique => true

  create_table "wgll_assessment_projects_job_roles_wgll_assessments", :force => true do |t|
    t.integer  "wgll_assessment_projects_job_role_id", :null => false
    t.integer  "wgll_assessment_id",                   :null => false
    t.datetime "invite_later",                         :null => false
    t.datetime "created",                              :null => false
    t.datetime "modified",                             :null => false
  end

  add_index "wgll_assessment_projects_job_roles_wgll_assessments", ["wgll_assessment_id"], :name => "wgll_assessment_id"
  add_index "wgll_assessment_projects_job_roles_wgll_assessments", ["wgll_assessment_projects_job_role_id", "wgll_assessment_id"], :name => "wgll_assessment_projects_job_role_id", :unique => true

  create_table "wgll_assessments", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description", :null => false
    t.string   "slug"
    t.datetime "created",     :null => false
    t.datetime "modified",    :null => false
  end

  create_table "wgll_assessments_questions", :force => true do |t|
    t.integer  "wgll_assessment_id", :null => false
    t.string   "title",              :null => false
    t.string   "interim"
    t.string   "extreme"
    t.text     "description"
    t.datetime "created",            :null => false
    t.datetime "modified",           :null => false
  end

  add_index "wgll_assessments_questions", ["wgll_assessment_id"], :name => "wgll_assessment_id"

  create_table "wgll_users_answers", :force => true do |t|
    t.integer  "wgll_assessments_question_id",                                         :null => false
    t.integer  "wgll_assessment_projects_job_roles_wgll_assessment_id",                :null => false
    t.integer  "user_id",                                                              :null => false
    t.integer  "response_id",                                           :default => 0
    t.integer  "weightage",                                             :default => 0
    t.datetime "created",                                                              :null => false
    t.datetime "modified",                                                             :null => false
  end

  add_index "wgll_users_answers", ["response_id"], :name => "response_id"
  add_index "wgll_users_answers", ["user_id"], :name => "user_id"
  add_index "wgll_users_answers", ["wgll_assessment_projects_job_roles_wgll_assessment_id"], :name => "wgll_assessment_projects_job_roles_wgll_assessment_id"
  add_index "wgll_users_answers", ["wgll_assessments_question_id", "wgll_assessment_projects_job_roles_wgll_assessment_id", "user_id", "response_id"], :name => "wgll_assessments_question_id", :unique => true

  create_table "wgll_users_reports", :force => true do |t|
    t.integer  "job_roles_user_id",                        :null => false
    t.integer  "assessment_type",       :default => 0,     :null => false
    t.datetime "assessment_start_date",                    :null => false
    t.datetime "assessment_end_date",                      :null => false
    t.boolean  "is_pass",               :default => false
    t.datetime "created",                                  :null => false
    t.datetime "modified",                                 :null => false
  end

  add_index "wgll_users_reports", ["job_roles_user_id"], :name => "job_roles_user_id"

end
