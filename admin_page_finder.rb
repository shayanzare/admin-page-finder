#!/usr/bin/ruby

# run this command : gem install colorize

require "net/http"
require "colorize"
require "open-uri"

php = ['sse/admin/add_user.php','admin/','administrator/','admin1/','admin2/','admin3/','admin4/','admin5/','usuarios/','usuario/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','admin/account.php','admin/index.php','admin/login.php','admin/admin.php',
'admin_area/admin.php','admin_area/login.php','siteadmin/login.php','siteadmin/index.php','siteadmin/login.html','siteadmin/login.htm','admin/account.html','admin/account.htm','admin/index.html','admin/index.htm','admin/login.html','admin/login.htm','admin/admin.html','admin/admin.htm',
'admin_area/index.php','bb-admin/index.php','bb-admin/login.php','bb-admin/admin.php','admin/home.php','admin_area/login.html','admin_area/login.htm','admin_area/index.html','admin_area/index.htm','admin/controlpanel.php','admin.php','admincp/index.php','admincp/login.php','admincp/index.html','admincp/index.htm','admin/account.html','admin/account.htm','adminpanel.html','adminpanel.htm','webadmin.html','webadmin.htm',
'webadmin/index.html','webadmin/index.htm','webadmin/admin.html','webadmin/admin.htm','webadmin/login.html','webadmin/login.htm','admin/admin_login.html','admin/admin_login.htm','admin_login.html','admin_login.htm','panel-administracion/login.html','panel-administracion/login.htm',
'admin/cp.php','cp.php','administrator/index.php','administrator/login.php','nsw/admin/login.php','webadmin/login.php','admin/admin_login.php','admin_login.php',
'administrator/account.php','administrator.php','admin_area/admin.html','admin_area/admin.htm','pages/admin/admin-login.php','admin/admin-login.php','admin-login.php',
'bb-admin/index.html','bb-admin/index.htm','bb-admin/login.html','bb-admin/login.htm','acceso.php','bb-admin/admin.html','bb-admin/admin.htm','admin/home.html','admin/home.htm','login.php','modelsearch/login.php','moderator.php','moderator/login.php',
'moderator/admin.php','account.php','pages/admin/admin-login.html','pages/admin/admin-login.htm','admin/admin-login.html','admin/admin-login.htm','admin-login.html','admin-login.htm','controlpanel.php','admincontrol.php',
'admin/adminLogin.html','admin/adminLogin.htm','adminLogin.html','adminLogin.htm','admin/adminLogin.html','admin/adminLogin.htm','home.html','home.htm','rcjakar/admin/login.php','adminarea/index.html','adminarea/index.htm','adminarea/admin.html','adminarea/admin.htm',
'webadmin.php','webadmin/index.php','webadmin/admin.php','admin/controlpanel.html','admin/controlpanel.htm','administrator/controlpanel.php','administrator/controlpanel.html','administrator/controlpanel.htm','admin.html','admin.htm','admin/cp.html','admin/cp.htm','cp.html','cp.html','adminpanel.php','moderator.html','moderator.htm',
'administrator/index.html','administrator/index.htm','administrator/login.html','administrator/login.htm','user.html','user.htm','administrator/account.html','administrator/account.htm','administrator.html','administrator.htm','login.html','login.htm','modelsearch/login.html','modelsearch/login.htm',
'moderator/login.html','moderator/login.htm','adminarea/login.html','adminarea/login.htm','panel-administracion/index.html','panel-administracion/index.htm','panel-administracion/admin.html','panel-administracion/admin.htm','modelsearch/index.html','modelsearch/index.htm','modelsearch/admin.html','modelsearch/admin.htm',
'admincontrol/login.html','admincontrol/login.htm','adm/index.html','adm/index.htm','adm.html','adm.htm','moderator/admin.html','moderator/admin.htm','moderator/admin.htm','user.php','account.html','account.htm','controlpanel.html','controlpanel.htm','admincontrol.html','admincontrol.htm',
'panel-administracion/login.php','wp-login.php','adminLogin.php','admin/adminLogin.php','home.php','admin.php','adminarea/index.php',
'adminarea/admin.php','adminarea/login.php','panel-administracion/index.php','panel-administracion/admin.php','modelsearch/index.php',
'modelsearch/admin.php','admincontrol/login.php','adm/admloginuser.php','admloginuser.php','admin2.php','admin2/login.php','admin2/index.php','usuarios/login.php',
'adm/index.php','adm.php','kpanel/','cpadmin.php','admin/cpadmin.php','administrator/cpadmin.php','adminpage/cpadmin.php','admin-page/cpadmin.php','user/cpadmin.php','affiliate.php','adm_auth.php','memberadmin.php','administratorlogin.php','secur-login.php','wp-admin/','administrator/login.html','login/','log-in.php','member.php','cpmember.php','cp-member.php','member.html','cpmember.html','cp-member.html','member.htm','cpmember.htm',
'cp-member.htm','sign_in.php','sign-in.php','signin.php','accounts.php','relogin.php','check.php','blog/wp-login.php','processlogin.php','checklogin.php','checkuser.php','checkadmin.php','isadmin.php','authenticate.php','authentication.php','auth.php','authuser.php','authadmin.php','fileadmin.php','sysadmin.php','yonetim.php','yonetici.php','ur-admin.php','administr8.php','websiteadmin.php','admins.php','pages/administrator/admin-login.php','pages/administrator/admin.php','pages/administrator/login.php','pages/admin/login.php','pages/admin/admin.php','admincp/admin-login.php',
'vorod.php','voroud.php','vorud.php','join.php','admincp/join.php','admin/join.php','administrator/join.php','webmaster.php','autologin.php','userlogin.php','userjoin.php','user-login.php','admincp/user-login.php','admin-cp/user-login.php','administrator/user-login.php','admincp/user-join.php','admin-cp/user-join.php','administrator/user-join.php','cmsadmin.php','yonetici.php','cgi-bin/login.php','login1.php','login_admin.php','login_out/','login_out.php','login_user.php','loginsuper.php','super1.php','super_index.php','super_login.php','super_join.php','supermanager.php','superman.php','superuser.php','supervise/Login.php','letmein.php','superuser.php','sysadm.php','access.php',
'mn-admin/index.php','mn-admin/login.php','mn-admin/admin.php','security/','admini/','letmein','admin_user/','admin_users','0admin/login.php','0manager/admin.php','a_main.php','aaa.php','aadmin/','abc/','acct/login.php','d_admin/admin_login.php',
'ad_login/','ad_login.php','add_admin/','add_user/','addfile.php','addmember/','addmember.php','adduser/','adduser.php','admanage/','adminpro/','adminmember.php','adminmember/','admins/','adsystem/index.php','adsystem/login.php','adsystem/admin.php','myadmin/','myadmin/login.php','myadmin/admin.php','my-admin/','my-admin/admin.php','my-admin/login.php','yonetim.php','indy_admin/','liveUser_admin/','lotus_domino_admin/','p/w/','psuser/','personal/','accounts/',
'acesso/','acesso.php','banneradmin/','cadmins/','ccms/','ccms/index.php','ccms/login.php','ccp14admin/','cms/','config/','configuration/','configure/','customer_login/','dir-login/','directadmin/','donos/','edit/','ezsqliteadmin/','fileadmin/','formslogin/','funcoes/','globes_admin/','hpwebjetadmin/','irc-macadmin/','joomla/administrator/','login-us/','login-redirect/','macadmin/','maintenance/','manage/','management.php',
'manager/','manuallogin/','members/','members.php','membro/','membros/','memlogin/','meta_login/','modcp/','navsiteadmin/','newsadmin/','newsadmin.php','news-admin/','news-admin.php','funadmin/','fun-admin/','funadmin.php/','fun-admin.php','nsw/admin/login.php','openvpnadmin/','painel/','panelc/','paneldecontrol/','passe/','password/','pgadmin/','php/','phpsqliteadmin/','phpldapadmin/','platz_login/','power_user/',
'processlogin/','project-admins/','pureadmin/','radmind-1/','raiz/','rcLogin/','registration/','root/','root/login.php','root/admin.php','roots/','roots/admin.php','roots/login.php','saff/','secret/','secrets/','secure/','senha/','senhas/','server_admin_small/','showlogin/','sff/','simplelogin/','sistema/','siteadmin/login.php','siteadmin/admin.php','smblogin/','sql-admin/','ss_vms_admin_sm/','sshadmin/','staradmin/','sub-login/','superman/','administrator/?h','GeneratedItems/','sw/','dynpoll/admin/','mailer/admin/',
'newposts/','*subaction=userinfo','*subaction=newposts','*do=lostpassword','*do=addnews',
'0admin/','0manager/','AdminTools/','Clave/','Database_Administration/','FCKeditor/editor/images/anchor.gif','server.php','Server/','ServerAdministrator/','Sing/','Super-Admin/','SysAdmin/','SysAdmin2/','UserLogin/','access/','acct_login/','admcp/','admin.xhtml','admin1.php','admin4_account/','admin4_colon/','admincontrol/','admincp/','administer/','administr8/','administracao/','administratie/',
'administration.php','administratie.php','administration/','administratoraccounts/','administrators.php','administrators/','administrivia/','modiriyat/','modiriat/','modiryat/','modiriyat/modiriyat.php','modiriyat/modiriat.php','modiriyat/modiryat.php','modiriat/admin.php','modiryat/login.php','adminitem.php',
'adminitem/','adminitems.php','adminpanel/','adminsite/','admistrador','admistrador/','admon/','autologin/','blogindex/','cgi-bin/login','cgi-bin/loginphp','cmsadmin/','control.php','control/','controle','controle/','controles','controles/','controlpanel','controlpanel/','cp','cp/','cpanel','cpanel_file/','index.swf',
'instadmin','instadmin/','irectadmin/','key/','letmein/','log-in/','log_in.php','log_in/','login','login-ir/','login-fa/','login1','login1/','login1php','login_admin','login_admin/','login_db/','login_out','login_user','login_user/','loginerror/','loginflat/','loginok/','loginsave/','loginsuper','loginsuper/','logo_sysadmin/','logout/','hall7/admin.php',
'logoutphp','manage.php','management/','manager.php','member/','moderatorcp','modules/admin/','net/','news_detail.php','not/','noticias/','pages/admin/','panel.php','panel/','phppgadmin/','radmind/','raiz','roots','siteadmin/','super','super/','super1','super1/','super1php','super_index','super_index/','super_indexphp','super_loginphp','superphp','superphp/','superman','supermanagerphp','supermanagerphp/',
'supermanphp','supermanphp/','super.php','superuser','superuser/','superuserphp','superuserphp/','supervise/','supervise/Login','supervise/Loginphp','supervise/Loginphp/','supervisor/','support_login/','sys-admin/',
'sysadm/','sysadmins/','system-administration/','typo3/','usager/','user/','useradmin/','username/','users.php','users/','usr/','usuario','utility_login/','uvpanel/','vadmind/','vmailadmin/','vorod/','voroud/','vorud/','webadmin','webmaster/','websvn/','wizmysqladmin/','wp-admin','wp-login/','xlogin/',
'_admin','backoffice','backoffice/','modcp.php','modcp/admin.php','modcp/modcp.php','modcp/login.php','pages/service-login.php','admin/','administrator/','admin1/','admin2/','admin3/','admin4/','admin5/','usuarios/','usuario/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','admin/account.asp','admin/account.aspx','admin/index.asp','admin/index.aspx','admin/login.asp','admin/login.aspx','admin/admin.asp','admin/admin.aspx',
'admin_area/admin.asp','admin_area/admin.aspx','admin_area/login.asp','admin_area/login.aspx','siteadmin/login.asp','siteadmin/login.aspx','siteadmin/index.asp','siteadmin/index.aspx','siteadmin/login.html','siteadmin/login.htm','admin/account.html','admin/account.htm','admin/index.html','admin/index.htm','admin/login.html','admin/login.htm','admin/admin.html','admin/admin.htm',
'admin_area/index.asp','admin_area/index.aspx','bb-admin/index.asp','bb-admin/index.aspx','bb-admin/login.asp','bb-admin/login.aspx','bb-admin/admin.asp','bb-admin/admin.asp','admin/home.asp','admin/home.aspx','admin_area/login.html','admin_area/login.htm','admin_area/index.html','admin_area/index.htm','admin/controlpanel.asp','admin/controlpanel.aspx','admin.asp','admin.aspx','admincp/index.asp','admincp/index.aspx','admincp/login.asp','admincp/login.aspx','admincp/index.html','admincp/index.htm','admin/account.html','admin/account.htm','adminpanel.html','adminpanel.htm','webadmin.html','webadmin.htm',
'webadmin/index.html','webadmin/index.htm','webadmin/admin.html','webadmin/admin.htm','webadmin/login.html','webadmin/login.htm','admin/admin_login.html','admin/admin_login.htm','admin_login.html','admin_login.htm','panel-administracion/login.html','panel-administracion/login.htm',
'admin/cp.asp','admin/cp.aspx','cp.asp','cp.aspx','administrator/index.asp','administrator/index.aspx','nsw/admin/login.asp','nsw/admin/login.aspx','webadmin/login.asp','webadmin/login.aspx','admin/admin_login.asp','admin/admin_login.aspx','admin_login.asp','admin_login.aspx',
'administrator/account.asp','administrator/account.aspx','administrator.asp','administrator.aspx','admin_area/admin.html','admin_area/admin.htm','pages/admin/admin-login.asp','pages/admin/admin-login.aspx','admin/admin-login.asp','admin/admin-login.aspx','admin-login.asp','admin-login.aspx',
'bb-admin/index.html','bb-admin/index.htm','bb-admin/login.html','bb-admin/login.htm','acceso.asp','acceso.aspx','bb-admin/admin.html','bb-admin/admin.htm','admin/home.html','admin/home.htm','login.asp','login.aspx','modelsearch/login.asp','modelsearch/login.aspx','moderator.asp','moderator.aspx','moderator/login.asp','moderator/login.aspx',
'moderator/admin.asp','moderator/admin.aspx','account.asp','account.aspx','pages/admin/admin-login.html','pages/admin/admin-login.htm','admin/admin-login.html','admin/admin-login.htm','admin-login.html','admin-login.htm','controlpanel.asp','controlpanel.aspx','admincontrol.asp','admincontrol.aspx',
'admin/adminLogin.html','admin/adminLogin.htm','adminLogin.html','adminLogin.htm','admin/adminLogin.html','admin/adminLogin.htm','home.html','home.htm','rcjakar/admin/login.asp','rcjakar/admin/login.aspx','adminarea/index.html','adminarea/index.htm','adminarea/admin.html','adminarea/admin.htm',
'webadmin.asp','webadmin.aspx','webadmin/index.asp','webadmin/index.aspx','webadmin/admin.asp','webadmin/admin.aspx','admin/controlpanel.html','admin/controlpanel.htm','admin/controlpanel.asp','admin/controlpanel.aspx','administrator/controlpanel.asp','administrator/controlpanel.aspx','administrator/controlpanel.html','administrator/controlpanel.htm','admin.html','admin.htm','admin/cp.html','admin/cp.htm','cp.html','cp.html','adminpanel.asp','adminpanel.aspx','moderator.html','moderator.htm',
'administrator/index.html','administrator/index.htm','administrator/login.html','administrator/login.htm','user.html','user.htm','administrator/account.html','administrator/account.htm','administrator.html','administrator.htm','login.html','login.htm','modelsearch/login.html','modelsearch/login.htm',
'moderator/login.html','moderator/login.htm','adminarea/login.html','adminarea/login.htm','panel-administracion/index.html','panel-administracion/index.htm','panel-administracion/admin.html','panel-administracion/admin.htm','modelsearch/index.html','modelsearch/index.htm','modelsearch/admin.html','modelsearch/admin.htm',
'admincontrol/login.html','admincontrol/login.htm','adm/index.html','adm/index.htm','adm.html','adm.htm','moderator/admin.html','moderator/admin.htm','moderator/admin.htm','user.asp','user.aspx','account.html','account.htm','controlpanel.html','controlpanel.htm','admincontrol.html','admincontrol.htm',
'panel-administracion/login.asp','panel-administracion/login.aspx','wp-login.asp','wp-login.aspx','adminLogin.asp','adminLogin.aspx','admin/adminLogin.asp','admin/adminLogin.aspx','home.asp','home.aspx','adminarea/index.asp','adminarea/index.aspx',
'adminarea/admin.asp','adminarea/admin.aspx','adminarea/login.asp','adminarea/login.aspx','panel-administracion/index.asp','panel-administracion/index.aspx','panel-administracion/admin.asp','panel-administracion/admin.aspx','modelsearch/index.asp','modelsearch/index.aspx',
'modelsearch/admin.asp','modelsearch/admin.aspx','admincontrol/login.asp','admincontrol/login.aspx','adm/admloginuser.asp','adm/admloginuser.aspx','admloginuser.asp','admloginuser.aspx','admin2.asp','admin2.aspx','admin2/login.asp','admin2/login.aspx','admin2/index.asp','admin2/index.aspx','usuarios/login.asp','usuarios/login.aspx',
'adm/index.asp','adm/index.aspx','adm.asp','adm.aspx','kpanel/','cpadmin.asp','cpadmin.aspx','admin/cpadmin.asp','admin/cpadmin.aspx','administrator/cpadmin.asp','administrator/cpadmin.aspx','adminpage/cpadmin.asp','adminpage/cpadmin.aspx','admin-page/cpadmin.asp','admin-page/cpadmin.aspx','user/cpadmin.asp','user/cpadmin.aspx','adm_auth.asp','adm_auth.aspx','memberadmin.asp','memberadmin.aspx','administratorlogin.asp','administratorlogin.aspx','secur-login.asp','secur-login.aspx','administrator/login.html','login/','log-in.asp','log-in.aspx','member.asp','member.aspx','cpmember.asp','cpmember.aspx','cp-member.asp','cp-member.aspx','member.html','cpmember.html','cp-member.html','member.htm','cpmember.htm',
'cp-member.htm','sign_in.asp','sign_in.aspx','sign-in.asp','sign-in.aspx','signin.asp','signin.aspx','accounts.asp','accounts.aspx','relogin.asp','relogin.aspx','check.asp','check.aspx','blog/wp-login.asp','blog/wp-login.aspx','blog/login.asp','blog/wp-login.aspx','processlogin.asp','processlogin.aspx','checklogin.asp','checklogin.aspx','checkuser.asp','checkuser.aspx','checkadmin.asp','checkadmin.aspx','isadmin.asp','isadmin.aspx','authenticate.asp','authenticate.aspx','authentication.asp','authentication.aspx','auth.asp','auth.aspx','authuser.asp','authuser.aspx','authadmin.asp','authadmin.aspx','fileadmin.asp','fileadmin.aspx','sysadmin.asp','sysadmin.aspx','yonetim.asp','yonetim.aspx','yonetici.asp','yonetici.aspx','ur-admin.asp','ur-admin.aspx','administr8.asp','administr8.aspx','websiteadmin.asp','websiteadmin.aspx','admins.asp','admins.aspx','pages/administrator/admin-login.asp','pages/administrator/admin-login.aspx','pages/administrator/admin.asp','pages/administrator/admin.aspx','pages/administrator/login.asp','pages/administrator/login.aspx','pages/admin/login.asp','pages/admin/login.aspx','pages/admin/admin.asp','pages/admin/admin.aspx','admincp/admin-login.asp','admincp/admin-login.aspx','affiliate.asp','affiliate.aspx',
'vorod.asp','vorod.aspx','voroud.asp','voroud.aspx','vorud.asp','vorud.aspx','join.asp','join.aspx','admincp/join.asp','admincp/join.aspx','admin/join.asp','admin/join.aspx','administrator/join.asp','administrator/join.aspx','webmaster.asp','webmaster.aspx','autologin.asp','autologin.aspx','userlogin.asp','userlogin.aspx','userjoin.asp','userjoin.aspx','user-login.asp','user-login.aspx','admincp/user-login.asp','admincp/user-login.aspx','admin-cp/user-login.asp','admin-cp/user-login.aspx','administrator/user-login.asp','administrator/user-login.aspx','admincp/user-join.asp','admincp/user-join.aspx','admin-cp/user-join.asp','admin-cp/user-join.aspx','administrator/user-join.asp','administrator/user-join.aspx','cmsadmin.asp','cmsadmin.aspx','cgi-bin/login.asp','cgi-bin/login.aspx','login1.asp','login1.aspx','login_admin.asp','login_admin.aspx','login_out/','login_out.asp','login_out.aspx','login_user.asp','login_user.aspx','loginsuper.asp','loginsuper.aspx','super1.asp','loginsuper.asp','loginsuper.aspx','super1.aspx','super_index.asp','super_index.aspx','super_login.asp','super_login.aspx','super_join.asp','super_join.aspx','supermanager.asp','supermanager.aspx','superman.asp','superman.aspx','superuser.asp','superuser.aspx','supervise/Login.asp','supervise/Login.aspx','letmein.asp','letmein.aspx','superuser.asp','superuser.aspx','sysadm.asp','sysadm.aspx','access.asp','access.aspx',
'mn-admin/index.asp','mn-admin/index.aspx','mn-admin/login.asp','mn-admin/login.aspx','mn-admin/admin.asp','mn-admin/admin.aspx','security/','admini/','letmein','admin_user/','admin_users','0admin/login.asp','0admin/login.aspx','0manager/admin.asp','0manager/admin.aspx','a_main.asp','a_main.aspx','aaa.asp','aaa.aspx','aadmin/','abc/','acct/login.asp','acct/login.aspx','d_admin/admin_login.asp','d_admin/admin_login.aspx',
'ad_login/','ad_login.asp','ad_login.aspx','add_admin/','add_user/','addfile.asp','addfile.aspx','addmember/','addmember.asp','addmember.aspx','adduser/','adduser.asp','adduser.aspx','admanage/','adminpro/','adminmember.asp','adminmember.aspx','adminmember/','admins/','adsystem/index.asp','adsystem/index.aspx','adsystem/login.asp','adsystem/login.aspx','adsystem/admin.asp','adsystem/admin.aspx','myadmin/','myadmin/login.asp','myadmin/login.aspx','myadmin/admin.asp','myadmin/admin.aspx','my-admin/','my-admin/admin.asp','my-admin/admin.aspx','my-admin/login.asp','my-admin/login.aspx','yonetim.asp','yonetim.aspx','indy_admin/','liveUser_admin/','lotus_domino_admin/','p/w/','psuser/','personal/','accounts/',
'acesso/','acesso.asp','acesso.aspx','banneradmin/','cadmins/','ccms/','ccms/index.asp','ccms/index.aspx','ccms/login.asp','ccms/login.aspx','ccp14admin/','cms/','config/','configuration/','configure/','customer_login/','dir-login/','directadmin/','donos/','edit/','ezsqliteadmin/','fileadmin/','formslogin/','funcoes/','globes_admin/','hpwebjetadmin/','irc-macadmin/','login-us/','login-redirect/','macadmin/','maintenance/','manage/','management.asp','management.aspx',
'manager/','manuallogin/','members/','members.asp','membro/','membros/','memlogin/','meta_login/','modcp/','navsiteadmin/','newsadmin/','newsadmin.asp','newsadmin.aspx','news-admin/','news-admin.asp','news-admin.aspx','funadmin/','fun-admin/','funadmin.asp/','funadmin.aspx/','fun-admin.asp','fun-admin.aspx','nsw/admin/login.asp','nsw/admin/login.aspx','openvpnadmin/','painel/','panelc/','paneldecontrol/','passe/','password/','pgadmin/','asp/','aspx/','aspsqliteadmin/','aspxsqliteadmin/','aspldapadmin/','aspxldapadmin/','platz_login/','power_user/',
'processlogin/','project-admins/','pureadmin/','radmind-1/','raiz/','rcLogin/','registration/','root/','root/login.asp','root/login.aspx','root/admin.asp','root/admin.aspx','roots/','roots/admin.asp','roots/admin.aspx','roots/login.asp','roots/login.aspx','saff/','secret/','secrets/','secure/','senha/','senhas/','server_admin_small/','showlogin/','sff/','simplelogin/','sistema/','siteadmin/admin.asp','siteadmin/admin.aspx','smblogin/','sql-admin/','asp-admin/','aspx-admin/','ss_vms_admin_sm/','sshadmin/','staradmin/','sub-login/','superman/','administrator/?h','GeneratedItems/','sw/','dynpoll/admin/','mailer/admin/','members/memberlogIn.aspx',
'newposts/',
'administrator/login.asp','administrator/login.aspx','login1asp','login1aspx',
'0admin/','0manager/','AdminTools/','Clave/','Database_Administration/','FCKeditor/editor/images/anchor.gif','server.asp','server.aspx','Server/','ServerAdministrator/','Sing/','Super-Admin/','SysAdmin/','SysAdmin2/','UserLogin/','access/','acct_login/','admcp/','admin.xhtml','admin1.asp','admin1.aspx',
'admin4_account/','admin4_colon/','admincontrol/','admincp/','administer/','administr8/','administracao/','administratie/','administration.asp','administration.aspx','administratie.asp','administratie.aspx','administration/','administratoraccounts/','administrators.asp','administrators.aspx','administrators/','administrivia/',
'modiriyat/','modiriat/','modiryat/','modiriyat/modiriyat.asp','modiriyat/modiriyat.aspx','modiriyat/modiriat.asp','modiriyat/modiriat.aspx','modiriyat/modiryat.asp','modiriyat/modiryat.aspx','modiriat/admin.asp','modiriat/admin.aspx','modiryat/login.asp','modiryat/login.aspx','adminitem.asp','adminitem.aspx','adminitem/',
'adminitems.asp','adminitems.aspx','adminpanel/','adminsite/','admistrador','admistrador/','admon/','autologin/','blogindex/','cgi-bin/login','cgi-bin/loginasp','cgi-bin/loginaspx','cmsadmin/','control.asp','control.aspx','control/','controle','controle/',
'controles','controles/','controlpanel','controlpanel/','cp','cp/','cpanel','cpanel_file/','index.swf','instadmin','instadmin/','irectadmin/','key/','letmein/','log-in/','log_in.asp','log_in.aspx','log_in/','login','login-ir/','login-fa/',
'login1','login1/','login_admin','login_admin/','login_db/','login_out','login_user','login_user/','loginerror/','loginflat/','loginok/','loginsave/','loginsuper','loginsuper/','logo_sysadmin/','logout/','hall7/admin.asp','hall7/admin.aspx','supermanager','supermanager/','logoutasp','logoutaspx','manage.asp',
'manage.aspx','management/','manager.asp','manager.aspx','member/','moderatorcp','modules/admin/','net/','news_detail.asp','news_detail.aspx','not/','noticias/','pages/admin/','panel.asp','panel.aspx','panel/','phppgadmin/','radmind/','raiz','roots','siteadmin/','super','super/','super1','super1/','super1asp',
'super1aspx','super_index','super_index/','super_indexasp','super_indexaspx','super_loginasp','super_loginaspx','superasp','superaspx','superasp/','superaspx/','superman','supermanagerasp','supermanageraspx','supermanagerasp/','supermanageraspx/','supermanasp','supermanaspx','supermanasp/','supermanaspx/','super.asp','super.aspx',
'superuser','superuser/','superuserasp','superuseraspx','superuserasp/''superuseraspx/','supervise/','supervise/Login','supervise/Loginasp','supervise/Loginaspx','supervise/Loginasp/','supervise/Loginaspx/','supervisor/','support_login/','sys-admin/','sysadm/','sysadmins/','system-administration/',
'typo3/','usager/','user/','useradmin/','username/','users.asp','users.aspx','users/','usr/','usuario','utility_login/','uvpanel/','vadmind/','vmailadmin/','vorod/','voroud/','vorud/','webadmin','webmaster/','websvn/','wizmysqladmin/','wp-admin','wp-login/','xlogin/']


