package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<plugin>
  <extension id="app" name="Application" point="org.eclipse.core.runtime.applications">
    <application>
      <run class="«param.uiswingProjectName».SwingApplication"/>
    </application>
  </extension>
  <extension id="product" point="org.eclipse.core.runtime.products">
    <product
          application="«param.uiswingProjectName».app"
          name="«param.projectAlias»">
       <property
             name="appName"
             value="«param.projectAlias»">
       </property>
    </product>
  </extension>
</plugin>
'''
}
