package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerDotProjectGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(".project")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>«param.serverProjectName»</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
		<buildCommand>
			<name>org.eclipse.jdt.core.javabuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.eclipse.pde.ManifestBuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.eclipse.pde.SchemaBuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
	</buildSpec>
	<natures>
		<nature>org.eclipse.jdt.core.javanature</nature>
		<nature>org.eclipse.pde.PluginNature</nature>
	</natures>
</projectDescription>
'''
}
