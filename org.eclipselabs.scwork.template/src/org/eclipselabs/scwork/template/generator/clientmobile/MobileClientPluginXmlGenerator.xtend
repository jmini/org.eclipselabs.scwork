package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<plugin>

   <extension
         name=""
         point="org.eclipse.scout.rt.extension.client.desktopExtensions">
      <desktopExtension
            class="org.eclipse.scout.rt.client.mobile.ui.desktop.DeviceTransformationDesktopExtension"
            active="true">
      </desktopExtension>
«IF(param.projectType != ProjectType.EMPTY_APPLICATION)»      <desktopExtension
            class="«param.clientmobileProjectName».ui.desktop.DesktopExtension"
            active="true">
      </desktopExtension>«ENDIF»
   </extension>

</plugin>
'''
}
