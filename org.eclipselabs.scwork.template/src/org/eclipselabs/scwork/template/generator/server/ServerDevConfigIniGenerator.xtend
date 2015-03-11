package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerDevConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(#["products", "development", "config.ini"])
	}
	
	override provideContent(InputParam param) 
'''
### Development Settings
osgi.clean=true
org.eclipse.equinox.http.jetty.http.port=8080
org.eclipse.equinox.http.jetty.context.path=/«param.projectAlias»_server


### Eclipse Runtime Configuration File
osgi.noShutdown=true
eclipse.ignoreApp=false
eclipse.product=«param.serverProjectName».product
osgi.bundles=org.eclipse.equinox.common@2\:start, org.eclipse.update.configurator@start, org.eclipse.equinox.http.jetty@start, org.eclipse.equinox.http.registry@start, org.eclipse.core.runtime@start
osgi.bundles.defaultStartLevel=4

eclipse.consoleLog=true
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=INFO


### RAP ajax back-end ws-security key
scout.ajax.token.key=changeit


### Validation
org.eclipse.scout.rt.server.validateInput=true


### Serialization
org.eclipse.scout.commons.serialization.bundleOrderPrefixes=«param.projectName»,org.eclipse.scout


### Service Runtime Configuration
org.eclipse.scout.rt.server.services.common.file.RemoteFileService#rootPath=«param.workspaceFolder.absolutePath.replaceAll("\\\\", "/")»/«param.serverProjectName»/j2ee/ear/war/WEB-INF/remotefiles


### Servlet Filter Runtime Configuration
org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#active=false
org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#realm=«param.projectAlias» Development
org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter#users=admin\=manager,allen\=allen,blake\=blake

org.eclipse.scout.rt.server.commons.servletfilter.security.AnonymousSecurityFilter#active=true
'''
}
