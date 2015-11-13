-- Create read only report user.

CREATE ROLE report LOGIN ENCRYPTED PASSWORD 'md50af801f86e50dceaf04b7e96066d0497'
   VALID UNTIL 'infinity';
GRANT fsp_read TO report;
COMMENT ON ROLE report
  IS 'User for reports';