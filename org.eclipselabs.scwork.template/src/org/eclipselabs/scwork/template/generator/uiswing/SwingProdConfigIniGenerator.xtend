package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingProdConfigIniGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(#["products", "production", "config.ini"])
	}
	
	override provideContent(InputParam param) 
'''
### Product Runtime Configuration
osgi.clean=true
eclipse.consoleLog=false
org.eclipse.scout.log=eclipse
org.eclipse.scout.log.level=WARNING

osgi.splashPath=platform\:/base/plugins/«param.uiswingProjectName»
eclipse.product=«param.uiswingProjectName».product
osgi.bundles.defaultStartLevel=4
osgi.bundles=org.eclipse.equinox.common@2\:start,org.eclipse.update.configurator@3\:start,org.eclipse.core.runtime@start
osgi.user.area=@user.home/«param.projectAlias»/user
osgi.configuration.area=@user.home/«param.projectAlias»/configuration
osgi.instance.area=@user.home/«param.projectAlias»/instance


### Swing Look And Feel
swing.defaultlaf=com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel
#swing.defaultlaf=com.sun.java.swing.plaf.windows.WindowsLookAndFeel


### Serialization
org.eclipse.scout.commons.serialization.bundleOrderPrefixes=«param.projectName»,org.eclipse.scout


### URL to the scout backend webapp
server.url=http\://localhost\:8080/«param.projectAlias»_server/process
'''
}
