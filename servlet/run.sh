# where to deploy testing code
temp_test_dir=/Library/Tomcat/webapps/temp_test

# 1. compile
pushd src
[ -d ../WEB-INF/classes ] || mkdir -p ../WEB-INF/classes
javac -cp /Library/Tomcat/lib/servlet-api.jar -d ../WEB-INF/classes MyServlet.java
[ -d $temp_test_dir ] || mkdir $temp_test_dir
popd
# 2. deploy
cp -Rp * $temp_test_dir
# 3. startup tomcat if it's not yet:
/Library/Tomcat/bin/startup.sh
# 4. goto http://localhost:8080/temp_test/myTest
# Notes: files involved: 
#  WEB-INF/classes/MyServlet.class;
#  WEB-INF/web.xml

