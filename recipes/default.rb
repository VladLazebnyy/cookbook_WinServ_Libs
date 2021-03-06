# Cookbook Name:: cookbook_WinSer_Libs
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "chocolatey"

if platform?('windows')
	if win_version.windows_server_2008? || win_version.windows_server_2008_r2?
		Chef::Log.warn('Recipe shall run for windows_server_2008.')
		#support only Windows Server 2008, Windows Server 2008 R2
		#include_recipe "cookbook_WinSer_Libs::vcs2005"
		#include_recipe "cookbook_WinSer_Libs::vcs2008"
		chocolatey 'vcredist2005'
		chocolatey 'vcredist2008'
		include_recipe "cookbook_WinSer_Libs::vcs2010"
		include_recipe "cookbook_WinSer_Libs::vcs2012"
		include_recipe "cookbook_WinSer_Libs::vcs2013"
	elsif  win_version.windows_server_2012? || win_version.windows_server_2012_r2?	
		Chef::Log.warn('Recipe shall run for windows_server_2012.')
		chocolatey 'vcredist2005'
		chocolatey 'vcredist2008'
		include_recipe "cookbook_WinSer_Libs::vcs2010"
		include_recipe "cookbook_WinSer_Libs::vcs2012"
		include_recipe "cookbook_WinSer_Libs::vcs2013"
	else
  		Chef::Log.warn('Recipe was design only for Win server 2008 and 2012 .')
  	end
else
	Chef::Log.warn('Pakages can only be installed on the Windows platform.')
end