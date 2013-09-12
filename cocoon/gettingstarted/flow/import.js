/*
* Copyright 2001-2007 Hippo (www.hippo.nl)
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
importPackage(Packages.nl.hippo.webdav.batchprocessor.plugins);
importPackage(Packages.org.apache.commons.httpclient);
importPackage(Packages.org.apache.commons.httpclient.auth);

function importContent() {
  var doImportContent = cocoon.parameters["doImportContent"];
  
  if (doImportContent == "on") {
  
    var repository = cocoon.parameters["repository"];
    var rootPath = cocoon.parameters["rootPath"];
    var username = cocoon.parameters["username"];
    var password = cocoon.parameters["password"];
    var host = cocoon.parameters["host"];
    var realPath = cocoon.parameters["realPath"];
    var backupLocation = realPath + "/gettingstarted/resources/skeleton-sample-content.hrep";
    var target = "http://" + repository.substring("webdav://".length);
    
    var restorer = new RestoreRepository();
  
    // setup http client
    var httpClient = new HttpClient();
    var httpState = new HttpState();
    var credentials = new UsernamePasswordCredentials(username, password);
    httpState.setCredentials(null, host, credentials);
    httpClient.setState(httpState);
  
    // import sample content in repo
    try {
      restorer.restore(backupLocation, target, httpClient);
    }
    catch (e) {
      cocoon.sendPage("step1b-failure");
    }

    cocoon.sendPage("step1b-success");
    
  }
  else {
    cocoon.redirectTo("step2");
  }
                    
}
