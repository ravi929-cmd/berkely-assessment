Create a Windows VM (Source):
1. Create a VM in Virtual Box.
   
    a. New VM > Type: Microsoft Windows, version: Windows Server 2022
    b. Allocated 4Gb RAM , 50GB HDD
    c. Attach Windows server 2022 ISO and started Installation
    d. Added VB Box Guest Additions for easy Installation.

3. Install IIS:

   a. Launch Server Manager > Add Roles and features.
   b. This includes IIS services, Security protocls for TCP activation, Logging tools, ASP .NET features to support .NET app.
   c. Restarted servre and verified IIS and other features installtaion.

5. Deploy Sample .NET app.
   a. Install .NET SDK Latest
   b. Install .NET Core Windows Hosting bundle.
   c. verifies .NET installation and created a simple .NET app on server.
   d. Then, published it to C:\.

6. Configure IIS and start app
   a. Created a site on IIS pointing .NET app file location on C:\.
   b. binding port 80.
   c. Started Site on IIS.
