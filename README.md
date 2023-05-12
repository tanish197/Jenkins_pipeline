## IN THIS PRJECT WE ARE GOING TO USE JENKINS WITH AWS EC2 SERVER AND INTEGRATE IT WITH GITHUB FOR NODEJS DISCORD BOT

### STEP 1: Setup environment
   1. Launch AWS EC2 instance 
   2. Give a name and Select Ubuntu as a server.
   3. Check HTTPS connection under security because it is related to https.
   4. Click Launch
   5. Connect to EC2 server
   ### Now run the following commands for further process:
       • sudo apt update
       // now will install java because jenkins in based upon java.
       • sudo apt install openjdk-11-jre
       • java -version
       • curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \   /usr/share/keyrings/jenkins-keyring.asc > /dev/null 
       • echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \   https://pkg.jenkins.io/debian binary/ | sudo tee \   /etc/apt/sources.list.d/jenkins.list > /dev/null
       • sudo apt-get update 
       // if you face an error then follow these commands: 
            • wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
            • sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
        // now again run the command:
        • sudo apt-get update
        • sudo apt-get install jenkins
	    • sudo systemctl enable jenkins
	    • sudo systemctl start jenkins
	    • sudo systemctl status jenkins
    // Now go to EC2 instance and add a security inbound in security group: 
    Type: Custom TCP 
    port no:  8080
    Source: MyIP ( because no other can access to this IP address) 
        • Now copy the public IPv4 of instance and browse it as for e.g.: 3.109.5.106:8080 
        // This will open Jenkins Welcome Page. Now, get the password and use it from using this command:
	    • sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   6. Complete the Jenkins Login proces.
   7. Now create a job. Give it a name and choose a freestyle and click OK
   // Note; you should make a git repository either your project or cloned one anything doesn't matter.
   8. Write your Description and chhose Github project(becaouse we have to pull it from git) and provide the repository link.
   9. Choose the git and provide the same link of repo now we have to add credentials
   ### Follow these steps before adding credentials:
     • Go to EC2 server terminal and write ssh-keygen
     • It will create the public and private key
     • Enter cd .ssh
     • cat id_rsa.pub (for public key)
     • cat id_rsa (for private key)
     • COPY BOTH
     • Now go to Github and open settings and click on SSH key generation. Create new key and give a name and paste the public key there and save.
     • Now get back to jenkins page and click on add credentials and choose SSh key with private key and give a name and enter the username which is "ubuntu' in this case and paste the private key and save.
     • Now choose the credential made.
     • edit the branch as per your repository. By default is */master
     • Click apply and save.
     • Now the build the job and check if it success. It should be successful if done no mistake.(Refer to SS:img 14)
  10. Check if Jenkins and Github are integrated or not :
        • cd /var/lib/jenkins/workspace/Jenkins-chatbot 
        • ls
        And you can see the files here now of git repository.

   ### Now we have to run the application
     
    1. Follow the steps given on  https://lo-victoria.com/build-a-simple-discord-bot-in-nodejs-for-beginners
        
        Few steps for problems that may be encountered:
        
         • While following steps to run chatbot when u make directory use this first :
           • sudo chown -R $USER:$USER .
           • sudo su
       
         • to make .env file just write 
            • sudo nano .env 
            
         • while installing packages you face problem then 
            • mkdir discordBot
              cd discordBot
              npm init
          // after using these commands, come out of directory if error occurs
              cd ..
          // now the run the command 
              npm install discord.js axios dotenv
          // now it will work

         • to see where it do login, so it will work on discord.com 


