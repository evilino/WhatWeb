##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 #
# Update version detection and added cookie and javascript matches
##
# Version 0.2 #
# Update version detection and ghdb match
##
Plugin.define "Liferay" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.3"
description "Liferay Portal is an enterprise web platform for building business solutions that deliver immediate results and long-term value. - homepage: http://www.liferay.com/"

# ShodanHQ results as at 2012-04-23 #
# 707 for COOKIE_SUPPORT GUEST_LANGUAGE_ID
# 650 for liferay-portal

# Google results as at 2012-04-23 #
# 208 for "Powered by Liferay Portal"
#  90 for "Powered by Liferay Portal" -site:liferay.com

# Dorks #
dorks [
'"Powered by Liferay Portal"'
]

# Examples #
examples %w|
91.98.133.134
151.1.163.13
195.76.55.107
184.107.254.205
164.177.150.124
195.198.8.151
81.169.131.61
81.22.160.185
213.9.109.100
2.116.11.71
www.liferay.com
www.optionsnet.gr/c/portal/
www.liferayportal.se
www.intalio.com/company/
www.monator.com
www.mcnolia.com/web/
webtown.hu
sareweb.net
portletfaces.org
innova4j.com:8080/web/guest/
vm-20.liferay.com/community/
https://www.jivix.nl/
|

# Matches #
matches [

# Powered by text
{ :text=>"Powered by Liferay Portal", :certainty=>10 },

# JavaScript # Liferay.Util.addInputFocus()
{ :text=>"<![CDATA[*/Liferay.Util.addInputFocus();/*]]>*" },

# HTTP Header # Liferay-Portal # Edition Detection
{ :search=>"headers[liferay-portal]", :string=>/^Liferay Portal (.+ Edition) (.+)$/ },

# HTTP Header # Liferay-Portal # Version Detection
{ :search=>"headers[liferay-portal]", :version=>/^Liferay Portal (.+ Edition) (.+)$/, :offset=>1 },

# HTTP Header # Set-Cookie # GUEST_LANGUAGE_ID
{ :search=>"headers[set-cookie]", :regexp=>/GUEST_LANGUAGE_ID=[a-z]{2,3}_[A-Z]{2,3};/ },

]

end

