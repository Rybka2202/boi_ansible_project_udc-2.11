#!powershell

#AnsibleRequires -CSharpUtil Ansible.Basic
#AnsibleRequires -PowerShell Ansible.ModuleUtils.CommandUtil
#AnsibleRequires -PowerShell Ansible.ModuleUtils.AddType
#Requires -Module Run-Command

$spec = @{
  options = @{
    command = @{
      type = "str";
      required = $true
    }
  }
  supports_check_mode = $false
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$runResult = Run-Command($module.Params.command)

try {
  $module.Result.runResult = $runResult.stdout | ConvertFrom-Json

  # Standard output stuff
  $module.Result.executabe = $runResult.executable
  $module.Result.rc = $runResult.rc

  $module.Result.failed = $module.Result.runResult.failed
  $module.Result.changed = $module.Result.runResult.changed
  $module.Result.stdout = $module.Result.runResult.stdout
  $module.Result.stderr = $module.Result.runResult.stderr
  $module.Result.outfile = $module.Result.runResult.outfile
  $module.Result.logfile = $module.Result.runResult.logfile

  $module.Result.runResult_raw = $runResult
}
catch {
  $module.Result.msg = "Could not parse output of the called powershell script as JSON."
  $module.Result.runResult = $runResult.stdout
}


$module.ExitJson()
