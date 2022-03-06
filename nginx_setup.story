We need a server configuration for our deployment in a conf file.


STEP 1: LOCAL APPLICATION DEPLOYMENT
    + Create a production build of Angular application

    + Copy this production build files from the build package in dist folder to '/srv/<give_any_relevant_name_to_folder>' folder



STEP 2: CUSTOM CONFIG FILE FOR APPLICATION DEPLOYMENT
    + The default conf file for Nginx is /etc/nginx/nginx.conf. This is the main conf file for Nginx.

    + This file includes the user defined configuration file (.conf) file located in /etc/nginx/conf.d/
      There is no restriction on the config file name by the user.
      But, after including this conf file, this main conf file also includes the file having server config object which is used to show the default welcome page for Nginx server, which is present in /etc/nginx/sites-available folder by name 'default'.

    + So, this include statement of default welcome page configuration overrides the server config for our desired deployment.

    + So, comment this default welcome page include statement present in the main config file in the 'http' config object as include statement and save the file.

    + Create a configuration file inside /etc/nginx/conf.d with extension '.conf' and any name relevant to the application.

    + Fill the following content inside this created conf file -
        server {
            listen 0.0.0.0:80;
            root /srv/<relevant_name_given_to_folder_in_step_1>;
            location / {
                    try_files $uri $uri/ /index.html;
            }
        }



This procedure can be part of Angular application hosting with Nginx on Cloud deployment.

The same procedure can be followed for React or Vue frontend app deployment.
