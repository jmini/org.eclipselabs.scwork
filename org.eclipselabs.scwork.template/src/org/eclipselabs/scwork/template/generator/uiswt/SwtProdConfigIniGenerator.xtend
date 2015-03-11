package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtProdConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile(#["products", "production", "config.ini"])
	}
	
//Check the osgi.splashPath value, previous value was: platform\:/base/plugins/«param.uiswtProjectName».app.core

	override provideContent(InputParam param) 
'''
### Product Runtime Configuration
osgi.clean=true
eclipse.consoleLog=false
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=WARNING

osgi.splashPath=platform\:/base/plugins/«param.uiswtProjectName»
eclipse.product=«param.uiswtProjectName».product
osgi.bundles.defaultStartLevel=4
osgi.bundles=org.eclipse.equinox.common@2\:start,org.eclipse.update.configurator@3\:start,org.eclipse.equinox.ds@3\:start,org.eclipse.core.runtime@start
osgi.user.area=@user.home/«param.projectAlias»/user
osgi.configuration.area=@user.home/«param.projectAlias»/configuration
osgi.instance.area=@user.home/«param.projectAlias»/instance


### URL to the scout backend webapp
server.url=http\://localhost\:8080/«param.projectAlias»_server/process


### Serialization
org.eclipse.scout.commons.serialization.bundleOrderPrefixes=«param.projectName»,org.eclipse.scout
clearPersistedState=true
'''
}
