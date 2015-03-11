package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<plugin>

   <extension
         name=""
         point="org.eclipse.scout.service.services">
«IF(param.projectType == ProjectType.OUTLINE_BASED_APPLICATION)»      <proxy
            factory="org.eclipse.scout.rt.client.services.ClientProxyServiceFactory"
            class="«param.sharedProjectName».services.IStandardOutlineService">
      </proxy>«ENDIF»
«IF(param.projectType == ProjectType.SINGLE_FORM_APPLICATION)»      <proxy
            factory="org.eclipse.scout.rt.client.services.ClientProxyServiceFactory"
            class="«param.sharedProjectName».services.IDesktopService">
      </proxy>«ENDIF»
   </extension>

</plugin>
'''
}
