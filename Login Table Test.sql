/*Insert into Biometrix.dbo.LoginTable 
([Username], [Password], [Email], [IsGoogle]) 
Values */
--A basic test, uncomment a line and ensure the results match
--('tjr13', 'asdf', null, 1) -- Should fail, google user's should not have passwords
--('tj213', null, null, 1) -- Should pass. 
--('tj13', null, null, 1) -- Should also pass.
--('tj23', null, null, 0) -- Should fail, no email or password for non-google user
--('tjr23', 'asdf', null, 0) -- should fail, no email for non-google user
--('tj2', null, 'asdf', 0) -- should fail, no password for non-google user
--('tjr23', 'afewr', 'ewsdf', 0) -- Should pass. 

/*Insert into Biometrix.dbo.LoginTable 
([Username], [Password], [Email]) 
Values */
--('tjwer', 'asdfs', 'asdfewrwer') -- Should pass.