package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtDevConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile(#["products", "development", "config.ini"])
	}
	
	override provideContent(InputParam param) 
'''
### Development Settings
osgi.clean=true
eclipse.consoleLog=true
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=WARNING


### Product Runtime Configuration
osgi.splashPath=platform\:/base/plugins/«param.uiswtProjectName»
eclipse.product=«param.uiswtProjectName».product
osgi.bundles.defaultStartLevel=4
osgi.bundles=org.eclipse.equinox.common@2\:start,org.eclipse.update.configurator@3\:start,org.eclipse.equinox.ds@3\:start,org.eclipse.core.runtime@start


### Serialization
org.eclipse.scout.commons.serialization.bundleOrderPrefixes=«param.projectName»,org.eclipse.scout


### URL to the scout backend webapp
server.url=http\://localhost\:8080/«param.projectAlias»_server/process
clearPersistedState=true
'''
}
