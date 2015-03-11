package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapDevConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["products", "development", "config.ini"])
	}
	
	override provideContent(InputParam param) 
'''
### Development Equinox Server
org.osgi.service.http.port=8081
org.eclipse.equinox.http.jetty.http.port=8082
org.eclipse.equinox.http.jetty.context.path=
org.eclipse.equinox.http.jetty.log.stderr.threshold=info


### Eclipse Runtime
eclipse.ignoreApp=true
osgi.noShutdown=true
osgi.bundles.defaultStartLevel=4
osgi.bundles=org.eclipse.equinox.common@2\:start,org.eclipse.update.configurator@3\:start,org.eclipse.equinox.http.jetty@start, org.eclipse.equinox.http.registry@start,org.eclipse.core.runtime@start, org.eclipse.rap.rwt.osgi@start
osgi.clean=true


### Logging
eclipse.consoleLog=true
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=WARNING


### Back-End (private URL without any auth)
server.url=http\://localhost\:8080/«param.projectAlias»_server/ajax


### Logout landing page
org.eclipse.scout.rt.ui.rap.servletfilter.LogoutFilter#redirectUrl=res/logout.html


### RAP ajax back-end ws-security key
scout.ajax.token.key=changeit


### Serialization
org.eclipse.scout.commons.serialization.bundleOrderPrefixes=«param.projectName»,org.eclipse.scout


### Authentication
org.eclipse.scout.rt.server.commons.servletfilter.security.AnonymousSecurityFilter#active=true

org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#active=false
org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#realm=«param.projectAlias» Development
org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#users=admin\=manager,allen\=allen,blake\=blake


### Gui Soap Protocol
soap.humanReadable=false

java.awt.headless=true
'''
}
