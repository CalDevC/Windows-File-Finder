# File Finder
**Created 01/27/2022 by WUPQTA**

This project is a PowerShell script that can be used to search Windows directories for files containing a certain sequence of characters in their name.\
The user has the ability to:

 - Search directories recursively or locally
 - Search multiple unrelated directories at once
 - Search for every number in a provided range
 - Specify what file types to look for

Any terms searched for that are not found are added to a text file specified by the user and all matched files are added to a different specifed text file.

## Usage Instructions
These are PowerShell scripts so they will need to be run inside of a PowerShell terminal.\
Before you can run anything, you will need to make sure that your PowerShell terminal has the proper permissions to run scripts. These permissions are known as the execution policy. Altering this policy can make your system more vulnerable to malware depending on what you change the execution policy to. For this reason I recommend educating yourself on the different execution policies using th efollowing resources:

 - **The different execution policy options and what they mean:**\
 https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#powershell-execution-policies
 - **How to check your current execution policy:**\
 https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#managing-the-execution-policy-with-powershell
 - **How to change your execution policy:**\
 https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#change-the-execution-policy

If you don't want to read, the short answer is the run this script you will likely need to change your execution poicy to `unrestricted`. Leaving your execution policy in this state is dangerous for uneducated users, so once again I recommend you take a look at the linked documentation. You can change your execution policy to this state by running:\
`Set-ExecutionPolicy -ExecutionPolicy Unrestricted`

Before starting the script, review the variables inside `const.ps1` and change them to your desired values. A description of each variable can be found within the file.

Once your variables are set, you can run the script with the following command:\
`.\main.ps1`

## User Options
The **search type** has 2 options:
 - Recursive
   - Searches the selected directory and all subdirectories
   - Selected by entering `R` or `r`
 - Local
   - Searches only the selected directory and does not "drill down"
   - Selected by entering `L` or `l`

The **search term type** has 2 options:
 - Range
   - Performs a search for every number in a provided range
   - Selected by entering `R` or `r`
 - Phrase
   - Performs a search for a specified sequence of characters
   - Selected by entering `P` or `p`

The **types of files** has several options:
 - Enter the extension of all file types you want to search for
 - Include the preceding `.` (ex: .pdf)
 - Search for multiple types by seperating them by a comma with no space (ex: .pdf,.tif,.png)
 - File types are not case sensitive so searching for .pdf will find .pdf and .PDF

The **file paths** option has infinite options:
 - Enter the full path of the directory you want to search starting with `\\`
 - Specify multiple directories by seperating them by a comma with no space (ex: \\C:\Users,\\D:\)

Entering **search terms**:
 - If entering a range:
   - Enter it in the format `<first number>-<last number>`
   - Make sure the first number is less than the last number
 - If entering a phrase:
   - case does not matter

