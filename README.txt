
                           HIPPO FORTRESS

Directory layout:
-----------------

/$HIPPO-FORTRESS
  /bin                 - startup files and service wrapper
  /config              - configuration files
  /legal               - license files for included software
  /lib                 - library jars
  /logs                - location of log files
  /work                - working directory

Running:
--------------------------

$ java -jar bin\start.jar


Installation:
--------------------------

-- Windows --

Install the NT service:

$ wrapper.exe -i wrapper.conf

Remove the service again:

$ wrapper.exe -r wrapper.conf

-- Linux --

Make sure that fortress.sh and wrapper.* have the executable bit enabled:

$ chmod 755 fortress.sh wrapper.*

Start fortress with:

$ fortress.sh start

Stop fortress with:

$ fortress.sh stop


Notes:
------

-- Linux --

- User running server -
The control script (fortress.sh) contains a check for which user is running.
If the current user is 'root' the control script will exit.

- Location of wrapper configuration -
You can set the location of the wrapper configuration file using the
WRAPPER_CONF environment variable. The default is "./wrapper.conf". Normally 
you specify its value in .bash_profile like this. The path can be absolute, 
or relative to <fortress home>/bin:
    WRAPPER_CONF=<filename>
    export WRAPPER_CONF
    
    
- Location of wrapper executable -
You can set the location of the wrapper executable file using the
WRAPPER_CMD environment variable. The default is "./wrapper.bin". Normally 
you specify its value in .bash_profile like this. The path can be absolute, 
or relative to <fortress home>/bin:
    WRAPPER_CMD=<filename>
    export WRAPPER_CMD

Please note that su-ing or sudo-ing from another user to the Fortress user may
not cause .bash_profile to be run. Please check that the method you use to
switch to the Fortress user runs .bash_profile.
