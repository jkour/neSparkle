# neSparkle Demo
This demo shows all the functionality of neSparkle component. Just run it and try the buttons and the options


# DSA Signature
neSparkle supports DSA signed installers. 

In \Demos\AppCast folder there are two appcast.xml files; one with the correct signature and one with wrong signature. The installer is neSparkle-test-app.exe, which is just an empty installer.

To see how DSA signatures work do the following:
* From the neSparkle Project Group, first run the **SimpleHTTPServer** project in Release configuration. This allows us to experiment with the two appcast files. The server listens to **http://localhost:7777**
* Then, run the **DelphiSparkleExample** project
* First select **Use Local (DSA Correct)** and click to check manually for updates. The appcast will appear with the release notes. Click to install the update. After a while, the installer will start
* Then change the option to **Use Local (DSA Wrong)**. Do the same as in the previous step. After the installer is downloaded, WinSparkle will show an error saying that the signature is invalid
