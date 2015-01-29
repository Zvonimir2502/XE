--------------------------------------------------------
--  File created - četvrtak-siječnja-29-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package MAIL_P
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SAPADMIN"."MAIL_P" 
  AS 
	   g_smtp_host      varchar2 (256)     :=  '192.168.1.32';
	   g_smtp_port      pls_integer        :=  25;
	   g_smtp_domain    varchar2 (256)     :=  'mail.saponia.hr';
	   g_mailer_id constant varchar2 (256) := 'Mailer by Oracle UTL_SMTP';
	   -- send mail using UTL_SMTP
     procedure write_mime_header (
        p_conn in out nocopy utl_smtp.connection
      , p_name in varchar2
      , p_value in varchar2
     );  
     
	   procedure mail (
	      p_sender in varchar2
	    , p_recipient in varchar2
	    , p_subject in varchar2
	    , p_message in varchar2
      , p_content_type IN VARCHAR2 DEFAULT 'text/plain'
      , p_attach_name IN VARCHAR2 DEFAULT NULL
      , p_attach_mime IN VARCHAR2 DEFAULT NULL
      , p_attach_blob IN BLOB DEFAULT NULL
	   );

    FUNCTION is_valid_email(i_email IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION MAIL_HTML_ADD(P_TEXT VARCHAR2,P_TABLICA VARCHAR2) RETURN VARCHAR2;
END MAIL_P;

/
