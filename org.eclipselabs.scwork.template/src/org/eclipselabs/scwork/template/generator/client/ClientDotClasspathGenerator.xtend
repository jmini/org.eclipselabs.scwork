package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientDotClasspathGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile(".classpath")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
	<classpathentry kind="src" path="src"/>
	<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8"/>
	<classpathentry kind="con" path="org.eclipse.pde.core.requiredPlugins"/>
	<classpathentry kind="output" path="bin"/>
</classpath>
'''
}