puts """

─────███────██
──────████───███
────────████──███
─────────████─█████
████████──█████████
████████████████████
████████████████████
█████████████████████
█████████████████████
█████████████████████
██─────██████████████
███────────█████████
█──█───────────████
█──────────────██
██──────────────█────────▄███████▄
██───███▄▄──▄▄███──────▄██$█████$██▄
██──█▀───▀███────█───▄██$█████████$██▄
██──█───█──██───█─█──█$█████████████$█
██──█──────██─────█──█████████████████
██──██────██▀█───█─────██████████████
─█───██████──▀████───────███████████           +================================================+
──────────────────█───────█████████            |                Admin Page Finder               |
─────────────▀▀████──────███████████           +================================================+
────────────────█▀──────██───████▀─▀█          | ♚ Coded: ViRuS007                              |
────────────────▀█──────█─────▀█▀───█          | ♚ Contact: @Msf_Payload (Telegram)             |
──▄▄▄▄▄▄▄────────██────█───████▀───██          | ♚ Chanell:telegram.me/CyberSoldiersST          |
─█████████████────▀█──█───███▀──▄▄██           | ♚ I take no responsibilities for the           |
─█▀██▀██▀████▀█████▀──█───██████▀─▀█           |   use of this program !                        |
─█────────█▄─────────██───████▀───██           +================================================+
─██▄████▄──██────────██───██──▄▄▄██            |             We Are Finally FREE                |
──██▄▄▄▄▄██▀─────────██──█████▀───█            |             We Are Finally AWAKE               |
─────────███────────███████▄────███            +================================================+
────────███████─────█████████████
───────▄██████████████████████
████████─██████████████████
─────────██████████████
────────███████████
───────█████
──────████

"""



print "\n[+] Enter Url(example: google.com): ".blue
url1 = gets.chomp
url2 = "http://" + url1 + "/"
print "\n[+] Enter Thread (0.5 #Half secend):".blue
thread = gets.chomp

#create a file
found_file = File.new("Found_page.txt", "w+")
found_file.write("
+================================================+
|                Admin Page Finder               |
+================================================+
| ♚ Coded: ViRuS007                              |
| ♚ Contact: @Msf_Payload (Telegram)             |
| ♚ Chanell:telegram.me/CyberSoldiersST          |
| ♚ I take no responsibilities for the           |
|   use of this program !                        |
+================================================+
|             We Are Finally FREE                |
|             We Are Finally AWAKE               |
+================================================+\n\n\n")

for i in php do
  url = URI.parse(URI.encode(url2.strip) + i)
  req = Net::HTTP::Get.new(url.to_s)

  res = Net::HTTP.start(url.host, url.port) {|http|
    sleep(thread.to_i)
    puts "[*] Checking : #{url}".yellow
    http.request(req)
  }
  if res.code == "404"
    puts "[!] Not Found\n".red

    #else
  else
    puts "[*] Found! \n".green
    found_file.write(url.to_s + "\n")
  end
end
