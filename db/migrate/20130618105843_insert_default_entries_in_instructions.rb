class InsertDefaultEntriesInInstructions < ActiveRecord::Migration
  def up
execute <<SQL
INSERT INTO instructions (id, reference_id, organisation_id, product_id, page_name, title, body, is_active, slug, created, modified) VALUES
(7, NULL, 0, 6, '', 'Dashboard Instructions Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'dashboard_instructions_page', now(), now()),
(8, NULL, 0, 6, '', 'Motivational Instructions Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'motivational_instructions_page', now(), now()),
(9, NULL, 0, 6, '', 'Values Part 1 Instructions Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'values_part_1_instructions_page', now(), now()),
(10, NULL, 0, 6, '', 'Values Part 2 Instructions Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'values_part_2_instructions_page', now(), now()),
(11, NULL, 0, 6, '', 'Pass Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'pass_page', now(), now()),
(12, NULL, 0, 6, '', 'Fail Page', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, '	fail_page', now(), now()),
(13, NULL, 0, 4, '', 'User Splash Page', '<div class="headings clearfix"><br/> <h4>Welcome to the XXX Tool</h4><br/><br/> </div><br/> <h3 class="instSubTitle center">Thank you for logging in to XXX Tool.</h3><br/><br/> <div class="instCnt" style="text-align: justify"><br/> <p class="paraCnt fontColor">This tool will help you to understand your strengths and development areas by giving you a platform to analyse your capabilities, as well as your motivations around these capabilities, which have been identified as important for your role.<br/> </p><br/><br/> <p class="paraCnt fontColor">This will enable you to discuss where you are currently performing in comparison to XXX''s standards. The intent is for you to build a brilliant development plan for the next 6\-12 months helping you to grow and to support XXX''s drive for high performance across the business.</p><br/> </div><br/> <div class="divider"></div><br/> <h3 class="instSubTitle">There are three stages to this development process:</h3><br/><br/> <div class="boxCnt2 clearfix"><br/><div class="shadeBg"><br/><div class="innerBg2"><br/> <div class="boxCount">1</div><br/> <h3 class="boxTitle">You complete a behavioural profile and a motivational profile</h3><br/> <p>This tool assesses your strengths and development areas against the capabilities<br/> which have been identified as essential for your role.</p><br/></div><br/></div><br/><div class="shadeBg"><br/><div class="innerBg2"><br/> <div class="boxCount">2</div><br/> <h3 class="boxTitle">Manager completes your<br/>capability profile</h3><br/><br/> <p>Once you have completed your profiles your team leader will then be invited to complete the same profiles responding with their view of how you''re currently performing</p><br/></div><br/></div><br/><div class="shadeBg"><br/><div class="innerBg2"><br/> <div class="boxCount">3</div><br/> <h3 class="boxTitle">Coaching Conversation</h3><br/><br/> <p>The final step is for you to have a 1:1 development conversation with your team leader. You should go through all of the responses that you both gave, and through discussion, mutually agree on what level you believe you are performing at for each of the capability statements.</p><br/> <p>A report is then generated and through an informed discussion you should together build a development plan with actions that can be tracked to be used over the next 6 -12 months.</p><br/></div><br/></div><br/><br/></div><br/><div class="instCnt"><br/><h3 class="instSubTitle center">What do we mean when we mention capabilities and motivations?</h3><br/><br/><ul class="instList"><br/><li><p></s><strong>Capabilities</strong> are a combination of knowledge, performance and behaviour, which<br/> can improve over time with development.</p></li><br/><li><p><br/> <strong>Motivations</strong> allow you to understand what naturally interests you and what you prefer to focus on in your role.<br/> Understanding what you are more likely to put your energy towards may help explain why you excel in one area compared to another,<br/> and can also highlight areas that you may need to work harder on to maintain your interest.<br/></p></li><br/></ul><br/></div><br/><div class="divider"></div><br/><br/> <div class="instCnt"><br/> <div class="sampleImage sampleUser"><br/> <img src="/img/sample2.jpg" alt=""/><br/> </div><br/> </div>', 0, 'user_splash_page', now(), now()),
(14, NULL, 0, 4, '', 'Manager Splash Page', '<div class="headings clearfix">\n <h4>Welcome to the XXX Sales Development Tool</h4>\n\n</div>\n<h3 class="instSubTitle center">Thank you for logging in to XXX''s Sales Development Tool.</h3>\n\n<div class="instCnt" style="text-align: justify">\n <p class="paraCnt fontColor">This tool will help you to understand the strengths and development areas of each of your team members by giving you a platform to analyse their capabilities and motivations. This enables you to discuss where they currently perform in comparison to the XXX ideal profile. The intent is for you to help your team build the best development plan possible for the next 6 -12 months helping them grow and to support our drive for high performance across the business</p>\n\n</div>\n<div class="divider"></div>\n<h3 class="instSubTitle">There are three stages to this development process:</h3>\n\n<div class="boxCnt2 clearfix">\n <div class="shadeBg">\n <div class="innerBg2">\n <div class="boxCount">1</div>\n <h3 class="boxTitle">Team member completes a behavioural and motivational profile</h3>\n <p>Each team member is invited to complete a behavioural profile and a motivational profile on the ESDT where they are profiled against key capabilities which have been identified as important for their role</p>\n </div>\n </div>\n <div class="shadeBg">\n <div class="innerBg2">\n <div class="boxCount">2</div>\n <h3 class="boxTitle">You review your team<br/>members capability profile</h3>\n\n <p>Once they have completed their profiles, as a manager, you will then be invited to complete the same development profile</p>\n </div>\n </div>\n <div class="shadeBg">\n <div class="innerBg2">\n <div class="boxCount">3</div>\n <h3 class="boxTitle">Coaching Conversation</h3>\n\n <p>The final step is for you to setup a 1:1 development conversation with each team member. You should go through all of the responses that you both gave, and through discussion, mutually agree on what level you believe they are performing at for each of the capability statements.</p>\n <p>A report is then generated and through an informed discussion you should together build a development plan with actions that can be tracked to be used over the next 6 -12 months.</p>\n </div>\n </div>\n</div>\n<div class="instCnt">\n <h3 class="instSubTitle center">What do we mean when we mention capabilities and motivations?</h3>\n\n <ul class="instList">\n <li><p></s><strong>Capabilities</strong> are a combination of knowledge, performance and behaviour, which\n can improve over time with development.</p></li>\n <li><p>\n <strong>Motivations</strong> allow you to understand what naturally interests you and what you prefer to focus on in your role.\n Understanding what you are more likely to put your energy towards may help explain why you excel in one area compared to another,\n and can also highlight areas that you may need to work harder on to maintain your interest.\n </p></li>\n </ul>\n</div>\n<div class="instCnt">\n <h3 class="instSubTitle topSpace30 center">There is also additional information available in the Manager''s User Guide:</h3>\n <ul class="instList">\n <li>Understanding the Development Journey</li>\n <li>Having a Great Development Conversation</li>\n <li>Interpreting the Report</li>\n <li>Key to Capabilities</li>\n </ul>\n</div>', 0, 'manager_splash_page', now(), now()),
(15, NULL, 0, 4, '', 'User Capability Instructions Page', '<div class="modal-header">\n <h2 id="myModalLabel">Part One - Capability Profile</h2>\n</div>\n<div class="modal-body">\n <ol>\n <li>\n This part of the XXX Tool will look at your current capability against a framework to help identify your\n strengths and your key areas for development.\n The answers that you give will be compared to the capabilities that have been identified as key for your role.\n </li>\n <li>\n You will be asked a series of questions, each with four response options.\n Please take your time to read the questions and the response options carefully and select the response\n that best represents what you feel you do on a regular basis. It is important to answer the questions as\n honestly as possible, as the output of this development profile will drive the development conversation\n that\n you have with your line manager and will create the focus of your development moving forward.\n </li>\n <li>\n This first part of the development profile should take\n between 15 and 20 minutes to complete, so ensure that you have the time to focus on\n this without interruption, however the development profile is not timed so you can take as long as you\n need.\n </li>\n <li>\n If you are unavoidably interrupted for any reason and have to leave the development profile, you can\n save your progress and return to it whenever is more convenient.\n </li>\n </ol>\n</div>', 0, 'user_capability_instructions_page', now(), now()),
(16, NULL, 0, 4, '', 'User Motivational Instructions Page', '<div class="modal-header">\n <h2 id="myModalLabel">Part Two - Motivational Profile</h2>\n </div>\n <div class="modal-body">\n <ol>\n <li>\n This profile looks at your preference towards each of the capabilities that have been identified as important for your role.\n The intent is to understand what naturally interests you. This will illustrate where you prefer to focus your energy within your role,\n which may help explain why you excel in areas that you are strong in, and may also highlight areas that you need to be more\n proactive in, in order to maintain your interest.\n\n\n </li>\n <li>\n You will be presented with a series of statements and asked to respond with the level to which you agree or disagree.\n Read each of the statements carefully and answer as truthfully as you can, with your first instinct.\n </li>\n <li>\n This should take between 15 and 20 minutes to complete so ensure that you have the time to focus on this without interruption,\n however it is not timed so you can take as long as you need.\n\n </li>\n <li>\n\n If you are unavoidably interrupted for any reason and have to leave the development profile, you can save your progress and\n return to it whenever is more convenient.\n </li>\n </ol>\n </div>', 0, 'user_motivational_instructions_page', now(), now()),
(17, NULL, 0, 4, '', 'Manager Capability Instructions Page', '<div class="modal-header">\n <h2 id="myModalLabel">Part One - Capability Profile</h2>\n</div>\n<div class="modal-body">\n <ol>\n <li>\n This profile looks at your team member''s current capabilities against an established XXX\n ideal framework to identify strengths and key areas for development. The answers that you\n give will be compared to the capabilities that have been identified as key for their role.\n\n </li>\n <li>\n You will be asked a series of questions, each with four response options.\n Please take your time to read the questions and the response options carefully\n and select the response that best represents what you feel this team member does\n consistently. It is important to answer the questions as honestly as possible,\n as the output of this development profile will drive the development conversation\n that you have and will create the focus of their development moving forward.\n\n </li>\n <li>\n This should take between 15 and 20 minutes to complete so ensure that you have the time to focus on this without interruption, however it is not timed so you can take as long as you need.\n </li>\n <li>\n If you are unavoidably interrupted for any reason and have to leave the development profile,\n you can save your progress and return to it whenever is more convenient.\n\n </li>\n </ol>\n</div>', 0, 'manager_capability_instructions_page', now(), now()),
(18, NULL, 0, 4, '', 'Joint Review Capability Instructions Page', '<div class="modal-header">\n <h2 id="myModalLabel">Part One - Capability Profile</h2>\n</div>\n<div class="modal-body">\n <ol>\n <li>\n The ESDT now displays the responses that you and your team member gave to all of the capability\n statements side-by-side. You should go through all of the responses together, and through discussion,\n mutually agree on what level you believe your team member is performing at for each of the capability\n statements. Please enter this agreed response into the ESDT.\n\n </li>\n <li>\n\n This will generate a report which compares the team member''s agreed level of performance for each\n capability against XXX''s ideal profile and also suggests where their motivations may lie. Together\n you should thoroughly analyse the report and identify the biggest gaps between the team members current\n level of performance and XXX''s ideal profile.\n\n </li>\n <li>\n Through discussing the results of the report you should together be able to agree on an actionable\n development plan to track and improve the performance of the team member over the following 6 - 12\n months. The Online Team Development Tool will be revisited periodically and used on an on-going basis\n for analysing and improving performance.\n </li>\n\n </ol>\n</div>', 0, 'joint_review_capability_instructions_page', now(), now()),
(19, NULL, 0, 4, '', 'User Thank You Page', '<div class="reportDetailsPara">\n <p class="center"><strong>Thank you for taking the time to complete the behavioural and motivational profiles using the ESDT!</strong></p>\n <p>\n\n\n Your team leader has now been invited to complete the behavioural profile responding with how they see you performing on a consistent basis.\n</p><p>\n Once your team leader has completed this you will receive an email notification outlining the next steps in more detail and inviting you to a a 1:1 development conversation. Here you will discuss how each of you responded to each of the capability statements and mutually agree the level at which you are performing for each of them. This will allow a report to be generated which you should use to together build a realistic development plan to be used for the next 6-12 months\n </p>\n</div>', 0, 'user_thank_you_page', now(), now()),
(20, NULL, 0, 4, '', 'Manager Thank You Page', '<div class="reportDetailsPara">\n <p class="">\n Thank you for taking the time to complete the development profile for one of your team members!\n You can now access a comparison of how you and your team member responded to each of the capability statements on the ESDT.</p>\n\n <p class="">\n The next step is for you to setup a 1:1 development conversation with them and discuss your responses. This will generate a report which you should use to together build a realistic development plan for your team member.\n </p>\n <p class="">\n You should now review the <strong>Manager''s Guide</strong> that you can access by clicking on the <strong>Guides</strong> button at the top right of the ESDT homepage. This contains detailed information on how to have a great development conversation in preparation for your 1:1 development conversation.\n </p>\n</div>', 0, 'manager_thank_you_page', now(), now()),
(21, NULL, 0, 4, '', 'Joint Review Thank You Page', ' <div class="reportDetailsPara">\n <p class="">\n\n Thank you for taking the time to complete the 1:1 development conversation with your team member.A detailed\n report has now been generated which you can access by clicking on the <strong>View My Team</strong> button\n from the ESDT\n homepage. Now locate your team member and click on the <strong>Report</strong> (2nd button) and then click\n on the <strong>View Report</strong>\n button on the final screen.\n </p>\n\n <p class="">\n\n This report will give insight into your team member''s strengths, areas of development, and motivations,\n which will allow you to build a focused development plan. This should have achievable goals that can be\n tracked, and should be geared towards helping your team member improve their performance in their role.\n\n </p>\n\n <p class="">\n Remember that this is just the beginning of the development process - over the next 6-12 months you should\n concentrate on working with your team member to achieve their development goals and monitor their progress.\n </p>\n\n <p class="">\n The ESDT will be used to re-evaluate your team member''s performance on an on-going basis, which will allow\n you to directly see how they progress and develop over the coming months. </p>\n</div>', 0, 'joint_review_thank_you_page', now(), now()),
(22, NULL, 0, 4, '', 'Report Header Page', '<div class="reportDetailsPara">\n <p> As part of our drive for performance improvement across sales and our continued focus on developing our\n people,\n the below report is a measurement of the current motivations and capabilities which have been identified\n as\n important for your role.\n </p>\n\n <p>\n\n The report measures 2 key areas:\n </p>\n\n <p>\n\n <strong>Motivations</strong> - This measures your intrinsic drive against each capability and gives us\n an\n insight into why\n this\n may be a strength or development area for you.\n </p>\n\n <p>\n\n <strong>Capabilities</strong> - This measures the level at which you are currently exhibiting this\n behaviour\n that is\n identified\n as important for your role against what is required.\n </p>\n\n <p>\n\n The report is designed to enhance your development conversations with your manager to inform and build\n your\n development plan moving forward.\n </p>\n\n <div class="subHeading clearfix">\n <h3 class="font15">Interpret Report</h3>\n </div>\n <p>\n <img src="/img/pdf_report_bg.jpg"/>\n </p>\n\n </div>', 0, 'report_header_page', now(), now())


SQL
  end

  def down
  end
end