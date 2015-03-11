package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SharedPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<?eclipse version="3.4"?>
<plugin>

   <extension
         name=""
         point="org.eclipse.scout.service.services">
      <service
            factory="org.eclipse.scout.service.DefaultServiceFactory"
            class="«param.sharedProjectName».services.common.text.«param.projectAlias.toFirstUpper»TextProviderService">
      </service>
      <service
            factory="org.eclipse.scout.service.DefaultServiceFactory"
            class="«param.sharedProjectName».services.common.text.«param.projectAlias.toFirstUpper»DocumentationTextProviderService">
      </service>
   </extension>

</plugin>
'''
}
