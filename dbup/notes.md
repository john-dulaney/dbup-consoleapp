# Exploration of DBUp

  ## Notes on Docs
Specific functions that run along with the DBConnection string in program.cs. 
          
   1. Get scripts which will be executed (`GetScriptsToExecute()`)
   1. Get already executed scripts (`GetExecutedScripts()`)
   1. Check if an upgrade is required (`IsUpgradeRequired()`)
   1. Creates version record for any new migration scripts without executing them (`MarkAsExecuted`)
   1. Useful for bringing development environments into sync with automated environments
   1. Try to connect to the database (`TryConnect()`)
   1. Perform the database upgrade (`PerformUpgrade()`)
   1. Log script output (`LogScriptOutput()`)

Can be called from both Command Line and Powershell as well as executed from the browser with some extra code to handle this funcitonality.

With an open connection string, we can add SQL statements to perform specific migrations. [SQL injection right through the connection](https://dbup.readthedocs.io/en/latest/usage/#code-based-scripts)
  (this is succeptable to SQL injection if done improperly. )

Testing is not automated. Call RecordingDBConnection. RecordingDbConnection keeps a log of every opened transaction, executed command and other things we likely care about. relies on [GitHub - approvals/ApprovalTests.Net: ApprovalTest verification library for .Net](https://github.com/approvals/ApprovalTests.Net) for the rest.

Adds an array of ScriptProviders.

Transactional DDL? Asked Paul, got no response.

Can choose how to log, where to log, with a configured logger. Our Logger class could play with this potentially.

Adds a table to the db called Schema versions. DBUp checks this table to see which scripts should be run and which ones should be skipped. Comes with a Class that handles scripts that should always be run.

variable substition - why? idk but it has it

  ## Notes on execution
  
1.  testing purposes setting up my own local sql server database
2.  Added test code from their intro walkthrough
3.  Amazingly simple to set up
4.  worked great out of the box
5.  currently exploring octopus
6.  
  
  ## Pros
  
- Can write script Pre-processors to change scripts conditionally before running
- powerful logging options
- can deploy the same scripts to multiple database (needs some setup)
- the console app exists in the source code
- While DbUp is running a script, it adds the name of each script to a special SchemaVersions table. This feature ensures that a given script only runs one time against a database instance, no matter how many times you might run the console app.
- Organize file structure however you want, app reads it as a aschema.
  
  ## Cons
    
- Designed for use where each developer keeps a local db copy, not a shared direct connection.
- EDMZ and NMCI will take special configurations/more console apps. Unless I come across a different way to do it.
- this is going to take more work than a plug and play.
- May require octopus deploy, which has 90% of features we wont use.
  
After talking over the current script deployment process for other environments like NMCI and eDMZ, I do not see  us being able to leverage this tool to our advantage. 
  
  repo -> [GitHub - john-dulaney/dbup-consoleapp: Testing dbup nuget package for potential use in new projects](https://github.com/john-dulaney/dbup-consoleapp)
  octopus -> [Practical Octopus Deploy - Using DbUp \| Russ Warner](http://russwarner.com/devops/practical-octopus-deploy-using-dbup/)