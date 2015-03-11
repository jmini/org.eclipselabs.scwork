package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerProdConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(#["products", "production", "config.ini"])
	}
	
	override provideContent(InputParam param) 
'''
### Eclipse Runtime Configuration File
osgi.noShutdown=true
eclipse.ignoreApp=false
eclipse.product=«param.serverProjectName».product
osgi.bundles=org.eclipse.equinox.common@2\:start, org.eclipse.update.configurator@start, org.eclipse.equinox.http.servletbridge@start, org.eclipse.equinox.http.registry@start, org.eclipse.core.runtime@start, org.eclipse.scout.rt.server@start
osgi.bundles.defaultStartLevel=4

eclipse.consoleLog=false
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=WARNING


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
